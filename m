Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E3B4CB9BD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 10:01:34 +0100 (CET)
Received: from localhost ([::1]:35592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPhL3-0005NZ-7F
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 04:01:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPhIT-0004YX-Fu
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 03:58:53 -0500
Received: from [2607:f8b0:4864:20::62b] (port=34729
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPhIR-0008KR-DE
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 03:58:52 -0500
Received: by mail-pl1-x62b.google.com with SMTP id ay5so3962662plb.1
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 00:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nEPs3Hqfq7junAOtEc51p15nHStl9ZSZwFFVc7zkQl4=;
 b=aBJQunRiZBFGtubF7jEyL3g9nLTLB0i4Wwcqm6e7T5ML/Y9dk7rzBfzbK8MEu05C6K
 CNEM8RKss3lU6t8nIHf76qS2Pwpy87e+7VDfB+DB0g6XAoolC815+LddQOXphoTWyJ47
 bPW6anJVF/9AK7GLnfkA2PN7qs2aGvWDUWvGuPlb6f3HCYiOEJ+qf6L/2RVtE0RmtnL8
 wJWtjPJXTGy1g6viluNkqxJpDYob9ougKgL5SOtyQ3EbHaJx8naVkVXR/3AAIy5ylHVw
 FyX6ZKWe327H8glJxUKfdqCBM9ni29hAj7eScne9l3LWQ5aDclDscNNVzCof6ywc5Dtj
 dxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nEPs3Hqfq7junAOtEc51p15nHStl9ZSZwFFVc7zkQl4=;
 b=0Gx427EhiCIA4u9ezPhBfSImGo8cNsf5iUefSngq4fPYc4HWK72mkszYsNT574VsA1
 9+ctsn2zUbpG1jNlONl7tWcv7kUHSymcJB9wnqbZC4pySi4PqHKtb1LbW+ugx7zMjrqD
 lSEMndIITcq09Gv/JufyUE+7eiNLNmzfQRV05Y3rW+BGC7EgQicrGyo8Kmxw+RqJSz+1
 kVu5WeMqkprcBmOmkkuYQidbCEgLTQUf/paIRS2FEmxCbEuLPS0vZY+8gLkIR4IqsJcl
 qOIv+4mH4fdqSJ79pm3BIocrLnD3HEw2QMdHjuZZzm6DxxOgdA4mzX1a+ZFDfaJmtrgm
 hj/A==
X-Gm-Message-State: AOAM532Oznx2J+1FMEZHvpEfIis2z5jOlOVCR0gllS6Ktg0kMQPy00lK
 kWWeUpqal4aclbkXZS1OqcvOhA==
X-Google-Smtp-Source: ABdhPJwGu3dGDaviP5sm7Xx8lrJLtaU4S5px+1iTQrDhlhZF9kr21lRBFl6xDnEALlFo83TggV5XFw==
X-Received: by 2002:a17:902:d88a:b0:151:61c0:ea27 with SMTP id
 b10-20020a170902d88a00b0015161c0ea27mr21409583plz.107.1646297929681; 
 Thu, 03 Mar 2022 00:58:49 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:e819:4400:f268:c391?
 (2603-800c-1201-c600-e819-4400-f268-c391.res6.spectrum.com.
 [2603:800c:1201:c600:e819:4400:f268:c391])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a056a00199500b004f3c48332basm1733272pfl.159.2022.03.03.00.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 00:58:49 -0800 (PST)
Message-ID: <9ad00abf-4380-4efc-4012-aee5a36ff6e6@linaro.org>
Date: Wed, 2 Mar 2022 22:58:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/2] s390x/tcg: Implement Vector-Enhancements Facility
 2 for s390x
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220303032219.17631-1-dmiller423@gmail.com>
 <20220303032219.17631-2-dmiller423@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303032219.17631-2-dmiller423@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/22 17:22, David Miller wrote:
> resolves: https://gitlab.com/qemu-project/qemu/-/issues/738
> 
> implements:
> VECTOR LOAD ELEMENTS REVERSED               (VLER)
> VECTOR LOAD BYTE REVERSED ELEMENTS          (VLBR)
> VECTOR LOAD BYTE REVERSED ELEMENT           (VLEBRH, VLEBRF, VLEBRG)
> VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO  (VLLEBRZ)
> VECTOR LOAD BYTE REVERSED ELEMENT AND REPLOCATE (VLBRREP)
> VECTOR STORE ELEMENTS REVERSED              (VSTER)
> VECTOR STORE BYTE REVERSED ELEMENTS         (VSTBR)
> VECTOR STORE BYTE REVERSED ELEMENTS         (VSTEBRH, VSTEBRF, VSTEBRG)
> VECTOR SHIFT LEFT DOUBLE BY BIT             (VSLD)
> VECTOR SHIFT RIGHT DOUBLE BY BIT            (VSRD)
> VECTOR STRING SEARCH                        (VSTRS)
> 
> modifies:
> VECTOR FP CONVERT FROM FIXED                (VCFPS)
> VECTOR FP CONVERT FROM LOGICAL              (VCFPL)
> VECTOR FP CONVERT TO FIXED                  (VCSFP)
> VECTOR FP CONVERT TO LOGICAL                (VCLFP)
> VECTOR SHIFT LEFT                           (VSL)
> VECTOR SHIFT RIGHT ARITHMETIC               (VSRA)
> VECTOR SHIFT RIGHT LOGICAL                  (VSRL)
> 
> Signed-off-by: David Miller <dmiller423@gmail.com>

Too many changes in one patch.
You need to split these into smaller, logical units.

> +/* VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO */
> +    F(0xe604, VLLEBRZ, VRX,   VE2, la2, 0, 0, 0, vllebrz, 0, IF_VEC)
> +/* VECTOR LOAD BYTE REVERSED ELEMENTS */
> +	F(0xe606, VLBR,    VRX,   VE2, la2, 0, 0, 0, vlbr, 0, IF_VEC)
> +/* VECTOR LOAD ELEMENTS REVERSED */
> +	F(0xe607, VLER,    VRX,   VE2, la2, 0, 0, 0, vler, 0, IF_VEC)

Tabs, and more later.

> @@ -457,6 +457,9 @@ static DisasJumpType op_vlrep(DisasContext *s, DisasOps *o)
>       return DISAS_NEXT;
>   }
>   
> +
> +
> +
>   static DisasJumpType op_vle(DisasContext *s, DisasOps *o)

