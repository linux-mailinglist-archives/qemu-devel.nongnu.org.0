Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8279D623B72
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:44:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0MW-0005TZ-Um; Thu, 10 Nov 2022 00:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0MV-0005Sx-3e
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:44:27 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0MT-0004uY-Ln
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:44:26 -0500
Received: by mail-pf1-x42f.google.com with SMTP id y13so927137pfp.7
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Z+5waqjt348hMKP/B6yAhudr0kbOI4/ArZCM6VUsPg=;
 b=OybpppxiJ4iQIyrufG+vMgeXrrvlT6tfayeBBC58mMcjH4XLOMhnhX67oR4SxGu1V0
 lgHKtUrlJfsK2kihrSAniOYc4GORDm244CJJqd5HfKL2Q/DFGh7QC6WPEbJRHnz349KB
 eLOqKEoypYLfrqnQcJqWxLVLX1e5wsPhqNiDmsMNIQwL2SJIv9RxtGf/ed/jq6U2JoXj
 NviSmW1C7DEbxrUt9ZtWnem/GKXNfD5K2Hvn7OmSk51CIEYe3g0MGsFWfcF17nlUNzyP
 Bojdecg0DBCEZSGmVCevY5ytPn8zMYf6y1MgPhkxeKWALoisWzfWHEnF2k0iSYP9/AMh
 Cihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Z+5waqjt348hMKP/B6yAhudr0kbOI4/ArZCM6VUsPg=;
 b=0cS03EEkXnxZfXgvlaeDwPs5B3zuCnbW0FO6CBb8yhPy7kZ+LCR5NBhRXq3rhTV3hj
 IWRv7DupJDLhZ05QWo+ircOw9DO1xhGbGzI89Q8K7ZD64QE2MuPEEBbVYFY/h30rm9hK
 boSiSLlfhkN2LLoN2JwFIcoww8mYSoBvLSwiwNUP3EYiXsr9oPRV4042K/PTkJyBMZWV
 XrFhAsAoR8Q6cX5DhaeXqi/25zqGQ/AXD4l/lG4pD6mRvPW16h/+hzC8BxepitwgVDx1
 3y1VFNb3ug9XG8Fn1sk3r3ktK25ffVwdQc5t8LrSpEes+7kzIdvSmJQCDV9fVBcVetae
 cM2w==
X-Gm-Message-State: ACrzQf1PuE4Haoyj9Hc1BDMgNPH/veye6TBwo9Sb7be9E+Gf4Cu94FdY
 B2qMT0vxjvFBdVuSe7tZNkV6MQ==
X-Google-Smtp-Source: AMsMyM6HDB1bwegA27mLTGFVQ+NERHmHDFGcjBxWKrk4xw6eejHIBUwOJNjtd8L2fDK8fvQuE2c8rQ==
X-Received: by 2002:a62:582:0:b0:56c:8c13:247e with SMTP id
 124-20020a620582000000b0056c8c13247emr62912373pff.43.1668059064080; 
 Wed, 09 Nov 2022 21:44:24 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090322d000b00186b6bb2f48sm10161131plg.129.2022.11.09.21.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:44:23 -0800 (PST)
Message-ID: <d4704608-446b-f211-4e86-ddfec19507cd@linaro.org>
Date: Thu, 10 Nov 2022 16:44:18 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 8/9] hw/intc: Convert TYPE_ARM_GICV3_ITS to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/10/22 03:14, Peter Maydell wrote:
> Convert the TYPE_ARM_GICV3_ITS device to 3-phase reset.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

