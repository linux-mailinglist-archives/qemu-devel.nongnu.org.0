Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAB96111A4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:37:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOb5-0004M5-4Q; Fri, 28 Oct 2022 08:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ooOZn-0001ad-93
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:35:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ooOHc-0001Zb-TM
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666959379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AXrRQFaN0tBehgYveoXpfB0NILGd/jz8B6ju3Va9SDc=;
 b=OzBfVxdCuFBhzu12UlC2BpkcN0mZ2U22JNRav38DLwr/QZjO+pty2KpBQ6seupJQcIK/64
 xaPipNKTV2ABw2BhRdWIWoyS09fz/R+dOg71oOSbzbPJ8+gNcNdv970eBgi9VSfhZURJZv
 YDxe1vTFfmF2HObUingBvW+oNIzFh6M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-329-0PcjVCe-NoydZppZ2avVcQ-1; Fri, 28 Oct 2022 08:16:18 -0400
X-MC-Unique: 0PcjVCe-NoydZppZ2avVcQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 r187-20020a1c44c4000000b003c41e9ae97dso880955wma.6
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AXrRQFaN0tBehgYveoXpfB0NILGd/jz8B6ju3Va9SDc=;
 b=r1/qWZmSH/0YKpsvfxA7XfwcVvUXMJqgEixJS26TCi0U1vwTIbnV0i7GlQIy21aPlW
 /liHdfconOOwcysKq4QX0ZIq1gjzU67eKPM/WswuCl2PdhGKDTQ+pTvqhjfqbzij7nX2
 mUkj+tbDL2KcN6k0qpyHCQUCyK0avxmgE2nTlH06xYplG3yAwWE8v5OvOEbS3HfI/3Au
 Ri859/0/KoNgR6V2ZRVg5dHJ/KJRoMRJtcE4Fef8Un1ep11xjhLq7buA5Yrm4AhJUjNj
 AndXN2KO46a9ZVzW9L0miG5o4DQj1AGoaW+ZcGbbLxaP8UnSk9g2ZqP8JRtWiDOLmswb
 8wYg==
X-Gm-Message-State: ACrzQf2cvWA7BI5FdHCbQCVhjPEAGu8AW7tMsBgXXDsgtWzQKUZXxR8w
 amRM93V6ZrxjaTH3GXZX9kz5UAfUFUaZjIaB7yXFsqaP7W1jB9VQwG59tuEIOMo61SvKZrdZxct
 aawkgsF/Sfg9fpjg=
X-Received: by 2002:a05:6000:18a5:b0:230:a3b:bc16 with SMTP id
 b5-20020a05600018a500b002300a3bbc16mr35138863wri.627.1666959376397; 
 Fri, 28 Oct 2022 05:16:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4AMxPtkqTEW+WiJ71sHfy+PZPPlwav6K0t+mDgODAkkmK53TfP6ofSu4hda57al6k4XxAadw==
X-Received: by 2002:a05:6000:18a5:b0:230:a3b:bc16 with SMTP id
 b5-20020a05600018a500b002300a3bbc16mr35138832wri.627.1666959376079; 
 Fri, 28 Oct 2022 05:16:16 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c2ca500b003b435c41103sm9701728wmc.0.2022.10.28.05.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 05:16:15 -0700 (PDT)
Message-ID: <5adbe3ec-c02f-e57e-9242-45910c074105@redhat.com>
Date: Fri, 28 Oct 2022 14:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/3] linux-aio: use LinuxAioState from the running
 thread
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221028071635.3037348-1-eesposit@redhat.com>
 <20221028071635.3037348-2-eesposit@redhat.com>
 <7d34077e-ee9d-26ea-ad94-ecc5c7f7376c@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <7d34077e-ee9d-26ea-ad94-ecc5c7f7376c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 28/10/2022 um 13:51 schrieb Paolo Bonzini:
