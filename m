Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43D359AABD
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 04:40:34 +0200 (CEST)
Received: from localhost ([::1]:38742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPEPa-0002nG-1x
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 22:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPEO9-0000hO-1u
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 22:39:05 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPEO7-0007rB-Hl
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 22:39:04 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 w11-20020a17090a380b00b001f73f75a1feso9102561pjb.2
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 19:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=fQra0MFLZqbH/4r0jsa1LeNiiDvseybCcRo1WtJMJ/o=;
 b=x/wWwg1JZvyRdRmG+GiXD9LhDhXsB24wFbtQ26kFerbBXoGtxe585svyRPRPHjvVG9
 4bst4g0kvOt5oZ1LB+sYnMKCAD3dnIzl75Nxn0RbUzbi1aidREFT1OoQdsbnqIDr2Kxz
 awOx851BWBmAbT09Plw89cPzKv3iglxlmxPDicueNl33BLP3VWuhgFwMUbrnzeWUrQk0
 mlXCNbgsmLNy0ZRYB878AGSdWr23QSJ1Qz3jhdsKWm6a5CwTDSiZd9Dp7sZFWINWemAT
 aybdWih2KM87Dcw6EPVC2sFftDRBtSzCKSFP2lcYWnF8zvzYRKt7FMNZKN4nGYM+FAvO
 J1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=fQra0MFLZqbH/4r0jsa1LeNiiDvseybCcRo1WtJMJ/o=;
 b=semYRo2WcI+oUh5IsW51meur87FlDfmOmWM7XJpv6l4/UHL6bfaS8c+Omge1+N9n4+
 Lzt9MI9C9pltcWinSrUd3dTtkVRTnwQ/rNjim+LoZ6TeQw+sujSsDAEZKDRwxQQnxsbV
 HThLVEkZDOwujkk9peD3yzvvV2ntE9COn39YvYoiyEh4pIbZWNBEhAd8jokSW//geAQP
 mDYKQmqqMew1glRi8tubDtGdSIfP3huClnSlFnknFR0XrYclnap6+nPiw5t6Z4UeWK/m
 a2d8sxAi3A7rto9ENzTBZojF1hHhHZqOrIdFoG3NvLt3hhkWB5HRYGiMC1R0Jya5n4Qy
 bHRQ==
X-Gm-Message-State: ACgBeo11eS9Ho4rgGPitTTSf5GIl2qLqRNrnqcwdngoeyWRafBe4MOZ+
 MhBqCl69akdstFyUumMIb0mdr6+lraRmTQ==
X-Google-Smtp-Source: AA6agR7Zjn84boQLMzeAzKzuDVX2QapmhPHzickQd2CNdOMkwr7m19JIyND9uiyqYh4UZPUK8nDiEg==
X-Received: by 2002:a17:90a:1b66:b0:1fa:bbb5:8a5 with SMTP id
 q93-20020a17090a1b6600b001fabbb508a5mr11429561pjq.216.1660963142151; 
 Fri, 19 Aug 2022 19:39:02 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:f37:9eb9:ca02:d0cb?
 ([2602:47:d49d:ec01:f37:9eb9:ca02:d0cb])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a63ba47000000b0040caab35e5bsm224284pgu.89.2022.08.19.19.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 19:39:01 -0700 (PDT)
Message-ID: <8c7a0416-fab9-3fbb-ab66-9a2753eae4e9@linaro.org>
Date: Fri, 19 Aug 2022 19:38:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] target/arm: Implement ID_MMFR5
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
 <20220819110052.2942289-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819110052.2942289-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/22 04:00, Peter Maydell wrote:
> In Armv8.6 a new AArch32 ID register ID_MMFR5 is defined.
> Implement this; we want to be able to use it to report to
> the guest that we implement FEAT_ETS.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h    | 1 +
>   target/arm/helper.c | 4 ++--
>   target/arm/kvm64.c  | 2 ++
>   3 files changed, 5 i

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

