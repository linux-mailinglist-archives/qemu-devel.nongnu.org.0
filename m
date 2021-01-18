Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B47A2FA84B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 19:07:08 +0100 (CET)
Received: from localhost ([::1]:44422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Yvh-0000sB-Dg
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 13:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1YVy-0004mD-Uu
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:40:30 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1YVu-0007TS-Tr
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:40:29 -0500
Received: by mail-pg1-x532.google.com with SMTP id v19so11315673pgj.12
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 09:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UIoa2Mr8IM1P7i42oI3clOgGWmlXt7pYolrrYLn6uYk=;
 b=nppuRWfgA2cazs48D1bF7BCHw0BE+eD1TjtBt70/gF/7nuvO+cMSMaToVrJxA8o1fR
 aZXcMoI426rQ75hRM8MGfsjOlqDP1eH4qw8AMQWJsHHzh6W34cG4LXOYJe5b8OkpbrqW
 bWiTdMbPGadMQcVeaPAcDzaZP7rJUw6tKnLOCV7l96UbCSrmhA63u0B5GL01Zo7i9x+2
 D++8Lpsn9IeWYv9G0gG7CVgXYwJx5JIBCGdrpJlQl1wnXXqAK2l4LOa+W9mnXgUGCBys
 e7RkkNCvKkGwBCqH4qYRhWQfbFUkLds/K5K/uYvWecN8tOHWgRJZ/+0DXCCDqcDGfLD6
 +lsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UIoa2Mr8IM1P7i42oI3clOgGWmlXt7pYolrrYLn6uYk=;
 b=M7p+3bDDuiUCVkCy6+GnSTssZ99WcUY0seDmw49hqebBY0Qkk6wYJwjpOovICcb92v
 iMwQo2JI68LYN+WHZcgOXpNitpnX7ghnTJL1uiKmjHDbmJQPRj1QS2ltWzKGUc5oT7up
 ZzM01zFJ506/BWYP1UqQ707OsM/8W1ubBCZ6faMiRGbosTci0f8j1UsZXyCGcBz6u+Ew
 L2mGyT3M8YOju86qPneYT44YrcHl5zCo2WLm0Mjk0ADCCs5pum39QwPfMnX0IhKDGSiJ
 c/mDfW09KstWZsBYFvT3WqZ7Iplhb16hH8RO1PzfnNgJLYv1Zlo+nu9dLQOR4PRLFUrS
 9s6w==
X-Gm-Message-State: AOAM530BmMr5Pbqi93B5Mec7xSxcZ+93Xh8ImRX1NvZAYB/o/9wj7o72
 arhJz7wjL9ZrUDIWAZioOfpxvA==
X-Google-Smtp-Source: ABdhPJymz9/Gn7YGPYcpLY90XThNWk7M6hBE9/Ld1auJGlJdtyRh6HYetMn68wXYNF0ICJSrwm04nw==
X-Received: by 2002:a63:6fce:: with SMTP id k197mr691978pgc.423.1610991625296; 
 Mon, 18 Jan 2021 09:40:25 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id a5sm16289298pgl.41.2021.01.18.09.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 09:40:24 -0800 (PST)
Subject: Re: [PATCH] target/mips: fetch code with translator_ld
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210116181328.3890849-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <632baae5-f8a4-72fd-e33b-d1622b13a04f@linaro.org>
Date: Mon, 18 Jan 2021 07:40:21 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210116181328.3890849-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.194,
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
 "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/16/21 8:13 AM, Philippe Mathieu-Daudé wrote:
> +++ b/target/mips/tlb_helper.c
> @@ -21,7 +21,7 @@
>  #include "cpu.h"
>  #include "internal.h"
>  #include "exec/exec-all.h"
> -#include "exec/cpu_ldst.h"
> +#include "exec/translator.h"
>  #include "exec/log.h"
>  #include "hw/mips/cpudevs.h"
>  
> @@ -526,9 +526,9 @@ static bool get_pte(CPUMIPSState *env, uint64_t vaddr, int entry_size,
>          return false;
>      }
>      if (entry_size == 64) {
> -        *pte = cpu_ldq_code(env, vaddr);
> +        *pte = translator_ldq(env, vaddr);
>      } else {
> -        *pte = cpu_ldl_code(env, vaddr);
> +        *pte = translator_ldl(env, vaddr);
>      }
>      return true;
>  }

NACK.  This is not within the translator.


r~

