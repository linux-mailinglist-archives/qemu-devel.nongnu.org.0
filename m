Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8E76F391A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 22:21:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pta0M-0004y4-FI; Mon, 01 May 2023 16:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pta0J-0004xT-R3
 for qemu-devel@nongnu.org; Mon, 01 May 2023 16:20:11 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pta0G-0006Ao-TI
 for qemu-devel@nongnu.org; Mon, 01 May 2023 16:20:11 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so28534595e9.3
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682972405; x=1685564405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lDI/20T1uPRoTlQGz3PG7IVp1dlrzIcikclK+BNrn4I=;
 b=sIfdTpfepArE8sU+4NTcy7xOvbZSf/dKemW7L8ciqw+ADmIAIdfVY09A5gWMdcAqIa
 f8rGwdhE+yELNnHDBZinJXVwAhyeZ00UJYIDJWdY113pLL27ph3TlpNIgVyb9EGPymiL
 uxMKe7WOwAc13vtMHss0uV5JMzgU2d+zn5g/Olu0rdbxdkYfwYe7RSiuRfeNUDAdxTiL
 8GonL3qL1Cmm7tBPpGdY0F9ZE8YcRntMFjMPS545gKIx9R5GlwBWbcsvz/cWkAf/aF/w
 9lgfW1ABFrSPSLQQJsnHuhaxOtRal6i2Q7Zi3YxlcUodG59RlYDzpf6Nd8VOXQjAvOeR
 G40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682972405; x=1685564405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lDI/20T1uPRoTlQGz3PG7IVp1dlrzIcikclK+BNrn4I=;
 b=Ie/Sq0/OXxuTnq8+oP01xdJFOkHGcXac3py9QdxqZOC4W4zWGsr3x4MA/3pLOxWrfj
 W3lpV+IRFrIOBOR7SdtqWwIzg99Z0o5yMu4fCKs/TsxoWtO5+mYxkrJjkwtddP///PZW
 /oZxnCDPheKxBpO9S/+It7YN2WjR9DU+63B5vIaW9gZEIL2LvTojzYm6/XggJpLFzKax
 V5UAHI1jh4jMx2uwE8sWhQs8Ol7o3Rvhqh7snnsCAk+pHYwpD5Ba0MeIv2l0/cMVmocU
 xAErdnHUcdp3K9LP+ACguDmgdAiMH8H5NOUVLmF3C1kn7DxUl43dKhvw1MfTmMHQPgTd
 IuDg==
X-Gm-Message-State: AC+VfDw8xCoBcDNFhZrdAA1rhJ7q/6IFtpbDPD9yoDjGV2YO83dOCVEA
 /l6n18iBRJ+op/ea3jrP5ihmLQ==
X-Google-Smtp-Source: ACHHUZ7GIF5nTiYKf2V07/in+UGAFPHkWwL0e1/1SwgFp/N3K/G6yGN5/97rm7s/+Dk8kHs3SY1QsA==
X-Received: by 2002:a1c:7502:0:b0:3ee:36f:3485 with SMTP id
 o2-20020a1c7502000000b003ee036f3485mr11398394wmc.8.1682972404738; 
 Mon, 01 May 2023 13:20:04 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940?
 ([2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940])
 by smtp.gmail.com with ESMTPSA id
 bi26-20020a05600c3d9a00b003eddc6aa5fasm32890364wmb.39.2023.05.01.13.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 13:20:04 -0700 (PDT)
Message-ID: <e9d647a3-c98e-7ab8-9378-74ac2d867a28@linaro.org>
Date: Mon, 1 May 2023 21:20:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 09/19] tcg: Add andcs and rotrs tcg gvec ops
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20230428144757.57530-1-lawrence.hunter@codethink.co.uk>
 <20230428144757.57530-10-lawrence.hunter@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230428144757.57530-10-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/28/23 15:47, Lawrence Hunter wrote:
> From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> 
> This commit adds helper functions and tcg operation definitions for the andcs and rotrs instructions
> 
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> ---
>   accel/tcg/tcg-runtime-gvec.c | 11 +++++++++++
>   accel/tcg/tcg-runtime.h      |  1 +
>   include/tcg/tcg-op-gvec.h    |  4 ++++
>   tcg/tcg-op-gvec.c            | 23 +++++++++++++++++++++++
>   4 files changed, 39 insertions(+)

Queued to tcg-next as two patches, and with alterations:

> +void tcg_gen_gvec_andcs(unsigned vece, uint32_t dofs, uint32_t aofs,
> +                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
> +{
> +    static GVecGen2s g = {
> +        .fni8 = tcg_gen_andc_i64,
> +        .fniv = tcg_gen_andc_vec,
> +        .fno = gen_helper_gvec_andcs,
> +        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
> +        .vece = MO_64
> +    };
> +
> +    tcg_gen_dup_i64(vece, c, c);
> +    tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, c, &g);
> +}

This needed a temporary.

> +void tcg_gen_gvec_rotrs(unsigned vece, uint32_t dofs, uint32_t aofs,
> +                        TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz)
> +{
> +    TCGv_i32 tmp = tcg_temp_new_i32();
> +    tcg_gen_sub_i32(tmp, tcg_constant_i32(1 << (vece + 3)), shift);
> +    tcg_gen_gvec_rotls(vece, dofs, aofs, tmp, oprsz, maxsz);
> +}

This needed the rotation count to be masked (32 - 0 == 32 is illegal).
Simplified as (-shift & mask).


r~


