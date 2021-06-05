Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C015039CB47
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 23:39:00 +0200 (CEST)
Received: from localhost ([::1]:44160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpe0R-0007up-FD
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 17:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpdzT-00072z-13
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 17:37:59 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpdzR-0007uR-LY
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 17:37:58 -0400
Received: by mail-pl1-x62f.google.com with SMTP id x10so6505586plg.3
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 14:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sNN2OkMhqKUqiMmhybJw47GbbvMAVw+88Q2gc/Kf5Ko=;
 b=M9F68V2buCDF5bO9vjdGYbXYFrqShD5nCD+0tpnk8Bb3YWuuTiGhQ4Kx/xSiDINp10
 2tXWC/wMXTIgY43W8HnmP7MMUAO9/yj6Pp1VLBEBaEi5gOWAwULpivO9g90SL2nCQtzW
 KRwabM23+ZF0K+dhcODMuuJF1Uu27Rl9gC1Dniyw20KJIYcDZtBwJG/fiwQ9BeBRhYiV
 n7Nl2HbkQhs+s4Ces6O6zdkXyJGKi0874sXtsMc0dU1D41Z5w0qcxCg2SxXQ8UaICldb
 f+VN6tzQYYMWCVaCz0Wk9xPBFYgK0DdiPrgdQua8GT5XS0yV8FPGY9+9/PncYWm/O+wJ
 SorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sNN2OkMhqKUqiMmhybJw47GbbvMAVw+88Q2gc/Kf5Ko=;
 b=cUOJUt//fMzOo9NHTB4GF2GU47fSko5I7/+gIijh1gSLvWKxz58zu4BjzERbrtYsv8
 1sSpp0ZYCmfu7A9u0LnnCNbwEuzCsY+LevjsBNRwXe/R+OjqVhyADgr6DdKA84pPYcya
 vtuA24t7jhGLuU8P7uj8UUPRrIeOt7aNp5kgBzA6YxTTmyNIPD34NdCyyowVAAh3j0qj
 meWkw+ot3aptlhv2MrudXbQ+jOSaw/Vqkd2gkReKsuJGRUfmeBkxBq+jxtSyH7fbWe17
 LhTThKK8KhtCHSjt/8ItuItoKKANheoj0Gs44CnvdRck3NjCbC3Pv4wwOatvaGAkmgyF
 I+tw==
X-Gm-Message-State: AOAM530bHovf2aggRauvVx/WK6ggI7dX07wBRH+p0eAq5JODm3bs23+j
 ckRqb8pSmDr67eaariIxlbR4yA==
X-Google-Smtp-Source: ABdhPJzbj6kAFRP9SeAlMKMiZ8sS9kMPrfPJebriVoB15e9B2JSv+Iv6C7fQVckBy9ash7mD9H+5iA==
X-Received: by 2002:a17:90a:f0d5:: with SMTP id
 fa21mr12445921pjb.4.1622929075558; 
 Sat, 05 Jun 2021 14:37:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v11sm4725951pfm.143.2021.06.05.14.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 14:37:55 -0700 (PDT)
Subject: Re: [PATCH v16 82/99] target/arm: move sve_zcr_len_for_el to
 TARGET_AARCH64-only cpu-sve
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-83-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4cae0f86-d7a8-7c0e-c2a6-442b49f25dfc@linaro.org>
Date: Sat, 5 Jun 2021 14:37:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-83-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 3edf8bb4ec..e9bfb6f575 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -223,7 +223,8 @@ typedef struct ARMPACKey {
>   } ARMPACKey;
>   #else
>   static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
> -#endif
> +
> +#endif /* TARGET_AARCH64 */
>   
>   /* See the commentary above the TBFLAG field definitions.  */
>   typedef struct CPUARMTBFlags {

Unrelated change.

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b297d0e6aa..0e41854b92 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -23,7 +23,11 @@
>   #include "target/arm/idau.h"
>   #include "qapi/error.h"
>   #include "cpu.h"
> +
> +#ifdef TARGET_AARCH64
>   #include "cpu-sve.h"
> +#endif /* TARGET_AARCH64 */
> +

Unrelated change and unnecessary.

> diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
> index edc4b4cb4e..984dae7643 100644
> --- a/target/arm/tcg/helper.c
> +++ b/target/arm/tcg/helper.c
> @@ -18,6 +18,10 @@
>   #include "cpregs.h"
>   #include "tcg-cpu.h"
>   
> +#ifdef TARGET_AARCH64
> +#include "cpu-sve.h"
> +#endif /* TARGET_AARCH64 */

Are the ifdefs really necessary?

r~


