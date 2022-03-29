Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7340E4EACA1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 13:48:13 +0200 (CEST)
Received: from localhost ([::1]:38116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZAKa-0003fn-CG
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 07:48:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZADa-0001xB-6r
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:41:00 -0400
Received: from [2607:f8b0:4864:20::32c] (port=34728
 helo=mail-ot1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZADY-0003Vd-Bk
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:40:57 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 n19-20020a9d7113000000b005cd9cff76c3so12593943otj.1
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 04:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=67dSrHJzoiIEZp713XU044T8LpChRcsXNXkjYvQYhyg=;
 b=Akg8FEtJhxtiADVDGvvQWh5xfSLiK76FtfhN1VV40ojPUto9IvEtkSyRYQ1FUWQJU3
 K8LuUh0s4wJDcaSbomzHPfsOiV0q40RjZIWHaOyXMXP+R8VvsCbUo0CeTjO53JuBS9I2
 ggMHEiBzEL4v0Ya9wtRsXsEdXd+C6a+e7B7m5ZFQz7nRAueK/Acj+plPpufHVVLM+mtn
 IA+vrJZd0cRSjq/xDtPE4bpPGBH9NRaItlmxjzA3apRouwDQW+N8Q50LBH6Hu+Q7qkaQ
 o/5BpuDdinzSIyf4ZWK2fxb9kF2ePeT8Qhwl0t21cCpiVUWdAxrI1ZJKAqT5u5GXyAgn
 fB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=67dSrHJzoiIEZp713XU044T8LpChRcsXNXkjYvQYhyg=;
 b=aLIdpIyMtYnPV6u1DVliaGzWJ96aa2pGLcz5WrahqEiFUCOvlgl9G2uXvKAXt8lvPj
 L3XnGVVJN1YkOwwJD0pgW+N4d2ekIym5aFPzmCKJr0BqM0yTJw5x/PhZwzgOWTdKcsnm
 LiQqzrAtE77C+PMdvh/n/pvt1oS2sE3MQB27+8GT4x0tYbxdoW6JX9rTOwUfjW08aFSe
 104Ak+fACKAw3D6+1c1JI5T/Xj3e9ow/dShlGD40bXU9tD3iHsVCWaVSpMt/O2c8Ersr
 Uph3kagau18+ZDRabpsxBDMWW3dQuAfrIz0dIEUuZ0i86u4EJUV7G+DITfW425pNchlL
 Eyhg==
X-Gm-Message-State: AOAM533xSfgyYMAks/cR8hlnqVOPhYTeaEKiMm0mnmH5k4ZIqegulKzY
 sSedjC18QgV/cIrcGpcnd/KETQ==
X-Google-Smtp-Source: ABdhPJyG0AcTinJVsocTpihw3UAlPwbzgnLbmytByNdVc3IARuG1vgngA21M/YlLtEixC8nWcg5mjQ==
X-Received: by 2002:a9d:32e:0:b0:5b2:2b53:8f9e with SMTP id
 43-20020a9d032e000000b005b22b538f9emr872846otv.107.1648554055249; 
 Tue, 29 Mar 2022 04:40:55 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 bd32-20020a056870d7a000b000d43d4d2de1sm8194275oab.5.2022.03.29.04.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 04:40:54 -0700 (PDT)
Message-ID: <31afd7fc-9ecd-959f-5a80-18a6707061a8@linaro.org>
Date: Tue, 29 Mar 2022 05:40:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 2/6] softfloat: add int128_to_float* conversion methods
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
 <20220328201442.175206-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328201442.175206-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, danielhb413@gmail.com,
 groug@kaod.org, clg@kaod.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 14:14, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Based on parts_sint_to_float, implements parts_sint_to_float2 that
> receives a 128-bit signed integer via int64_t and uint64_t arguments.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   fpu/softfloat-parts.c.inc | 37 +++++++++++++++++++++++++++++++++++++
>   fpu/softfloat.c           | 30 ++++++++++++++++++++++++++++++
>   include/fpu/softfloat.h   |  3 +++
>   3 files changed, 70 insertions(+)
> 
> diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
> index 0bbecf835f..5f7f107a0d 100644
> --- a/fpu/softfloat-parts.c.inc
> +++ b/fpu/softfloat-parts.c.inc
> @@ -1196,6 +1196,43 @@ static void partsN(sint_to_float)(FloatPartsN *p, int64_t a,
>       p->frac_hi = f << shift;
>   }
>   
> +static void partsN(sint_to_float2)(FloatPartsN *p, int64_t hi, uint64_t lo,
> +                                   int scale, float_status *status)
> +{
> +    uint64_t f = hi;
> +    int shift;
> +
> +    if (hi == 0) {
> +        parts_uint_to_float(p, lo, scale, status);
> +    } else {

We should also defer "small" negative numbers.

        if (hi == -1) {
            parts_uint_to_float(p, -lo, scale, status);
            p->sign = true;
            return;
        }

That should ensure...

> +        memset(p, 0, sizeof(*p));
> +        p->cls = float_class_normal;
> +        if (hi < 0) {
> +            lo = -lo;
> +            f = ~f + !lo;
> +            p->sign = true;
> +        }
> +        if (f != 0) {
> +            shift = clz64(f);
> +        } else {
> +            shift = 64 + clz64(lo);
> +        }

this case

> +        scale = MIN(MAX(scale, -0x10000), 0x10000);
> +
> +        p->exp = 127 - shift + scale;
> +
> +        if (shift >= 64) {
> +            f = lo;
> +            lo = 0;
> +            shift -= 64;
> +        }

and this case don't happen.

> +        p->frac_hi = shl_double(f, lo, shift);
> +        if (N > 64) {
> +            p->frac_lo = shl_double(lo, 0, shift);

Same comment about shl_double w/ 0.

Alternately, rewrite the whole thing in terms of uint_to_float2:

     if (hi >= 0) {
         uint_to_float2(p, hi, lo, scale, status);
     } else {
         lo = -lo;
         hi = ~hi + !lo;
         uint_to_float2(p, hi, lo, scale, status);
         p->sign = true;
     }


r~

