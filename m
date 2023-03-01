Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF32B6A6E8A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:35:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNY1-0000Ra-Ey; Wed, 01 Mar 2023 09:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pXNXy-0000MZ-7s; Wed, 01 Mar 2023 09:35:10 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pXNXv-0003lv-5z; Wed, 01 Mar 2023 09:35:08 -0500
Received: from mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c08:ae0e:0:640:6e49:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id C1D89603DE;
 Wed,  1 Mar 2023 17:34:57 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b71b::1:14] (unknown
 [2a02:6b8:b081:b71b::1:14])
 by mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id uYW7T305Qa60-U8n1GEc0; Wed, 01 Mar 2023 17:34:57 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net;
 dkim=pass
Message-ID: <bf90a430-226f-085c-557e-4c1c5f8787f3@yandex-team.ru>
Date: Wed, 1 Mar 2023 17:34:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/9] mirror: allow switching from background to active mode
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com, den@virtuozzo.com,
 t.lamprecht@proxmox.com, alexander.ivanov@virtuozzo.com
References: <20230224144825.466375-1-f.ebner@proxmox.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230224144825.466375-1-f.ebner@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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

On 24.02.23 17:48, Fiona Ebner wrote:
> With active mode, the guest write speed is limited by the synchronous
> writes to the mirror target. For this reason, management applications
> might want to start out in background mode and only switch to active
> mode later, when certain conditions are met. This series adds a
> block-job-change QMP command to acheive that, as well as
> job-type-specific information when querying block jobs, which
> can be used to decide when the switch should happen.
> 
> For now, only the direction background -> active is supported.
> 
> The information added upon querying is whether the target is actively
> synced, the total data sent, and the remaining dirty bytes.
> 
> Initially, I tried to go for a more general 'job-change' command, but
> I couldn't figure out a way to avoid mutual inclusion between
> block-core.json and job.json.

Hmm, what do you mean? As I understand job-* API is "new" and block-job-* is "old", so we'd better add job-change command

-- 
Best regards,
Vladimir


