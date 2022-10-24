Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2360B32A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:58:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy2D-0005R6-13; Mon, 24 Oct 2022 10:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy2B-0005Qs-Ps
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:02:31 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy29-00026T-Uk
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:02:31 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so10040577wma.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O+X+u57x1uevzYmR5pcqzyvkVqgqnWQEnymzap2XNvg=;
 b=cbHPyKVHH4vLYZhEkeWuM+aXka6xXT4mmj7m4V3hA4InDWWEd/KwIh+kM4IEYu+Eoo
 Q6WUGbFOqyphxgu/byHmaV4nqvx9XuhFTZulNBP1L75YnvVu01/nieBzlDA1mju7Iy52
 eMzGmYFqRJmQkq6lL831hvCUAgta2dfUQLoUuMhHPr9NYZ4dKAtdiML79i3oYCcOxeZ/
 ShnJqHlvuo8bOplzKLVNmINFOSnkRB9k7k622UdM7AOW25dzA2NPnZD6+5kGqPJU4R0R
 PKeGU7j2eLheXnAjE7fCp2BW2+2UuIUs2Qli6pLZxifcoRx+BjHki/06uQX36mPH8Y1n
 VkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O+X+u57x1uevzYmR5pcqzyvkVqgqnWQEnymzap2XNvg=;
 b=7hi244sZhE9xQ9Hh7SLBH8HD243skhMUYqtlXFg5vDbZB88a8rsIGEeU/+UoV5JUlT
 agRUFNZpTFeWyrnygkwRy6rWoXt20atjm4jjMHvChd1aY/E3w6A6Pa/eO55L3D5jvkVC
 XtU77ygiTnlm8YZ8eSsVvjbeE2qUq9CjD1YQiBxPkeEOEQAvX6ddj3864fqM/EJHhpgS
 mN8i+u+FECCRMPorgxyP1RZzX+WFzQUD5y8BFozrTGwdn4mZb8Q6blkXT13tWkWIlgEN
 tQw0Cyqq4elV3LrnaQFah83qZOGJXaauLUvjQ8AS17j6bwdvh3CM0X/lu4EntudaGAGt
 eOLg==
X-Gm-Message-State: ACrzQf3fYDu381R3oRJPqBKxEbUtumz+CHrsqTsUL6ofrLbQHtvIFP5b
 uCLxjpCZOkRO8oqLIAGmXXIaOyJm4AfiUg==
X-Google-Smtp-Source: AMsMyM4B7l1MoRljRatQsFfb8wiguJSs4nnJJINwEgktw5CTbg+n36bhw36FjjvbXEcxmlTPLs6F8A==
X-Received: by 2002:a05:600c:a08:b0:3bc:eb4c:b90 with SMTP id
 z8-20020a05600c0a0800b003bceb4c0b90mr22673722wmp.184.1666620147347; 
 Mon, 24 Oct 2022 07:02:27 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 j37-20020a05600c1c2500b003b4c979e6bcsm8929436wms.10.2022.10.24.07.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:02:26 -0700 (PDT)
Message-ID: <2409f2b6-64fc-2d88-8ff6-1dc78e2e738c@linaro.org>
Date: Mon, 24 Oct 2022 16:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 07/29] target/hppa: Convert to tcg_ops restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-9-richard.henderson@linaro.org>
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
>   target/hppa/cpu.c       | 19 +++++++++++++++++++
>   target/hppa/translate.c | 13 -------------
>   2 files changed, 19 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


