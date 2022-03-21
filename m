Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E3E4E25A1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 12:52:26 +0100 (CET)
Received: from localhost ([::1]:34840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWGaH-0001Kn-GX
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 07:52:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWGTP-0007mV-LH
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:45:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWGTI-0001hA-I8
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647863110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXOn5grRkBx7UzeSZrn19Y22nfFTfef+a2+w0gUOnk4=;
 b=EOSFrBNyYFRtOnJl66A3aN1fluF9NIznDzxx/QNgMELkSrVlf7sVnqiolL3scibdVPHdCm
 dPxqyx5zXbqFvdD6JHTy+PgmqOOeIOtbfPcDEkmSG/Aen1oH0chF60NNWxk/bFc7s8ZvX1
 bnQU+nngEaEhG3y1J6rAbR9m5cfiQZo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-c8UizysSOROSuPBSVeCxLw-1; Mon, 21 Mar 2022 07:45:09 -0400
X-MC-Unique: c8UizysSOROSuPBSVeCxLw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v184-20020a1cacc1000000b0038a12dbc23bso10146929wme.5
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 04:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cXOn5grRkBx7UzeSZrn19Y22nfFTfef+a2+w0gUOnk4=;
 b=IoUpJhX9t81LC7zClbpjol1RgUA6sk/SqwistZCDbwo/cuP0QaIoCQBfANeDkkR+Im
 09jmaoY6J2iZbA5DDLejqXzr83glWaN/vXbWexJZfdUIGhMsjPBfzZ50BeJFeMHVeixY
 aBhaJ7rABp0Fvh8MuyIj4HyCOJ5okK3Em8coeC8hrX5Gj+aJ60tb1m52rYP8JQBqzyT8
 ip3m5dXzJxOaWi+9n9oqIHXTPlg5GOAyfz6jnOUlWes9KoyO7P8wkKqBr7AckY0STp5z
 A5CWJqzu57ppVE+SnEixsXo0uoVWTSOMUhV45F4mDbv7L8dC6CNb1m4TfD423Ya0C1az
 Aqfg==
X-Gm-Message-State: AOAM5319XAnF+54USFacngajphCNTeBVsiuoCVo4t79AjnWjdU3JQ3Vx
 SmTkclIRopgkSZMWz2Qva9GdcDcIOACD7m1t1cqzQZobOA/uX4geoHjMy8K42bNYvlshyASqbVB
 nEpWG0/kOFAZ+LJw=
X-Received: by 2002:a5d:6944:0:b0:203:e024:7cdd with SMTP id
 r4-20020a5d6944000000b00203e0247cddmr11272458wrw.503.1647863108435; 
 Mon, 21 Mar 2022 04:45:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIhRIBVCs14Qi6mKGL2+bO//qRF6gCBpA9lBzsXDj5I5AOATP3ABa1GvJe0TCKyu0+YynilA==
X-Received: by 2002:a5d:6944:0:b0:203:e024:7cdd with SMTP id
 r4-20020a5d6944000000b00203e0247cddmr11272434wrw.503.1647863108126; 
 Mon, 21 Mar 2022 04:45:08 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4900:849b:f76e:5e1f:ff95?
 (p200300cbc7044900849bf76e5e1fff95.dip0.t-ipconnect.de.
 [2003:cb:c704:4900:849b:f76e:5e1f:ff95])
 by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm19175260wri.0.2022.03.21.04.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 04:45:07 -0700 (PDT)
Message-ID: <d98d81c9-2a40-c70e-2aff-85bf9a8c797d@redhat.com>
Date: Mon, 21 Mar 2022 12:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 07/11] target/s390x: vxeh2: vector {load, store} byte
 reversed elements
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <20220308015358.188499-8-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220308015358.188499-8-richard.henderson@linaro.org>
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linar.org>,
 dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 02:53, Richard Henderson wrote:
> From: David Miller <dmiller423@gmail.com>
> 
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Message-Id: <20220307020327.3003-6-dmiller423@gmail.com>
> [rth: Split out elements (plural) from element (scalar)
>       Use tcg little-endian memory ops, plus hswap and wswap.]
> Signed-off-by: Richard Henderson <richard.henderson@linar.org>
> ---
>  target/s390x/tcg/translate_vx.c.inc | 101 ++++++++++++++++++++++++++++
>  target/s390x/tcg/insn-data.def      |   4 ++
>  2 files changed, 105 insertions(+)
> 
> diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
> index ac807122a3..9a82401d71 100644
> --- a/target/s390x/tcg/translate_vx.c.inc
> +++ b/target/s390x/tcg/translate_vx.c.inc
> @@ -457,6 +457,56 @@ static DisasJumpType op_vlrep(DisasContext *s, DisasOps *o)
>      return DISAS_NEXT;
>  }
>  
> +static DisasJumpType op_vlbr(DisasContext *s, DisasOps *o)
> +{
> +    const uint8_t es = get_field(s, m3);
> +    TCGv_i64 t0, t1, tt;
> +
> +    if (es < ES_16 || es > ES_128) {
> +        gen_program_exception(s, PGM_SPECIFICATION);
> +        return DISAS_NORETURN;
> +    }
> +
> +    t0 = tcg_temp_new_i64();
> +    t1 = tcg_temp_new_i64();
> +
> +    /* Begin with byte reversed doublewords... */
> +    tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
> +    gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
> +    tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
> +

Would it make sense to just special-case ES_128, by loading them into
the proper t0/t1 right away?

if (es == ES_128) {
    tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
    gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
    tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
    goto write;
}

/* Begin with byte reversed doublewords... */
tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);

