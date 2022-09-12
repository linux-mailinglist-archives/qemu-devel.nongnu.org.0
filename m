Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F955B5BB5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:58:32 +0200 (CEST)
Received: from localhost ([::1]:34702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXjxG-0002xJ-Uv
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXjvB-0007wQ-Qs
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 09:56:22 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:45770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXjvA-0004Ms-6b
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 09:56:21 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so7245097wmb.4
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 06:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=D9UZWKoA9i7uwzkjpStMF64Wky1fnPV+scOijCXrAvk=;
 b=WZG8F8k1j5lieVNvDEdg4bEwZq9TRebBomnzZ+CrIvXEbSrFsx42vtqJuKEEeg9ZMF
 HqIg0lC1Qyu/gskLuD5JOeYuG1NPr67tOE99JnV09rj6YCSn5igRl61JRINZhOk7Cwgh
 qNN6mpXFeuNUAonQk3+a0OW2Kc6zh6bq85Tn8t1tG2iVGf4+lLDrWSNHuX5C2lvqHHoh
 CUd7L9xPoOVM4XqWBVK8Y59JY1lP25B4AAkwRUMzfGxZweKMsUUFdpdGD2rCHMOkrTk+
 8f1Zv4ZhZnxffZoVgBA0KxcWU7xSP1HQSkooDZ++i8pGfImAn0h10IENiUFkVx3n2342
 nHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=D9UZWKoA9i7uwzkjpStMF64Wky1fnPV+scOijCXrAvk=;
 b=m+mHjTStsvRYLUxmFyGbo/D/ZHmYnSpEBykCjV9vOxtLcQSmK7SSp9c0RErggWeC1g
 K3aLwgmxNsBScW9WHw+eL6ApthryXQ4AZ4hXrVDufB1MUMvTPrJpoXmXKWY8+HTs/NcH
 Iilq1mnqeELjQ+ZPzkD+Hb3bkWdkBt2sU2pnsC8XCHhvLwWIl1Ob9Eccm5avysH8qnI6
 SEyHc3UXHzULQxluiKZzihz7jk8FtSw0/Gi4bCG84MxczFTYPomA52UNUB8b1mBpxUfj
 M0GWVTbKr9Pg0OOuHbNZ1B9y89F+VEA9g1Nd4TPGHG+rYJaEjKuB+93tkGpMWwil9a38
 MLRw==
X-Gm-Message-State: ACgBeo3SjxHDZ/ab76NObqLDXrnhgBEjYG/CP1+kLirKcrfOuQkWQtUu
 7LY1o42N3IZDDcPE/OqUymOPTQ==
X-Google-Smtp-Source: AA6agR4qE13166zOScDl/yASrSkOXr7AnLQcbmdQSUZr7afrH8ca5EuZIrhlWjxvJhgg5cxLqlOc5Q==
X-Received: by 2002:a1c:2507:0:b0:3b3:3681:f774 with SMTP id
 l7-20020a1c2507000000b003b33681f774mr13204906wml.134.1662990978402; 
 Mon, 12 Sep 2022 06:56:18 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.69])
 by smtp.gmail.com with ESMTPSA id
 k3-20020adff5c3000000b00228cd9f6349sm7483735wrp.106.2022.09.12.06.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 06:56:17 -0700 (PDT)
Message-ID: <e87ec571-3d79-3a4c-ed60-51fbd0c7b005@linaro.org>
Date: Mon, 12 Sep 2022 14:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 23/37] target/i386: reimplement 0x0f 0x78-0x7f, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-24-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-24-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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
> +static void gen_MOVD_from(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    MemOp ot = decode->op[2].ot;
> +    int lo_ofs = decode->op[2].offset
> +        - xmm_offset(decode->op[2].ot)
> +        + xmm_offset(ot);
> +
> +    switch (ot) {
> +    case MO_32:
> +#ifdef TARGET_X86_64
> +        tcg_gen_ld_i32(s->tmp2_i32, cpu_env, lo_ofs);
> +        tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);

tcg_gen_ld32u_tl(s->T0, cpu_env, lo_ofs);

> +static void gen_MOVQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    int vec_len = sse_vec_len(s, decode);
> +    int lo_ofs = decode->op[0].offset
> +        - xmm_offset(decode->op[0].ot)
> +        + xmm_offset(MO_64);
> +
> +    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset);
> +    tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
> +    tcg_gen_st_i64(s->tmp1_i64, cpu_env, lo_ofs);

tcg_gen_gvec_dup_i64(MO_64, offset, 8, sse_vec_max_len, s->tmp1_i64);


> +static void gen_SSE4a_I(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    TCGv_i32 length = tcg_const_i32(decode->immediate & 255);
> +    TCGv_i32 index = tcg_const_i32(decode->immediate >> 8);
> +
> +    if (s->prefix & PREFIX_DATA) {
> +        gen_helper_extrq_i(cpu_env, s->ptr0, index, length);
> +    } else {
> +        gen_helper_insertq_i(cpu_env, s->ptr0, index, length);
> +    }
> +    tcg_temp_free_i32(length);
> +    tcg_temp_free_i32(index);

Again, why the choice of delayed decode?  I guess it doesn't matter, but it's odd.


r~

