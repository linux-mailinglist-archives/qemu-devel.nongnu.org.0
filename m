Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F492414F8F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:05:20 +0200 (CEST)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT6cR-0007oh-A7
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT57X-0000EL-PD
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:29:20 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT57V-0007oZ-VG
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:29:19 -0400
Received: by mail-pl1-x62e.google.com with SMTP id w6so2129175pll.3
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=wmY8T2Z5Od62raewpRrgLpDRvTkqXcicZImbtNcq46I=;
 b=CAK7hzi05dLF2G+p5vqA8F/4cwX9jjXVZErVqpM377kFkHOJgVNv0QYSqDRFGG/kwE
 uidq3njppOXUyFh3ecIPT8iueouxST2pxXsKe6d9i2vEu6T8o+nb1toK5XEoPr/Iv1DM
 n1t+H9dw+/SVYr4MzUbcXbg6/8X8qQ6AQVFTRQPnhAGIR+phOr9tuOBWlwkE6TA4dxSA
 KjVX5Wa7c3cmTHusSDWuN/px8WblvGO/Kl0Sro4ysrAhmTDpIulX4oiYt/iLdfIs+je+
 NIOtfDHE/Fh8z2mcYz4DtKS4jSA2KtOGuxjjb/AhrEJe7kcIGdyb8ldkWt5Zqrj32I/5
 amsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wmY8T2Z5Od62raewpRrgLpDRvTkqXcicZImbtNcq46I=;
 b=3DE2IJte7UJ7Td8KX0hGT3MrPOQVAmFTBg1Nb6/7E3Xe/CxdI7Eq+8cfjWLVvJQPEn
 B6sNK4yJ1EoHfp/QBCnmbnc/iZrpq4asRyJ86PIrhLDSTrGx9pOzc+Xsff5W1YZptkfH
 VXqu4X4gdz9n376ux9b5g6O/ZqP7oeHMFhW+o8150cTh1FYTYs9ZNRy9S+8E3I9ujfRU
 +SB8PS2lpKylYq/9t6Qkf7xLOZoC3jxgGDWQKXY9zq0OhJaWkKLRjyxQxTN1twtgLxG2
 Yy2Ok/vrJDSJxxe/UP7Gbu6eDWixQYQ2PtAU3lwMKVOw4A7HZOWjiWsQYAsL+kgaWjgW
 KNnw==
X-Gm-Message-State: AOAM531rG9BcRmw9XZeXwKCmweTFXOqos7U1J7WZr5timAQqHIwEdvCG
 9Vm9nAuf3aZfliDnwd/39CdqWi+Krt4p/g==
X-Google-Smtp-Source: ABdhPJy6lUIxekuG+vnm3IZljqLm0XYzw5r/XDo3UrOJFc6dLW74JJ5WFOKSpI5Za81ZrA33CwMdMQ==
X-Received: by 2002:a17:90a:c982:: with SMTP id w2mr16738pjt.30.1632328156217; 
 Wed, 22 Sep 2021 09:29:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u9sm3370975pgp.83.2021.09.22.09.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 09:29:15 -0700 (PDT)
Subject: Re: [PATCH v2 23/30] tcg/loongarch64: Add softmmu load/store helpers, 
 implement qemu_ld/qemu_st ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-24-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <69924e4b-53dc-fd75-db6b-d094cec103b5@linaro.org>
Date: Wed, 22 Sep 2021 09:29:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-24-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

On 9/21/21 1:19 PM, WANG Xuerui wrote:
> +    /* Compare masked address with the TLB entry.  */
> +    label_ptr[0] = s->code_ptr;
> +    tcg_out_opc_bne(s, TCG_REG_TMP0, TCG_REG_TMP1, 0);
> +
> +    /* TLB Hit - translate address using addend.  */
> +    tcg_out_opc_add_d(s, TCG_REG_TMP0, TCG_REG_TMP2, addrl);

You removed a little too much here.  You still need

     if (TARGET_LONG_BITS == 32) {
         tcg_out_ext32u(s, TCG_REG_TMP0, addrl);
         addrl = TCG_REG_TMP0;
     }
     tcg_out_opc_add_d(s, TCG_REG_TMP0, TCG_REG_TMP2, addrl);

> +static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOpIdx oi,
> +                                TCGReg datalo, TCGReg addrlo,
> +                                void *raddr, tcg_insn_unit **label_ptr)
> +{
> +    TCGLabelQemuLdst *label = new_ldst_label(s);
> +
> +    label->is_ld = is_ld;
> +    label->oi = oi;
> +    label->type = 0;

Type should be set based on "is_64" argument to tcg_out_qemu_ld (or indeed, is_64 could be 
replaced by "type", which would probably make more sense).

This will be used to fix...

> +    if (opc & MO_SIGN) {
> +        /* Sign-extend directly into destination.  */
> +        switch (size) {
> +        case MO_8:
> +            tcg_out_ext8s(s, l->datalo_reg, TCG_REG_A0);
> +            break;
> +        case MO_16:
> +            tcg_out_ext16s(s, l->datalo_reg, TCG_REG_A0);
> +            break;
> +        case MO_32:
> +            tcg_out_ext32s(s, l->datalo_reg, TCG_REG_A0);
> +            break;
> +        default:
> +            g_assert_not_reached();
> +            break;
> +        }
> +    } else {
> +        tcg_out_mov(s, size == MO_64, l->datalo_reg, TCG_REG_A0);
> +    }

... this, where TCG_TYPE_I32 loads should always be sign-extended from 32-bits.  Something 
like

     switch (opc & MO_SSIZE) {
     case MO_SB:
         ext8s;
         break;
     case MO_SH:
         ext16s;
         break;
     case MO_SL:
         ext32s;
         break;
     case MO_UL:
         if (type == TCG_TYPE_I32) {
             ext32s;
             break;
         }
         /* fall through */
     default:
         tcg_out_mov(s, TCG_TYPE_REG, datalo, A0);
         break;
     }

> +    case MO_64:
> +        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A2, l->datalo_reg);

TCG_TYPE_I64, to match MO_64.

> +    if (USE_GUEST_BASE) {
> +        tcg_out_opc_add_d(s, base, TCG_GUEST_BASE_REG, addr_regl);
> +    } else {
> +        tcg_out_opc_add_d(s, base, addr_regl, TCG_REG_ZERO);
> +    }

Still adding zero in tcg_out_qemu_st.


r~