/*
 * For 16 and 32-bit elements, the doubleword bswap also reversed
 * the order of the elements.  Perform a larger order swap to put
 * them back into place.
 */
switch (es) {
...
}

write:
write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);

> +    /*
> +     * For 16 and 32-bit elements, the doubleword bswap also reversed
> +     * the order of the elements.  Perform a larger order swap to put
> +     * them back into place.  For the 128-bit "element", finish the
> +     * bswap by swapping the doublewords.
> +     */
> +    switch (es) {
> +    case ES_16:
> +        tcg_gen_hswap_i64(t0, t0);
> +        tcg_gen_hswap_i64(t1, t1);
> +        break;
> +    case ES_32:
> +        tcg_gen_wswap_i64(t0, t0);
> +        tcg_gen_wswap_i64(t1, t1);
> +        break;
> +    case ES_64:
> +        break;
> +    case ES_128:
> +        tt = t0, t0 = t1, t1 = tt;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
> +    write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    return DISAS_NEXT;
> +}
> +
>  static DisasJumpType op_vle(DisasContext *s, DisasOps *o)
>  {
>      const uint8_t es = s->insn->data;
> @@ -998,6 +1048,57 @@ static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
>      return DISAS_NEXT;
>  }
>  
> +static DisasJumpType op_vstbr(DisasContext *s, DisasOps *o)
> +{
> +    const uint8_t es = get_field(s, m3);
> +    TCGv_i64 t0, t1, tt;
> +
> +    if (es < ES_16 || es > ES_128) {
> +        gen_program_exception(s, PGM_SPECIFICATION);
> +        return DISAS_NORETURN;
> +    }
> +
> +    /* Probe write access before actually modifying memory */
> +    gen_helper_probe_write_access(cpu_env, o->addr1, tcg_constant_i64(16));
> +
> +    t0 = tcg_temp_new_i64();
> +    t1 = tcg_temp_new_i64();
> +    read_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
> +    read_vec_element_i64(t1, get_field(s, v1), 1, ES_64);


Dito, eventually just special case on MO_128 directly.

> +
> +    /*
> +     * For 16 and 32-bit elements, the doubleword bswap below will
> +     * reverse the order of the elements.  Perform a larger order
> +     * swap to put them back into place.  For the 128-bit "element",
> +     * finish the bswap by swapping the doublewords.
> +     */
> +    switch (es) {
> +    case MO_16:
> +        tcg_gen_hswap_i64(t0, t0);
> +        tcg_gen_hswap_i64(t1, t1);
> +        break;
> +    case MO_32:
> +        tcg_gen_wswap_i64(t0, t0);
> +        tcg_gen_wswap_i64(t1, t1);
> +        break;
> +    case MO_64:
> +        break;
> +    case MO_128:
> +        tt = t0, t0 = t1, t1 = tt;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    tcg_gen_qemu_st_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
> +    gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
> +    tcg_gen_qemu_st_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    return DISAS_NEXT;
> +}
> +
>  static DisasJumpType op_vste(DisasContext *s, DisasOps *o)
>  {
>      const uint8_t es = s->insn->data;
> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
> index b524541a7d..ee6e1dc9e5 100644
> --- a/target/s390x/tcg/insn-data.def
> +++ b/target/s390x/tcg/insn-data.def
> @@ -1027,6 +1027,8 @@
>      F(0xe756, VLR,     VRR_a, V,   0, 0, 0, 0, vlr, 0, IF_VEC)
>  /* VECTOR LOAD AND REPLICATE */
>      F(0xe705, VLREP,   VRX,   V,   la2, 0, 0, 0, vlrep, 0, IF_VEC)
> +/* VECTOR LOAD BYTE REVERSED ELEMENTS */
> +    F(0xe606, VLBR,    VRX,   VE2, la2, 0, 0, 0, vlbr, 0, IF_VEC)
>  /* VECTOR LOAD ELEMENT */
>      E(0xe700, VLEB,    VRX,   V,   la2, 0, 0, 0, vle, 0, ES_8, IF_VEC)
>      E(0xe701, VLEH,    VRX,   V,   la2, 0, 0, 0, vle, 0, ES_16, IF_VEC)
> @@ -1079,6 +1081,8 @@
>      F(0xe75f, VSEG,    VRR_a, V,   0, 0, 0, 0, vseg, 0, IF_VEC)
>  /* VECTOR STORE */
>      F(0xe70e, VST,     VRX,   V,   la2, 0, 0, 0, vst, 0, IF_VEC)
> +/* VECTOR STORE BYTE REVERSED ELEMENTS */
> +    F(0xe60e, VSTBR,    VRX,   VE2, la2, 0, 0, 0, vstbr, 0, IF_VEC)
>  /* VECTOR STORE ELEMENT */
>      E(0xe708, VSTEB,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_8, IF_VEC)
>      E(0xe709, VSTEH,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_16, IF_VEC)


-- 
Thanks,

David / dhildenb


