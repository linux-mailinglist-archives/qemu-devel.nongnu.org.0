Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8F6879FE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:20:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNWgg-0003LV-1e; Thu, 02 Feb 2023 05:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pNWgX-0003Hv-CH; Thu, 02 Feb 2023 05:19:18 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pNWgU-00052H-OU; Thu, 02 Feb 2023 05:19:16 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id B85FA419B1;
 Thu,  2 Feb 2023 11:19:00 +0100 (CET)
Message-ID: <afc7767f-481d-acd3-fd65-5c827c790e3a@proxmox.com>
Date: Thu, 2 Feb 2023 11:18:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: t.lamprecht@proxmox.com, jsnow@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
 <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Am 31.01.23 um 18:44 schrieb Vladimir Sementsov-Ogievskiy:
>> @@ -1035,10 +1036,31 @@ static int coroutine_fn mirror_run(Job *job,
>> Error **errp)
>>           if (s->in_flight == 0 && cnt == 0) {
>>               trace_mirror_before_flush(s);
>>               if (!job_is_ready(&s->common.job)) {
>> +                if (s->copy_mode ==
>> +                    MIRROR_COPY_MODE_WRITE_BLOCKING_AFTER_READY) {
>> +                    /*
>> +                     * Pause guest I/O to check if we can switch to
>> active mode.
>> +                     * To set actively_synced to true below, it is
>> necessary to
>> +                     * have seen and synced all guest I/O.
>> +                     */
>> +                    s->in_drain = true;
>> +                    bdrv_drained_begin(bs);
>> +                    if (bdrv_get_dirty_count(s->dirty_bitmap) > 0) {
>> +                        bdrv_drained_end(bs);
>> +                        s->in_drain = false;
>> +                        continue;
>> +                    }
>> +                    s->in_active_mode = true;
>> +                    bdrv_disable_dirty_bitmap(s->dirty_bitmap);
>> +                    bdrv_drained_end(bs);
>> +                    s->in_drain = false;
>> +                }
> 
> I doubt, do we really need the drained section?
> 
> Why can't we simply set s->in_active_mode here and don't care?
> 
> I think bdrv_get_dirty_count(s->dirty_bitmap) can't become > 0 here, as
> cnt is zero, we are in context of bs and we don't have yield point. (ok,
> we have one in drained_begin(), but what I think we can simply drop
> drained section here).
> 

Thank you for the explanation! I wasn't sure if it's really needed and
wanted to take it safe (should've mentioned that in the original mail).

>> +
>>                   if (mirror_flush(s) < 0) {
>>                       /* Go check s->ret.  */
>>                       continue;
>>                   }
>> +
>>                   /* We're out of the streaming phase.  From now on,
>> if the job
>>                    * is cancelled we will actually complete all
>> pending I/O and
>>                    * report completion.  This way, block-job-cancel
>> will leave
>> @@ -1443,7 +1465,7 @@ static int coroutine_fn
>> bdrv_mirror_top_do_write(BlockDriverState *bs,
>>       if (s->job) {
>>           copy_to_target = s->job->ret >= 0 &&
>>                            !job_is_cancelled(&s->job->common.job) &&
>> -                         s->job->copy_mode ==
>> MIRROR_COPY_MODE_WRITE_BLOCKING;
>> +                         s->job->in_active_mode;
>>       }
>>         if (copy_to_target) {
>> @@ -1494,7 +1516,7 @@ static int coroutine_fn
>> bdrv_mirror_top_pwritev(BlockDriverState *bs,
>>       if (s->job) {
>>           copy_to_target = s->job->ret >= 0 &&
>>                            !job_is_cancelled(&s->job->common.job) &&
>> -                         s->job->copy_mode ==
>> MIRROR_COPY_MODE_WRITE_BLOCKING;
>> +                         s->job->in_active_mode;
>>       }
>>         if (copy_to_target) {
>> @@ -1792,7 +1814,10 @@ static BlockJob *mirror_start_job(
>>           goto fail;
>>       }
>>       if (s->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING) {
>> +        s->in_active_mode = true;
>>           bdrv_disable_dirty_bitmap(s->dirty_bitmap);
>> +    } else {
>> +        s->in_active_mode = false;
>>       }
>>         ret = block_job_add_bdrv(&s->common, "source", bs, 0,
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 95ac4fa634..2a983ed78d 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -1200,10 +1200,13 @@
>>   #                  addition, data is copied in background just like in
>>   #                  @background mode.
>>   #
>> +# @write-blocking-after-ready: starts out in @background mode and
>> switches to
>> +#                              @write-blocking when transitioning to
>> ready.
> 
> You should add also (Since: 8.0) label
> 

I'll try to remember it next time.

>> +#
>>   # Since: 3.0
>>   ##
>>   { 'enum': 'MirrorCopyMode',
>> -  'data': ['background', 'write-blocking'] }
>> +  'data': ['background', 'write-blocking',
>> 'write-blocking-after-ready'] }
>>     ##
>>   # @BlockJobInfo:
> 


