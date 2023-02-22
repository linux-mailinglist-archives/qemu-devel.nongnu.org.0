Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A4069FD35
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 21:50:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUw4X-000866-9W; Wed, 22 Feb 2023 15:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUw4U-00085K-Of
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:50:38 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUw4T-0005Vi-Al
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:50:38 -0500
Received: by mail-pg1-x534.google.com with SMTP id d6so1621420pgu.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 12:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1SJnQiiPoXc2ckflJYsxWP4AbYgnprIeOE/8hqQh0WE=;
 b=co6ChzT/VHVB6Qa+rLbtvRAhFUZDq1yoikJMPQkpDtqnbdUGIaEmXXL+SkR26xG4jz
 Z4TpIsjnc63b0P1KRBW3V0wsaHM4eGGTmE0hfwNs8amkATSkyNFju79AVaVHpKuj4kPx
 fR/mmxLA5pDMOIZQlLMq8lwn0JN8pYgBO+mIOAEvOfBNs3WYosYvk33SHZ9/vy0JDw/8
 1qov8WD3OPEEl0xT6TXCVmmi4CKRR4l1CCmj7zs2+gCGCQK89kEN4Ksnhae9zZCsTeRc
 6dlccJfQNpiBbKzka14jNFo3akGeC0D0PFgXM/hKSl2k7cXrQvrOMDFSrvCTU2Ae3yL0
 X+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1SJnQiiPoXc2ckflJYsxWP4AbYgnprIeOE/8hqQh0WE=;
 b=4WnM7bovCQ+HlEI5Hw15tl9+kQecWIZXnXssOzGb/sSPt7sa+4TBcEOeBRloSLrv+h
 YOjbjs+mfZxwmreo9wUHqvq03NK44NnNkXwRtxBxfMH/7nclxl5RKU2uYiCLk8VXA9TV
 2xMeHIa01ZUzzpdBhe2Eg/0asR5WMPKTBGJsQ7TDvkeRyVnVcxQWkgya0m2ZFqX1YL3v
 sbxXRx7fUCP6fgTuU5bSjobisfyS4wniLSo8mLrIbC7KSIPdZ9rPiRYUvv/RybjU+xXj
 K4HADp2KdLi8lBOKw1lBULtria4bDqHqPxjN1BOXceGvsnnm5rpRf8vVMkUJFpEyitrd
 hYxw==
X-Gm-Message-State: AO0yUKVd8QSj8a+9eOA8w6dukyL3nhnYu6xuICZKuq1FoI6iXUr2HlnS
 Mtw/WkkEzgRU3aTrxGwE3/6sJw==
X-Google-Smtp-Source: AK7set91hEzLkq2vtp3yxBICSlwrF65GKhS2Be1cT3q9vKZgzpSQLp5NIFMWllGlRmB0q0SVyuBXxw==
X-Received: by 2002:a62:524b:0:b0:5a8:adc8:6de1 with SMTP id
 g72-20020a62524b000000b005a8adc86de1mr8138808pfb.29.1677099035681; 
 Wed, 22 Feb 2023 12:50:35 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 c22-20020aa78816000000b00571f66721aesm3342365pfo.42.2023.02.22.12.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 12:50:34 -0800 (PST)
Message-ID: <05dc1251-593f-69de-4ee5-f76b702601a2@linaro.org>
Date: Wed, 22 Feb 2023 10:50:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/7] target/arm: Implement v8.3 Pauth2
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-5-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-5-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

On 2/22/23 09:35, Aaron Lindsay wrote:
> +        result = ((ptr ^ pac) & xor_mask) | (ptr & ~xor_mask);

Simplifies to

     result = ptr ^ (pac & xor_mask);

which, IMO is also clearer.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

