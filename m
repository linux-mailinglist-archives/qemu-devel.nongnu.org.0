Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D9759AB78
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 07:24:26 +0200 (CEST)
Received: from localhost ([::1]:60274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPGy9-0000yx-EA
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 01:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPGw7-0006Nd-94
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 01:22:20 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPGw6-0004QW-0c
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 01:22:19 -0400
Received: by mail-pg1-x52b.google.com with SMTP id d71so5165257pgc.13
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 22:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=XlZgOSQ4NES66fut4fiHJ48r4KbfdGGMFc466qIdkkw=;
 b=OHMeD9ciras5hDTvtgrUFdp2AMKqVQAwBjUoAYT/U9AQVBRmVpm4vxTewNzUZUmG7X
 9RNJUnftITYr+M2QRatp6I/a78/7CQ9XUJltuM/hSZgSmLHwiNF4cTZwGXtHSH4Gu1vw
 k7kBH0KTR5g/eqAYHad6f3pI5sBhJZ7bciPSPKGBnUaBVTrP2XEQQ+gfwy+8Tb3fb9uy
 Fejyh4eLM5bbgwmUbSQpR0v6h7+E8XM+yOnpfnEwQRZwu28dGWYiUBvJ00CKyZ9mAY/D
 vS6t5xomGJIWveoNJiUuVCXtpQU09VT7qp+xgxinGixCY2QpWJ3LYMcx82q/jgasqELK
 nQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=XlZgOSQ4NES66fut4fiHJ48r4KbfdGGMFc466qIdkkw=;
 b=TuYbFN4A5Id2FGvHDbyabBUBDvuVMK+57h+tRfd+6PJqCMwsjv8OwM88Q56/7XF3em
 acv1oMX0ri/SUaZBYL4MbAK9YBybHyGG1vDfOW/XNRW1BmDEyS3nPs75Fj/uKS3eBd4C
 KqeC1phcSBqPdXx9a5yr01WkauBjT/oKilmq49dVM4kv3nuKLE0oh2PUcpYZjUxXYZP4
 RfDF4wsncx+zIYG3r0iaF834Rd2WGXTCLKoG0gzEJ30GEP4rLucunDEaEUnnsAn8MZ3B
 SyjmBCPWF+b3mjTL0HaxyJjYi1HttOJjwcznIdg2AeACowURDTcj5GChafW7w1raN30X
 H1UA==
X-Gm-Message-State: ACgBeo2E4nuN59IiyJ/Dpywgh27PBGCnX6DAhi0TT2zN+vBG9WTE8XOr
 KcCZVuT6hHfsh4xLManzAD43UnBdaHLtZQ==
X-Google-Smtp-Source: AA6agR7u22t69Xhzd3WPueJzmXBVNpP4yIQmu1JR3NDwB2MBzD2ZqqNhH6rrb3HB+YSa6hjReGyjxw==
X-Received: by 2002:a63:8ac8:0:b0:429:71e3:4af6 with SMTP id
 y191-20020a638ac8000000b0042971e34af6mr9052151pgd.218.1660972936517; 
 Fri, 19 Aug 2022 22:22:16 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:b651:a70f:2852:70f5?
 ([2602:47:d49d:ec01:b651:a70f:2852:70f5])
 by smtp.gmail.com with ESMTPSA id
 z16-20020aa79590000000b0052d8405bcd2sm4322149pfj.163.2022.08.19.22.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 22:22:15 -0700 (PDT)
Message-ID: <923c77ed-f3e7-38e1-6637-3c1196ec51c4@linaro.org>
Date: Fri, 19 Aug 2022 22:22:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] target/arm: Add missing space in comment
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
 <20220819110052.2942289-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819110052.2942289-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> Fix a missing space before a comment terminator.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu_tcg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

