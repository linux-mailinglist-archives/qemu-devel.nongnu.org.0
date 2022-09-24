Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B3E5E8FBE
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 22:55:27 +0200 (CEST)
Received: from localhost ([::1]:54954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocCBK-0008Ld-8l
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 16:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocC9V-0006sy-Kh
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:53:34 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:34716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocC9R-00068n-Co
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:53:33 -0400
Received: by mail-qk1-x731.google.com with SMTP id g2so2100793qkk.1
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 13:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=kNvDpK4JNbEziFejJMBwH5QHqJate6wtymOmHvJan78=;
 b=qhhjNDUbXpSaBX8f24Un/DsouAc4C363i85w8fjzY4a1rD8r7u159m3DQcJSX5cBcw
 d3lrsSPxSpz+K9LAPQN+U8ri0/GCGh41+REZKf0SCgELe+oOGwcfV6r84O1v2z5wZ7Fs
 9NiwX6xC2sphwTElFsFY97udZL+b3N4lV7lCG48WZqfX/r8FHII93ymThWxsyUwEqDyx
 tv5OLRoM8LIdo0KlTPhcViJdFFypoJy0QQvuzTIgYFf0K4KuhyNKOVN4SIhshlxMPrSz
 IgfpQ3eD1eUEhQRqoFNvN4hRREFIxBHd4/Kn66Oy4fNxOyhhipr88/GeAT9xxUZWKnsG
 5JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=kNvDpK4JNbEziFejJMBwH5QHqJate6wtymOmHvJan78=;
 b=ELMrw2IRWZ1gQgHTeaaPmWm5zGy9OFvjXRgcEizSbcGVYMVhAAIfo/kMVngfR55i0g
 v96I6CqE67OKNzYuiIqEJ+casJIiMR6r9JTM5rGFzZJUUZE6E1usORE5tfzHdgG+keyj
 2mOLmBSsWui4FsQ/hSUXKYugb0WWZOYuPrrLFvSuhRtPehGe2RP4hDtNWYGt8122PpN0
 gysnwSiQIPzy5hi6dqc8Nz3UQsQs3f1Ozn/MoHpbgaB3MS29AWcmn9K+de4UYRA+3zW9
 SVn5lEgmlHHi6IJDToqqFaGJut5JAKsHR61o43ln3NDT4eyEWJ7CcgELGqpbj5yuXHyz
 nrLg==
X-Gm-Message-State: ACrzQf0C6amkBODBAXkQkgTVU7JtCt1G9XKevNf2hCP4VTaFe5PUl1ai
 Bzcn0l0HfqVqINi9uu297XjpEw==
X-Google-Smtp-Source: AMsMyM6boi3b2xx/dc5VJ6AxjEspLSHYd1a2kYmJ5wWmB595LKjyNDiWggU9spSiJn/usBehSETcvw==
X-Received: by 2002:a05:620a:4450:b0:6ce:968b:d43f with SMTP id
 w16-20020a05620a445000b006ce968bd43fmr9523199qkp.570.1664052808130; 
 Sat, 24 Sep 2022 13:53:28 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a05620a259600b006bac157ec19sm8395774qko.123.2022.09.24.13.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 13:53:27 -0700 (PDT)
Message-ID: <cca89a61-2a58-a0ef-66d8-513e2d171700@linaro.org>
Date: Sat, 24 Sep 2022 20:53:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 23/37] target/i386: reimplement 0x0f 0x70-0x77, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-24-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-24-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/22 17:24, Paolo Bonzini wrote:
> +static TCGv_ptr make_imm8u_xmm_vec(uint8_t imm, int vec_len)
> +{
> +    MemOp ot = vec_len == 16 ? MO_128 : MO_256;
> +    TCGv_i32 imm_v = tcg_constant8u_i32(imm);
> +    TCGv_ptr ptr = tcg_temp_new_ptr();
> +
> +    tcg_gen_gvec_dup_imm(MO_64, offsetof(CPUX86State, xmm_t0) + xmm_offset(ot),
> +                         vec_len, vec_len, 0);
> +
> +    tcg_gen_addi_ptr(ptr, cpu_env, offsetof(CPUX86State, xmm_t0));
> +    tcg_gen_st_i32(imm_v, ptr, offsetof(ZMMReg, ZMM_L(0)));

tcg_gen_st_i32(imm, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_L(0)));

> +static void gen_VZEROUPPER(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    int i;
> +
> +    for (i = 0; i < CPU_NB_REGS; i++) {
> +        int offset = ZMM_OFFSET(i) + offsetof(ZMMReg, ZMM_X(0));
> +        tcg_gen_gvec_mov(MO_64, offset, offset, 16, 32);
> +    }
> +}

This has the same big-endian problem as MOVQ, wrt which end is cleared?

Perhaps better for now as

   offset = ZMM_OFFSET(i) + offsetof(ZMMReg, ZMM_X(0));
   tcg_gen_gvec_dupi(MO_64, offset, 16, 16, 0)


r~

