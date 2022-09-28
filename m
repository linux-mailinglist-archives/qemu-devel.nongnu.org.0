Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F055EE1F4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:34:51 +0200 (CEST)
Received: from localhost ([::1]:55122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oda1J-0000ZQ-TP
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZPZ-0008IM-4R
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:55:49 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZPV-0006oH-Th
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:55:48 -0400
Received: by mail-pg1-x52b.google.com with SMTP id v4so12567427pgi.10
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 08:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=c4Tft3S+9WiTzRQTVFPXvhNJF9eE88AHtHkvG9wN/Is=;
 b=RDAoT1hBSSS6gi6iTM0+Vs2p1EysBCCm2m5WoPh8yxVlcu7FywI1ggU5uPORgtTIAH
 fniIa+qbgU2hXBdWYWRFdlqFWyoRG130w4YJ5FRGsJsT9c5VWrqYYHghQ1hBkVtKxX4a
 gNGNNO6j+mA6ll3bJopxMcnNfH1wGdy5u7KQOkskR1md9ZFYjj351dbmo24LYugDWb+v
 4aTXR61lXxIoD6q6olXu5wWPG7iJFUybyXV2PVIch+OvxQK5iElB966Q9AfUlV1TdzF7
 dL1Dg/6ETYirvc6S9KPzG89fHELQIlx3+uK4DZlioLdxu7oYRyZExsZMsEVsHGCRRcLk
 jm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=c4Tft3S+9WiTzRQTVFPXvhNJF9eE88AHtHkvG9wN/Is=;
 b=SDG7FiU/UY0/Wl2NaP3pBxUsMdHuyCARYZ5OtTIdduXilWC5EqYW+N8DNN7WMOWr8a
 81Bf2qTW3w9AusZrXSMPyr62JaLC+XiCjgyKCV5St85iCodMZhCP0KzfItMMKElJMOyC
 ugtnY80oY64ADwxy1xYrDSTK08YR90+32xZZr9E70W/QESTEGWsFPfUR0egHA4D/cFvU
 pimNNploNP2sUIXd8UOc9YpuKswYXSjVkLoK+2JRWvPZaf472yXQsSva0uwmv9gF1ZtQ
 sCzJqiYBnHnQytJWxwmJpYEpW3OHihxW4L0Jw6MOrQVSCecM+dtw9w0Vgp9XuOKPla8v
 rgWQ==
X-Gm-Message-State: ACrzQf0Q3BZlPg0Cfp0fKkKkNJ+fI6hiTnFY1ZoBYx+o+gB1GMwho7dQ
 xrTVd/SCPj4O1ngR1GdyNqKVpQ==
X-Google-Smtp-Source: AMsMyM6wf5bo2JP3OfjlswALhmD007hOlj4i0xMC6wDzDE7NHeTk0S0a4rcwklGszbvDZV3Il8TXpg==
X-Received: by 2002:a62:ee0c:0:b0:558:5c4:97dc with SMTP id
 e12-20020a62ee0c000000b0055805c497dcmr19343535pfi.14.1664380544340; 
 Wed, 28 Sep 2022 08:55:44 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 x64-20020a633143000000b0043be67b6304sm3900772pgx.0.2022.09.28.08.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 08:55:43 -0700 (PDT)
Message-ID: <3ec61ad6-d439-f501-4433-26c194863c54@linaro.org>
Date: Wed, 28 Sep 2022 08:55:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/hppa: Generate illegal instruction exception for
 64-bit instructions
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <Yy+BHMfYE3fYVq6k@p100>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Yy+BHMfYE3fYVq6k@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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

On 9/24/22 15:13, Helge Deller wrote:
> Qemu currently emulates a 32-bit CPU only, and crashes with this error
> when it faces a 64-bit load (e.g.  "ldd 0(r26),r0") or 64-bit store
> (e.g. "std r26,0(r26)") instruction in the guest:
> 
> ERROR:../qemu/tcg/tcg-op.c:2822:tcg_canonicalize_memop: code should not be reached
> 
> Fix this by adding checks for 64-bit sizes and generate an illegal
> instruction exception if necessary.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/target/hppa/translate.c b/target/hppa/translate.c
> index b8dbfee5e9..287cc410cd 100644
> --- a/target/hppa/translate.c
> +++ b/target/hppa/translate.c
> @@ -1568,7 +1568,12 @@ static bool do_load(DisasContext *ctx, unsigned rt, unsigned rb,
>           /* Make sure if RT == RB, we see the result of the load.  */
>           dest = get_temp(ctx);
>       }
> -    do_load_reg(ctx, dest, rb, rx, scale, disp, sp, modify, mop);
> +    if (unlikely(TARGET_REGISTER_BITS == 32 && (mop & MO_SIZE) > MO_32)) {
> +        gen_illegal(ctx);
> +        dest = tcg_constant_reg(0);
> +    } else {
> +        do_load_reg(ctx, dest, rb, rx, scale, disp, sp, modify, mop);
> +    }

This should be done in trans_ld,

> @@ -1631,7 +1636,11 @@ static bool do_store(DisasContext *ctx, unsigned rt, unsigned rb,
>                        int modify, MemOp mop)
>   {
>       nullify_over(ctx);
> -    do_store_reg(ctx, load_gpr(ctx, rt), rb, 0, 0, disp, sp, modify, mop);
> +    if (unlikely(TARGET_REGISTER_BITS == 32 && (mop & MO_SIZE) > MO_32)) {
> +        gen_illegal(ctx);
> +    } else {
> +        do_store_reg(ctx, load_gpr(ctx, rt), rb, 0, 0, disp, sp, modify, mop);
> +    }

and this in trans_st.


r~


