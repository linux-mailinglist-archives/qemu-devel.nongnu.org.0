Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D833A6DB8CF
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 06:25:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pl07J-00077W-Si; Sat, 08 Apr 2023 00:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl07H-00076B-2O
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 00:23:55 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl07E-0005qB-3r
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 00:23:54 -0400
Received: by mail-pl1-x634.google.com with SMTP id w11so468873plp.13
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 21:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680927830;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hiiQLOUpmXBWuKOn/UUWqBuRStVCeUARBOIRt8dw52c=;
 b=lkvzkcFYRPQ0/XRKi7u4dhC39xUYN7uK5T2yDMgb5v34yfuCuc82zpr62tb5Z+70Di
 4mQt4nvdDU4SXxu1Svl13qFdJ+FbMyvaOUwEWe0+QLyMy9jVY1upxIetr/DlUwJ02Fuo
 R4Q3DYpD7+CfNZoup1nyytlKQAPrD9g+WCNXUyd5F/z0rD9afMC9cRBlEewVFan4437N
 AS0YcMly8nschlUTyOtDZCejRtg1S5YnhS53wL8t3am51bp3Ekfdh6O5KUQ3ZhwTr8AM
 jvCmb1oMSWg/bGT+zWJx/uJrsJ44J6SQ4cauEDI4e3t3tZLxIU2zY5+aGAVjeJ3JyHWw
 WzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680927830;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hiiQLOUpmXBWuKOn/UUWqBuRStVCeUARBOIRt8dw52c=;
 b=G34fMZKdm5UOVtvonfBNBEqUipp9pMUS6mpYReZsa4ZclbyyI4pi9SnBrHmVO4JESs
 4F1CaZK87iT5z0Vwj+BNB3AHotAI7vz+RZwKPIGZf89P+KPCtLJLLs4pNa5RRXhUCaLx
 tDBEduNsg2H/MLCZGHFcmFNEVSx51XT/EKEgw/IYbT5kJ2ahlQ/IAMqsBHxRgRGAcgAH
 gfDmSY3A1RRaB4BlG4N0mF7EbAlkysOurkMy7GZzEo3H7/QveF2lGfwO6DGE/P810+lA
 bhzZM7SSL8ZVqslvNXaEBiJzGAFrlB3e9sFiaCkAZkxB7qAfrb6o7BSh+hJNb1W0nZX+
 QH0w==
X-Gm-Message-State: AAQBX9f2cu+RM5FzNBr/nzoHRf3/Kyo0NMOC5SB00yHOG9+yIgExm/ua
 +bQ/HA+3yrZHCcHwSMZXEsaml4P+tyE56NmP098=
X-Google-Smtp-Source: AKy350bxSubZkDnaLAgaaFFf8QyqWAXH0GhCoxrxaORXlZzZG86iODTY6N0YjkS8zhiOSfi65CBBYg==
X-Received: by 2002:a17:903:2115:b0:1a1:b11d:6af5 with SMTP id
 o21-20020a170903211500b001a1b11d6af5mr611598ple.52.1680927830461; 
 Fri, 07 Apr 2023 21:23:50 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a17090aa50d00b0023d16f05dd8sm2292970pjq.36.2023.04.07.21.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 21:23:50 -0700 (PDT)
Message-ID: <e6e1a695-1dde-4109-e0f7-cd1c9ff73af5@linaro.org>
Date: Fri, 7 Apr 2023 21:23:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/10] hw/intc/arm_gic: Rename 'first_cpu' argument
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> "hw/core/cpu.h" defines 'first_cpu' as QTAILQ_FIRST_RCU(&cpus).
> 
> arm_gic_common_reset_irq_state() calls its second argument
> 'first_cpu', producing a build failure when "hw/core/cpu.h"
> is included:
> 
>    hw/intc/arm_gic_common.c:238:68: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
>      static inline void arm_gic_common_reset_irq_state(GICState *s, int first_cpu,
>                                                                         ^
>    include/hw/core/cpu.h:451:26: note: expanded from macro 'first_cpu'
>      #define first_cpu        QTAILQ_FIRST_RCU(&cpus)
>                               ^
> 
> KISS, rename the function argument.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/intc/arm_gic_common.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Wow, that's ugly.  But a reasonable work-around.


r~

