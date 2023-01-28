Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BC267F40E
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 03:37:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLb5L-0002tQ-VE; Fri, 27 Jan 2023 21:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLb5K-0002t3-5w
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:36:54 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLb5I-0006y5-Jv
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:36:53 -0500
Received: by mail-pf1-x42d.google.com with SMTP id z31so4482968pfw.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 18:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PfhjYHQxkLDkhgFEAq0RDCvvIlvQ17QxBaSnhHldefI=;
 b=tw2PyEapUMzQrrb12aTaQcPKX4SxbD45xkRjnkh6HltEjyQSOLERHXr5XC8FHEqVbs
 0tL+S6XF8VlHvIeMY0kuC6HnntQH6ahYPQdSMY8IIZoJTPwFBAwsJXZT6MDL2ZOpepNs
 TGjcO+QxOTT854B4Uxgp/jL6C0annPyG1Y5d5EmMHEVJE+X7kGPlAm7Loo0wvD6gTi08
 tl7k4Sub2jyRI4nHhjB/xyAX1TCmXPxkxhx1UDrttyrlWMJpOZAs8e2BYHaecRNAnAH3
 lutym8AmztaJTSM/p7BnUVg0B2wuy+7Un7q4TtchlsYOujOFaNZCdXcEKVdPeQx1iy87
 gZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PfhjYHQxkLDkhgFEAq0RDCvvIlvQ17QxBaSnhHldefI=;
 b=bn9Y8MQrPZgMYe15e0w21+aY2NFNS37wgOlEx/+6qCQtLvXy1UQfcf4kOILSqOcdaT
 KnfsROeVn89SYTpg4WKvNuivp1QjtCk5WrS5HcypwE3WwIUPKOmqw3/GpjcSf+SEJ01J
 vbuubdEVvUbzo2WPWof3mK+31NvY5IZPo67H/qrWA9C3A/QkaeV8n0gZ964TN25jYxky
 Q93x/GcB6JdBg7i8LUKVHO9vcH/aqGZ7i8UrUxzLJJn8rWvr1Y6Tb5i3qfIH5Gfs7Mht
 tAUPI4BcapAWj6ZdweXIKsi0qozi3VkbvGsh2nP6GlhyhS0Jx1MsNhNzGf+DTw4r7vf8
 zslQ==
X-Gm-Message-State: AO0yUKWtZZH51zLIXdMul2Y1woXYgxphWHmQgnuAQfF+PbQQ+oA8e0YT
 EH+nbbqdA/Stj5lYftHp1fpzvA==
X-Google-Smtp-Source: AK7set/6OGFlEYzSB9odiPMU6PXBoI2IBp5+3V9eydlJsrW2Lhdv6bytv4AUzZMJcV22LgiKEioc8A==
X-Received: by 2002:aa7:9834:0:b0:58d:9251:b2a6 with SMTP id
 q20-20020aa79834000000b0058d9251b2a6mr691299pfl.1.1674873411268; 
 Fri, 27 Jan 2023 18:36:51 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 y4-20020a056a001c8400b005906fdf418esm3274399pfw.59.2023.01.27.18.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 18:36:50 -0800 (PST)
Message-ID: <6b4f7ce3-a815-50c8-9568-054271fd5b2a@linaro.org>
Date: Fri, 27 Jan 2023 16:36:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 10/23] target/arm: Mark up sysregs for HFGRTR bits 0..11
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 07:54, Peter Maydell wrote:
> Mark up the sysreg definitions for the registers trapped
> by HFGRTR/HFGWTR bits 0..11.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> The annotation of the cpreg definitions is split into multiple
> patches for ease of review, 12 bits or so at a time.
> ---
>   target/arm/cpregs.h | 14 ++++++++++++++
>   target/arm/helper.c | 17 +++++++++++++++++
>   2 files changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

