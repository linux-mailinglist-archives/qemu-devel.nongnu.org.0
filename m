Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A48C5F0837
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 12:04:04 +0200 (CEST)
Received: from localhost ([::1]:36332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeCsF-000753-7x
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 06:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oeCor-0004v2-85
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 06:00:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oeCoo-00034w-VN
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 06:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664532030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdzF+ff0NiigFDP+vj05gHt4sG9+KiwRzQlo0CUyrJ0=;
 b=Ri0HWiXGp1/G90OSmj++n3F4ro8Eu+yOUHasf/WjMGSSAKHpQDAi++FoHF4kuYLUO1L7Gn
 sS4CUw3DVVOXFrXNsY/Gn4U4uYt82bvzZRm+w6l1PQty2TgVCCZJywuiafWEZZxo0iOPas
 STjaFI/qq/Cl1XCwGGrdgOjvGWMKjtU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-virZnDtjOVaPGsGHk1BemQ-1; Fri, 30 Sep 2022 06:00:28 -0400
X-MC-Unique: virZnDtjOVaPGsGHk1BemQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 bj42-20020a05620a192a00b006cf663bca6aso3347956qkb.3
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 03:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=hdzF+ff0NiigFDP+vj05gHt4sG9+KiwRzQlo0CUyrJ0=;
 b=Un6Mkjz8tbS9cCcLj2K3acpwr9TJL3pw4FvfpPXROpeCIp423aUrD3596fpCBgtxpw
 CBdi54OammbRr1c+pS04Ncc2kSmPimlCjOVZ3w73IaVd8+XBpble1GkPvYk1VSdjB9sI
 gVecx/8NpA8zQNlQXxxpeDLv44g6rBv9iDJrc+aeSiK8wUX0FE3nSbrxKOs2Gu09QsjH
 /m1NiI6z6x5soVzaEOtls9T8YBand3cW+r73p1qkZxAj+0zUsCnAW132RPNatvfOj3YP
 aBdj6ywlEEZPcxm99x0+BfpPtUj26LuYQ1n66U9Fx6q38/DGdtYlZ5u9PZOBp+ZSQUD7
 2mzw==
X-Gm-Message-State: ACrzQf0IMry094ExOO028D4aIBMKawZoXWz9I/3DPUfKlNOfLeWmEPrA
 WsYJgQmsYxqktzVyJ3yb1BdkmRJpS0j2U3oPcGpB5/Q1800XIgJq+8KAca5SStns7s/EvcVY6zF
 mVq/3678jFWvHtuo=
X-Received: by 2002:a05:6214:1c89:b0:4af:664e:553b with SMTP id
 ib9-20020a0562141c8900b004af664e553bmr6155360qvb.18.1664532028010; 
 Fri, 30 Sep 2022 03:00:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7viUuRE43VLTc/yygPQcQB4+BJz4Lw1rUiyR0IWNkfFV7z8NnsHSN2tLKZc4wjfz9wW5uS4w==
X-Received: by 2002:a05:6214:1c89:b0:4af:664e:553b with SMTP id
 ib9-20020a0562141c8900b004af664e553bmr6155340qvb.18.1664532027762; 
 Fri, 30 Sep 2022 03:00:27 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a05620a410300b006b5bf5d45casm2281816qko.27.2022.09.30.03.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 03:00:27 -0700 (PDT)
Message-ID: <9ca32c64-43cb-7c77-9cb3-d6516a157c23@redhat.com>
Date: Fri, 30 Sep 2022 12:00:23 +0200
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
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YzWxJo0vDiupS0fO@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.099, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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



Am 29/09/2022 um 16:52 schrieb Kevin Wolf:
> Am 09.06.2022 um 15:44 hat Emanuele Giuseppe Esposito geschrieben:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Remove usage of aio_context_acquire by always submitting asynchronous
>> AIO to the current thread's LinuxAioState.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  block/file-posix.c  |  3 ++-
>>  block/linux-aio.c   | 13 ++++++-------
>>  include/block/aio.h |  4 ----
>>  3 files changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/block/file-posix.c b/block/file-posix.c
>> index 48cd096624..33f92f004a 100644
>> --- a/block/file-posix.c
>> +++ b/block/file-posix.c
>> @@ -2086,7 +2086,8 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
>>  #endif
>>  #ifdef CONFIG_LINUX_AIO
>>      } else if (s->use_linux_aio) {
>> -        LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
>> +        AioContext *ctx = qemu_get_current_aio_context();
>> +        LinuxAioState *aio = aio_get_linux_aio(ctx);
>>          assert(qiov->size == bytes);
>>          return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
>>                                s->aio_max_batch);
> 
> raw_aio_plug() and raw_aio_unplug() need the same change.
> 
> I wonder if we should actually better remove the 'aio' parameter from
> the functions that linux-aio.c offers to avoid suggesting that any
> LinuxAioState works for any thread. Getting it from the current
> AioContext is something it can do by itself. But this would be code
> cleanup for a separate patch.

I do not think that this would work. At least not for all functions of
the API. I tried removing the ctx parameter from aio_setup_linux_aio and
it's already problematic, as it used by raw_aio_attach_aio_context()
which is a .bdrv_attach_aio_context() callback, which should be called
by the main thread. So that function needs the aiocontext parameter.

So maybe for now just simplify aio_get_linux_aio()? In a separate patch.
> 
>> diff --git a/block/linux-aio.c b/block/linux-aio.c
>> index 4c423fcccf..1d3cc767d1 100644
>> --- a/block/linux-aio.c
>> +++ b/block/linux-aio.c
>> @@ -16,6 +16,9 @@
>>  #include "qemu/coroutine.h"
>>  #include "qapi/error.h"
>>  
>> +/* Only used for assertions.  */
>> +#include "qemu/coroutine_int.h"
>> +
>>  #include <libaio.h>
>>  
>>  /*
>> @@ -56,10 +59,8 @@ struct LinuxAioState {
>>      io_context_t ctx;
>>      EventNotifier e;
>>  
>> -    /* io queue for submit at batch.  Protected by AioContext lock. */
>> +    /* All data is only used in one I/O thread.  */
>>      LaioQueue io_q;
>> -
>> -    /* I/O completion processing.  Only runs in I/O thread.  */
>>      QEMUBH *completion_bh;
>>      int event_idx;
>>      int event_max;
>> @@ -102,9 +103,8 @@ static void qemu_laio_process_completion(struct qemu_laiocb *laiocb)
>>       * later.  Coroutines cannot be entered recursively so avoid doing
>>       * that!
>>       */
>> -    if (!qemu_coroutine_entered(laiocb->co)) {
>> -        aio_co_wake(laiocb->co);
>> -    }
>> +    assert(laiocb->co->ctx == laiocb->ctx->aio_context);
>> +    qemu_coroutine_enter_if_inactive(laiocb->co);
>>  }
>>  
>>  /**
>> @@ -238,7 +238,6 @@ static void qemu_laio_process_completions_and_submit(LinuxAioState *s)
>>      if (!s->io_q.plugged && !QSIMPLEQ_EMPTY(&s->io_q.pending)) {
>>          ioq_submit(s);
>>      }
>> -    aio_context_release(s->aio_context);
>>  }
> 
> I certainly expected the aio_context_acquire() in the same function to
> go away, too! Am I missing something?

ops

Emanuele


