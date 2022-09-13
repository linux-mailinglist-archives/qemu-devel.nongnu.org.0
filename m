Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086EF5B6B79
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:16:20 +0200 (CEST)
Received: from localhost ([::1]:51874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY2xn-0000i5-4l
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY2vk-0007a6-Vt
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:14:13 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY2vi-000360-VL
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:14:12 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b5so19938460wrr.5
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 03:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=7w7UucKWQMy2vZPJq5Grgt0I4sHy4yCcqg+nEMzQU+E=;
 b=wjEgqY1Pzovh1ZHY1uzroj9uOdWfCQp7k7IO/O82G/N9L7Jwz72jITGk/Wl5dT2ByF
 ybKHrBIg5FH01Dx/K76bjRdWcusNWQrsYjFZfyWP2xYfWCH3KdT07PV0AY4DAdzCxnji
 VHksVlQ8TbvH1+9zJYEN6HWV6V3DlY7BoMaH06y7WgM9PHM77mbAEDjG5QHTX1CNB2DT
 BFDSmxcDu3U3FZWGsf9PamT22wtrNZkVyKSdDc/jhB/PAfJRe/YYHTeQhyg98nnUG1pY
 KQm9TaA0+b2h6ZBGD694O0MsUj/vEGfHqHw+JXg4qQUtxJcFknxZYUN39GJVJgq2T5iy
 PLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=7w7UucKWQMy2vZPJq5Grgt0I4sHy4yCcqg+nEMzQU+E=;
 b=fZpnmLZqHEWO2Rgu+pBGzhPgLjGuNph0YjkKLaz1V/Gy93dJ9skT6W5kx+Hp4LSTGh
 PGpPFqY3pW8URw1w50dipIlk1+X89SG03It1v8/0fYJvsvK1S1eAcTYAhShQe9dcypky
 1MYo2sF8RnMUDZL7PVw+WArvoCVulzYEGkoNp5374S0nhx/I/ujs4iJ/Omes3tbp4RER
 FfGz7lmJdZyVXSKcACs9osMtfnqZrdTVZ85WMYA08+lsFcmDPsPImeF0fFQEiLoQ3VBT
 QtEgtGeJHr2qh26BTZIleMRNWALCOjFnTEI2FAghngkg/Zu+PUnEZtYyA64O8keZ1PBQ
 mTog==
X-Gm-Message-State: ACgBeo3IN9XbkVMq2SOTzuE0qJ2NHISdVXzbD4Fn2SjwoGATwFTbKSLn
 UrTR/OJF0ebls5YKAiaIIKrwhg==
X-Google-Smtp-Source: AA6agR7uczskiTYd/PoFbN7nZf6dKYsZDfcWruyLxywcQKZ7lw5ip71WDc2/Y0R3f1CzpMp/sYE7Ug==
X-Received: by 2002:adf:fe06:0:b0:228:db6f:41ae with SMTP id
 n6-20020adffe06000000b00228db6f41aemr18729487wrr.577.1663064049025; 
 Tue, 13 Sep 2022 03:14:09 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a1c4603000000b003a5c244fc13sm13200435wma.2.2022.09.13.03.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 03:14:08 -0700 (PDT)
Message-ID: <a877d694-e4c3-5875-a628-76f2328d3242@linaro.org>
Date: Tue, 13 Sep 2022 11:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 30/37] target/i386: reimplement 0x0f 0x10-0x17, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-31-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-31-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> +static void gen_VMOVHPx_ld(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    if (decode->op[0].offset != decode->op[1].offset) {
> +        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[1].offset + offsetof(XMMReg, XMM_Q(0)));
> +        tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
> +    }
> +    gen_ldq_env_A0(s, decode->op[0].offset + offsetof(XMMReg, XMM_Q(1)));
> +}

Don't modify op0 before the load fault.

> +static void gen_VMOVHLPS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset + offsetof(XMMReg, XMM_Q(1)));
> +    tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
> +    if (decode->op[0].offset != decode->op[1].offset) {
> +        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[1].offset + offsetof(XMMReg, XMM_Q(1)));
> +        tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(1)));
> +    }
> +}
> +
> +static void gen_VMOVLHPS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset + offsetof(XMMReg, XMM_Q(0)));
> +    tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(1)));
> +    if (decode->op[0].offset != decode->op[1].offset) {
> +        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[1].offset + offsetof(XMMReg, XMM_Q(0)));
> +        tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
> +    }
> +}
> +
> +static void gen_VMOVLPx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    int vec_len = sse_vec_len(s, decode);
> +
> +    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset + offsetof(XMMReg, XMM_Q(0)));
> +    tcg_gen_gvec_mov(MO_64, decode->op[0].offset, decode->op[1].offset, vec_len, vec_len);
> +    tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset + offsetof(XMMReg, XMM_Q(0)));
> +}

You've just been moving i64 pieces in the other functions, why is this one different using 
a gvec move in the middle?  I do wonder if a generic helper moving offset->offset, with 
the comparison wouldn't be helpful within these functions, even when you know off1 != 
off2, due to Q(0) vs Q(1).

> +static void gen_VMOVLPx_ld(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    int vec_len = sse_vec_len(s, decode);
> +
> +    tcg_gen_gvec_mov(MO_64, decode->op[0].offset, decode->op[1].offset, vec_len, vec_len);
> +    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_64);
> +    tcg_gen_st_i64(s->tmp1_i64, s->ptr0, offsetof(ZMMReg, ZMM_Q(0)));
> +}

Don't modify op0 before load fault.

> +static void gen_VMOVSD_ld(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    TCGv zero = tcg_const_i64(0);
> +
> +    tcg_gen_st_i64(zero, s->ptr0, offsetof(ZMMReg, ZMM_Q(1)));
> +    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_64);
> +    tcg_gen_st_i64(s->tmp1_i64, s->ptr0, offsetof(ZMMReg, ZMM_Q(0)));
> +    tcg_temp_free_i64(zero);
> +}

Likewise.

> +static void gen_VMOVSS_ld(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    int vec_len = sse_vec_len(s, decode);
> +
> +    tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
> +    tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0, s->mem_index, MO_32);
> +    tcg_gen_st_i32(s->tmp2_i32, s->ptr0, offsetof(ZMMReg, ZMM_L(0)));
> +}

Likewise.


r~

