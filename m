Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D9D6FE321
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 19:16:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwnOl-0002Mr-4D; Wed, 10 May 2023 13:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwnOf-0002JS-GW
 for qemu-devel@nongnu.org; Wed, 10 May 2023 13:14:37 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwnOd-0005K5-BO
 for qemu-devel@nongnu.org; Wed, 10 May 2023 13:14:36 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f450815d0bso13343515e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 10:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683738873; x=1686330873;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ik8v63x9h9zTH24wkm0NElTYstoDZLTexAAy2VQtZ18=;
 b=yvuY1mqg1eWRbSwKbGV9Bj80pmzWah9CYypMVhqajJreyIOFnM+W5VfA1nwP5Lso0m
 jftNYt2RoLDAYwAZIoRz7MMuAfANy3GFL0lEevoUmIsaiUXulk8nUZsSC0h4bO3tDeHj
 u5lp5i0tk5FSz8JvdcizLLwPx8SfmpuqZwzQmOaqoASSIhhAduHNyYEzx1hRMZQXlr5D
 uJUPsVo9k1DR0eSIv73yMIXJIl+qg5rW8tgdpS9M8i2geLtu5awZeJo5VczLoqK6Mk2m
 rrN7HZyxli6f9feZs0E3UN8+3TBSkFSS+RpLiGOH/GumcZIgU6POFBgjl+3/lhmmxnel
 XE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683738873; x=1686330873;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ik8v63x9h9zTH24wkm0NElTYstoDZLTexAAy2VQtZ18=;
 b=SHhFTEulaAx6AdGZe3KxDWflYwaf3WNs1GMKUEgkIxrN6H51pKYJ67WYiP54KjnovW
 JAZk86LscTv+OPGKYG2IeObOZInCEJso1pzN7dGlBu9bRj/Xf9P2ocheURplRYZSW6px
 XeKyIXrdHlXR7Mpb/ZBMclt7oYau+wwTYf2KOHvZ87Yc/rtDyIQZBr5S75tw5uKPbDH/
 ZZtdYguRp+W5Ks+wSnGpTRC44ka9V8+q+QxB9fJSDj7Zm+O70UJ7AM3Z5YQ8lyWK736R
 hEvf6SgoVVrVANZcLcE8qJFbwS98n9WE9S81Lik8vtabDz1SMNndG6+RcbmR5+tezVbu
 4qvQ==
X-Gm-Message-State: AC+VfDwMhhbG/meXulmU5msNZscdL8pH8c+Z6yh/XT1AqAzj6Z9Ye87h
 DvlxUbYN1LjyELBMGMIzXRc8Eg==
X-Google-Smtp-Source: ACHHUZ5azSxgT//Csqdf4NkZ0CgdYWP+TJK/TMpIa4xDCofEyM1FbHLzpgmoDj8kMfBBPX5291u98Q==
X-Received: by 2002:adf:e3ce:0:b0:304:9fb0:6a8 with SMTP id
 k14-20020adfe3ce000000b003049fb006a8mr12552352wrm.18.1683738873307; 
 Wed, 10 May 2023 10:14:33 -0700 (PDT)
Received: from [192.168.1.177] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x10-20020adfffca000000b002e61e002943sm17817054wrs.116.2023.05.10.10.14.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 10:14:32 -0700 (PDT)
Message-ID: <1c7c5786-a1c1-0e5e-3953-24cc690629d3@linaro.org>
Date: Wed, 10 May 2023 18:14:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/8] testing and misc (docker, docs, ci scripts, gitlab,
 avocado, Kconfig)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230510150658.1399087-1-alex.bennee@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230510150658.1399087-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/10/23 16:06, Alex Bennée wrote:
> The following changes since commit 568992e3440f11897e209bf676aa5b93251385fa:
> 
>    Merge tag 'pull-qapi-2023-05-09-v2' of https://repo.or.cz/qemu/armbru into staging (2023-05-10 13:11:29 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stsquad/qemu.git tags/pull-testing-updates-100523-1
> 
> for you to fetch changes up to b9353acfd7ae1fc59a64b9aea34bd77a415751d1:
> 
>    hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102 machine (2023-05-10 16:02:58 +0100)
> 
> ----------------------------------------------------------------
> Testing updates:
> 
>    - fix up xtensa docker container base to current Debian
>    - document breakpoint and watchpoint support
>    - clean up the ansible scripts for Ubuntu 22.04
>    - add a minimal device profile
>    - drop https on mipsdistros URL
>    - fix Kconfig bug for XLNX_VERSAL

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


