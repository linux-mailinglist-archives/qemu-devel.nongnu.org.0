Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF09438032
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 00:22:10 +0200 (CEST)
Received: from localhost ([::1]:44504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me2vP-0001OM-KV
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 18:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2tO-0008Vf-3T
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 18:20:02 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2tM-0004oE-LT
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 18:20:01 -0400
Received: by mail-pf1-x433.google.com with SMTP id o133so4852517pfg.7
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 15:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OydtGg6XGNVTeN+sK+dSjf/2g2VoMMtj5jMfQqJ+vn0=;
 b=Kih+IZSmUwsQxoDAJW92Xl7y/fL4sJd/D5B3CWmjWoQqqRkOamappaSsG4tc02abyT
 XJJ8OFaW65KEb6oVvkkhIWmWCWO3sU/SpdNIHaeMsHT3T7cQC+9E8spBrMqGUbiWbL3Z
 qImOX3p0/40tMunQiX0SApBFcwtRxF0DR5YAxleCdhkcAVEa/LCfBKmk0D69IFVJbKsG
 dDfTivld59ltQH5QBRYWk1FaKdkt4niYGS+pTYG1l4RnLQTOyDNVemIpDvAMp59g1dfq
 1XKKFV7b3I35UV5ab2qy0BQ7AtGEtXY6IiliZsMEEsbNxUgdoCuzC+MKlXvqFHisE1fV
 ComQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OydtGg6XGNVTeN+sK+dSjf/2g2VoMMtj5jMfQqJ+vn0=;
 b=dRmsCwzkkLsDFqqcKYuHTIEueRMthLoQ2soD8BYmeSi9Iwg8msecbY/f4Wk3iZK0dd
 d3y3K6aF/asbe/b04N+s0LRS/byrqGky/rgQTnuRqf0I4dZBLzM2GhzjSqA374gNUHIn
 8E2iQiTcrLXaWuR5HMIkmcHq3WEBgVE7aRqGz1wUJmIT646q/wDLo16W38iaPkStzBiQ
 qmxkfYTHIgZ84h6SvkG6a1CoCy8AcRMf79DBTeJ7P3w1+vDmkaDABM7E5lchqW/hsrmj
 hqCiK8xz2VwMImVqxrOCZCiNdPBRcpl/8NBL24jT8Hf3BS+p7hlNx/t4nT/jcDSS+HzK
 AJ6A==
X-Gm-Message-State: AOAM533cOoG3cvKxkbn33NcZYYThQFdlZGys6jb2dA+0guOzKCazH5uZ
 v0sN/mw8kv8BuMa4n2VNoiMJiA==
X-Google-Smtp-Source: ABdhPJyXBRPyjfllahlTA3h9pSEHlmPYgoAFkQs5tZ8Ir4XSGK56M6lBB3Q3jV0jwgqb52RhUadnSw==
X-Received: by 2002:a63:af59:: with SMTP id s25mr1811794pgo.70.1634941198612; 
 Fri, 22 Oct 2021 15:19:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id f84sm10382982pfa.25.2021.10.22.15.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 15:19:58 -0700 (PDT)
Subject: Re: [PATCH 03/33] target/ppc: Move load and store floating point
 instructions to decodetree
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-4-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e2636e91-a311-740e-aa55-9f1efed65389@linaro.org>
Date: Fri, 22 Oct 2021 15:19:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-4-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pherde <phervalle@gmail.com>, lucas.castro@eldorado.org.br, groug@kaod.org,
 luis.pires@eldorado.org.br,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> +/*            Floating-point Load/Store Instructions                         */
> +static bool do_lsfpsd(DisasContext *ctx, int rt, int ra, TCGv displ,
> +                      bool update, bool store, bool single)
> +{
> +    TCGv ea;
> +    TCGv_i64 t0;
> +    REQUIRE_INSNS_FLAGS(ctx, FLOAT);
> +    REQUIRE_FPU(ctx);
> +    if (update && ra == 0) {
> +        gen_invalid(ctx);
> +        return true;
> +    }
> +    gen_set_access_type(ctx, ACCESS_FLOAT);
> +    t0 = tcg_temp_new_i64();
> +    ea = tcg_temp_new();
> +    do_ea_calc(ctx, ra, displ, ea);
> +    if (store) {
> +        get_fpr(t0, rt);
> +        single ? gen_qemu_st32fs(ctx, t0, ea) : gen_qemu_st64_i64(ctx, t0, ea);
> +    } else {
> +        single ? gen_qemu_ld32fs(ctx, t0, ea) : gen_qemu_ld64_i64(ctx, t0, ea);
> +        set_fpr(rt, t0);
> +    }

Not thrilled about the top-level ?: expression.  I mean, it works, but surely an if 
statement is clearer.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

