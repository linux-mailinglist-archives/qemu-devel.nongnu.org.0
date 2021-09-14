Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D8D40B069
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:18:29 +0200 (CEST)
Received: from localhost ([::1]:59840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9GV-0002io-MR
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ9Dz-0001WY-VZ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:15:52 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ9Dw-0007kP-4P
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:15:50 -0400
Received: by mail-pg1-x530.google.com with SMTP id r2so12826487pgl.10
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k/dh/SzV7zi8g/B/lsniz6NXOi3k+7v4vHS09D/xcE4=;
 b=mBCPz4NjHxz/7oZ4H+PK/OLVWzj5qtx576UShLl8fDeDUNKrL1MlcxZzOzo9D914Gu
 BvUfzor/oZa2PTcltRZK31Bw8og4rmjmt0UljZG//C6j1JvDtDaXDW/Nyig44VIGGHRO
 wCmoo7vyZOMs8qhIuKan+sYDRZOnncEfaiWk7gWjvC7J6mwRnZ4kv9ho2yXqymKZdgv+
 q3Nobty/kOiT6Zs75pv1httidIrj/KzoYRjDMqSfAe57oBC6YYt1zEBk7LCo/UR60Tf2
 TKa5kGSjs47c9at2EecGMoTfTNEN90Y66/tdZDE24zs8MEDijXv9Ai5cmUGbXVRh0FYS
 ozsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k/dh/SzV7zi8g/B/lsniz6NXOi3k+7v4vHS09D/xcE4=;
 b=Px9faScMtG8TQTjFAk//11TLi6db445QOC1ldCyifp6vuI6gM9fIHlE1WbdQSpIqmw
 js49rKzxODyA5UFLH1ASPCHy0AwxqvzGWj5keSD2T7SwvY6QEVemcUS5Y/XRgyKRPY7F
 wyPjmkCYhTLvdSYGlNGWvIRgTMQGq/T/cQ1h1CL+biIXsvMrEe7qWqHhOj4a/ceFlJU8
 ayISxcA9Yas6yVzEjf1AbCEqxEOaGKNEGc9hyQMF+2Mn8kIKQX3/BT5DOUcFQAXUD+vw
 G1oYgM3JrNZ6BrfkRGOD9akA68meA5BEHjrNynzl5ZXCQfq/Wc6UfW+74TwfeKYPWLxR
 oBzA==
X-Gm-Message-State: AOAM531OtTIHA1OapRhFMWymZZlo4WswmwLAAZqK7oGrc2vRmAaQjjE6
 Lk8InQQoE5ayn1dT5XaKWod8NQ==
X-Google-Smtp-Source: ABdhPJwJ+MeM+GGs7NrwVxW4KhVYt2nCtV4UxgEO8TOj7Ck/wBXfvZUVeaRZdim1qs9dtoMMyGQ8Vg==
X-Received: by 2002:a63:350:: with SMTP id 77mr15699671pgd.441.1631628943583; 
 Tue, 14 Sep 2021 07:15:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w26sm2797927pfj.178.2021.09.14.07.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 07:15:43 -0700 (PDT)
Subject: Re: [PATCH v5 10/21] target/loongarch: Add floating point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
 <1631624431-30658-11-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f9c65cce-5235-d8cd-ee2e-0a47d51548d8@linaro.org>
Date: Tue, 14 Sep 2021 07:15:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631624431-30658-11-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, peterx@redhat.com,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 6:00 AM, Song Gao wrote:
> +static void update_fcsr0_mask(CPULoongArchState *env, uintptr_t pc, int mask)
> +{
> +    int flags = get_float_exception_flags(&env->fp_status) & (~mask);
> +
> +    if (!flags) {
> +        SET_FP_CAUSE(env->fcsr0, flags);
> +        return;

If mask != 0, we may unintentionally leave fp_status.flags != 0, which will then be 
incorporated into the next fp operation.

> +    }
> +
> +    flags = ieee_ex_to_loongarch(flags);
> +    set_float_exception_flags(0, &env->fp_status);

I think this set should move above the if.

> +static bool trans_fmax_s(DisasContext *ctx, arg_fmt_fdfjfk *a)
> +{
> +    tcg_gen_umax_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], cpu_fpr[a->fk]);

Um, this is an integer operation.  You want float32_maxnum.
Likewise for the other min/max operations.

> +static bool trans_fabs_s(DisasContext *ctx, arg_fmt_fdfj *a)
> +{
> +    tcg_gen_ext32u_tl(cpu_fpr[a->fj], cpu_fpr[a->fj]);

You shouldn't be modifying fj.

> +    tcg_gen_abs_i64(cpu_fpr[a->fd], cpu_fpr[a->fj]);

This is an integer operation.  You want

     tcg_gen_andi_i64(cpu_fpr[a->fd], cpu_fpr[a->fj],
                      MAKE_64BIT_MASK(0, 31));

> +static bool trans_fabs_d(DisasContext *ctx, arg_fmt_fdfj *a)
> +{
> +    tcg_gen_abs_i64(cpu_fpr[a->fd], cpu_fpr[a->fj]);

Similarly.

> +/*
> + * LoongArch requires NaN-boxing of narrower width floating point values.
> + * This applies when a 32-bit value is assigned to a 64-bit FP register.
> + */

Um, this comment does not reflect the language in the v1.00 manual.

The actual language says that the upper 32 bits are undefined ("can be any value").  We 
should state that here, and then that QEMU chooses to nanbox, because it is most likely to 
show guest bugs early.


r~

