Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D77439526
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 13:46:02 +0200 (CEST)
Received: from localhost ([::1]:46708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meyQS-0006It-Lk
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 07:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1meyKq-00044v-5x; Mon, 25 Oct 2021 07:40:12 -0400
Received: from kerio.kamp.de ([195.62.97.192]:45330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1meyKl-0003cc-J2; Mon, 25 Oct 2021 07:40:11 -0400
X-Footer: a2FtcC5kZQ==
Received: from [172.21.12.60] ([172.21.12.60]) (authenticated user pl@kamp.de)
 by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Mon, 25 Oct 2021 13:39:55 +0200
Subject: Re: [PATCH v5 0/6] block/rbd: migrate to coroutines and add write
 zeroes support
From: Peter Lieven <pl@kamp.de>
To: Kevin Wolf <kwolf@redhat.com>
References: <YObtGbd5jlQNUbn0@redhat.com>
 <77F23D4A-18B3-4367-9D4E-9710FA6269B2@kamp.de> <YOgjFRNxUH2GUXyN@redhat.com>
 <2f156d36-52f0-a375-cfe7-f17164b306ad@kamp.de>
Message-ID: <32b18db2-0a39-2945-1d06-e189273062c2@kamp.de>
Date: Mon, 25 Oct 2021 13:39:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2f156d36-52f0-a375-cfe7-f17164b306ad@kamp.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.846,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.09.21 um 14:34 schrieb Peter Lieven:
> Am 09.07.21 um 12:21 schrieb Kevin Wolf:
>> Am 08.07.2021 um 20:23 hat Peter Lieven geschrieben:
>>> Am 08.07.2021 um 14:18 schrieb Kevin Wolf <kwolf@redhat.com>:
>>>> Am 07.07.2021 um 20:13 hat Peter Lieven geschrieben:
>>>>>> Am 06.07.2021 um 17:25 schrieb Kevin Wolf <kwolf@redhat.com>:
>>>>>> Am 06.07.2021 um 16:55 hat Peter Lieven geschrieben:
>>>>>>> I will have a decent look after my vacation.
>>>>>> Sounds good, thanks. Enjoy your vacation!
>>>>> As I had to fire up my laptop to look into another issue anyway, I
>>>>> have sent two patches for updating MAINTAINERS and to fix the int vs.
>>>>> bool mix for task->complete.
>>>> I think you need to reevaluate your definition of vacation. ;-)
>>> Lets talk about this when the kids are grown up. Sometimes sending
>>> patches can be quite relaxing :-)
>> Heh, fair enough. :-)
>>
>>>> But thanks anyway.
>>>>
>>>>> As Paolos fix (5f50be9b5) is relatively new and there are maybe other
>>>>> non obvious problems when removing the BH indirection and we are close
>>>>> to soft freeze I would leave the BH removal change for 6.2.
>>>> Sure, code cleanups aren't urgent.
>>> Isn’t the indirection also a slight performance drop?
>> Yeah, I guess technically it is, though I doubt it's measurable.
>
>
> As promised I was trying to remove the indirection through the BH after Qemu 6.1 release.
>
> However, if I remove the BH I run into the following assertion while running some fio tests:
>
>
> qemu-system-x86_64: ../block/block-backend.c:1197: blk_wait_while_drained: Assertion `blk->in_flight > 0' failed.
>
>
> Any idea?
>
>
> This is what I changed:
>
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 3cb24f9981..bc1dbc20f7 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -1063,13 +1063,6 @@ static int qemu_rbd_resize(BlockDriverState *bs, uint64_t size)
>      return 0;
>  }
>
> -static void qemu_rbd_finish_bh(void *opaque)
> -{
> -    RBDTask *task = opaque;
> -    task->complete = true;
> -    aio_co_wake(task->co);
> -}
> -
>  /*
>   * This is the completion callback function for all rbd aio calls
>   * started from qemu_rbd_start_co().
> @@ -1083,8 +1076,8 @@ static void qemu_rbd_completion_cb(rbd_completion_t c, RBDTask *task)
>  {
>      task->ret = rbd_aio_get_return_value(c);
>      rbd_aio_release(c);
> -    aio_bh_schedule_oneshot(bdrv_get_aio_context(task->bs),
> -                            qemu_rbd_finish_bh, task);
> +    task->complete = true;
> +    aio_co_wake(task->co);
>  }
>
>
> Peter
>
>

Kevin, Paolo, any idea?


Thanks,

Peter


-- 

Mit freundlichen Grüßen

Peter Lieven

...........................................................

   KAMP Netzwerkdienste GmbH
   Vestische Str. 89-91 | 46117 Oberhausen
   Tel: +49 (0) 208.89 402-50 | Fax: +49 (0) 208.89 402-40
   pl@kamp.de | http://www.kamp.de

   Geschäftsführer: Heiner Lante | Michael Lante
   Amtsgericht Duisburg | HRB Nr. 12154
   USt-Id-Nr.: DE 120607556

...........................................................



