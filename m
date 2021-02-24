Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0CD323573
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 02:49:58 +0100 (CET)
Received: from localhost ([::1]:33464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEjJN-0006Dy-Aw
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 20:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEjIQ-0005kO-U0
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:48:58 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:33825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEjIP-00044C-9y
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:48:58 -0500
Received: by mail-pg1-x52d.google.com with SMTP id l2so433889pgb.1
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 17:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G3qpc/P9ylHBilkfHy8W/CpP9bi9vx0msUZY6RqHXl8=;
 b=IbuA6fO0Puy9PuCp7mZWVrt8mM0MNoSfHWYkok2CW6iHvwtwOnSdV+4BDD87M1JX1K
 JY20PERcDbz8Sx+vrQNMYRUHxYVBfJjilAxRR71OoFJMb5AySK/2FPpcHRBReDVAyFEK
 90zOEoXy/Ag9JdBlEhkpCV/rDb9JmhPlxC1+NfUWVSshZw0sAb7KArXMF2rwbzoHttC/
 di1p2Yx1Snw+ycGWFPCI0eZpBGrvtE67/P6qPRW2hzhmzrCaOgI0qR0RTS4Sg6C3i2U0
 yC7H62V1uSfE7LOlnunQLO67slMNfsIrpn/CfiPBv5F7Gy7nQP4RIKcgT9dx8rF/7aXm
 2SMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G3qpc/P9ylHBilkfHy8W/CpP9bi9vx0msUZY6RqHXl8=;
 b=Cc1lhqyNSib4Z31ZM3th1wFB15e5/U1PX+/ITJYvDOyrZhFjQXrMAUjYMoaPbjfSfM
 VOT5et/Yni9JxIZ8LR+U3lP+3ZDxYGB6PRra46oz+hRlNO1cE7KuZdSSxeGiG1+IMxgJ
 B8DAfSn8OwlxyI/ImtrLUGVntogyd16h8g1M3b6WzP9elr4Ub4xO/PPD12RDakRTap/T
 D8CHSs/Dzicz4HF4CeIx7Bmy7RPQ3+xHrfYdnxNuw+dT6UzszelhKNy+da2RF/qR14eJ
 WvxdZea9/mt3c3am3zuzbU84j79seKZmzi9muCZPC9Y9tFAVMAUOBrZK+Js3vvv6y0GU
 +a+w==
X-Gm-Message-State: AOAM5301ZzjPKPUPKKP5+Sxk4seI443uKmBgEWMmV+LqynVn7+pvPw7P
 86TBOaK5FdchYtv0Gm2GHSkG2Q==
X-Google-Smtp-Source: ABdhPJztWdexdkNs3K8PT8CM6ZaOS5or4ujoOrlTGT5hcPAYO2SMKl4w2HVlj4iRQ35y5QGdpVskOg==
X-Received: by 2002:a63:f808:: with SMTP id n8mr3859520pgh.115.1614131335572; 
 Tue, 23 Feb 2021 17:48:55 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id q3sm467318pfn.14.2021.02.23.17.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 17:48:55 -0800 (PST)
Subject: Re: [PATCH v3 09/10] target/mips: Simplify 64-bit ifdef'ry of MXU code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210222223901.2792336-1-f4bug@amsat.org>
 <20210222223901.2792336-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <35741b4d-a2e2-6088-06ae-558675486433@linaro.org>
Date: Tue, 23 Feb 2021 17:48:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222223901.2792336-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 2:39 PM, Philippe Mathieu-Daudé wrote:
> +#else /* !defined(TARGET_MIPS64) */
> +
> +bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
> +{
> +    return false;

Also seems suspect, but harmless.

> -#if !defined(TARGET_MIPS64)
> -        if (ctx->insn_flags & ASE_MXU) {
> +        if ((TARGET_LONG_BITS == 32) && (ctx->insn_flags & ASE_MXU)) {
>              decode_opc_mxu(ctx, ctx->opcode);

(1) Unnecessary () around ==.

(2) The call to decode_opc_mxu should be eliminated by the compiler because of
the constant false test.  You can (a) retain the function above and omit the
new test, (b) add the new test and leave the function undefined, a diagnostic
link error, or you can re-declare the function with QEMU_ERROR.


> @@ -28081,9 +28085,7 @@ void mips_tcg_init(void)
>      cpu_llval = tcg_global_mem_new(cpu_env, offsetof(CPUMIPSState, llval),
>                                     "llval");
>  
> -#if !defined(TARGET_MIPS64)
>      mxu_translate_init();
> -#endif /* !TARGET_MIPS64 */

This one won't be eliminated, and is an abort for MIPS64 per patch 8, so all
mips64 now aborts on startup.


r~