> On 10/28/22 09:16, Emanuele Giuseppe Esposito wrote:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Remove usage of aio_context_acquire by always submitting asynchronous
>> AIO to the current thread's LinuxAioState.
>>
>> In order to prevent mistakes from the caller side, avoid passing
>> LinuxAioState
>> in laio_io_{plug/unplug} and laio_co_submit.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/file-posix.c      | 10 +++-------
>>   block/linux-aio.c       | 34 ++++++++++++++++++----------------
>>   include/block/aio.h     |  4 ----
>>   include/block/raw-aio.h | 10 ++++------
>>   4 files changed, 25 insertions(+), 33 deletions(-)
>>
>> diff --git a/block/file-posix.c b/block/file-posix.c
>> index 23acffb9a4..23fe98eb3e 100644
>> --- a/block/file-posix.c
>> +++ b/block/file-posix.c
>> @@ -2099,10 +2099,8 @@ static int coroutine_fn
>> raw_co_prw(BlockDriverState *bs, uint64_t offset,
>>   #endif
>>   #ifdef CONFIG_LINUX_AIO
>>       } else if (s->use_linux_aio) {
>> -        LinuxAioState *aio =
>> aio_get_linux_aio(bdrv_get_aio_context(bs));
>>           assert(qiov->size == bytes);
>> -        return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
>> -                              s->aio_max_batch);
>> +        return laio_co_submit(s->fd, offset, qiov, type,
>> s->aio_max_batch);
>>   #endif
>>       }
>>   @@ -2142,8 +2140,7 @@ static void raw_aio_plug(BlockDriverState *bs)
>>       BDRVRawState __attribute__((unused)) *s = bs->opaque;
>>   #ifdef CONFIG_LINUX_AIO
>>       if (s->use_linux_aio) {
>> -        LinuxAioState *aio =
>> aio_get_linux_aio(bdrv_get_aio_context(bs));
>> -        laio_io_plug(bs, aio);
>> +        laio_io_plug();
>>       }
>>   #endif
>>   #ifdef CONFIG_LINUX_IO_URING
>> @@ -2159,8 +2156,7 @@ static void raw_aio_unplug(BlockDriverState *bs)
>>       BDRVRawState __attribute__((unused)) *s = bs->opaque;
>>   #ifdef CONFIG_LINUX_AIO
>>       if (s->use_linux_aio) {
>> -        LinuxAioState *aio =
>> aio_get_linux_aio(bdrv_get_aio_context(bs));
>> -        laio_io_unplug(bs, aio, s->aio_max_batch);
>> +        laio_io_unplug(s->aio_max_batch);
>>       }
>>   #endif
>>   #ifdef CONFIG_LINUX_IO_URING
>> diff --git a/block/linux-aio.c b/block/linux-aio.c
>> index d2cfb7f523..c806d3bb91 100644
>> --- a/block/linux-aio.c
>> +++ b/block/linux-aio.c
>> @@ -16,6 +16,9 @@
>>   #include "qemu/coroutine.h"
>>   #include "qapi/error.h"
>>   +/* Only used for assertions.  */
>> +#include "qemu/coroutine_int.h"
>> +
>>   #include <libaio.h>
>>     /*
>> @@ -56,10 +59,8 @@ struct LinuxAioState {
>>       io_context_t ctx;
>>       EventNotifier e;
>>   -    /* io queue for submit at batch.  Protected by AioContext lock. */
>> +    /* All data is only used in one I/O thread.  */
>>       LaioQueue io_q;
>> -
>> -    /* I/O completion processing.  Only runs in I/O thread.  */
>>       QEMUBH *completion_bh;
>>       int event_idx;
>>       int event_max;
>> @@ -102,9 +103,8 @@ static void qemu_laio_process_completion(struct
>> qemu_laiocb *laiocb)
>>        * later.  Coroutines cannot be entered recursively so avoid doing
>>        * that!
>>        */
>> -    if (!qemu_coroutine_entered(laiocb->co)) {
>> -        aio_co_wake(laiocb->co);
>> -    }
>> +    assert(laiocb->co->ctx == laiocb->ctx->aio_context);
>> +    qemu_coroutine_enter_if_inactive(laiocb->co);
> 
> This is wrong, it misses the aio_context_acquire/aio_context_release
> pair in aio_co_enter() (which is called by aio_co_wake()).
> 
> Likewise in patch 2.

Makes sense, I'll drop this hunk in v3.

Emanuele


