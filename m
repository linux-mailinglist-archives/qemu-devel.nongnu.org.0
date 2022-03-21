Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548E94E2534
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 12:25:06 +0100 (CET)
Received: from localhost ([::1]:47446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWG9p-0006Yz-7x
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 07:25:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWG8Y-0005pW-6X
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:23:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWG8W-0006Wt-HM
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:23:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647861823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=785NLRCTakla03QYaBTvGeDT1i7TrS/OGw8wZvBa5HE=;
 b=bZ15Blw4KZusOysKUmBWVc4ag7MnWRmbNoj7QJaOWTbpDtCrUEAqTjEvCuKZjV5LDgmf05
 v+PXxlz70yzE5+1N5nNmy83Vx/5pxRkI3MWGOB31yNwoz5Ye/UnsdWd9wVXpMxhlVr1k0U
 GZdM5kxqOhDxnv61OhhIx4izddTiRXo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-vR89mOT7NwSWA7fW05x6tA-1; Mon, 21 Mar 2022 07:23:42 -0400
X-MC-Unique: vR89mOT7NwSWA7fW05x6tA-1
Received: by mail-wm1-f71.google.com with SMTP id
 r64-20020a1c2b43000000b0038b59eb1940so7173754wmr.0
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 04:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=785NLRCTakla03QYaBTvGeDT1i7TrS/OGw8wZvBa5HE=;
 b=LdjGORTOHlxKINqxnJdpV8SG2FOJso8xtW2rVm53jgct0fame4cmJ8QaIp7Wc1E60U
 /lfoHnaLIVgkgUmMuz+lBV3dPDSNz7uzGdi9xMj0bncymEDgzjegbPJMnQS40SIbiaGV
 gr/CJORW/OkpDTtTranV7BqGRx/EwLQ3u+eV/G7T6Iu/23S941hojiHDCTbOxXgBZZAh
 dwT9LVsC5YKwYOzmPXeJ+KUA/hTSZ51mmYCGTJHkr8xgttD5WSiJO1Dc+goqE9v1ILYW
 eTlfgg1Is1yRJfMnyxZquVO1u/hkHkEW9ZL4FU4YlBKqaCajACK0gDNgeM1bB5+twFLp
 bQDA==
X-Gm-Message-State: AOAM531NSM1GZFDQkDpc3la1wFO4Ga66CaY5plGensTmokL4ZzLS7Z++
 rHAswrwf6n9a1Q6YHcq0bd56CL+3W9999jHABKOKU3vTNdxiXtZRXFkAffBM2lS8E5ibso22nku
 dq7djUKCVN1ekN8M=
X-Received: by 2002:adf:9581:0:b0:1ed:c341:4ed1 with SMTP id
 p1-20020adf9581000000b001edc3414ed1mr17721252wrp.299.1647861821139; 
 Mon, 21 Mar 2022 04:23:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZTR6RFr2AaUw1vk3EQ4A+UHmQqU4ravxMcLlavyt8FaDaB7s5UsO78+2Fqt8QsSAPUwfG2A==
X-Received: by 2002:adf:9581:0:b0:1ed:c341:4ed1 with SMTP id
 p1-20020adf9581000000b001edc3414ed1mr17721235wrp.299.1647861820802; 
 Mon, 21 Mar 2022 04:23:40 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4900:849b:f76e:5e1f:ff95?
 (p200300cbc7044900849bf76e5e1fff95.dip0.t-ipconnect.de.
 [2003:cb:c704:4900:849b:f76e:5e1f:ff95])
 by smtp.gmail.com with ESMTPSA id
 l126-20020a1c2584000000b00387d4f35651sm17174133wml.10.2022.03.21.04.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 04:23:40 -0700 (PDT)
Message-ID: <b6d282db-ab47-155f-6ca9-ac98c7acf588@redhat.com>
Date: Mon, 21 Mar 2022 12:23:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 05/11] target/s390x: vxeh2: vector shift double by bit
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <20220308015358.188499-6-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220308015358.188499-6-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 02:53, Richard Henderson wrote:
> From: David Miller <dmiller423@gmail.com>
> 
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Message-Id: <20220307020327.3003-4-dmiller423@gmail.com>
> [rth: Split out of larger patch.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/translate_vx.c.inc | 47 ++++++++++++++++++++++++++---
>  target/s390x/tcg/insn-data.def      |  6 +++-
>  2 files changed, 48 insertions(+), 5 deletions(-)
> 
> diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
> index 967f6213d8..a5283ef2f8 100644
> --- a/target/s390x/tcg/translate_vx.c.inc
> +++ b/target/s390x/tcg/translate_vx.c.inc
> @@ -2056,11 +2056,19 @@ static DisasJumpType op_vsrl(DisasContext *s, DisasOps *o)
>                              gen_helper_gvec_vsrl_ve2);
>  }
>  
> -static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
> +static DisasJumpType op_vsld(DisasContext *s, DisasOps *o)
>  {
> -    const uint8_t i4 = get_field(s, i4) & 0xf;
> -    const int left_shift = (i4 & 7) * 8;
> -    const int right_shift = 64 - left_shift;
> +    const bool byte = s->insn->data;
> +    const uint8_t mask = byte ? 15 : 7;
> +    const uint8_t mul  = byte ?  8 : 1;
> +    const uint8_t i4   = get_field(s, i4);
> +    const int right_shift = 64 - (i4 & 7) * mul;
> +
> +    if (i4 & ~mask) {
> +        gen_program_exception(s, PGM_SPECIFICATION);
> +        return DISAS_NORETURN;
> +    }
> +
>      TCGv_i64 t0 = tcg_temp_new_i64();
>      TCGv_i64 t1 = tcg_temp_new_i64();
>      TCGv_i64 t2 = tcg_temp_new_i64();

TCGv_i64 t0, t1, t2;

if (i4 & ~mask) {
...
}

t0 = tcg_temp_new_i64();
t1 = tcg_temp_new_i64();
t2 = tcg_temp_new_i64();

> @@ -2074,8 +2082,39 @@ static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
>          read_vec_element_i64(t1, get_field(s, v3), 0, ES_64);
>          read_vec_element_i64(t2, get_field(s, v3), 1, ES_64);
>      }
> +
>      tcg_gen_extract2_i64(t0, t1, t0, right_shift);
>      tcg_gen_extract2_i64(t1, t2, t1, right_shift);
> +
> +    write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
> +    write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +    return DISAS_NEXT;
> +}
> +
> +static DisasJumpType op_vsrd(DisasContext *s, DisasOps *o)
> +{
> +    const uint8_t i4 = get_field(s, i4);
> +
> +    if (i4 & ~7) {
> +        gen_program_exception(s, PGM_SPECIFICATION);
> +        return DISAS_NORETURN;
> +    }
> +
> +    TCGv_i64 t0 = tcg_temp_new_i64();
> +    TCGv_i64 t1 = tcg_temp_new_i64();
> +    TCGv_i64 t2 = tcg_temp_new_i64();

TCGv_i64 t0, t1, t2;

if (i4 & ~7) {
    gen_program_exception(s, PGM_SPECIFICATION);
    return DISAS_NORETURN;
}

t0 = tcg_temp_new_i64();
t1 = tcg_temp_new_i64();
t2 = tcg_temp_new_i64();


> +
> +    read_vec_element_i64(t0, get_field(s, v2), 1, ES_64);
> +    read_vec_element_i64(t1, get_field(s, v3), 0, ES_64);
> +    read_vec_element_i64(t2, get_field(s, v3), 1, ES_64);
> +
> +    tcg_gen_extract2_i64(t0, t1, t0, i4);
> +    tcg_gen_extract2_i64(t1, t2, t1, i4);
> +
>      write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
>      write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
>  
> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
> index f487a64abf..98a31a557d 100644
> --- a/target/s390x/tcg/insn-data.def
> +++ b/target/s390x/tcg/insn-data.def
> @@ -1207,12 +1207,16 @@
>      E(0xe774, VSL,     VRR_c, V,   0, 0, 0, 0, vsl, 0, 0, IF_VEC)
>  /* VECTOR SHIFT LEFT BY BYTE */
>      E(0xe775, VSLB,    VRR_c, V,   0, 0, 0, 0, vsl, 0, 1, IF_VEC)
> +/* VECTOR SHIFT LEFT DOUBLE BY BIT */
> +    E(0xe786, VSLD,    VRI_d, VE2, 0, 0, 0, 0, vsld, 0, 0, IF_VEC)
>  /* VECTOR SHIFT LEFT DOUBLE BY BYTE */
> -    F(0xe777, VSLDB,   VRI_d, V,   0, 0, 0, 0, vsldb, 0, IF_VEC)
> +    E(0xe777, VSLDB,   VRI_d, V,   0, 0, 0, 0, vsld, 0, 1, IF_VEC)
>  /* VECTOR SHIFT RIGHT ARITHMETIC */
>      E(0xe77e, VSRA,    VRR_c, V,   0, 0, 0, 0, vsra, 0, 0, IF_VEC)
>  /* VECTOR SHIFT RIGHT ARITHMETIC BY BYTE */
>      E(0xe77f, VSRAB,   VRR_c, V,   0, 0, 0, 0, vsra, 0, 1, IF_VEC)
> +/* VECTOR SHIFT RIGHT DOUBLE BY BIT */
> +    F(0xe787, VSRD,    VRI_d, VE2, 0, 0, 0, 0, vsrd, 0, IF_VEC)
>  /* VECTOR SHIFT RIGHT LOGICAL */
>      E(0xe77c, VSRL,    VRR_c, V,   0, 0, 0, 0, vsrl, 0, 0, IF_VEC)
>  /* VECTOR SHIFT RIGHT LOGICAL BY BYTE */


-- 
Thanks,

David / dhildenb


