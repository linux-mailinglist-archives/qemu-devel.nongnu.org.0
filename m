Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C6B5FA0FF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:16:01 +0200 (CEST)
Received: from localhost ([::1]:33448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuVc-0004Dv-29
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohuFB-0007nE-WB
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:59:02 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohuF8-0001oI-Oz
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:59:00 -0400
Received: by mail-pf1-x432.google.com with SMTP id i3so10969575pfk.9
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/zcGw0OEpIV+d+zstfCaAlpl2dCz+eHKJbYqaPwP+CI=;
 b=F/M7Cs3s1RNJZlQHt+MBkwWEYK70sQ3uqvP8PLTCefWdmDLaax6f0Zw3yfiEAL7FM2
 xMFQ+/w+ku2eE1XnBw9fuqKk0mKhdsje4d9IvzzrW2v7CT+8B96y7seZY3fV0Kc3xPZS
 M1QQi1fOWYQiIpWjhMQMO5s82VpedZUDkveOLCI21rVlyq4Xus3jv/reTIaTqRWqoTf7
 LeBrb8OwPtM6qOKLpjmF/IqHzP+wElRVoscxz156SO7gqwYF34wtbd6GtqIfxY6Ng3pq
 1rHI582ZFgJF9uU4Zxv+5auM9dGjd0Lb9U7yVa8xCZe66UAJnM+GeWkCZP/RYyzc8J5y
 js1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/zcGw0OEpIV+d+zstfCaAlpl2dCz+eHKJbYqaPwP+CI=;
 b=RMtYyqAgrK5cwypN8GNi+PICWkvXzvjhUZLXOSgndB/8RudODBSgWRhE4BSyIBwEFo
 VRwJQ0iEhlJ89Ty1WWDcJCbq8NOejmzPOzW3dPuV8Mb8xKKyy5XiWh7o+14Pv39X+JC7
 rmpvrozvwbDnr3bF5SEiE+lGJsQ56QopC/C0v5vZZ7H0D0aNwqmIoVxBq+31/ce7rjOx
 s8I/h4c+so53j0xrX6H9xvKUqZKyva+k1VNzLJ3SLWUZum6/CwMtMpANW9hdE01ZGmwi
 dpiqOqtflY66UZlPFP6ulyRSVxJT7oyL93EbeoiwVGrE/dqbfySU/vZBh+xoejwnIQpt
 oYoQ==
X-Gm-Message-State: ACrzQf1vs/5BHGdc0qEKnBSSqFlvc0IZcAdhNpqdgyHvw0A0e08T38Mz
 blFT9lAU322Veemvvd/CK+yQ0Q==
X-Google-Smtp-Source: AMsMyM7hWa9eN8SdrtJdhSNXL4jOcUiv/gUOfA+9xYu6TPe3EgEuGbLF3kgvbtp+0I61co3g5cZ2Hw==
X-Received: by 2002:a63:24d:0:b0:452:87c1:9781 with SMTP id
 74-20020a63024d000000b0045287c19781mr17104888pgc.512.1665413937184; 
 Mon, 10 Oct 2022 07:58:57 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 n30-20020a17090a5aa100b0020a11217682sm2972588pji.27.2022.10.10.07.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 07:58:56 -0700 (PDT)
Message-ID: <953e59c1-c4a0-9740-a177-97c9b8389300@linaro.org>
Date: Mon, 10 Oct 2022 07:58:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RISU PATCH 2/5] loongarch: Add LoongArch basic test support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, maobibo@loongson.cn
References: <20220917074317.1410274-1-gaosong@loongson.cn>
 <20220917074317.1410274-3-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220917074317.1410274-3-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/22 00:43, Song Gao wrote:
> This patch adds LoongArch server, client support, and basic test file.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   risu_loongarch64.c         |  50 ++++++++++
>   risu_reginfo_loongarch64.c | 183 +++++++++++++++++++++++++++++++++++++
>   risu_reginfo_loongarch64.h |  25 +++++
>   test_loongarch64.s         |  92 +++++++++++++++++++
>   4 files changed, 350 insertions(+)
>   create mode 100644 risu_loongarch64.c
>   create mode 100644 risu_reginfo_loongarch64.c
>   create mode 100644 risu_reginfo_loongarch64.h
>   create mode 100644 test_loongarch64.s

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

