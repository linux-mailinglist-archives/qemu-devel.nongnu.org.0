Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DA34381E1
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 06:43:25 +0200 (CEST)
Received: from localhost ([::1]:45902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me8sO-0007WX-Pg
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 00:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me8rc-0006qI-GL
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 00:42:36 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me8rb-0001bu-3B
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 00:42:36 -0400
Received: by mail-pl1-x632.google.com with SMTP id s1so4099027plg.12
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 21:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SneiNojpTqh4lJBaaqoZbvH6PRSbhE3ZzkYvOyFzMFk=;
 b=G1z85ipIAxgQd1KS5eEzEPRUVDONAG98CZtm1KUrzb6Lu9+S1ew0uQEu0y6ubGI4/5
 oPUgvTy2Fz0NhNy49Q6MHRPKNHtlxGD/DYwTVxPSj7tVCU6vyKgMKYKzaoUCO3xzXmqO
 NHAPpNLJJLAQ7ly0iyBV4hYwKPq8GJKRzO+ZRdCa0/yKmPsV8GtWyvjzCtX6gtlNdtut
 IBhrlKNlX/DP5iwqY9StMuIE+/bJr6hg+CDN1Wit9vSm1ca/GPRrSkdt9WC+ud/Dz1oS
 ugUj620TBBS3ujt2BVODOeIn7JBawJE5/zCFofDZezbAxmrkdiZXvsN3L18nMYS50XPn
 ToGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SneiNojpTqh4lJBaaqoZbvH6PRSbhE3ZzkYvOyFzMFk=;
 b=f79ig1oKW2K6OVC+VZVdQQq43MmIN7dY8FyztRqqLWFg7zYrPLjeNF5PeaTtbdHwb8
 OAmpIJVPBS6QcyrKNmT3ol+MrfKKemKfuU/nW8xYhI0rWCSfepUYxKdVXMl50ka9XBfx
 mY9Vyx871VyYO8OzDm4NzWP976GdIqphXU6u+k3UZ++OsjSdXJR2lKVkAF47XkZfQuOV
 JOH4hgNfGzfMOxhCymVokknkmC06oquK6yw11/QQyCQ9I477JlvcKK2imr1XTjoGup7K
 8P+9dvNPEeg2gGhGkLWx31jHAf8qRS0rE40atUqM5sCXkFhtiioyMDbtLAKTOsm8aut6
 9quw==
X-Gm-Message-State: AOAM531wBMKoKPaHr0lilITu3tfgBNjDTj9JKFvuKjItMeMdEhRNpdhS
 4isH55TQKnfgaMS/i/9kgS0pvg==
X-Google-Smtp-Source: ABdhPJwMlOEEE+GC7+ZqQmViRTpak4Xe86bedI+jyftlxWJY+KpSdCybCZYXPAXqPCiCfstycnxLig==
X-Received: by 2002:a17:90a:eb04:: with SMTP id
 j4mr14073536pjz.76.1634964153338; 
 Fri, 22 Oct 2021 21:42:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b134sm9669951pga.3.2021.10.22.21.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 21:42:33 -0700 (PDT)
Subject: Re: [PATCH 16/33] target/ppc: Implement Vector Insert Word from GPR
 using Immediate insns
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-17-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4a9f95b2-3f9e-f835-0315-7632a5e6996a@linaro.org>
Date: Fri, 22 Oct 2021 21:42:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-17-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> +static bool do_vins_VX_uim4(DisasContext *ctx, arg_VX_uim4 *a, int size,
> +                        void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
> +{
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +    REQUIRE_VECTOR(ctx);
> +
> +    if (a->uim > (16 - size)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid index for VINS* at"
> +            " 0x" TARGET_FMT_lx ", UIM = %d > %d\n", ctx->cia, a->uim,
> +            16 - size);
> +        return true;
> +    }

Does this really do nothing on real hw?
I know the manual says undefined, but I would have expected SIGILL.

> +#if defined(TARGET_PPC64)
> +    return do_vinsx(ctx, a->vrt, size, false, tcg_constant_tl(a->uim),
> +                    cpu_gpr[a->vrb], gen_helper);
> +#else
> +    bool ok;
> +    TCGv_i64 val;
> +
> +    val = tcg_temp_new_i64();
> +    tcg_gen_extu_tl_i64(val, cpu_gpr[a->vrb]);
> +
> +    ok = do_vinsx(ctx, a->vrt, size, false, tcg_constant_tl(a->uim), val,
> +                  gen_helper);
> +
> +    tcg_temp_free_i64(val);
> +    return ok;
> +#endif

Similarly wrt target_ulong.

r~

