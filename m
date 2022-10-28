Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F174611B26
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:49:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooVKG-0007Lm-LJ; Fri, 28 Oct 2022 15:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVK1-0007Ht-PZ
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:47:21 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVK0-0007ik-BF
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:47:17 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y13so5620639pfp.7
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ostfe6AwmweUUMw4nT2jwGJ3Aco28v/A4mF+ZvUoqGM=;
 b=cforzJH3vCdRkJVqDsXgk+tmKLMmXR3DU0TxJ/aTQFq6oZR6jE2A/E1MK0iPlYnxSS
 39q++7pfDnL+ZCvaCvQ7QM1aLN82I/1d0TcTfjedHQfU4DJWbRzklnwVvpOqAzhHoFbf
 5TStm7UiAJfi30BY2cDxleOjTGWV+oGqxAYDPlJ6d59e+f0ZyXfX20f9O/V6kVRr8dGl
 lWYZrCMLPoZTzXBhnGsrVKX50/RCqtNhBKxMiqKQ3Tck02wVRY4eRqk+hW8Ovh/4NS28
 N/lPm6e1J+Qj3OYag3tl0HscGPuMewSEC3DeZUH9Vd0dmu5rJO6H4azcnpYwp090pbQO
 wX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ostfe6AwmweUUMw4nT2jwGJ3Aco28v/A4mF+ZvUoqGM=;
 b=zpqu5eiVk849FZie3J1nGU7frdSArJZpv7AYpz/4PSYXi98ELwaHJl118nXVUq0BV8
 UboM9GhhoIJC1trMm97l1b1OzUXfKUbDkyd91A7FmvHOQOqfx5bo8HFuKHDx+lWWC6qk
 gODcsK+hj7UmmlPlyCFdLjIqK8igs1OvVVrVXzmTJMnEDESKvPSorDYPiUNBnUYJUGqu
 UOr60X/zPfMAP/U7eHxuVMHuLnML+NZdRsn2sGoXmsD0bZVLZDQKOrjGROrjKd0aqup3
 eM3edG0epA/6bcNYOn1UrmVf+/tc72NaIEcrtd14FWRr8vVdWR4cYXZ7Gv064DAKkdcZ
 3rNQ==
X-Gm-Message-State: ACrzQf1a+Mf/wUp3j8sZA5p8TUHDZ8m1Q5GZwZpVKiBVOhq/NJ9/poNP
 BS4Ncv7cq3sd1L4anB13Z0Nwmw==
X-Google-Smtp-Source: AMsMyM7sjG6Q23ULsN6bbRUvRMFLffyd0OvI6iQYG2IIIpQcKnt2rh2nGE0loipP0x1xa4adQHcZVA==
X-Received: by 2002:a05:6a00:1889:b0:56c:3d4f:ae14 with SMTP id
 x9-20020a056a00188900b0056c3d4fae14mr676453pfh.49.1666986434497; 
 Fri, 28 Oct 2022 12:47:14 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 67-20020a621746000000b0056c349f5c73sm3178233pfx.132.2022.10.28.12.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:47:13 -0700 (PDT)
Message-ID: <18dbefb6-49d9-db35-5fb7-2ed05a994b6e@linaro.org>
Date: Sat, 29 Oct 2022 06:47:09 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 7/7] target/arm: Report FEAT_EVT for TCG '-cpu max'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221028134002.730598-1-peter.maydell@linaro.org>
 <20221028134002.730598-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028134002.730598-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/29/22 00:40, Peter Maydell wrote:
> Update the ID registers for TCG's '-cpu max' to report the
> FEAT_EVT Enhanced Virtualization Traps support.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/cpu64.c            | 1 +
>   target/arm/cpu_tcg.c          | 1 +
>   3 files changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

