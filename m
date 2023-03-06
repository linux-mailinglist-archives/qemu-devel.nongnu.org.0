Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B17E6ACFAF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 22:00:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZHvs-0000gx-He; Mon, 06 Mar 2023 15:59:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZHvq-0000gL-GT
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 15:59:42 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZHvo-0002ct-Qd
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 15:59:42 -0500
Received: by mail-pg1-x543.google.com with SMTP id d6so6407842pgu.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 12:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678136379;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kL3nB96TTOBWD0VXNbthw2THlSiLt6pqGu0TGvBd21I=;
 b=GnvRzX9a24acvwNwCyRIqog4sL72XGYh7VPrOkMukh1R7et2sVR/ORdYMDfgmkgULc
 lvJG0Rxd+7G1mPifEKGF9b3/FwX7Uc+yOhdWDFhbjrjwzMFaYxwqcUkYdPI7O9MVj8yv
 nQMICC0Ze3dSZ51Mk4CIbYoY7CtO4iMRQmkScphUXTvEVwpKljlGZ/gcT4N4jdUjbZFz
 jz4D1Sp99UaEPyWmwreT6lo5Kp7oWUvOujrTfy/WNWgW1TRXefbkWXzEulrIBaPam+Wv
 DwR3xspkocnYb8eCW5TYBrYT0S4u4gvTCFNKosG23qcdYpCrdyNxqO9OfRqabAnuRLlL
 I9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678136379;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kL3nB96TTOBWD0VXNbthw2THlSiLt6pqGu0TGvBd21I=;
 b=paXYEYTYQAmAJJJcRlqJUJMJUcEYsdYIY5GYd1vrTetOTtcPiAW3+1/rUlfklBtc/E
 w2iNzTnu6LeVfRbAr7OR6LCSYKq5dj1v70ugfchCOobPxKDnef1mefEHyUTW9+V/X/VQ
 m5uXKfuKe65GAazLqcm1lhS0NCvkCj9zbvl95KQSuL6grB3LG8aJ7KRUbFR3SWmAofmw
 GkyXN/GYX/mniUJwTXi2PF0VcL86cWkDkD7lzTIefbXbfql4mvQ8PCikqX8S9bIWJ3MO
 QAOz4MFgsMwE0HM85+60M6E6o6TOfMfqJl1BgBj4Pa9KAsLb2dZyzxDiqFWXgdMFsPjQ
 qjfA==
X-Gm-Message-State: AO0yUKVHN1gQjZ1Xy+D6N6zCILlJ3iLTpv4GkA9soTghs0qgfNmDLwxr
 cbDE0iEo0TgaF3jjWGHIJLttNQ==
X-Google-Smtp-Source: AK7set8fRSzwOSZGVekZMuaAIaK7wEwcxuOmJKhXGOGuukCLq3RznqfSZktA39fq/5wtRRu22uxweg==
X-Received: by 2002:aa7:98de:0:b0:5df:3aa1:10c5 with SMTP id
 e30-20020aa798de000000b005df3aa110c5mr10509137pfm.14.1678136379135; 
 Mon, 06 Mar 2023 12:59:39 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:7632:29c7:3cce:bec3?
 ([2602:ae:154a:9f01:7632:29c7:3cce:bec3])
 by smtp.gmail.com with ESMTPSA id
 i2-20020aa787c2000000b005b34d81b010sm6867808pfo.91.2023.03.06.12.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 12:59:38 -0800 (PST)
Message-ID: <8e162045-a39a-9e9e-ff49-e4fb08e20c6d@linaro.org>
Date: Mon, 6 Mar 2023 12:59:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 1/2] target/s390x: Fix emulation of C(G)HRL
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <20230306205554.2070579-1-nsg@linux.ibm.com>
 <20230306205554.2070579-2-nsg@linux.ibm.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230306205554.2070579-2-nsg@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/6/23 12:55, Nina Schoetterl-Glausch wrote:
> The second operand of COMPARE HALFWORD RELATIVE LONG is a signed
> halfword, it does not have the same size as the first operand.
> 
> Fixes: a7e836d5eb ("target-s390: Convert COMPARE, COMPARE LOGICAL")
> Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> ---
>   target/s390x/tcg/insn-data.h.inc | 4 ++--
>   target/s390x/tcg/translate.c     | 7 +++++++
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
> index 9d2d35f084..6fe8ca5143 100644
> --- a/target/s390x/tcg/insn-data.h.inc
> +++ b/target/s390x/tcg/insn-data.h.inc
> @@ -199,8 +199,8 @@
>       C(0xe55c, CHSI,    SIL,   GIE, m1_32s, i2, 0, 0, 0, cmps64)
>       C(0xe558, CGHSI,   SIL,   GIE, m1_64, i2, 0, 0, 0, cmps64)
>   /* COMPARE HALFWORD RELATIVE LONG */
> -    C(0xc605, CHRL,    RIL_b, GIE, r1_o, mri2_32s, 0, 0, 0, cmps32)
> -    C(0xc604, CGHRL,   RIL_b, GIE, r1_o, mri2_64, 0, 0, 0, cmps64)
> +    C(0xc605, CHRL,    RIL_b, GIE, r1_o, mri2_16s, 0, 0, 0, cmps32)
> +    C(0xc604, CGHRL,   RIL_b, GIE, r1_o, mri2_16s, 0, 0, 0, cmps64)
>   /* COMPARE HIGH */
>       C(0xb9cd, CHHR,    RRE,   HW,  r1_sr32, r2_sr32, 0, 0, 0, cmps32)
>       C(0xb9dd, CHLR,    RRE,   HW,  r1_sr32, r2_o, 0, 0, 0, cmps32)
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 811049ea28..60b1254bb2 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -5974,6 +5974,13 @@ static void in2_m2_64a(DisasContext *s, DisasOps *o)
>   #define SPEC_in2_m2_64a 0
>   #endif
>   
> +static void in2_mri2_16s(DisasContext *s, DisasOps *o)
> +{
> +    in2_ri2(s, o);
> +    tcg_gen_qemu_ld16s(o->in2, o->in2, get_mem_index(s));
> +}
> +#define SPEC_in2_mri2_16s 0

This is incorrect.  See

https://patchew.org/QEMU/20230227054233.390271-1-richard.henderson@linaro.org/20230227054233.390271-51-richard.henderson@linaro.org/


r~

