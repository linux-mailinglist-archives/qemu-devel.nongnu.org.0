Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0BF32FF81
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 08:36:22 +0100 (CET)
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lInxd-0003pU-B6
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 02:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lInw1-0003OJ-6r
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 02:34:41 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lInvz-0003Dc-HX
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 02:34:40 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 d14-20020a17090ab30eb02900caa8f10060so1330623pjr.4
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 23:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6O51sH4tnKybCPfySNrMtL3pI53Msh+JqAy9S+qdrXE=;
 b=g8chD7ZraWP38I9SNgJXXRBf0rzPhu3ZAlnymn2JAstDCSm2vRXkqjvchnnL8nX+kW
 oUxzL/4q29mfy0Y1izq3OtPF/aRX62YTIp7XBqapsPdmP89d3c9LAO36j3k8b14jkReZ
 i2sVMC8Ot3FxnkU4OOrhbcWZAREqVxGtrW/SRYMZ6YNIr7g22E1w0DPYRzl7wK0WuFB7
 ww6Yzc+7o0aqG4AO2U3NijyqvQhuhbHJi/uah1+DdtAhx/sW1QHkVszXFWQBTu/jjdl4
 CGaH77xf9412mbBGa7gr5pJZRaqVMY6vsq74faxN4v5OnDntzlXW/21ybfFFvjlkd9rv
 qufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6O51sH4tnKybCPfySNrMtL3pI53Msh+JqAy9S+qdrXE=;
 b=jOemccCAhr5x4jLE6r73MuO3vvIgjVPmHiN9tXAxUfFuoSmzSmzux4NlWZcH64lVYP
 rPkG3n5Q76YC9XW8KkuXxc+pYmRrmfUjZ/aO2CBslBPshP3zf3BuhDaDtoYPpSI0D9bn
 bRgYHNonujtnc07++eYheKS/wlcsicXRGRH7czKYokXzQ2WmStvQmCuSGonpJQEAIeys
 tLNC9PySneJJlcSiqTssHw3PSglUSuYEwcJs4FSAWI5CkhGM5JH8JfD0OjZgadl+7fbS
 fIgzbbDiGXk6arpkMq9//2ISQ4r0Xxn8+YabYrcTVyguGMh5gguuyYYyx+VWaGyljkAC
 6ddQ==
X-Gm-Message-State: AOAM530iSaiPq8iGdAcg+TF8Wscq0K+y5k7XDeTCz48ml8XEsg4DrKz+
 ErwFowUforjQ7N5DUhb0/vXs7o+hIwl6AQ==
X-Google-Smtp-Source: ABdhPJyzpc3EB5gN0eITk7eM0g0G2DuZBen76vvjQyJTI8F+CepteZ5xE6s7phUdYtZVapepqdaOgA==
X-Received: by 2002:a17:90a:778a:: with SMTP id
 v10mr18456657pjk.229.1615102477826; 
 Sat, 06 Mar 2021 23:34:37 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id s26sm7222010pfd.5.2021.03.06.23.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Mar 2021 23:34:37 -0800 (PST)
Subject: Re: [PATCH 1/2] target/tricore: Fix imask OPC2_32_RRPW_IMASK for r3+1
 == r2
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
References: <20210305132629.755627-1-kbastian@mail.uni-paderborn.de>
 <20210305132629.755627-2-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb6e7c44-0472-a545-ea9e-b28e446168c9@linaro.org>
Date: Sat, 6 Mar 2021 23:34:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305132629.755627-2-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: david.brenken@efs-auto.de, georg.hofstetter@efs-auto.de,
 andreas.konopik@efs-auto.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 5:26 AM, Bastian Koppelmann wrote:
> @@ -6989,6 +6989,7 @@ static void decode_rrpw_extract_insert(DisasContext *ctx)
>       uint32_t op2;
>       int r1, r2, r3;
>       int32_t pos, width;
> +    TCGv temp;
>   
>       op2 = MASK_OP_RRPW_OP2(ctx->opcode);
>       r1 = MASK_OP_RRPW_S1(ctx->opcode);
> @@ -7021,10 +7022,15 @@ static void decode_rrpw_extract_insert(DisasContext *ctx)
>           break;
>       case OPC2_32_RRPW_IMASK:
>           CHECK_REG_PAIR(r3);
> +        temp = tcg_temp_new();
> +
>           if (pos + width <= 32) {
> -            tcg_gen_movi_tl(cpu_gpr_d[r3+1], ((1u << width) - 1) << pos);
> +            tcg_gen_movi_tl(temp, ((1u << width) - 1) << pos);
>               tcg_gen_shli_tl(cpu_gpr_d[r3], cpu_gpr_d[r2], pos);
> +            tcg_gen_mov_tl(cpu_gpr_d[r3+1], temp);
>           }
> +
> +        tcg_temp_free(temp);

You could restrict the variable to the if block.

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

