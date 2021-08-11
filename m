Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E91D3E8771
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 02:51:50 +0200 (CEST)
Received: from localhost ([::1]:40390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDcTF-0005Tv-5k
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 20:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDcSM-0004cN-EG
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 20:50:54 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDcSK-0005JH-9i
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 20:50:53 -0400
Received: by mail-pl1-x634.google.com with SMTP id k2so384268plk.13
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 17:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E9ZmMC5KcCuMcg46RmzRYoZclmpodwk5J7LVFibG6B0=;
 b=ZRnlrptI57tHqUVLd7fUuJ4zrE4YcBkfNM1pmVQNf5PEr9vnaKRI8zqxkbTbZ3M0oc
 qcm3rRzoUXfaUDgp4xtHI2I1iiqiRl1ZLxVHZLOa08LI477PqDJS8fWt5Jqt0eYJ2fMI
 4R+ZAq8GEy0JsZek/ta4bfys7oAnFrrZLXtO2tzQNkkDoer1vBXg08Tf1vy6X71iulFV
 HvRjxVbqlQYyyqHIwhqHl1CrPiRqwvD+CEcTvReGQT93fIwy7kOcH9GKw0xBBiB7sr5n
 3pOuFMYsI3CzqKaI8rpLc2HvxhTNtbmNbsr/VPukTic2BAUap8RdqMFMOG+RxnV6K5td
 8ViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E9ZmMC5KcCuMcg46RmzRYoZclmpodwk5J7LVFibG6B0=;
 b=LRDYlzoBzBWEPb/pi8Dqzsd4nx1rUdWqPZvNasH7owXDVPQY4QUrRmrJf0P2axZ4ol
 brlossWPD4K3wOXMaO6pu2LePHri8ge+ja3qK/zPBbd8xw4BaUJoFxZEcHCGWIgc0A6D
 RSS+zh4OADCObVZI7KM0O/DHww06kSZLE4KBo4tT1KyB9kOeGHfS2FK+vfTJy3Y7c5+7
 yX5uGUHDnJEgWYNDlJVd/zylnCXlTd+cA/M+w56XzghM+vzMItbJIDPeqzgCUpeHPTQu
 o27T/kJc91OujdeATBZvnzdI54E83O9Q1s6qcW1Ev9Mh7vQQyBoN9uMaqEtkcCQTwqzv
 +D/g==
X-Gm-Message-State: AOAM532YZaCzEcngJOLbMv4FbafscKZedzalLeJYIOS87ARuRhOEmiEF
 a+iCJ5wza9sP8MivXH0HibYrww==
X-Google-Smtp-Source: ABdhPJzFf3q+hlXVkKpg5t+01oTaO6zKiWTKgClmP0wrHLMKmNpnqVvOgB9FkaLDyf40CHL9CDVHQw==
X-Received: by 2002:a05:6a00:15cf:b029:3c2:7a3c:1758 with SMTP id
 o15-20020a056a0015cfb02903c27a3c1758mr26140252pfu.41.1628643050540; 
 Tue, 10 Aug 2021 17:50:50 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id d22sm28785863pgi.73.2021.08.10.17.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 17:50:49 -0700 (PDT)
Subject: Re: [PATCH 10/19] target/ppc: PMU Event-Based exception support
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-11-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <97a6f2be-11ea-fb57-3bfd-d4dfd2747445@linaro.org>
Date: Tue, 10 Aug 2021 14:50:44 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809131057.1694145-11-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 3:10 AM, Daniel Henrique Barboza wrote:
> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
> index 91bb82e699..43cc0eb722 100644
> --- a/target/ppc/pmu_book3s_helper.c
> +++ b/target/ppc/pmu_book3s_helper.c
> @@ -10,12 +10,15 @@
>    * See the COPYING file in the top-level directory.
>    */
>   
> +#include "pmu_book3s_helper.h"
> +
>   #include "qemu/osdep.h"

Never put anything before osdep.h.

> +static void cpu_ppc_pmu_timer_cb(void *opaque)
> +{
> +    PowerPCCPU *cpu = opaque;
> +    CPUPPCState *env = &cpu->env;
> +    uint64_t mmcr0;
> +
> +    mmcr0 = env->spr[SPR_POWER_MMCR0];
> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_EBE) {
> +        /* freeeze counters if needed */
> +        if (mmcr0 & MMCR0_FCECE) {
> +            mmcr0 &= ~MMCR0_FCECE;
> +            mmcr0 |= MMCR0_FC;
> +        }
> +
> +        /* Clear PMAE and set PMAO */
> +        if (mmcr0 & MMCR0_PMAE) {
> +            mmcr0 &= ~MMCR0_PMAE;
> +            mmcr0 |= MMCR0_PMAO;
> +        }
> +        env->spr[SPR_POWER_MMCR0] = mmcr0;
> +
> +        /* Fire the PMC hardware exception */
> +        ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);

Does this even compile ppc64-linux-user?
This function is in hw/ppc/.


r~

