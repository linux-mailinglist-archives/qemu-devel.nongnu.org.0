Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE1655F900
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 09:32:28 +0200 (CEST)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6SBX-00023E-Id
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 03:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o6S8P-0008SI-4z
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 03:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o6S8K-0001sK-Ew
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 03:29:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656487747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I92IFH8NA7TRgQHNE0b1uQixcLsKziwt6y1BFqfn2g8=;
 b=jIWDiJCaE+KjzUHiXQnVumiR5AfKV575wHTJvaqSUkguPI6Eli92ASz9XVtgZcFINoGnJN
 BCQhLjNJuSXu6QjkJD1RmnVDrpYsr0tyKVHsDRgEG/REjFmfte1q4R5akb3m1te9G40ovQ
 AMKOHjUGh/yVt1WpBtbKyP6VYdFZ5Wo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-3IdDOu4aPMqFpG0-4HIm8A-1; Wed, 29 Jun 2022 03:28:55 -0400
X-MC-Unique: 3IdDOu4aPMqFpG0-4HIm8A-1
Received: by mail-lf1-f71.google.com with SMTP id
 e10-20020a19674a000000b0047f8d95f43cso7371437lfj.0
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 00:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I92IFH8NA7TRgQHNE0b1uQixcLsKziwt6y1BFqfn2g8=;
 b=J2mW9lPoOD5yuHgfXJZ/uctQoZ3oL2HTdMyQm6cH3mKnQOA88pF5Nce8j/AcewqqTB
 dQGZOgsuU1K481oEYRCTgfN1/+n2W+9q5tBN0uX9SiDbD/oSGLlDQEVYFTzUtt0ptUA2
 ERnTl1kxT9iDVFvQFTmyPemAiqfkDw2Huqix5DVnX11hZgA5aW/mcSmSDsdJsmBcFwHQ
 RDRseJIiFgPMdKm6G8hVI3Yj32gCK82qTwo1g6Fk3QTXyXZeWNHh/Wg9ZRB90x5biX2K
 x78hQjZYTBlgqvUFEPfPvCj79ke+QdKFBVQhBHUfRVT6EqEFsM+e+wCbZOAwfxSqjpBv
 cyrA==
X-Gm-Message-State: AJIora84NiTLdc01zkGt62l3IANd7t6SEf8+ncaKpRclE9qpjApFk8zL
 3OWMA/BKJ6Raa/yndtKdC6sRmd0RaVi2e853+sFSh5smVEklO7Z+LKJo2NagfxypZnKzC0p9ypI
 MEMM8zsCPwgrwDqc=
X-Received: by 2002:a05:6512:3a88:b0:481:4bb:3246 with SMTP id
 q8-20020a0565123a8800b0048104bb3246mr1198029lfu.292.1656487733687; 
 Wed, 29 Jun 2022 00:28:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vGcVV+Iq7rgyPYu0O7OqDHMtQyQMPehXU5LO45CrIH1oKhirT0QnXX56j3nP1817wHifbosw==
X-Received: by 2002:a05:6512:3a88:b0:481:4bb:3246 with SMTP id
 q8-20020a0565123a8800b0048104bb3246mr1198009lfu.292.1656487733235; 
 Wed, 29 Jun 2022 00:28:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:e600:d4fa:af4b:d7b6:20df?
 (p200300cbc708e600d4faaf4bd7b620df.dip0.t-ipconnect.de.
 [2003:cb:c708:e600:d4fa:af4b:d7b6:20df])
 by smtp.gmail.com with ESMTPSA id
 cf3-20020a056512280300b0047fa8ffe92csm2494544lfb.233.2022.06.29.00.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 00:28:52 -0700 (PDT)
Message-ID: <b3fd052f-658f-2e39-816b-9e5b9e521ec7@redhat.com>
Date: Wed, 29 Jun 2022 09:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RESEND PATCH] hw/dma: fix crash caused by race condition
Content-Language: en-US
To: Tong Zhang <t.zhang2@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: "ztong0001@gmail.com" <ztong0001@gmail.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Francisco Londono <f.londono@samsung.com>
References: <CGME20220506163106uscas1p20aa8ba0a290a9b50be54df6ec4f9cee0@uscas1p2.samsung.com>
 <20220506163059.2517-1-t.zhang2@samsung.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220506163059.2517-1-t.zhang2@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 06.05.22 18:31, Tong Zhang wrote:
> assert(dbs->acb) is meant to check the return value of io_func per
> documented in commit 6bee44ea34 ("dma: the passed io_func does not
> return NULL"). However, there is a chance that after calling
> aio_context_release(dbs->ctx); the dma_blk_cb function is called before
> the assertion and dbs->acb is set to NULL again at line 121. Thus when
> we run assert at line 181 it will fail.
> 
>   softmmu/dma-helpers.c:181: dma_blk_cb: Assertion `dbs->acb' failed.
> 
> Reported-by: Francisco Londono <f.londono@samsung.com>
> Signed-off-by: Tong Zhang <t.zhang2@samsung.com>
> ---
>  softmmu/dma-helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> index 7820fec54c..cb81017928 100644
> --- a/softmmu/dma-helpers.c
> +++ b/softmmu/dma-helpers.c
> @@ -177,8 +177,8 @@ static void dma_blk_cb(void *opaque, int ret)
>      aio_context_acquire(dbs->ctx);
>      dbs->acb = dbs->io_func(dbs->offset, &dbs->iov,
>                              dma_blk_cb, dbs, dbs->io_func_opaque);
> -    aio_context_release(dbs->ctx);
>      assert(dbs->acb);
> +    aio_context_release(dbs->ctx);
>  }
>  
>  static void dma_aio_cancel(BlockAIOCB *acb)

Please don't resend patches if the previous submission came to the
conclusion that it's unclear how this should help.

https://lkml.kernel.org/r/CAJSP0QW396RY_g8LS1mncDZcOv5GamURy+xv+s8zMcdq03OOMA@mail.gmail.com


I *still* don't understand the interaction between the lock and the
assertion and so far nobody was able to clarify.

-- 
Thanks,

David / dhildenb


