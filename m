Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC94370075
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:27:21 +0200 (CEST)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXrE-0006ns-MV
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcXjk-0000Kc-49
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 14:19:37 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcXjf-0008Pq-UH
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 14:19:35 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 b14-20020a17090a6e0eb0290155c7f6a356so6004916pjk.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 11:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=93XX07kN6h4RP1dYTi7TQSIrNi2PbrcwmMbfBG+ycuY=;
 b=nMinhAzYZtKc5Ry4xekB6hP2wZI+/y3i6skkqCt0aYEHwHzfX/Zp4kXXPGeDFMG/dU
 bvn1pYa2dS19ZVL+dtxpwgpgCrNeUdVFEgaNKcFYbEoDvJIx8IxnKj1lgX5YBVtgJHd3
 Am3XOSFIZbsRLU9eE73Awy9Z5B8rlohMH22NnjrO2hgIGv6lAB36E6f6ko7z68q4RQMd
 CbwfAjt723/2U3RMUrKQe9aCquagZP9/YUNRqqiAoe4D91SGgVq1vnGLbh4ixaUnjo1T
 XkcEfJgjel3wYoJKxy5VrdQtfDEFBRXWIIiQi9ag3ZmLH00nxcVDef9v823tDsryLk31
 zAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=93XX07kN6h4RP1dYTi7TQSIrNi2PbrcwmMbfBG+ycuY=;
 b=jx/I7MUVa7rq4f1KjweyELfsdTjD/Gfitpa/rQFb+EndHVg4fIfLXkNjGooqjpBJuP
 p6xVFCTWeWZDKPKx+Wh9CFhpURrr7Ex+YPl20O3f5s6zY1Gdw+/WlndK889YnxbVZIUy
 /qtLrYyXtDHsv4kg9o4GeeNJrHkJk4GnwDM0bgsyUqzrxadybwzMy5FdMqD14Hq5HzCm
 8qM9AP5/9O9BQ+2eqUrWubqhvxtvm1zKDHqBT9uNlklr3qK9r10nZw/zdafVHN295Ckk
 84EjJNOoMwdxwO09YrfxU/yeq5dx6EmtkcHvSYs6ELetR+H3DFDh59JvrTqlXBFSrXVh
 IhrQ==
X-Gm-Message-State: AOAM531tOH4GPoDaV01NZ2q+ob5vHWDTiIMf+ck8RfHw2RpkY46eMhnV
 ogH6DnJI9qTf3lKj1RrmcUw0vw==
X-Google-Smtp-Source: ABdhPJw9WD7H1obVebc4s9vkY/UCULJdxml73KZJWixusHNxFdkujgbPn7cWfwoWCPje5UsKJMKeKQ==
X-Received: by 2002:a17:902:8d98:b029:eb:43c2:d294 with SMTP id
 v24-20020a1709028d98b02900eb43c2d294mr6600521plo.49.1619806769251; 
 Fri, 30 Apr 2021 11:19:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id b14sm2795999pfo.10.2021.04.30.11.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 11:19:28 -0700 (PDT)
Subject: Re: [PATCH v2] Set the correct env->fpip for x86 float instructions
To: Ziqiao Kong <ziqiaokong@gmail.com>, qemu-devel@nongnu.org
References: <20210430021943.152586-1-ziqiaokong@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <62651fc0-0c46-6d14-0c93-7d1339f29b1b@linaro.org>
Date: Fri, 30 Apr 2021 11:19:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430021943.152586-1-ziqiaokong@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 7:19 PM, Ziqiao Kong wrote:
> @@ -1440,7 +1442,9 @@ typedef struct CPUX86State {
>       FPReg fpregs[8];
>       /* KVM-only so far */
>       uint16_t fpop;
> +    uint16_t fpcs;
>       uint64_t fpip;
> +    uint16_t fpds;
>       uint64_t fpdp;

Let's put all uint16_t together, just after fpop, to avoid extra padding 
between the uint64_t.

> +        cpu_stw_data_ra(env, ptr + 16, fpcs, retaddr); /* fpcs */
> +        cpu_stw_data_ra(env, ptr + 18, 0, retaddr);
...
> +        cpu_stw_data_ra(env, ptr + 24, fpds, retaddr); /* fpds */
> +        cpu_stw_data_ra(env, ptr + 26, 0, retaddr);

Better to continue to use stl here, to zero-extend the field.

> @@ -5850,7 +5858,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           op = ((b & 7) << 3) | ((modrm >> 3) & 7);
>           if (mod != 3) {
>               /* memory op */
> -            gen_lea_modrm(env, s, modrm);
> +            update_fdp = true;

You should just move the declaration of update_fdp and last_addr into this 
block.  Then the store to fdp+fds goes at the end of this block.

> +            last_addr = gen_lea_modrm_0(env, s, modrm);
> +            ea = gen_lea_modrm_1(s, last_addr);
> +            gen_lea_v_seg(s, s->aflag, ea, last_addr.def_seg, s->override);

I think you should copy ea into a temporary here.

> +            tcg_gen_mov_tl(s->T0, cpu_seg_base[R_CS]);
> +            tcg_gen_st16_tl(s->T0, cpu_env, offsetof(CPUX86State, fpcs));

cpu_seg_base is segment base, not the segment selector.

I believe that you want to copy offsetof(CPUX86State, segs[seg_reg].selector) 
into this field.

> +            ea = gen_lea_modrm_1(s, last_addr);
> +            tcg_gen_st_tl(ea, cpu_env, offsetof(CPUX86State, fpdp));

Use the temporary saved above instead of re-computing.


r~

