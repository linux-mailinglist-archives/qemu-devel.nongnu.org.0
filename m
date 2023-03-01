Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE396A6ECE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:50:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNlw-000149-TO; Wed, 01 Mar 2023 09:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pXNlu-00013P-NB; Wed, 01 Mar 2023 09:49:34 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pXNlt-0007H8-0G; Wed, 01 Mar 2023 09:49:34 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 8B49B48D77;
 Wed,  1 Mar 2023 15:49:22 +0100 (CET)
Message-ID: <7a47d765-7e52-579b-64e2-c42345bccada@proxmox.com>
Date: Wed, 1 Mar 2023 15:49:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/9] mirror: allow switching from background to active mode
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com, den@virtuozzo.com,
 t.lamprecht@proxmox.com, alexander.ivanov@virtuozzo.com
References: <20230224144825.466375-1-f.ebner@proxmox.com>
 <bf90a430-226f-085c-557e-4c1c5f8787f3@yandex-team.ru>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <bf90a430-226f-085c-557e-4c1c5f8787f3@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 01.03.23 um 15:34 schrieb Vladimir Sementsov-Ogievskiy:
> On 24.02.23 17:48, Fiona Ebner wrote:
>> With active mode, the guest write speed is limited by the synchronous
>> writes to the mirror target. For this reason, management applications
>> might want to start out in background mode and only switch to active
>> mode later, when certain conditions are met. This series adds a
>> block-job-change QMP command to acheive that, as well as
>> job-type-specific information when querying block jobs, which
>> can be used to decide when the switch should happen.
>>
>> For now, only the direction background -> active is supported.
>>
>> The information added upon querying is whether the target is actively
>> synced, the total data sent, and the remaining dirty bytes.
>>
>> Initially, I tried to go for a more general 'job-change' command, but
>> I couldn't figure out a way to avoid mutual inclusion between
>> block-core.json and job.json.
> 
> Hmm, what do you mean? As I understand job-* API is "new" and
> block-job-* is "old", so we'd better add job-change command
> 

My issue is that when I go for that with a JobChangeOptions union in
job.json and declare JobChangeOptionsMirror in block-core.json (it needs
to know about MirrorCopyMode and all other mirror-related declarations
are there so it's the natural place), then I need to include
block-core.json in job.json so that the JobChangeOptions union can
reference JobChangeOptionsMirror. But that is a mutual inclusion.

I guess it would be possible to move MirrorCopyMode to job.json and
declare JobChangeOptionsMirror in job.json, but that didn't feel right
and would mean moving more and more to job.json whenever extending
job-change requires it.

But maybe I'm missing something obvious? Haven't worked much with the
QAPI yet.


