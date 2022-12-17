Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FB264FB5C
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 18:41:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6bAh-0006Dw-7b; Sat, 17 Dec 2022 12:40:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6bAe-0006DP-FJ
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:40:24 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6bAc-0004eZ-Vu
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:40:24 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d15so5266840pls.6
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 09:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NKhvx9ZP6HfRVIK6rKtBvpPTQoup6pHdSzdZQ71LyXA=;
 b=aA6dD4GKyb0CmaDU6YFQLAxJYHs5ENaIUxp423QVEgrN/uv6Q0YP6aNPNsxs3lzGiW
 71DVjoISIpacyJjRZsYCyxMEZFwd3XABSqR4IfEyJtoK31LNW7dTKnRYYrtC1r4TU3ew
 YpRm0IhkHHCqbseNdmsxZNih53s8co6wmgb++lBkQdvcQXsMy4vpYss2io5DMikXTe9W
 hyyDpw4J5u8sns/TgwFvkqqbqTU1LOa7UCD3E+hl3inGF/E0r+7yTkUtTOKm3SFvsnK7
 zIY1DqHPTaoR1Q1xk+awKLQF8G1tmEPWZP+jEBqd05nqHkopLPBiBCfoS9mfxxjZuHNa
 f8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NKhvx9ZP6HfRVIK6rKtBvpPTQoup6pHdSzdZQ71LyXA=;
 b=vzJfRcIw8wtLINnKACNwZifEYiri0ful9AWepSM6q7FLdC636Woj0axiuOUHDl0gEO
 yzPQPVdb6eENZgoYu3gN85dgecQgnJJUWVY0EUFVQb8DWG6S2TX1TR1DaklBXBuUIRGw
 NMwB1asivocQU34M2XMSXRpDGIIjjES9BcQGDbZ5riCSmepVqNs9OMzjVuNL3qJi//g0
 CofsI0F/KMIxErf69y2uWDHfBdtgDxnEEqeCmOjU5kNHy4COctnwXdnYNYkVUyMzwR3/
 DQyUKrTloH2k72dEh0p6tpdGOTaRGwNmCMN8dOC2RISgwo/xDfPkJFsqOT5XzHypn/sY
 KFhA==
X-Gm-Message-State: ANoB5pmrMrnRF7DAQUnk1PISvlD3dxxCkbghCyTsDKpXbsPWTEynyK6c
 f0P7eK0cluBGsWIERmsz0KSJVg==
X-Google-Smtp-Source: AA0mqf6ZHLXvItT/mp9GQ46PXdp+RRft1k3LgDcA61BqptIJ8Lm1KK8A991K5/EwOKcG2YCvIdijYQ==
X-Received: by 2002:a17:902:e80c:b0:18a:4493:5db6 with SMTP id
 u12-20020a170902e80c00b0018a44935db6mr54976500plg.41.1671298821513; 
 Sat, 17 Dec 2022 09:40:21 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:dbe7:d50a:f977:e69b?
 ([2602:47:d48c:8101:dbe7:d50a:f977:e69b])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a170902684f00b00189ed861791sm3802706pln.266.2022.12.17.09.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 09:40:21 -0800 (PST)
Message-ID: <db7db8ff-4521-734c-f04a-4b57a60756d5@linaro.org>
Date: Sat, 17 Dec 2022 09:40:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/5] target/s390x/tcg/excp_helper: Restrict system
 headers to sysemu
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221217152454.96388-1-philmd@linaro.org>
 <20221217152454.96388-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221217152454.96388-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/17/22 07:24, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/s390x/tcg/excp_helper.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
> 
> diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
> index fe02d82201..bc767f0443 100644
> --- a/target/s390x/tcg/excp_helper.c
> +++ b/target/s390x/tcg/excp_helper.c
> @@ -21,15 +21,15 @@
>   #include "qemu/osdep.h"
>   #include "qemu/log.h"
>   #include "cpu.h"
> -#include "s390x-internal.h"
>   #include "exec/helper-proto.h"
> -#include "qemu/timer.h"
>   #include "exec/exec-all.h"
>   #include "exec/cpu_ldst.h"
> -#include "hw/s390x/ioinst.h"
> -#include "exec/address-spaces.h"
> +#include "s390x-internal.h"
>   #include "tcg_s390x.h"
>   #ifndef CONFIG_USER_ONLY
> +#include "qemu/timer.h"
> +#include "exec/address-spaces.h"
> +#include "hw/s390x/ioinst.h"
>   #include "hw/s390x/s390_flic.h"
>   #include "hw/boards.h"
>   #endif


