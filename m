Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFD85A5239
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 18:52:18 +0200 (CEST)
Received: from localhost ([::1]:50942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oShzl-0000Qz-JS
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 12:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oShtV-0004gy-2B
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:45:51 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:42542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oShtT-0006lx-2s
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:45:48 -0400
Received: by mail-pg1-x535.google.com with SMTP id q63so8177661pga.9
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 09:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=t9jvOJl7s83u4NMUJhD9JJcrzTEsB9TshE6iuCC1S/s=;
 b=IidjNQkri7y0kM6/+hy8quCEXt3BQ28Cwsa2olGavH43FhzWDCTskN7p11GafHcCtY
 WdV+InDFT2SNjSFgXNWqcZOfHDmjAyzemloYgxgHTyv55qUX7MgcUGYubohtf/RhMbDc
 EQeo0N/ktFZ8E3GwEIclJXyyYDtpZb2acK5dthM9K5aaZXcAyVbGvUUeDBUTSo3rltCJ
 9gsRojdWAN/pp6pP7lSkmRl8KjJDDSG1FLhOFBVTqXObiSMFPg8bZCHIFe48RX2VGGo3
 FbYmoscBYPKRuGW+C2cbO9JlRS76teGV/S1ddB+Xiitbyf21ac6XT5BnOoZXyLozNoUW
 BZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=t9jvOJl7s83u4NMUJhD9JJcrzTEsB9TshE6iuCC1S/s=;
 b=6nXGlpgL8t8IevDpSDw1Qz8F0gmPGaOtBHpm1vZu8qbtvvX7muUJNyjrymAgwVQ80v
 PSP216uuhF9pTxWxl0nYwJgA/U/q/Aitfp1CnpDb2wQuCzt2yfySC4UmTZm6KbsMAsa8
 jMl5cJix1GFRg1dyhG9tfO9CCRpNvVkQpZQ1eh5VEavTsYyUxYW4Ky7GPdjskdeSgEiA
 qG/+094s9MUpzqQijMfyqZyrdMJUZcSlhkv2I1uK9lpiaY73nW59J+2CysokaPeKexpz
 uz+o5EF+Cxrq4Du3we/TCOrUCT3bEBen4TVOqhO6HLpzGL8kXe3nQFNS0sgNs5B8X+rg
 VE4A==
X-Gm-Message-State: ACgBeo2isvihMvXhJvn+LijUrw1jUrXtm7HxNuljkMFZIqy9WYpG0z2O
 2pi6JUyzAblMSwJBX1MptdM6MA==
X-Google-Smtp-Source: AA6agR4YKbOAjA7RTGf0VESOtghnuAjGWhv5U1DS6s+naf5JGNcAmlZkVbSafNPyzeUNr46ZuUH1FA==
X-Received: by 2002:a05:6a00:1a93:b0:536:5dca:a685 with SMTP id
 e19-20020a056a001a9300b005365dcaa685mr17554113pfv.13.1661791545625; 
 Mon, 29 Aug 2022 09:45:45 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:be85:d5a:94bd:75bd?
 ([2602:47:d49d:ec01:be85:d5a:94bd:75bd])
 by smtp.gmail.com with ESMTPSA id
 g16-20020aa796b0000000b005385555e647sm1725296pfk.155.2022.08.29.09.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 09:45:45 -0700 (PDT)
Message-ID: <a0972b9f-7fbc-8403-6db6-cb30b741d247@linaro.org>
Date: Mon, 29 Aug 2022 09:45:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] target/i386: Raise #GP on unaligned m128 accesses
 when required.
Content-Language: en-US
To: Ricky Zhou <ricky@rzhou.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, eduardo@habkost.net
References: <20220829142326.39562-1-ricky@rzhou.org>
 <20220829142326.39562-2-ricky@rzhou.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220829142326.39562-2-ricky@rzhou.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/29/22 07:23, Ricky Zhou wrote:
> Many instructions which load/store 128-bit values are supposed to
> raise #GP when the memory operand isn't 16-byte aligned. This includes:
>   - Instructions explicitly requiring memory alignment (Exceptions Type 1
>     in the "AVX and SSE Instruction Exception Specification" section of
>     the SDM)
>   - Legacy SSE instructions that load/store 128-bit values (Exceptions
>     Types 2 and 4).
> 
> This change adds a raise_gp_if_unaligned helper which raises #GP if an
> address is not properly aligned. This helper is called before 128-bit
> loads/stores where appropriate.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/217
> Signed-off-by: Ricky Zhou<ricky@rzhou.org>
> ---
>   target/i386/helper.h         |  1 +
>   target/i386/tcg/mem_helper.c |  8 ++++++++
>   target/i386/tcg/translate.c  | 38 +++++++++++++++++++++++++++++++++---
>   3 files changed, 44 insertions(+), 3 deletions(-)


This trap should be raised via the memory operation:

- static inline void gen_ldo_env_A0(DisasContext *s, int offset)

+ static inline void gen_ldo_env_A0(DisasContext *s, int offset, bool aligned)
   {

       int mem_index = s->mem_index;

-     tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);

+     tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index,
+                         MO_LEUQ | (aligned ? MO_ALIGN_16 : 0));
       tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(0)));

       tcg_gen_addi_tl(s->tmp0, s->A0, 8);

       tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);

       tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(1)));

   }


Only the first of the two loads/stores must be aligned, as the other is known to be +8. 
You then must fill in the x86_tcg_ops.do_unaligned_access hook to raise #GP.


r~

