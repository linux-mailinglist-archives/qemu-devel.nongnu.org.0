Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D1D60B6E1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 21:13:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on1h4-0006tJ-P1; Mon, 24 Oct 2022 13:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1on1h0-0006ei-RW
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 13:56:55 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1on1gz-0002jZ-2Y
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 13:56:54 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso3805705wmq.1
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 10:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6gCaz+qigoY+JMmq4Wmx0pzWkRsgUH7y5hYc1ztGWN0=;
 b=OO1S2dtXYjiVyoN8nNxRWrLwrjrlSlKE3f36qx0D3J2IlhhMd4tW4hssqWsoUxdxei
 6Pq5L/tHlVWSkKdYwm7ZPoP/mUwz+m1PAtnY3orqAahK4d0o8O8obAZN5Rn8iA82hiCf
 M1/W4jG2svfHcIC5Y6nvIoE2+LMA3ovNm15i6jcuQp2gnc/RmzvDmfajuBcRZpRpY4Bl
 WO5+yi6OUBi8Hg1b9CjOzpvBL0WEKw1Zx4aZeYCL57GVUWtLCg+JqP7qeyiZ09OqeZmR
 NsXfZwgCKatMUx2nkKrqbdr/QKmeACByKW2S8mygDCc63Ptb41eKCJsFjR6iecFVXdUN
 U4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6gCaz+qigoY+JMmq4Wmx0pzWkRsgUH7y5hYc1ztGWN0=;
 b=5EYdV9gap707BX76xEf8LzrqP3CTZRBdscqyBonBTFLrb56tmA2lLHr2xrrM4qCyRT
 xu/r4K/QyQ9RhzjRZe1WSHWRSzzqN1Ecj/MQMz4xDX7t+487nypGGgZzmbeTwyk0p5OL
 KjOULGRlMnuAQ03AS/s3Q0U4ioH/BvC99V63USMWItWJI3xYacfDDL1nPA5aqgLoEUg2
 iqf4jpVolwbmQfxsjPCQ9ALOfWjPzuaKyDQVNsIr9N8A32+7Q8OWLjD2htBjGKzL/hNM
 vP69xodX8AdZBv2OLKSyV2PQJcN6VKAE4lkJErcDL9cCl4NyprpVFt4DCd5anmgrbOzj
 KcvA==
X-Gm-Message-State: ACrzQf3js3JSGNe80pxn44SpUJTKlrzbJPJfJ71EaBJfQqsfr7fHyMDh
 GvZhCh1F7mVQBbfCfFpERM0zVQ==
X-Google-Smtp-Source: AMsMyM4/wnkgk5sY3GkcL4s0U9vx6V9V/bTtDq7Zjj65Cc7SpB8cqdm5S6sxq4OtRT9UO4y+FZTkAw==
X-Received: by 2002:a05:600c:4e45:b0:3cf:3e69:9351 with SMTP id
 e5-20020a05600c4e4500b003cf3e699351mr126259wmq.2.1666634209657; 
 Mon, 24 Oct 2022 10:56:49 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a5d58e5000000b0022e36c1113fsm311743wrd.13.2022.10.24.10.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 10:56:49 -0700 (PDT)
Message-ID: <e69931b3-bd1c-cde3-9863-fbd9b09e15b0@linaro.org>
Date: Mon, 24 Oct 2022 19:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 22/29] target/xtensa: Convert to tcg_ops
 restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/cpu.c       | 10 ++++++++++
>   target/xtensa/translate.c |  6 ------
>   2 files changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


