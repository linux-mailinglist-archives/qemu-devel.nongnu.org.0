Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B670F6A7F63
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:01:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfkO-0004y1-7A; Thu, 02 Mar 2023 05:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pXfk8-0004pm-Hw; Thu, 02 Mar 2023 05:00:56 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pXfk6-0005QE-H7; Thu, 02 Mar 2023 05:00:56 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 987F244D46;
 Thu,  2 Mar 2023 11:00:51 +0100 (CET)
Message-ID: <9b5f2a97-e8a4-d5cc-8cb7-61e23233813b@proxmox.com>
Date: Thu, 2 Mar 2023 11:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/9] mirror: implement mirror_change method
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com, den@virtuozzo.com,
 t.lamprecht@proxmox.com, alexander.ivanov@virtuozzo.com
References: <20230224144825.466375-1-f.ebner@proxmox.com>
 <20230224144825.466375-4-f.ebner@proxmox.com>
 <2cdf6add-6224-6f64-dda8-d359405e5fff@yandex-team.ru>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <2cdf6add-6224-6f64-dda8-d359405e5fff@yandex-team.ru>
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

Am 01.03.23 um 16:18 schrieb Vladimir Sementsov-Ogievskiy:
> On 24.02.23 17:48, Fiona Ebner wrote:
>> which allows switching the @copy-mode from 'background' to
>> 'write-blocking'.
>>
>> Once the job is in active mode, no new writes need to be registered in
>> the dirty bitmap, because they are synchronously written to the
>> target. But since the method is called from the monitor and IO might
>> be happening in an iothread at the same time, a drained section is
>> needed.
>>
>> This is useful for management applications, so they can start out in
>> background mode to avoid limiting guest write speed and switch to
>> active mode when certain criteria are fullfilled. Currently, the
>> amount of information that can be used for those criteria is a bit
>> limited, so the plan is to extend quering of block jobs to return more
>> information relevant for mirror.
>>
>> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
>> ---
>>
>> Sorry, I still haven't fully grasped the drained logic. Is my
>> rationale for the drained section correct? There also are some yield
>> points in block/io.c, for example when the driver implements
>> bdrv_aio_pwritev (file-win32 and null), and the bitmap is only updated
>> after that. Is that another reason it's required?
>>
> 
> I think your logic is correct. But draining is quite expensive.
> 
> Could we avoid it? For example, just count separately
> in_flight_non_active writes (the writes that are started with copy_mode
> = BACKGROUND), and disable dirty bitmap when this counter becomes 0.
> 
> Or better idea: move the dirty bitmap to the filter, and make it always
> disabled. Then, we can set it by hand in bdrv_mirror_top_do_write() only
> when copy_to_target = false.
> 
Sounds good to me! I'll try to go for the second approach in the next
version.

Best Regards,
Fiona


