Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7234E2467
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 11:33:28 +0100 (CET)
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWFLr-0002Ny-3x
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 06:33:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWFJm-0000eI-GB
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 06:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWFJj-0003X3-NP
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 06:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647858674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G7MWf/oubDsGqiZ5vptkYzwsIIyt8APdHTpwfF4AXDY=;
 b=Df892Le2/804vtCX+/LAVFejeo9OIWXsvhPp33XryN63gkNx7FxDA+2VxCHMlXwvBUKtRy
 9WF3ktMCsYZ9rbx477juKVadYtWbyjRvWI20E0kaIkwwUclGtasfTVrrgwjza0OwcQGMAT
 vZVN4UntI4QJrniyw1BGcTQZ5NjRGps=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-uUaragvAOueRx1NYknACPg-1; Mon, 21 Mar 2022 06:31:13 -0400
X-MC-Unique: uUaragvAOueRx1NYknACPg-1
Received: by mail-wm1-f69.google.com with SMTP id
 12-20020a05600c24cc00b0038c6caa95f7so5752435wmu.4
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 03:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=G7MWf/oubDsGqiZ5vptkYzwsIIyt8APdHTpwfF4AXDY=;
 b=ClJrILmXiN9tM/5+95d3o7zvHOOl9Ko22olNosLrVkCDaZztumKP51F5H1mfOZQdlL
 tazmNBO375snB/1PNatNQzT5p6df/mAL20F6WFRxT+BuA/Grv6fuizPC2hU+vLPR2Ets
 yiWTILFL8s7Ze5Sslij+WJMWgNVXfAYcMI6JwQK+n+ZBeaRPy6UNmYb0IE5s8kC4gvId
 Um862hZ7y8Jvm/vg2i/6Wg7y0UjxWZDlrWpWJV2EIZ269da4IFAFi/Y1q1eDE2fbuBgX
 j4nM/q7qgCs6Dr+M2XaH6fO5XcHGcX9l1+pz8RdFWx3b7P2mWPzvoknaYdu7Nos2/GRF
 rfMg==
X-Gm-Message-State: AOAM533w40wOWyiIg9eqHem3cw7h1Yzf8tmBzkFI5WpKYEOvuH/jchZH
 Ti7nN3ScbuTrJ5GxuwM5i1aUYTiSdxLOT3q8taRI31eL7PeyqdUKMk3ohbuf9FcyaKhEuvfbzN/
 j9euOji86pCtjmVg=
X-Received: by 2002:a5d:47a6:0:b0:203:914f:52fa with SMTP id
 6-20020a5d47a6000000b00203914f52famr240671wrb.257.1647858671843; 
 Mon, 21 Mar 2022 03:31:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5x2xjQSKw5LtjzQaLUeguvi9zVQfqYbDLn8NhT0hwz5Xrk8WSQHXrYhATFqCiN206TPD86Q==
X-Received: by 2002:a5d:47a6:0:b0:203:914f:52fa with SMTP id
 6-20020a5d47a6000000b00203914f52famr240648wrb.257.1647858671505; 
 Mon, 21 Mar 2022 03:31:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4900:849b:f76e:5e1f:ff95?
 (p200300cbc7044900849bf76e5e1fff95.dip0.t-ipconnect.de.
 [2003:cb:c704:4900:849b:f76e:5e1f:ff95])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a5d46ca000000b00203fd86e198sm6614815wrs.96.2022.03.21.03.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 03:31:11 -0700 (PDT)
