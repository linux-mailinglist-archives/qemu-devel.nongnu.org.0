Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4893C3CFA4E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:15:00 +0200 (CEST)
Received: from localhost ([::1]:42772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5paN-0000YX-9W
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1m5pU5-0005fE-Km
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:08:29 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1m5pTy-0001vo-Gs
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:08:27 -0400
Received: by mail-pj1-x102e.google.com with SMTP id my10so13564998pjb.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ME0Vzwu3XuQ8FEhukYS/pvRq3DxNUlOiZLZz33n/PUE=;
 b=jPiASk3s2036zycpfPy8dX1VgnJ+CPyroVOy7KogPcDBmNeCGiKAHqF48KDOg4l0s8
 GIUPpNjDHoPcan/BjQhQVVMT2LyQsnHEIMHJ2Q6IP1KsPWdCbl09OwXiGeyblG/utGTV
 T6XOS8AQXPsbaDL0D3ld6pt3ShGJ7FVzx0dnKVanpgc3bkMdTgBOZxg6YwAuMW7u696Z
 vK76WqpyV1HFDz9p13fLkqLijiMZ5Cojkfgi2JcpIS2eWigMMwF03DxeZiw+EjwstLfw
 zmIemrVJx0mtb2WPh0NQoeVlrtOEAlvsd0/BsgMGZ7HsyuCO88Ts+x7u3U1Kp0OPnBx+
 R39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=ME0Vzwu3XuQ8FEhukYS/pvRq3DxNUlOiZLZz33n/PUE=;
 b=q6rugAI/cFS6Ol7eXUQRsxA/3iYWc1wLZ1XLBDqBqxjzhKX3fFuB25JHeKzLz6DpFS
 oMsvPJK5ZH2I7H1+PXdvXT/AKbySwehQ2Oh641OdQfzct7IAqzSIYx8qm2mMqCru5iXb
 qdrmRGaGynjNme5ESRxo4N65VJSWpmO1aX7igmo2DpcK53aZv/zyq1S5w+BgxAqVEzgV
 QU+IQi/Jwcm6obGynHvaUdXQkxXDuFwnavJVoc9YhAVbsOLsYp8yHRX39ANCdYGXjq/q
 o0IQHsHOvAdliESXHv6EBBm8R2TAreIgQQEWZ+IwX1Hrwqgr604pmWe0VIG+DBtwDUi7
 bZmQ==
X-Gm-Message-State: AOAM530pVYQkwovD1XqTZX0oei0jL4b5s6X7lxZLDIJq4b/3utiv+GY3
 IGJuwx9ElC++JjPulKPscgK2hg==
X-Google-Smtp-Source: ABdhPJw71f6yhfUndssdiTkwgjzjKzAg05lXvXjvsgVRLvVk05v+9Ez5oPP9HCR4qjNGJxYzVGdMDg==
X-Received: by 2002:a17:90a:c202:: with SMTP id
 e2mr22369576pjt.123.1626786477728; 
 Tue, 20 Jul 2021 06:07:57 -0700 (PDT)
Received: from [10.93.159.188] ([139.177.225.251])
 by smtp.gmail.com with ESMTPSA id y187sm23472392pfb.185.2021.07.20.06.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 06:07:34 -0700 (PDT)
Subject: Re: Re: [PATCH 1/1] block: Do not poll in
 bdrv_set_aio_context_ignore() when acquiring new_context
To: Kevin Wolf <kwolf@redhat.com>
References: <20210712053831.51722-1-yezhiyong@bytedance.com>
 <20210712053831.51722-2-yezhiyong@bytedance.com>
 <YPVS9ZnMFXEJ6c9H@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
Message-ID: <941e3587-f6c0-235c-7b6b-139d1c70ffa0@bytedance.com>
Date: Tue, 20 Jul 2021 21:07:15 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YPVS9ZnMFXEJ6c9H@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=yezhiyong@bytedance.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kevin,

Thanks for your reply and detailed answer. It is true that 
AIO_WAIT_WHILE() will temporarily unlock the new context as you said, 
which is a point I overlooked. I'm using qemu version 5.2, and it works 
fine after I cherry-pick commit c7040ff6 into it.

Thanks again!

Zhiyong

On 7/19/21 6:24 PM, Kevin Wolf wrote:
> Am 12.07.2021 um 07:38 hat Zhiyong Ye geschrieben:
>> When bdrv_set_aio_context_ignore() is called in the main loop to change
>> the AioContext onto the IO thread, the bdrv_drain_invoke_entry() never
>> gets to run and the IO thread hangs at co_schedule_bh_cb().
>>
>> This is because the AioContext is occupied by the main thread after
>> being attached to the IO thread, and the main thread poll in
>> bdrv_drained_end() waiting for the IO request to be drained, but the IO
>> thread cannot acquire the AioContext, which leads to deadlock.
> 
> This shouldn't be the case:
> 
>   * The caller must own the AioContext lock for the old AioContext of bs, but it
>   * must not own the AioContext lock for new_context (unless new_context is the
>   * same as the current context of bs).
> 
> Then bdrv_set_aio_context_ignore() switches the AioContext of bs, and
> then calls bdrv_drained_end() while holding only the lock for the new
> context. AIO_WAIT_WHILE() will temporarily drop that lock, so aio_poll()
> should run without holding any AioContext locks.
> 
> If I'm not missing anything, the scenario you're seeing means that the
> caller already held a lock for the new AioContext, so that it's locked
> twice while AIO_WAIT_WHILE() drops the lock only once. This would be a
> bug in the caller because the documentation I quoted explicitly forbids
> holding the AioContext lock for the new context.
> 
>> Just like below:
>>
>> <------>
>> [Switching to thread 1 (Thread 0x7fd810bbef40 (LWP 533312))]
>> (gdb) bt
>> ...
>> 3  0x00005601f6ea93aa in fdmon_poll_wait at ../util/fdmon-poll.c:80
>> 4  0x00005601f6e81a1c in aio_poll at ../util/aio-posix.c:607
>> 5  0x00005601f6dcde87 in bdrv_drained_end at ../block/io.c:496
>> 6  0x00005601f6d798cd in bdrv_set_aio_context_ignore at ../block.c:6502
>> 7  0x00005601f6d7996c in bdrv_set_aio_context_ignore at ../block.c:6472
>> 8  0x00005601f6d79cb8 in bdrv_child_try_set_aio_context at ../block.c:6587
>> 9  0x00005601f6da86f2 in blk_do_set_aio_context at ../block/block-backend.c:2026
>> 10 0x00005601f6daa96d in blk_set_aio_context at ../block/block-backend.c:2047
>> 11 0x00005601f6c71883 in virtio_scsi_hotplug at ../hw/scsi/virtio-scsi.c:831
> 
> Which version of QEMU are you using? In current git master, line 831 is
> something entirely different.
> 
> Are you using something before commit c7040ff6? Because this is a commit
> that fixed a virtio-scsi bug where it would hold the wrong lock before
> calling blk_set_aio_context().
> 
>>
>> [Switching to thread 4 (Thread 0x7fd8092e7700 (LWP 533315))]
>> (gdb) bt
>> ...
>> 4  0x00005601f6eab6a8 in qemu_mutex_lock_impl at ../util/qemu-thread-posix.c:79
>> 5  0x00005601f6e7ce88 in co_schedule_bh_cb at ../util/async.c:489
>> 6  0x00005601f6e7c404 in aio_bh_poll at ../util/async.c:164
>> 7  0x00005601f6e81a46 in aio_poll at ../util/aio-posix.c:659
>> 8  0x00005601f6d5ccf3 in iothread_run at ../iothread.c:73
>> 9  0x00005601f6eab512 in qemu_thread_start at ../util/qemu-thread-posix.c:521
>> 10 0x00007fd80d7b84a4 in start_thread at pthread_create.c:456
>> 11 0x00007fd80d4fad0f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:97
>> (gdb) f 4
>> 4  0x00005601f6eab6a8 in qemu_mutex_lock_impl at ../util/qemu-thread-posix.c:79
>> (gdb) p *mutex
>> $2 = {lock = {__data = {__lock = 2, __count = 1, __owner = 533312, __nusers = 1,
>>        __kind = 1, __spins = 0, __elision = 0, __list = {__prev = 0x0, __next = 0x0}},
>>        __size = "\002\000\000\000\001\000\000\000@#\b\000\001\000\000\000\001",
>>        '\000' <repeats 22 times>, __align = 4294967298}, initialized = true}
>> <------>
>>
>> Therefore, we should never poll anywhere in
>> bdrv_set_aio_context_ignore() when acquiring the new context. In fact,
>> commit e037c09c has also already elaborated on why we can't poll at
>> bdrv_do_drained_end().
>>
>> Signed-off-by: Zhiyong Ye <yezhiyong@bytedance.com>
>> ---
>>   block.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/block.c b/block.c
>> index be083f389e..ebbea72d64 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -6846,6 +6846,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
>>       GSList *parents_to_process = NULL;
>>       GSList *entry;
>>       BdrvChild *child, *parent;
>> +    int drained_end_counter = 0;
>>   
>>       g_assert(qemu_get_current_aio_context() == qemu_get_aio_context());
>>   
>> @@ -6907,7 +6908,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
>>           aio_context_release(old_context);
>>       }
>>   
>> -    bdrv_drained_end(bs);
>> +    bdrv_drained_end_no_poll(bs, &drained_end_counter);
>>   
>>       if (qemu_get_aio_context() != old_context) {
>>           aio_context_acquire(old_context);
>> @@ -6915,6 +6916,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
>>       if (qemu_get_aio_context() != new_context) {
>>           aio_context_release(new_context);
>>       }
>> +    BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
> 
> This would be wrong because bs is already in the new context, but you
> wouldn't hold the lock for it. AIO_WAIT_WHILE() would try to drop the
> lock for a context that isn't even locked, resulting in a crash.
> 
>>   }
>>   
>>   static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
> 
> Kevin
> 

