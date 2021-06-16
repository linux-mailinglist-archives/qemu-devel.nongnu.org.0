Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4063AA21E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 19:08:51 +0200 (CEST)
Received: from localhost ([::1]:39458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltZ22-0007e3-PO
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 13:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYvS-0005Qd-O2; Wed, 16 Jun 2021 13:02:02 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYvR-00036W-1w; Wed, 16 Jun 2021 13:02:02 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso4593529wmg.2; 
 Wed, 16 Jun 2021 10:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u6isqT2Dobu/7XI6GqxrxTNokbfefqoMCgYEMP8ZCoc=;
 b=Gg8HneHxDPCb5v1YDIKgXkgPaO7w+nD0l24fs3INSP2wqYAMb5DdAESH5Rbp0Nz1en
 Ftnf8bShTSBZst1Rv0NrDMSH58/SwigMKGlClzg4hS9C1d+3GvdIbM0sFPVDAee4hGgm
 sp8UASohm07I0p3ophKeScVMfNQvJoR0IA431g8+8SNzF1S1bkixSBsrHibIP0Fwvsje
 +oKjPzbfyLccRoHYsTQZeeD4AcMZ0mdJKeanZtTSo9wVJ/u+KGpvbjCnuUAmEKzZeiuq
 8EHeaDYh2gheWhGFqtIvXbNa49N9A/IIS97TZyl9wnXbHfvR5bhGWiHCA70T2Uk/TvCN
 bdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u6isqT2Dobu/7XI6GqxrxTNokbfefqoMCgYEMP8ZCoc=;
 b=AQzZjXIbi8vtdRsDghEW9cA16F8z1iHCn3mmyKISsk/V6FNdmMpPq/yEztIHG/BTHA
 JsfLm5GSbGKfWecB3odEHjBlBZVzffSIOh6mW+HV/wS4OLt2W1rc4gpNF61qu0lKrddK
 lK8CldU2tokk+xt/ZcSMeoViNRClrodgeSNXacSL5v20mrlDvvZg1KsumbuT1uUNcnOl
 PzP0AXmWvU6Ex5ketkiwcmqi6e9QI0+qs3n4Clv/J+pTyqSVpjWNUWA1LiyZBnFLe/N1
 srlAhTS7+SYC0Wm0OI/zUoPdF+0VhdnfNjil+dSfNP6Jg51HIZQzc2Pr3ZqKJsz1h3zh
 KQkA==
X-Gm-Message-State: AOAM532hQHPi6RuWd1b+bZsIei6wXuxR4ZZCs6qDhJblMHmJBSXbdrZu
 D81RXYbk+Glgo/V5wWE86Dw=
X-Google-Smtp-Source: ABdhPJyNPX6/+Reuc3VMspkk+bbT5siyF+YW9Rbwj11w+a/CwlIw2Dc3o1PViwTlkRc/ewLPsELgPg==
X-Received: by 2002:a05:600c:214c:: with SMTP id
 v12mr11444wml.33.1623862919157; 
 Wed, 16 Jun 2021 10:01:59 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o18sm5387543wmh.38.2021.06.16.10.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 10:01:58 -0700 (PDT)
Subject: Re: [PATCH 03/21] linux-user/arm: Force v2 frames for fdpic
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <29966029-dd11-2d61-4fe7-f7fc73ef26c7@amsat.org>
Date: Wed, 16 Jun 2021 19:01:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616011209.1446045-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 6/16/21 3:11 AM, Richard Henderson wrote:
> The value of get_os_release may be controlled by a command
> line option.  Since fdpic was added in v4.14, and v2 frame
> were added in v2.6.12, this makes no change under normal conditions.
> 
> Split out a helper function to perform the test.
> 
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/signal.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
> index 32b68ee302..2d30345fc2 100644
> --- a/linux-user/arm/signal.c
> +++ b/linux-user/arm/signal.c
> @@ -165,6 +165,18 @@ static inline int valid_user_regs(CPUARMState *regs)
>      return 1;
>  }
>  
> +static bool v2_frame(void)
> +{
> +    /*
> +     * We do not create fdpic trampolines for v1 frames.
> +     * Thus we force v2 frames, regardless of what uname says.
> +     * Support for fdpic dates from Linux 4.14, so this is not
> +     * really a behaviour change.
> +     */
> +    int is_fdpic = info_is_fdpic(((TaskState *)thread_cpu->opaque)->info);
> +    return is_fdpic || get_osversion() >= 0x020612;
> +}

Could you refactor v2_frame() in a previous patch and add the
is_fdpic check in another one please?