Message-ID: <86ecb12d-2777-e83a-f375-368a3baebe86@redhat.com>
Date: Mon, 21 Mar 2022 11:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <20220308015358.188499-4-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 03/11] target/s390x: vxeh2: vector string search
In-Reply-To: <20220308015358.188499-4-richard.henderson@linaro.org>
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 02:53, Richard Henderson wrote:
> From: David Miller <dmiller423@gmail.com>
> 
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Message-Id: <20220307020327.3003-3-dmiller423@gmail.com>
> [rth: Rewrite helpers; fix validation of m6.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> The substring search was incorrect, in that it didn't properly
> restart the search when a match failed.  Split the helper into
> multiple, so that the memory accesses can be optimized.
> ---
>  target/s390x/helper.h                |   6 ++
>  target/s390x/tcg/translate.c         |   3 +-
>  target/s390x/tcg/vec_string_helper.c | 101 +++++++++++++++++++++++++++
>  target/s390x/tcg/translate_vx.c.inc  |  26 +++++++
>  target/s390x/tcg/insn-data.def       |   2 +
>  5 files changed, 137 insertions(+), 1 deletion(-)
> 
> diff --git a/target/s390x/helper.h b/target/s390x/helper.h
> index 7cbcbd7f0b..7412130883 100644
> --- a/target/s390x/helper.h
> +++ b/target/s390x/helper.h
> @@ -246,6 +246,12 @@ DEF_HELPER_6(gvec_vstrc_cc32, void, ptr, cptr, cptr, cptr, env, i32)
>  DEF_HELPER_6(gvec_vstrc_cc_rt8, void, ptr, cptr, cptr, cptr, env, i32)
>  DEF_HELPER_6(gvec_vstrc_cc_rt16, void, ptr, cptr, cptr, cptr, env, i32)
>  DEF_HELPER_6(gvec_vstrc_cc_rt32, void, ptr, cptr, cptr, cptr, env, i32)
> +DEF_HELPER_6(gvec_vstrs_8, void, ptr, cptr, cptr, cptr, env, i32)
> +DEF_HELPER_6(gvec_vstrs_16, void, ptr, cptr, cptr, cptr, env, i32)
> +DEF_HELPER_6(gvec_vstrs_32, void, ptr, cptr, cptr, cptr, env, i32)
> +DEF_HELPER_6(gvec_vstrs_zs8, void, ptr, cptr, cptr, cptr, env, i32)
> +DEF_HELPER_6(gvec_vstrs_zs16, void, ptr, cptr, cptr, cptr, env, i32)
> +DEF_HELPER_6(gvec_vstrs_zs32, void, ptr, cptr, cptr, cptr, env, i32)
>  
>  /* === Vector Floating-Point Instructions */
>  DEF_HELPER_FLAGS_5(gvec_vfa32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 904b51542f..d9ac29573d 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -6222,7 +6222,8 @@ enum DisasInsnEnum {
>  #define FAC_PCI         S390_FEAT_ZPCI /* z/PCI facility */
>  #define FAC_AIS         S390_FEAT_ADAPTER_INT_SUPPRESSION
>  #define FAC_V           S390_FEAT_VECTOR /* vector facility */
> -#define FAC_VE          S390_FEAT_VECTOR_ENH /* vector enhancements facility 1 */
> +#define FAC_VE          S390_FEAT_VECTOR_ENH  /* vector enhancements facility 1 */
> +#define FAC_VE2         S390_FEAT_VECTOR_ENH2 /* vector enhancements facility 2 */
>  #define FAC_MIE2        S390_FEAT_MISC_INSTRUCTION_EXT2 /* miscellaneous-instruction-extensions facility 2 */
>  #define FAC_MIE3        S390_FEAT_MISC_INSTRUCTION_EXT3 /* miscellaneous-instruction-extensions facility 3 */
>  
> diff --git a/target/s390x/tcg/vec_string_helper.c b/target/s390x/tcg/vec_string_helper.c
> index ac315eb095..6c0476ecc1 100644
> --- a/target/s390x/tcg/vec_string_helper.c
> +++ b/target/s390x/tcg/vec_string_helper.c
> @@ -471,3 +471,104 @@ void HELPER(gvec_vstrc_cc_rt##BITS)(void *v1, const void *v2, const void *v3,  \
>  DEF_VSTRC_CC_RT_HELPER(8)
>  DEF_VSTRC_CC_RT_HELPER(16)
>  DEF_VSTRC_CC_RT_HELPER(32)
> +
> +static int vstrs(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
> +                 const S390Vector *v4, uint8_t es, bool zs)
> +{
> +    int substr_elen, substr_0, str_elen, i, j, k, cc;
> +    int nelem = 16 >> es;
> +    bool eos = false;
> +
> +    substr_elen = s390_vec_read_element8(v4, 7) >> es;
> +
> +    /* If ZS, bound substr length by min(nelem, strlen(v3)). */
> +    if (zs) {
> +        int i;

You can drop this "int i;"

> +        for (i = 0; i < nelem; i++) {
> +            if (s390_vec_read_element(v3, i, es) == 0) {
> +                break;
> +            }
> +        }
> +        if (i < substr_elen) {
> +            substr_elen = i;
> +        }

Maybe combine both, I guess there is no need to search beyond substr_elen.

substr_elen = MIN(substr_elen, nelem);
for (i = 0; i < substr_elen; i++) {
    if (s390_vec_read_element(v3, i, es) == 0) {
        substr_elen = i;
        break;
    }
}


We should do the MIN(substr_elen, nelem) maybe right when reading it
from v4.

> +    }
> +
> +    if (substr_elen == 0) {
> +        cc = 2; /* full match for degenerate case of empty substr */
> +        k = 0;
> +        goto done;
> +    }
> +
> +    /* If ZS, look for eos in the searched string. */
> +    if (zs) {
> +        for (k = 0; k < nelem; k++) {
> +            if (s390_vec_read_element(v2, k, es) == 0) {
> +                eos = true;
> +                break;
> +            }
> +        }

I guess we could move that into the main search loop and avoid parsing
the string twice. Not sure what's better.

> +        str_elen = k;
> +    } else {
> +        str_elen = nelem;
> +    }
> +
> +    substr_0 = s390_vec_read_element(v3, 0, es);
> +
> +    for (k = 0; ; k++) {
> +        for (; k < str_elen; k++) {
> +            if (s390_vec_read_element(v2, k, es) == substr_0) {
> +                break;
> +            }
> +        }
> +
> +        /* If we reached the end of the string, no match. */
> +        if (k == str_elen) {
> +            cc = eos; /* no match (with or without zero char) */
> +            goto done;
> +        }
> +
> +        /* If the substring is only one char, match. */
> +        if (substr_elen == 1) {
> +            cc = 2; /* full match */
> +            goto done;
> +        }
> +
> +        /* If the match begins at the last char, we have a partial match. */
> +        if (k == str_elen - 1) {
> +            cc = 3; /* partial match */
> +            goto done;
> +        }
> +
> +        i = MIN(nelem, k + substr_elen);
> +        for (j = k + 1; j < i; j++) {
> +            uint32_t e2 = s390_vec_read_element(v2, j, es);
> +            uint32_t e3 = s390_vec_read_element(v3, j - k, es);
> +            if (e2 != e3) {
> +                break;
> +            }
> +        }
> +        if (j == i) {
> +            /* Matched up until "end". */
> +            cc = i - k == substr_elen ? 2 : 3; /* full or partial match */
> +            goto done;
> +        }
> +    }
> +
> + done:
> +    s390_vec_write_element64(v1, 0, k << es);
> +    s390_vec_write_element64(v1, 1, 0);
> +    return cc;
> +}
> +
> +#define DEF_VSTRS_HELPER(BITS)                                             \
> +void QEMU_FLATTEN HELPER(gvec_vstrs_##BITS)(void *v1, const void *v2,      \
> +    const void *v3, const void *v4, CPUS390XState *env, uint32_t desc)     \
> +    { env->cc_op = vstrs(v1, v2, v3, v4, MO_##BITS, false); }              \
> +void QEMU_FLATTEN HELPER(gvec_vstrs_zs##BITS)(void *v1, const void *v2,    \
> +    const void *v3, const void *v4, CPUS390XState *env, uint32_t desc)     \
> +    { env->cc_op = vstrs(v1, v2, v3, v4, MO_##BITS, true); }
> +
> +DEF_VSTRS_HELPER(8)
> +DEF_VSTRS_HELPER(16)
> +DEF_VSTRS_HELPER(32)
> diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
> index ea28e40d4f..d514e8b218 100644
> --- a/target/s390x/tcg/translate_vx.c.inc
> +++ b/target/s390x/tcg/translate_vx.c.inc
> @@ -2497,6 +2497,32 @@ static DisasJumpType op_vstrc(DisasContext *s, DisasOps *o)
>      return DISAS_NEXT;
>  }
>  
> +static DisasJumpType op_vstrs(DisasContext *s, DisasOps *o)
> +{
> +    typedef void (*helper_vstrs)(TCGv_ptr, TCGv_ptr, TCGv_ptr,
> +                                 TCGv_ptr, TCGv_ptr, TCGv_i32);
> +    static const helper_vstrs fns[3][2] = {
> +        { gen_helper_gvec_vstrs_8, gen_helper_gvec_vstrs_zs8 },
> +        { gen_helper_gvec_vstrs_16, gen_helper_gvec_vstrs_zs16 },
> +        { gen_helper_gvec_vstrs_32, gen_helper_gvec_vstrs_zs32 },
> +    };
> +

Superfluous empty line.

> +    const uint8_t m5 = get_field(s, m5);

Could so a s/m5/es/ , as we do it in other handlers.

> +    const uint8_t m6 = get_field(s, m6);
> +    bool zs = m6 & 2;

I remember we wanted to use extract32() for such bit-tests, at least we
do it in most of the other handlers :)

const bool zs = extract32(m6, 1, 1);

?

> +
> +    if (m5 > ES_32 || m6 & ~2) {
> +        gen_program_exception(s, PGM_SPECIFICATION);
> +        return DISAS_NORETURN;
> +    }
> +



-- 
Thanks,

David / dhildenb


