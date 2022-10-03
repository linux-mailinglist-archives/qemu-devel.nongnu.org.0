Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE065F2D0D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 11:23:42 +0200 (CEST)
Received: from localhost ([::1]:34096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofHfo-0004Gv-CM
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 05:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ofHbb-0001ai-7p
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ofHbI-0007qO-Rm
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664788740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5utfVoLIVmtcvkZfr32+GJbtZpfVxQVjHeclS2kSnGo=;
 b=ewCKBLWKYGgnxq5cUPZyIvQEeQiioRjQqGADRfpN5/cy9O1wbE/04vhi3q/N1VD9cDyb22
 zMkGrL1zgumNvAmwMYDspL2GusclPAyY4XSfk9lrYRBATueogsFIyxHRjuCT9d+pBaeUZs
 hbzWQz0CPzVBdtWFtfMeEtlGTFVt56Q=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-110-3_-jXixuMX-yB4w9SVwuNg-1; Mon, 03 Oct 2022 05:18:59 -0400
X-MC-Unique: 3_-jXixuMX-yB4w9SVwuNg-1
Received: by mail-qk1-f197.google.com with SMTP id
 de16-20020a05620a371000b006ceb92bc740so8696991qkb.15
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 02:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5utfVoLIVmtcvkZfr32+GJbtZpfVxQVjHeclS2kSnGo=;
 b=t6BgErGm/c5uGrBx1kxbY3/9yZMFAlfd4jpXqJcw6hZIF39j7PvIpmXihY8FeD6Du8
 DOtvCpy8oOtV0E34aYmQKxCMEf7H52Qa06hf4Jv7hHXmghNYVC6DVx0T7Y1spHt18/l6
 BeVjv7mOXPWg9fTdWCM8gDigvbjUFvxtKbS5OND+WIhAD442wD5zo79ILXYIH+qAv61e
 1roT39+FvhAS1y+nM+0M3PkdfU9dnrxMYO7UWKCnyFrf4h5a6n6ug6ofwKx0OPlaSFBd
 x2RWQSqckOpie5eaa+GJPtctmSQ2Lg0Nnu1Zs8XozKiW+q8fpybTmafbi2nMb8X0RKNo
 OuBw==
X-Gm-Message-State: ACrzQf3LrVIf1IPvYS5dOZiwjLk0wbUSnGMQR6UnQCluERvMFMXJHalq
 5V5Uc01WHzfj3Z2ZUZlBGAExzLoDj1mOGkaRoYADFK7SKW3aM64iCLJfY3cna5cSU9d18tCLdLb
 f7Qmdb4LgbCX5gfA=
X-Received: by 2002:ac8:7e95:0:b0:35c:cd2c:c74c with SMTP id
 w21-20020ac87e95000000b0035ccd2cc74cmr14968120qtj.524.1664788738561; 
 Mon, 03 Oct 2022 02:18:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5u6vUD4nUDn+30qQNhYflCcv/jf31AWfKxjcL0pn1ZaAX8pWRf+/K0w/EweaTWvUfmv7Hymg==
X-Received: by 2002:ac8:7e95:0:b0:35c:cd2c:c74c with SMTP id
 w21-20020ac87e95000000b0035ccd2cc74cmr14968107qtj.524.1664788738274; 
 Mon, 03 Oct 2022 02:18:58 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a37f604000000b006bbc09af9f5sm10550460qkj.101.2022.10.03.02.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 02:18:57 -0700 (PDT)
Message-ID: <ef0dd9e7-95f2-021e-ffd1-3b9dda12660a@redhat.com>
Date: Mon, 3 Oct 2022 11:18:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] linux-aio: use LinuxAioState from the running thread
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20220609134452.1146309-1-eesposit@redhat.com>
 <20220609134452.1146309-2-eesposit@redhat.com> <YzWxJo0vDiupS0fO@redhat.com>
 <9ca32c64-43cb-7c77-9cb3-d6516a157c23@redhat.com>
 <YzcL+380WqqmcRgm@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YzcL+380WqqmcRgm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.086, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 30/09/2022 um 17:32 schrieb Kevin Wolf:
