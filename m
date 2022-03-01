Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6524C8886
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:50:04 +0100 (CET)
Received: from localhost ([::1]:46592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOz8r-0004EV-KP
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:50:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nOz3e-0000AG-Cd
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:44:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nOz3c-0006Ls-Lm
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:44:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646127875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXjdvJQCImOKXPlyTJCucaD9ryEizrjRsEkxbSDfhkI=;
 b=fGT3i/j4fah3bWgbmeFyG6cLS63k4a7jdySBxxIIjdnpcAr2INulCtmkFud4zn4VRXfgDr
 s3QcNRlZdR4w+Yj5Yfy7dhAJM5JeZfjRF6vzp/f1lyf0HefasHaCrUU3nFhfL/dJyz0PGC
 RoNZZcARMQls34hrbiFUkxnsdr33Mjw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-JUh7jnn5M6aCssfZ3Me7Vg-1; Tue, 01 Mar 2022 04:44:34 -0500
X-MC-Unique: JUh7jnn5M6aCssfZ3Me7Vg-1
Received: by mail-wr1-f70.google.com with SMTP id
 a11-20020adffb8b000000b001efe754a488so1556865wrr.13
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GXjdvJQCImOKXPlyTJCucaD9ryEizrjRsEkxbSDfhkI=;
 b=F8RuhEjdaMPY6bdPIOdJ52fvGGhetwwsVM12xkbRvwFKHY7lRlbUS34CotDeGM+/aZ
 T/WNlI9kF68vvG6UfgBzWoOaTbVPmGXCjRz5Y5MNhTvkn2RCepg4Jre1SPO6/UGP4nnK
 9eNDXNvMV+TXM7+GeBc1186r/4P5WfRxPSF/4TcSTDQJs1ois3MuJidxAs8iGwUc180h
 K2SyCWQl4m8rVFDzOnXrlDk+t1efliUnCcZAoJy2kgNo6KmTnp1nyd2OAi/WKzVZTqfD
 zZw3s5HMurBf9EUrYFIkhv1tf9FIzAXOVQa+mQAZYZq2adMuWMDbZGQMETS7Bg6l+MIN
 zv9w==
X-Gm-Message-State: AOAM530VlLfff6KsLjaaEC5mrneDlh5Fq1PfpWBKMjbylIH44d2N5Ozc
 E4NnNiY35gvN+M5pPCFxWxJGYeYAJp/znQp3JpE4rJhSNTca7E8k3MBI+0CLC+ayRUA0BKYBRyW
 ejZhp9DaAiFiNlsI=
X-Received: by 2002:a05:600c:1c25:b0:380:d306:1058 with SMTP id
 j37-20020a05600c1c2500b00380d3061058mr16460778wms.150.1646127873692; 
 Tue, 01 Mar 2022 01:44:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwc0BSPcXt0ZlOB13KbXWH16AbZ2WXQM4xPrx57xxB2dv4VbbR0keQP08xW4YcNBfK4RtgPQA==
X-Received: by 2002:a05:600c:1c25:b0:380:d306:1058 with SMTP id
 j37-20020a05600c1c2500b00380d3061058mr16460759wms.150.1646127873403; 
 Tue, 01 Mar 2022 01:44:33 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8?
 ([2a09:80c0:192:0:20af:34be:985b:b6c8])
 by smtp.gmail.com with ESMTPSA id
 k15-20020adff28f000000b001f018230b86sm1130132wro.44.2022.03.01.01.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 01:44:33 -0800 (PST)
Message-ID: <67347f43-b4f4-f73a-9f16-6eb9642349e6@redhat.com>
Date: Tue, 1 Mar 2022 10:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/tcg/s390x: Fix the exrl-trt* tests with Clang
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220301092431.1448419-1-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220301092431.1448419-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.03.22 10:24, Thomas Huth wrote:
> The exrl-trt* tests use two pre-initialized variables for the
> results of the assembly code:
> 
>     uint64_t r1 = 0xffffffffffffffffull;
>     uint64_t r2 = 0xffffffffffffffffull;
> 
> But then the assembly code copies over the full contents
> of the register into the output variable, without taking
> care of this pre-initialized values:
> 
>         "    lgr %[r1],%%r1\n"
>         "    lgr %[r2],%%r2\n"
> 
> The code then finally compares the register contents to
> a value that apparently depends on the pre-initialized values:
> 
>     if (r2 != 0xffffffffffffffaaull) {
>         write(1, "bad r2\n", 7);
>         return 1;
>     }
> 
> This all works with GCC, since the 0xffffffffffffffff got into
> the r2 register there by accident, but it fails completely with
> Clang.
> 
> Let's fix this by declaring the r1 and r2 variables as proper
> register variables instead, so the pre-initialized values get
> correctly passed into the inline assembly code.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/tcg/s390x/exrl-trt.c  | 8 +++-----
>  tests/tcg/s390x/exrl-trtr.c | 8 +++-----
>  2 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/tcg/s390x/exrl-trt.c b/tests/tcg/s390x/exrl-trt.c
> index 16711a3181..451f777b9d 100644
> --- a/tests/tcg/s390x/exrl-trt.c
> +++ b/tests/tcg/s390x/exrl-trt.c
> @@ -5,8 +5,8 @@ int main(void)
>  {
>      char op1[] = "hello";
>      char op2[256];
> -    uint64_t r1 = 0xffffffffffffffffull;
> -    uint64_t r2 = 0xffffffffffffffffull;
> +    register uint64_t r1 asm("r1") = 0xffffffffffffffffull;
> +    register uint64_t r2 asm("r2") = 0xffffffffffffffffull;
>      uint64_t cc;
>      int i;
>  
> @@ -21,8 +21,6 @@ int main(void)
>          "    j 2f\n"
>          "1:  trt 0(1,%[op1]),%[op2]\n"
>          "2:  exrl %[op1_len],1b\n"
> -        "    lgr %[r1],%%r1\n"
> -        "    lgr %[r2],%%r2\n"
>          "    ipm %[cc]\n"
>          : [r1] "+r" (r1),
>            [r2] "+r" (r2),
> @@ -30,7 +28,7 @@ int main(void)
>          : [op1] "a" (&op1),
>            [op1_len] "a" (5),
>            [op2] "Q" (op2)
> -        : "r1", "r2", "cc");
> +        : "cc");
>      cc = (cc >> 28) & 3;
>      if (cc != 2) {
>          write(1, "bad cc\n", 7);
> diff --git a/tests/tcg/s390x/exrl-trtr.c b/tests/tcg/s390x/exrl-trtr.c
> index 5f30cda6bd..422f7f385a 100644
> --- a/tests/tcg/s390x/exrl-trtr.c
> +++ b/tests/tcg/s390x/exrl-trtr.c
> @@ -5,8 +5,8 @@ int main(void)
>  {
>      char op1[] = {0, 1, 2, 3};
>      char op2[256];
> -    uint64_t r1 = 0xffffffffffffffffull;
> -    uint64_t r2 = 0xffffffffffffffffull;
> +    register uint64_t r1 asm("r1") = 0xffffffffffffffffull;
> +    register uint64_t r2 asm("r2") = 0xffffffffffffffffull;
>      uint64_t cc;
>      int i;
>  
> @@ -21,8 +21,6 @@ int main(void)
>          "    j 2f\n"
>          "1:  trtr 3(1,%[op1]),%[op2]\n"
>          "2:  exrl %[op1_len],1b\n"
> -        "    lgr %[r1],%%r1\n"
> -        "    lgr %[r2],%%r2\n"
>          "    ipm %[cc]\n"
>          : [r1] "+r" (r1),
>            [r2] "+r" (r2),
> @@ -30,7 +28,7 @@ int main(void)
>          : [op1] "a" (&op1),
>            [op1_len] "a" (3),
>            [op2] "Q" (op2)
> -        : "r1", "r2", "cc");
> +        : "cc");
>      cc = (cc >> 28) & 3;
>      if (cc != 1) {
>          write(1, "bad cc\n", 7);

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


