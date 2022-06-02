Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2332153BBC9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 17:44:40 +0200 (CEST)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwn03-0001oX-2F
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 11:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmw8-0008TD-LE
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:40:36 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmw4-0003t4-6F
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:40:35 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so5164646pjs.1
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 08:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6XNMpTK0letqpMMwzZOBcXwTmtfSv9vjOp5ITB1VrzE=;
 b=R1ii5BvznDHkc4QVzfowORoSybcmN4jYSKRRpBBG/bE56NgECoqTGS1gwunjmnuVxC
 AWlMsKvyBFMTQfYSRTnEuUmx1YV0cVvJWjaPi60rTB92dnzxOYoroxW/IeqpEwXr1Yl5
 CzdvOjzhbNB2sjRn43LxCEFLK6PVbOuGKFtJOd1THLh77dZPk8T+tsRiLHzAUzne4/PO
 TjuHxyLReUmkSFxFyYBS8j9cdIGs7kRrDwZSY3sfi1gBABhjOUY6t/YQbwhsGeq/8pvK
 /W2gkG0SG0yeL2sA+jM9sL49KGMb9gixia8DukRBCO+RuNx4DNZtuk4ijrSLPiWI1bsM
 QnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6XNMpTK0letqpMMwzZOBcXwTmtfSv9vjOp5ITB1VrzE=;
 b=PJANXtVxDHioAMVRg7bA4xjlO8yksgzqb9isywzSzUXpVaNj0v6JfG1/LLcwPapv81
 bWAloaozQOZDcbGND8sgyPm204cI4iZEkj7PKOXJgf+5230bpn6PazDQ21kDvP9NmF7W
 hzhnOGaP5gIXKHGt7gfP7qVPkzTarCewSWY6BCjTlnNsZcdvCyCTIOWSl5YSMnVxC61o
 r06eQSBsvkVveDlZyiJpOcHhm2cF7RLNKXx5Xa5Uv/9aSmpQAoXeq/8AES6GIFX/D1bq
 yM7XdyPaatiezRjHsMj+B82PypPDaMOouKwfAxN/OxlyKQsNdR/9cSr+8TnlJmLQTmUX
 9qtQ==
X-Gm-Message-State: AOAM532AZ6w4jTQDXsg5HC/ZnTzIGhlF8GZkjlbLsVIvPpAvZggoLuYf
 D6sgoERyHOG7yGif8d6aWffGkA==
X-Google-Smtp-Source: ABdhPJycvZkA9FGD8pHm5/48Iei1mdnUBy+IC70oduE9bIfKpC1qTfQSV5GzlahDF6IylP0twLT3Eg==
X-Received: by 2002:a17:902:7c0c:b0:161:ef0f:9da8 with SMTP id
 x12-20020a1709027c0c00b00161ef0f9da8mr5438128pll.147.1654184425067; 
 Thu, 02 Jun 2022 08:40:25 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569?
 ([2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a170902ea4400b001641a68f1c7sm3683453plg.273.2022.06.02.08.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 08:40:24 -0700 (PDT)
Message-ID: <82fdb645-bda1-5335-c6ad-168e23fe8ccf@linaro.org>
Date: Thu, 2 Jun 2022 08:40:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 2/3] hw/openrisc: Split re-usable boot time apis out
 to boot.c
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Jia Liu <proljc@gmail.com>
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-3-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220527172731.1742837-3-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/22 10:27, Stafford Horne wrote:
> These will be shared with the virt platform.
> 
> Signed-off-by: Stafford Horne<shorne@gmail.com>
> ---
>   hw/openrisc/boot.c         | 127 +++++++++++++++++++++++++++++++++++++
>   hw/openrisc/meson.build    |   1 +
>   hw/openrisc/openrisc_sim.c | 106 ++-----------------------------
>   include/hw/openrisc/boot.h |  34 ++++++++++
>   4 files changed, 168 insertions(+), 100 deletions(-)
>   create mode 100644 hw/openrisc/boot.c
>   create mode 100644 include/hw/openrisc/boot.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

