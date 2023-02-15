Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A264169840C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:01:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSN1a-0000TY-FL; Wed, 15 Feb 2023 14:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSN1X-0000TQ-Ui
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:00:59 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSN1S-0000MH-GH
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:00:58 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 d8-20020a17090ad98800b002344fa17c8bso2786497pjv.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yqjbik306xTVtuPi0oENmMimoAsUlSwmsBcSsjcPaJ4=;
 b=ng1gcdLNC6Icm8HGU4bQKYQ1xPh2IAFZ5W9WqJbksZ4QBPz9UpNWWcpi4BKOJmhh6K
 dQoEJ03bmaaztW9HKshZcfWE7xab8BGITKXa05YbQI0+31IlXt70gXbg0sIumrko7v46
 zV8ZBJmTNOKYaLMIjLBssm+mo7JrlRE9dq4fz97RgYoc/ARFtCe+BDbUb5v8nOkFjRHO
 jo1NqPwE1k525ojAUtHNrXiY0xaTwwHmHz0A/0EwrYJCBdO0GpHTUzSxMHgxNTLk7xcJ
 3LRTGG2Ecw+pRvXzlMCYLjgMw0CGIBUO8G23XJNCwMp5Q5dIbzZh6mcVL6lpKYWiuPrK
 5YNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yqjbik306xTVtuPi0oENmMimoAsUlSwmsBcSsjcPaJ4=;
 b=cQnI/3fgJBJSRUiueczm3Snp0AC/IaSgOCD36712qudBGMlLxD6UIrQTw7pCp+rIxO
 hAIkCWKo9KuyQUBeOBwd+4FAEQZ+n7NyU2V0AP9Mee1em4KywPqiAUy26sju4QKtdf/V
 /TXNgVYxe7B3yR7TPBrju58jhvl5vkpMQ702SakcqQN1SjA/y+oLdFHJY0JnW2Lc7LZw
 47Rt3GYvliC5TtL6fOlnM1Ab11z4by6UUphZGMTPoo4tMlxiueH+JMmagZdZewpyTHo9
 cxepNSo3iuBAUvC1G6MZQSYsm097ihvi05K5mKDkOg8ENZg4PHAtXpi8mkkE3d34MQqC
 u5EA==
X-Gm-Message-State: AO0yUKVjuwowWuqK5BIqDPk9MHZiTNlKHNluG665dqouB+gU1IgVTdhP
 M209EsmBmeH8cf22qDYFHgm9AaSYj9qzDjoJ/EM=
X-Google-Smtp-Source: AK7set/N+tElDE6+Z/f2sRDEifppaZFpHGJZssQVNAyzGqDAK9MmyjDWCnNsxw32vSKOVpXd1HJq6g==
X-Received: by 2002:a17:902:c942:b0:19a:627f:fb73 with SMTP id
 i2-20020a170902c94200b0019a627ffb73mr299359pla.57.1676487652073; 
 Wed, 15 Feb 2023 11:00:52 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 j16-20020a170902759000b00189f2fdbdd0sm12519272pll.234.2023.02.15.11.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:00:51 -0800 (PST)
Message-ID: <bfb6e39e-7bf9-71e7-61ef-aa98e668a698@linaro.org>
Date: Wed, 15 Feb 2023 09:00:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/5] hw/timer/i8254: Really inline i8254_pit_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20230215174353.37097-1-philmd@linaro.org>
 <20230215174353.37097-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215174353.37097-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 07:43, Philippe Mathieu-Daudé wrote:
> In-line the one-line i8254_pit_create() call.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i386/microvm.c        | 2 +-
>   hw/isa/i82378.c          | 2 +-
>   hw/isa/piix4.c           | 4 ++--
>   hw/isa/vt82c686.c        | 2 +-
>   hw/mips/jazz.c           | 2 +-
>   include/hw/timer/i8254.h | 7 -------
>   6 files changed, 6 i

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