Do not add pointless whitespace.

> +static DisasJumpType op_vlebr(DisasContext *s, DisasOps *o)
> +{
> +    const uint8_t es = (1 == s->fields.op2) ? 1 : (1 ^ s->fields.op2);
> +    const uint8_t enr = get_field(s, m3);
> +    TCGv_i64 tmp;
> +
> +    if (es < ES_16 || es > ES_64 || !valid_vec_element(enr, es)) {
> +        gen_program_exception(s, PGM_SPECIFICATION);
> +        return DISAS_NORETURN;
> +    }
> +
> +    tmp = tcg_temp_new_i64();
> +    tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);

Just use a little-endian load: MO_LE | es.
While we use MO_TE all over, it's no secret that it's always big-endian.

And everywhere else you do load then swap, or swap then store.

> +}
> +
> +
> +
> +static DisasJumpType op_vsteb(DisasContext *s, DisasOps *o)

More care with spacing.

> +static inline void s390_vec_reverse(S390Vector *vdst,
> +                                    S390Vector *vsrc, uint8_t es)
> +{
> +    const uint8_t elems = 1 << (4 - es);
> +    uint32_t enr;
> +
> +    for (enr = 0; enr < elems; enr++) {
> +        switch (es) {
> +        case MO_8:
> +            s390_vec_write_element8(vdst, enr,
> +                           s390_vec_read_element8(vsrc, 15 ^ enr));
> +            break;
> +        case MO_16:
> +            s390_vec_write_element16(vdst, enr,
> +                           s390_vec_read_element16(vsrc, 7 ^ enr));
> +            break;
> +        case MO_32:
> +            s390_vec_write_element32(vdst, enr,
> +                           s390_vec_read_element32(vsrc, 3 ^ enr));
> +            break;
> +        case MO_64:
> +            s390_vec_write_element64(vdst, enr,
> +                           s390_vec_read_element64(vsrc, 1 ^ enr));
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +    }
> +}

This seems likely to go wrong for vdst == vsrc.
In addition, swapping the order of elements is something that can be done in parallel.

     l = src[lo], h = src[hi];
     switch (es) {
     case MO_64:
         dst[hi] = l, dst[lo] = h;
         break;
     case MO_8:
         dst[hi] = bswap64(l);
         dst[lo] = bswap64(h);
         break;
     case MO_16:
         dst[hi] = hswap64(l);
         dst[lo] = hswap64(h);
         break;
     case MO_32:
         dst[hi] = wswap64(l);
         dst[hi] = wswap64(h);
         break;
     }

which, really, can all be generated inline.


r~

