Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7823D34C4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 08:39:33 +0200 (CEST)
Received: from localhost ([::1]:33604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6oqK-0007Kl-9q
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 02:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6opP-0006ax-6u
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:38:35 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6opN-0000pE-Pt
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:38:34 -0400
Received: by mail-pl1-x62b.google.com with SMTP id e14so2078720plh.8
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 23:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dkKZOYg+M38lB1jshk3VcNal3c8OgYCh2J3hyd/Ehls=;
 b=HPLKdnCd8tyiDCQ+Boqw9YBaVX4iloxQbaRJE/82Am3FNCz5Tbcwlzy+WtY8OHGz93
 YbLuRh+U4zCUXXgRM/oITqw/CwQ9pvUabf/Khziz0FU4w5zWVeg388REUJerlEYkffYP
 bo4i3W7GOpXnpX3OblAAn8jtSCibMVwQNxLOYUzf+/kvu1tbeAZrc9orYhrHqnihVkYS
 Nk/8caK/O0aedragaRLgk2NWleuwI2TUFKoQNmCThz7m+ksCYyTFjeTQyR/wESy10CJG
 GgkxpmNfUijsZoISybqwrJkMwjB1TRo2s6iXPxRKr5huWDf7AYdpOvEL72OHr+dot/Uf
 bdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dkKZOYg+M38lB1jshk3VcNal3c8OgYCh2J3hyd/Ehls=;
 b=RcfmZ5HG7kXEcxnvM28RiZxqI1dHAT94UfpkLiI8ane80m0Grvdaw/V6ga71SonOmT
 K48cje8yVS694jEYi2KDeRwFaVd41Nbm9sdlkqOEkdXP1W2FZ36UbbUDwn+XgJe87M3a
 Z/K5q4JJgwa/u0Pv9zSugCnCg5KResFgDOfYweR5Nto0hzeLc6/+vyaZ2qsm73o2Id1P
 UqysF55wZ4KHO0DAZE/2Qw36/y/wCrCQLvGnZbVgca2T0sKrxW7UzeiY5m/j5MA6RtKZ
 oKOn4Hguago2q7MQLLaFo3Hcr2WeckI3nIyOrVAqrAiu1MZmu2fKY0cfqZi6OokG+PmA
 mU6Q==
X-Gm-Message-State: AOAM533fvwYgwR7pTa2qEh4HSGx7aj3Nm5fK6ZWDne1aZ+l8VjDk9tNx
 wHL8qUbMMIkuY+l3/gTZQbEu8A==
X-Google-Smtp-Source: ABdhPJyF3FXqIIbNq2lANPMKXf6aRaIhvu+ghTSjuoUs47GlORuo2MQiCUkjwuUXAy7QlOfqDeHQPw==
X-Received: by 2002:a17:90a:8c9:: with SMTP id 9mr12066722pjn.58.1627022312282; 
 Thu, 22 Jul 2021 23:38:32 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id z3sm625330pjn.43.2021.07.22.23.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 23:38:31 -0700 (PDT)
Subject: Re: [PATCH v2 18/22] target/loongarch: Add branch instruction
 translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-19-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d721302e-ddcf-95d1-f39d-35afd25999ce@linaro.org>
Date: Thu, 22 Jul 2021 20:38:28 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-19-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 PM, Song Gao wrote:
> +/* Branch Instructions translation */
> +static bool trans_beqz(DisasContext *ctx, arg_beqz *a)
> +{
> +    TCGv t0, t1;
> +    int bcond_flag = 0;
> +
> +    t0 = tcg_temp_new();
> +    t1 = tcg_const_i64(0);
> +
> +    if (a->rj != 0) {
> +        gen_load_gpr(t0, a->rj);
> +        bcond_flag = 1;
> +    }
> +
> +    if (bcond_flag == 0) {
> +        ctx->hflags |= LOONGARCH_HFLAG_B;
> +    } else {
> +        tcg_gen_setcond_tl(TCG_COND_EQ, bcond, t0, t1);
> +        ctx->hflags |= LOONGARCH_HFLAG_BC;
> +    }
> +    ctx->btarget = ctx->base.pc_next + (a->offs21 << 2);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +
> +    return true;
> +}

Drop all of the branch delay slot stuff.
Use a common routine and pass in the TCGCond.


r~

