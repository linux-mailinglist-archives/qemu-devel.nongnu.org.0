Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 496686F06A5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:33:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1jE-0005W7-Ia; Thu, 27 Apr 2023 09:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ps1iz-0005MU-0k
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:32:03 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ps1it-0005T5-4e
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:31:50 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-94f0dd117dcso1266886166b.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682602304; x=1685194304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zYwyYLh2Tw+XJDySpIrVL0yR5p6SiE7BPIN+ovNlKLM=;
 b=lanfdFX36MiJ7Avo5O93Kx56KCGHciZtUrKNMg3Du4ku5M0cW0qgFMP6RCxwqhGeD3
 66HKgHCZzcO1Ae2uxp4EW33kfFXsC5892obaYuBvOH+w0CldwC1QLUFSkH+uz0vcJl3N
 X+HUnWpncTou8EDqid/C+EdZ2L8E0QZEeOE6Www4mG965Fru6Q5yOpLELBLvf+hRAkJL
 My1DMTeYJIl05zaqbCntTs9ccmsNxI+LDVF8rNBOBnwCVNYGprfnOV/VvLtBj3XzayqE
 6mp8LNghWWleMcjOH3+O7LBjhlfcpPMNlORKZK4eCZl0JpsCAc/LHvBW3VtDzdgArQRo
 Q2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682602304; x=1685194304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zYwyYLh2Tw+XJDySpIrVL0yR5p6SiE7BPIN+ovNlKLM=;
 b=lU82rtpTU3iyBLUm1UeGbMSpXz8dOsaXIbenTBj+u1m1Q6zy/vkjFJv9gNvZyuZOlU
 jyqoQpIZgGRQl/VjE+nfbqdPJCDDHX3s5yPKTCuCs6qZYOIyVcmoJ3rK5R4HH1yyNL/k
 nei+2W54exhc1YKsariSrke7e0Ce2aoFCvUNU/GXEYAK3mM7mLaQr/DSBw3LDPOBxm/C
 ZlPAknwsNo40sj3tYQ5I4704e8i6CJOOAk2JWHDMkfsJfTVyLlYnTodXHLTZU7Amv6+K
 ZHKIJ/hZWRSJhKZuImkgZVn0mAZP2SrsNLGkZZQgou93KKp9vxO+Rs0idP3GXPar4Tvk
 WwfA==
X-Gm-Message-State: AC+VfDyun187od+YXY3MmoDgzrZVHa5Z1pGWbcP4Yw4BgQoQGybNHkJ/
 /cLri5JhBfQnz2g4kW+czt5b4w==
X-Google-Smtp-Source: ACHHUZ6SF3bfzyWF0CJ4OaOSu99qnRFd3eh5L9n1ftcbxK/+lkyw0CXAbh9CGC71JYuZUARprTJCjA==
X-Received: by 2002:a17:907:2d25:b0:94f:7844:b0ca with SMTP id
 gs37-20020a1709072d2500b0094f7844b0camr2263531ejc.52.1682602304415; 
 Thu, 27 Apr 2023 06:31:44 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a170906bc4c00b00947ed087a2csm9684143ejv.154.2023.04.27.06.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 06:31:44 -0700 (PDT)
Message-ID: <e14ec7da-ac1f-7b48-276a-53acfc0b4091@linaro.org>
Date: Thu, 27 Apr 2023 14:31:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 RESEND 7/7] Hexagon (linux-user/hexagon): handle
 breakpoints
Content-Language: en-US
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, bcain@quicinc.com, f4bug@amsat.org,
 peter.maydell@linaro.org, tsimpson@quicinc.com,
 Laurent Vivier <laurent@vivier.eu>
References: <cover.1681993775.git.quic_mathbern@quicinc.com>
 <26f1f1cc2c23fe4669326cabe5615188be9afc06.1681993775.git.quic_mathbern@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <26f1f1cc2c23fe4669326cabe5615188be9afc06.1681993775.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x632.google.com
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

On 4/20/23 13:31, Matheus Tavares Bernardino wrote:
> From: Taylor Simpson <tsimpson@quicinc.com>
> 
> This enables LLDB to work with hexagon linux-user mode through the GDB
> remote protocol.
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   linux-user/hexagon/cpu_loop.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
> index b84e25bf71..00c12bbb55 100644
> --- a/linux-user/hexagon/cpu_loop.c
> +++ b/linux-user/hexagon/cpu_loop.c
> @@ -33,6 +33,7 @@ void cpu_loop(CPUHexagonState *env)
>       target_ulong ret;
>   
>       for (;;) {
> +        target_siginfo_t info;
>           cpu_exec_start(cs);
>           trapnr = cpu_exec(cs);
>           cpu_exec_end(cs);
> @@ -63,6 +64,15 @@ void cpu_loop(CPUHexagonState *env)
>           case EXCP_ATOMIC:
>               cpu_exec_step_atomic(cs);
>               break;
> +        case EXCP_DEBUG:
> +            info = (target_siginfo_t) {
> +                .si_signo = TARGET_SIGTRAP,
> +                .si_errno = 0,
> +                .si_code = TARGET_TRAP_BRKPT,
> +                ._sifields._sigfault._addr = 0
> +            };
> +            queue_signal(env, info.si_signo, QEMU_SI_KILL, &info);

Use force_sig_fault.


r~