> Am 30.09.2022 um 12:00 hat Emanuele Giuseppe Esposito geschrieben:
>>
>>
>> Am 29/09/2022 um 16:52 schrieb Kevin Wolf:
>>> Am 09.06.2022 um 15:44 hat Emanuele Giuseppe Esposito geschrieben:
>>>> From: Paolo Bonzini <pbonzini@redhat.com>
>>>>
>>>> Remove usage of aio_context_acquire by always submitting asynchronous
>>>> AIO to the current thread's LinuxAioState.
>>>>
>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>> ---
>>>>  block/file-posix.c  |  3 ++-
>>>>  block/linux-aio.c   | 13 ++++++-------
>>>>  include/block/aio.h |  4 ----
>>>>  3 files changed, 8 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>>> index 48cd096624..33f92f004a 100644
>>>> --- a/block/file-posix.c
>>>> +++ b/block/file-posix.c
>>>> @@ -2086,7 +2086,8 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
>>>>  #endif
>>>>  #ifdef CONFIG_LINUX_AIO
>>>>      } else if (s->use_linux_aio) {
>>>> -        LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
>>>> +        AioContext *ctx = qemu_get_current_aio_context();
>>>> +        LinuxAioState *aio = aio_get_linux_aio(ctx);
>>>>          assert(qiov->size == bytes);
>>>>          return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
>>>>                                s->aio_max_batch);
>>>
>>> raw_aio_plug() and raw_aio_unplug() need the same change.
>>>
>>> I wonder if we should actually better remove the 'aio' parameter from
>>> the functions that linux-aio.c offers to avoid suggesting that any
>>> LinuxAioState works for any thread. Getting it from the current
>>> AioContext is something it can do by itself. But this would be code
>>> cleanup for a separate patch.
>>
>> I do not think that this would work. At least not for all functions of
>> the API. I tried removing the ctx parameter from aio_setup_linux_aio and
>> it's already problematic, as it used by raw_aio_attach_aio_context()
>> which is a .bdrv_attach_aio_context() callback, which should be called
>> by the main thread. So that function needs the aiocontext parameter.
>>
>> So maybe for now just simplify aio_get_linux_aio()? In a separate patch.
> 
> Oh, I don't mind the ctx parameter in these functions at all.
> 
> I was talking about the functions in linux-aio.c, specifically
> laio_co_submit(), laio_io_plug() and laio_io_unplug(). They could call
> aio_get_linux_aio() internally for the current thread instead of letting
> the caller do that and giving the false impression that there is more
> than one correct value for their LinuxAioState parameter.
> 
> But anyway, as I said, this would be a separate cleanup patch. For this
> one, it's just important that at least file-posix.c does the right thing
> for plug/unplug, too.
> 

Make sense

>>>> diff --git a/block/linux-aio.c b/block/linux-aio.c
>>>> index 4c423fcccf..1d3cc767d1 100644
>>>> --- a/block/linux-aio.c
>>>> +++ b/block/linux-aio.c
>>>> @@ -16,6 +16,9 @@
>>>>  #include "qemu/coroutine.h"
>>>>  #include "qapi/error.h"
>>>>  
>>>> +/* Only used for assertions.  */
>>>> +#include "qemu/coroutine_int.h"
>>>> +
>>>>  #include <libaio.h>
>>>>  
>>>>  /*
>>>> @@ -56,10 +59,8 @@ struct LinuxAioState {
>>>>      io_context_t ctx;
>>>>      EventNotifier e;
>>>>  
>>>> -    /* io queue for submit at batch.  Protected by AioContext lock. */
>>>> +    /* All data is only used in one I/O thread.  */
>>>>      LaioQueue io_q;
>>>> -
>>>> -    /* I/O completion processing.  Only runs in I/O thread.  */
>>>>      QEMUBH *completion_bh;
>>>>      int event_idx;
>>>>      int event_max;
>>>> @@ -102,9 +103,8 @@ static void qemu_laio_process_completion(struct qemu_laiocb *laiocb)
>>>>       * later.  Coroutines cannot be entered recursively so avoid doing
>>>>       * that!
>>>>       */
>>>> -    if (!qemu_coroutine_entered(laiocb->co)) {
>>>> -        aio_co_wake(laiocb->co);
>>>> -    }
>>>> +    assert(laiocb->co->ctx == laiocb->ctx->aio_context);
>>>> +    qemu_coroutine_enter_if_inactive(laiocb->co);
>>>>  }
>>>>  
>>>>  /**
>>>> @@ -238,7 +238,6 @@ static void qemu_laio_process_completions_and_submit(LinuxAioState *s)
>>>>      if (!s->io_q.plugged && !QSIMPLEQ_EMPTY(&s->io_q.pending)) {
>>>>          ioq_submit(s);
>>>>      }
>>>> -    aio_context_release(s->aio_context);
>>>>  }
>>>
>>> I certainly expected the aio_context_acquire() in the same function to
>>> go away, too! Am I missing something?
>>
>> ops
> 
> :-)
> 
> If it's unintentional, I'm actually surprised that locking without
> unlocking later didn't cause problems immediately.

Seems that iotests/unit tests do not trigger it.

> 
> Kevin
> 


