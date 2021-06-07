Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B1939E906
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 23:19:57 +0200 (CEST)
Received: from localhost ([::1]:36142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqMf5-00074H-R4
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 17:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqMeK-0006C4-QY
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 17:19:08 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:43616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqMeI-00076K-Ri
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 17:19:08 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 l10-20020a17090a150ab0290162974722f2so876636pja.2
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 14:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JlFsy46jLLFrpGtbMMHWfQ7VG0oLfPsiz0n2d5lKWFI=;
 b=MIePrU9z4EMjf/NoTmsQaT/2fSxdbagm7rXYSLKTV6EHVpYR0iz8zS/ai2WL1UEGOG
 j7z5vj0Jv0fEx6vDJqRc+joJ1vihHXP7G7/gQfi9jD+yR0QGtiV5sG5sHiy2S3hLg4Bn
 Le+gHto6Pajpz8G2cwuRxtp4+KDDeS0x3r2Y8FQWtqqGEC7Qm8gzvFVZ0kh85AhAs0EQ
 X/A6R+DDQIxWoAfQhBoLyzXbXTIiRpheIEWLzkQ/Sr5XN2Ohlda8A0yPIAOA0mLDCdKp
 ULQnZM/imnK91KdNuzJTNc58bHLOZNZzRXHpCGevsZ8qDnOwc1bk0sgIA/tZgGCqMR0b
 YCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JlFsy46jLLFrpGtbMMHWfQ7VG0oLfPsiz0n2d5lKWFI=;
 b=SEvjEZDtNB4saNddS3hzIXLF3PIrUjhTpSp9OB1zHuUkQdzfglce3zR35LFZ/TCQm9
 ZXJc469KkDigyulU+HplbIfaq3t5aTTWJe5NNER9Nq4kA/SK7RPPN4oubCO7ixUtqGS4
 iM7ldbUdA+V6G0OnJqYOkS1ErUYDIv0QAca+FJinslgFmsZArkul+gbGWDdFhjjzlEch
 X2y3uuFfNP3UyX/LIl62X0lbfUWyQU/dQ7KQZ7Ywd380mq4xKiaVU23kZj/xRdXV2594
 VM8V3NO3Y6eQRubewQ+aCWRtRNpFPjWKkmURBzp9EbIB/qP+AJ1fcC2EZ+KralFOfb58
 892w==
X-Gm-Message-State: AOAM530ONhWPeDxTNON73FT/wd9mzdU58XCJxfY+4ijy6V6sRYQ72c5I
 zfpznjuat1qvVLwgxnqXTz9e+M6q55I4ew==
X-Google-Smtp-Source: ABdhPJw+1mhrw3MfxzIcZzDf5orcxl1Tz+biu7oECEcOJE9Uew43ouBOjsH7SJow2kf2Z79Xh8CRrg==
X-Received: by 2002:a17:90b:17c2:: with SMTP id
 me2mr22796738pjb.176.1623100745190; 
 Mon, 07 Jun 2021 14:19:05 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f6sm9037601pfb.28.2021.06.07.14.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 14:19:04 -0700 (PDT)
Subject: Re: [PATCH 03/55] target/arm: Handle VPR semantics in existing code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23ec05cc-55d3-f343-d834-aa40f7685b37@linaro.org>
Date: Mon, 7 Jun 2021 14:19:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> @@ -410,16 +415,19 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
>       env->v7m.fpccr[is_secure] &= ~R_V7M_FPCCR_LSPACT_MASK;
>   
>       if (ts) {
> -        /* Clear s0 to s31 and the FPSCR */
> +        /* Clear s0 to s31 and the FPSCR and VPR */
>           int i;
>   
>           for (i = 0; i < 32; i += 2) {
>               *aa32_vfp_dreg(env, i / 2) = 0;
>           }
>           vfp_set_fpscr(env, 0);
> +        if (cpu_isar_feature(aa32_mve, cpu)) {
> +            env->v7m.vpr = 0;
> +        }

If the vpr does not exist without mve, is it cleaner to simply set vpr 
unconditionally?

Either way it looks good.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

