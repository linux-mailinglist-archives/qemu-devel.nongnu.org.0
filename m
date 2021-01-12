Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80482F3BD9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:33:43 +0100 (CET)
Received: from localhost ([::1]:39684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzRIN-0005Wx-0X
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzRFX-000483-RK
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:30:48 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzRFV-0001A2-B0
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:30:47 -0500
Received: by mail-pg1-x529.google.com with SMTP id i7so23959pgc.8
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D+IJXKt51oO51JsVzIZi+vzH4wq53fO63tV2KNuJKXI=;
 b=DhmvKZgtbyWO5yihuEuAIBg2qcfcZgsDikQG9BR51azGyKpwQMRwH3K0Tx0XJ9TCw7
 bTgJ5cW+698ohsSBV7aXrC5yOJkab2qrI0SW/8l8KayH5c9s6b+YbAygJy7ZntPetUYX
 eMb82/zyHcdN4/mbA60/L34Wp5PqdnQhIfItkODAuEqzsiRMFwtuNakNoN6w4th/Dpxy
 oDyGmfKrHBMFwd8SUFD5Y8dJq9eEb92D8x7cHJ+AEqS0KgZdgq1PkjCR5sA9xPCpa8BH
 wSsibTvP0+dOLOb8+BdPRggBD/G3EeNvNjpc+JS2pAiXW9y/vQQAw1zZRhDddX/3G8mT
 S4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D+IJXKt51oO51JsVzIZi+vzH4wq53fO63tV2KNuJKXI=;
 b=d7Gkq7mt/gZ1q1xxAtAA9pWcD8APubQBoZ44KI64JNVm2zKHq1PrVpE/4Pe0lrtYDX
 c1msoZIXRxD/p1r/HW4gA2ztTno+M2pieRgCJbT+G3HS7QUmm/TN4xOvbzlyZ2UC/UB0
 vbK5Jgigjiu+Dnn4yLY46eyJqzn2CfzeDCDSRdikt5KUElFDGYJNPhHLtVPDyNcP41jA
 2PM04g/xWlU4CjSHSssiN45WkBTDdqIOaYIvLYZ+jH8ld80CbUIEdtrO47WWohukZ38Q
 uUeHKV/P/OMF8wvbHMH+ddXOtIJeFDjUftojojDRBR7310UF8Jmi1xIjUUzyetgETEnW
 DQXA==
X-Gm-Message-State: AOAM533ETus4UdPJj+coKdgwFe8omY1P+Pzo6X3S8bvMNRkqLy7NQzB7
 qjj3+VphOUTVcOpVLaHV4xM9ROu6gkTEww==
X-Google-Smtp-Source: ABdhPJzcwVDT6HSHXoQWruGT82SQM02FZdERDMocIpPeBV0i5K4HRcwwKED28OXP5fuPfj3JSNRE8Q==
X-Received: by 2002:a63:6806:: with SMTP id d6mr988527pgc.205.1610487043278;
 Tue, 12 Jan 2021 13:30:43 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id c184sm49022pfb.11.2021.01.12.13.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:30:42 -0800 (PST)
Subject: Re: [PATCH 17/19] target/arm: add ARMv8.4-SEL2 extension
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <12681824.uLZWGnKmhe@basile.remlab.net>
 <20210112104511.36576-17-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ffaca60-2fa0-ac7d-b430-0bbaee18b25a@linaro.org>
Date: Tue, 12 Jan 2021 11:30:39 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112104511.36576-17-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 12:45 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> This adds handling for the SCR_EL3.EEL2 bit.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

The patch title seems to have gone awry.

> @@ -2832,9 +2832,19 @@ static bool msr_banked_access_decode
>          }
>          if (s->current_el == 1) {
>              /* If we're in Secure EL1 (which implies that EL3 is AArch64)
> -             * then accesses to Mon registers trap to EL3
> +             * then accesses to Mon registers trap to Secure EL2, if it exists,
> +             * otherwise EL3.
>               */
> -            TCGv_i32 tcg_el = tcg_const_i32(3);
> +            TCGv_i32 tcg_el;
> +
> +            if (dc_isar_feature(aa64_sel2, s)) {
> +                /* Target EL is EL<3 minus SCR_EL3.EEL2> */
> +                tcg_el = load_cpu_field(cp15.scr_el3);
> +                tcg_gen_sextract_i32(tcg_el, tcg_el, ctz32(SCR_EEL2), 1);
> +                tcg_gen_addi_i32(tcg_el, tcg_el, 3);
> +            } else {
> +                tcg_el = tcg_const_i32(3);
> +            }

You can't test an aa64 feature without verifying that the cpu has aa64 support
(if the cpu is strictly aa32, the aa64 registers are undefined/uninitialized).  So:

    if (arm_dc_feature(s, ARM_FEATURE_AARCH64) &&
        dc_isar_feature(aa64_sel2, s)) {
        ...

With those things changed,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


