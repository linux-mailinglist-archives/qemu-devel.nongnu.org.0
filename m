Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747276DB8CD
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 06:25:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pl07Z-0007AS-B9; Sat, 08 Apr 2023 00:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl07X-00079T-5e
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 00:24:11 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl07U-0005tF-WB
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 00:24:10 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 bp17-20020a17090b0c1100b0023f187954acso300905pjb.2
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 21:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680927847;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SUf3WfCxOVdR+3bfJfHcevGewv4Q85VTTJ9AWC0Fz3A=;
 b=M6ule4MSP61kRkiYLQckGXwG36BBy88n1C4e4q/MbZ4jPqsZVxpVsrW+/hlEu7cN4G
 FKgL1hm9EUnD+E3l6NWRfNX/pk0kMMRdrk7sKYqtgBw+WvVLXQ43L+1XGc/goQjDKAvm
 RMJm0fFNsmJ7KSHZ8BKfwumaTdqFvuKSJbBM1/pAhegO7TuebsgCRh6TXBAVcKeDnJPn
 2i/5MYzTFKIJnJyF+ZJeuQeOLzPiskkObGSLAXorpBG6Vs/bsZw25NSL+3d2TtaVb0IV
 u8q5yj/zReQ5zpMmXo6izob23ZS5U5FQV5R6UGXk9rJSP/7Bf9Kh2saPavjcW7g4AKXm
 +Jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680927847;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SUf3WfCxOVdR+3bfJfHcevGewv4Q85VTTJ9AWC0Fz3A=;
 b=EUrEa+QXvZq7JbUwuYIbhkbCZokfHXbIgNHxFxwit9t1Dt/5k8HK92U9ImgTnSFIYl
 cb8uxP5IesSZspmwXMqNhzF5VVf++6X9Z1jT0yu7ZrL4ge3q3Z2lRloPno3t9jXcx9pQ
 keD0mPXa2h2dpJ12gZkM64s/kslUtk9oHRwRRCbQLf6nUkbhwUaRgSfahi6sjJfZALVM
 AUFxL8zgYd1ChhVl/2qbEZVRfktgPwnKl/MKDbsrpVpCEXGd+Mf5nASgFcT/gwgZFIkS
 D67E0O15lZiZsFwETgYUWDd/Py1ytTCbQdMwwxjk6OEwZVwYcBM97T1EaMwXzaGsW4EM
 lZ1A==
X-Gm-Message-State: AAQBX9fRtB+cW3JiAHbCGjCFVeWxpoiHDYhluklBqOQYGfChcSDe0zs2
 kY1692/kJRI3nO40S3Ahw4uBgQ==
X-Google-Smtp-Source: AKy350aTojRcwvS7asuLQjO5JCzvuwE9tyORjUy8gTe5GSqRwTu1Ft3j89YC+lFknwdCZLTFDWHdww==
X-Received: by 2002:a17:90b:33c4:b0:237:161d:f5ac with SMTP id
 lk4-20020a17090b33c400b00237161df5acmr4835643pjb.36.1680927847525; 
 Fri, 07 Apr 2023 21:24:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a17090270cb00b0019a997bca5csm3621258plt.121.2023.04.07.21.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 21:24:07 -0700 (PDT)
Message-ID: <28b356e3-fae0-c3b2-e40f-d32bb75f46bb@linaro.org>
Date: Fri, 7 Apr 2023 21:24:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/10] hw/intc/arm_gic: Rename 'first_cpu' argument
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-5-philmd@linaro.org>
 <e6e1a695-1dde-4109-e0f7-cd1c9ff73af5@linaro.org>
In-Reply-To: <e6e1a695-1dde-4109-e0f7-cd1c9ff73af5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/7/23 21:23, Richard Henderson wrote:
> On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
>> "hw/core/cpu.h" defines 'first_cpu' as QTAILQ_FIRST_RCU(&cpus).
>>
>> arm_gic_common_reset_irq_state() calls its second argument
>> 'first_cpu', producing a build failure when "hw/core/cpu.h"
>> is included:
>>
>>    hw/intc/arm_gic_common.c:238:68: warning: omitting the parameter name in a function 
>> definition is a C2x extension [-Wc2x-extensions]
>>      static inline void arm_gic_common_reset_irq_state(GICState *s, int first_cpu,
>>                                                                         ^
>>    include/hw/core/cpu.h:451:26: note: expanded from macro 'first_cpu'
>>      #define first_cpu        QTAILQ_FIRST_RCU(&cpus)
>>                               ^
>>
>> KISS, rename the function argument.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
>>   hw/intc/arm_gic_common.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> Wow, that's ugly.  But a reasonable work-around.

Duh.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


