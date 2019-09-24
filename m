Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88684BD28D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 21:23:17 +0200 (CEST)
Received: from localhost ([::1]:50074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCqP6-00007W-6k
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 15:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iCqNR-0007el-Da
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 15:21:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iCqNN-0001c8-RD
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 15:21:30 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:46808)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iCqNN-0001br-Kc
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 15:21:29 -0400
Received: by mail-pl1-x642.google.com with SMTP id q24so1366956plr.13
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 12:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hcr/1mHm+yGJGONH9wsQlfBTqXyvN4VTA+blD+3eg9U=;
 b=sfHRs8pI7N8NrM/QIrtUMv1JHHuj9GhRWizzp9hZE4gBRhGbnpPZE02ohwb74Ey692
 O+m0JdMmMiklt9Li+lFc6lw1pnpWPO6ebeUZ9Jc4PdIhIO3yUA1c9qyCKrVYe5M5j7+q
 8xknmrZmoHiPLUaOI5x307kui2+wISTWO6UEqMOUZqBGbpZk2Oh0bNKd9Qvgx1EomAsE
 DEC7fEZHRX7AZsBogMq8VCxNOARDj53Giu4rX6HjxRb2oSKsllzFrUAu6czuyTIntKps
 7Hkg7hvkKnq5esrKSqRRVL3tZIcZyrCFf9O3x/B06WvHeH68EAE1W3H+ohsuvR3Yg2w7
 /lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hcr/1mHm+yGJGONH9wsQlfBTqXyvN4VTA+blD+3eg9U=;
 b=W1YlAlzIAxIL2ya9fVTlwxnUOYVcTJBwSMtBS9IF60uzxykjr7/iyxuvgvCPDbVsr+
 0rs1KITn+pq+xWadMV24fIq6wssHPhCRSXRlhBWcdMm6HMTquZYb246HRDSchqo2kLJ0
 qWRUfqFGEi1jOphTp2zqIOwf+C8HNMP1LSAh+joxuJm3RgaS4rFqIH8VRyJlpZy7M5Fu
 gWy2Fn5rEwFIKaC1G2LcgHY4qR8Fq6kJf4UM2S4L0p9UjI8qWHR1bz+ptvUUJ2rpDLTn
 zCRlfldwWaLQhvq3MNSr6kOnZAjNTiKD8e6Ix1Ygn9VdRKmR8BRFFr1jHwdobWgMdNfL
 DmGg==
X-Gm-Message-State: APjAAAWh+mRRdW311fKinK7/2Ub9d6YdlkA6BIwKBRUhHitv/BjWhzIe
 HQn63YGppJcxkvV9Ud3CIoqEFg==
X-Google-Smtp-Source: APXvYqx41oxZ58RaZdxcj+j3zQe4R5nwVWiSLjIKnLDbRywRqN3U3A2T6LdJx9jdw/4K0WV0ro1BQA==
X-Received: by 2002:a17:902:144:: with SMTP id 62mr4895524plb.70.1569352888233; 
 Tue, 24 Sep 2019 12:21:28 -0700 (PDT)
Received: from [172.20.32.216] ([12.157.10.118])
 by smtp.gmail.com with ESMTPSA id i16sm3485074pfa.184.2019.09.24.12.21.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Sep 2019 12:21:26 -0700 (PDT)
Subject: Re: [PATCH 1/7] target/ppc: introduce get_dfp{64,128}() helper
 functions
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, pc@us.ibm.com, david@gibson.dropbear.id.au
References: <20190924153556.27575-1-mark.cave-ayland@ilande.co.uk>
 <20190924153556.27575-2-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e4e2220b-d23b-aa54-2c46-c937bd0efe86@linaro.org>
Date: Tue, 24 Sep 2019 12:21:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924153556.27575-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/19 8:35 AM, Mark Cave-Ayland wrote:
> +static void get_dfp64(uint64_t *dst, uint64_t *dfp)
> +{
> +    dst[0] = dfp[0];
> +}
> +
> +static void get_dfp128(uint64_t *dst, uint64_t *dfp)
> +{
> +    dst[0] = dfp[HI_IDX];
> +    dst[1] = dfp[LO_IDX];
> +}

I'm not keen on this.  I would prefer some type difference that prevents you
from getting the arguments the wrong way around.

I'm thinking that a combination helper like

static void get_dfp64(decNumber *out, uint64_t *in)
{
    union {
       uint64_t i;
       decimal64 d;
    } u;

    u.i = *in;
    decimal64ToNumber(&u.d, out);
}

> @@ -129,7 +140,7 @@ static void dfp_prepare_decimal64(struct PPC_DFP *dfp, uint64_t *a,
>      dfp->env = env;
>  
>      if (a) {
> -        dfp->a64[0] = *a;
> +        get_dfp64(dfp->a64, a);
>          decimal64ToNumber((decimal64 *)dfp->a64, &dfp->a);
>      } else {
>          dfp->a64[0] = 0;

becomes

    get_dfp64(&dfp->a, a);

and that might clean up a lot of the code.

> @@ -617,10 +626,12 @@ uint32_t helper_##op(CPUPPCState *env, uint64_t *a, uint64_t *b)         \
>  {                                                                        \
>      struct PPC_DFP dfp;                                                  \
>      unsigned k;                                                          \
> +    uint64_t a64;                                                        \
>                                                                           \
>      dfp_prepare_decimal##size(&dfp, 0, b, env);                          \
>                                                                           \
> -    k = *a & 0x3F;                                                       \
> +    get_dfp64(&a64, a);                                                  \
> +    k = a64 & 0x3F;                                                      \
>                                                                           \
>      if (unlikely(decNumberIsSpecial(&dfp.b))) {                          \
>          dfp.crbf = 1;                                                    \

Whereas cases like this, where a scalar is being passed in, I don't think that
re-using the same helper is appropriate.  Ideally, they would be passed in by
value, and not by reference at all.  That, of course, requires changes to the
translator beyond the scope of this patch.

>  void helper_dctqpq(CPUPPCState *env, uint64_t *t, uint64_t *b)
>  {
>      struct PPC_DFP dfp;
> +    uint64_t b64;
>      dfp_prepare_decimal128(&dfp, 0, 0, env);
> -    decimal64ToNumber((decimal64 *)b, &dfp.t);
> +    get_dfp64(&b64, b);
> +    decimal64ToNumber((decimal64 *)&b64, &dfp.t);

This would become

    get_dfp64(&dfp.t, b);

with no intermediate b64 temp.


r~

