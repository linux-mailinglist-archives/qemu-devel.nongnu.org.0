Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D10E450348
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 12:19:03 +0100 (CET)
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mma0s-00024z-D3
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 06:19:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1mmZz9-0000O8-SK; Mon, 15 Nov 2021 06:17:15 -0500
Received: from kerio.kamp.de ([195.62.97.192]:52060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1mmZz5-0007fP-OX; Mon, 15 Nov 2021 06:17:14 -0500
X-Footer: a2FtcC5kZQ==
Received: from [172.21.12.60] ([172.21.12.60]) (authenticated user pl@kamp.de)
 by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Mon, 15 Nov 2021 12:17:01 +0100
Subject: Re: [PATCH v5 0/6] block/rbd: migrate to coroutines and add write
 zeroes support
From: Peter Lieven <pl@kamp.de>
To: Kevin Wolf <kwolf@redhat.com>
References: <YObtGbd5jlQNUbn0@redhat.com>
 <77F23D4A-18B3-4367-9D4E-9710FA6269B2@kamp.de> <YOgjFRNxUH2GUXyN@redhat.com>
 <2f156d36-52f0-a375-cfe7-f17164b306ad@kamp.de>
 <32b18db2-0a39-2945-1d06-e189273062c2@kamp.de> <YXap8SAOT5Kb41E2@redhat.com>
 <23e2ebe9-b600-cc60-0962-7e7d153a4d4d@kamp.de>
Message-ID: <40c6e10b-b8e3-bb5c-cde3-b4a4e2261d1f@kamp.de>
Date: Mon, 15 Nov 2021 12:17:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <23e2ebe9-b600-cc60-0962-7e7d153a4d4d@kamp.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.278,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.10.21 um 16:53 schrieb Peter Lieven:
> Am 25.10.21 um 14:58 schrieb Kevin Wolf:
>> Am 25.10.2021 um 13:39 hat Peter Lieven geschrieben:
>>> Am 16.09.21 um 14:34 schrieb Peter Lieven:
>>>> Am 09.07.21 um 12:21 schrieb Kevin Wolf:
>>>>> Am 08.07.2021 um 20:23 hat Peter Lieven geschrieben:
>>>>>> Am 08.07.2021 um 14:18 schrieb Kevin Wolf <kwolf@redhat.com>:
>>>>>>> Am 07.07.2021 um 20:13 hat Peter Lieven geschrieben:
>>>>>>>>> Am 06.07.2021 um 17:25 schrieb Kevin Wolf <kwolf@redhat.com>:
>>>>>>>>> Am 06.07.2021 um 16:55 hat Peter Lieven geschrieben:
>>>>>>>>>> I will have a decent look after my vacation.
>>>>>>>>> Sounds good, thanks. Enjoy your vacation!
>>>>>>>> As I had to fire up my laptop to look into another issue anyway, I
>>>>>>>> have sent two patches for updating MAINTAINERS and to fix the int vs.
>>>>>>>> bool mix for task->complete.
>>>>>>> I think you need to reevaluate your definition of vacation. ;-)
>>>>>> Lets talk about this when the kids are grown up. Sometimes sending
>>>>>> patches can be quite relaxing :-)
>>>>> Heh, fair enough. :-)
>>>>>
>>>>>>> But thanks anyway.
>>>>>>>
>>>>>>>> As Paolos fix (5f50be9b5) is relatively new and there are maybe other
>>>>>>>> non obvious problems when removing the BH indirection and we are close
>>>>>>>> to soft freeze I would leave the BH removal change for 6.2.
>>>>>>> Sure, code cleanups aren't urgent.
>>>>>> Isn’t the indirection also a slight performance drop?
>>>>> Yeah, I guess technically it is, though I doubt it's measurable.
>>>> As promised I was trying to remove the indirection through the BH after Qemu 6.1 release.
>>>>
>>>> However, if I remove the BH I run into the following assertion while running some fio tests:
>>>>
>>>>
>>>> qemu-system-x86_64: ../block/block-backend.c:1197: blk_wait_while_drained: Assertion `blk->in_flight > 0' failed.
>>>>
>>>>
>>>> Any idea?
>>>>
>>>>
>>>> This is what I changed:
>>>>
>>>>
>>>> diff --git a/block/rbd.c b/block/rbd.c
>>>> index 3cb24f9981..bc1dbc20f7 100644
>>>> --- a/block/rbd.c
>>>> +++ b/block/rbd.c
>>>> @@ -1063,13 +1063,6 @@ static int qemu_rbd_resize(BlockDriverState *bs, uint64_t size)
>>>>       return 0;
>>>>   }
>>>>
>>>> -static void qemu_rbd_finish_bh(void *opaque)
>>>> -{
>>>> -    RBDTask *task = opaque;
>>>> -    task->complete = true;
>>>> -    aio_co_wake(task->co);
>>>> -}
>>>> -
>>>>   /*
>>>>    * This is the completion callback function for all rbd aio calls
>>>>    * started from qemu_rbd_start_co().
>>>> @@ -1083,8 +1076,8 @@ static void qemu_rbd_completion_cb(rbd_completion_t c, RBDTask *task)
>>>>   {
>>>>       task->ret = rbd_aio_get_return_value(c);
>>>>       rbd_aio_release(c);
>>>> -    aio_bh_schedule_oneshot(bdrv_get_aio_context(task->bs),
>>>> -                            qemu_rbd_finish_bh, task);
>>>> +    task->complete = true;
>>>> +    aio_co_wake(task->co);
>>>>   }
>>> Kevin, Paolo, any idea?
>> Not really, I don't see the connection between both places.
>>
>> Do you have a stack trace for the crash?
>
> The crash seems not to be limited to that assertion. I have also seen:
>
>
> qemu-system-x86_64: ../block/block-backend.c:1497: blk_aio_write_entry: Assertion `!qiov || qiov->size == acb->bytes' failed.
>
>
> Altough harder to trigger I catch this backtrace in gdb:
>
>
> qemu-system-x86_64: ../block/block-backend.c:1497: blk_aio_write_entry: Assertion `!qiov || qiov->size == acb->bytes' failed.
> [Wechseln zu Thread 0x7ffff7fa8f40 (LWP 17852)]
>
> Thread 1 "qemu-system-x86" hit Breakpoint 1, __GI_abort () at abort.c:49
> 49    abort.c: Datei oder Verzeichnis nicht gefunden.
> (gdb) bt
> #0  0x00007ffff42567e0 in __GI_abort () at abort.c:49
> #1  0x00007ffff424648a in __assert_fail_base (fmt=0x7ffff43cd750 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=assertion@entry=0x555555e638e0 "!qiov || qiov->size == acb->bytes", file=file@entry=0x555555e634b2 "../block/block-backend.c", line=line@entry=1497, function=function@entry=0x555555e63b20 <__PRETTY_FUNCTION__.32450> "blk_aio_write_entry") at assert.c:92
> #2  0x00007ffff4246502 in __GI___assert_fail (assertion=assertion@entry=0x555555e638e0 "!qiov || qiov->size == acb->bytes", file=file@entry=0x555555e634b2 "../block/block-backend.c", line=line@entry=1497, function=function@entry=0x555555e63b20 <__PRETTY_FUNCTION__.32450> "blk_aio_write_entry") at assert.c:101
> #3  0x0000555555becc78 in blk_aio_write_entry (opaque=0x555556b534f0) at ../block/block-backend.c:1497
> #4  0x0000555555cf0e4c in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:173
> #5  0x00007ffff426e7b0 in __start_context () at /lib/x86_64-linux-gnu/libc.so.6
> #6  0x00007fffffffd5a0 in  ()
> #7  0x0000000000000000 in  ()
>


any ideas? Or should we just abandon the idea of removing the BH?


Peter




