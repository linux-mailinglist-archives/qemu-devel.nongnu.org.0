Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A56325F94
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:01:44 +0100 (CET)
Received: from localhost ([::1]:57448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZ0I-0008F9-WD
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFYxh-0006uj-6J; Fri, 26 Feb 2021 03:59:01 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFYxf-0000hU-Gr; Fri, 26 Feb 2021 03:59:00 -0500
Received: by mail-ed1-x534.google.com with SMTP id p1so5504237edy.2;
 Fri, 26 Feb 2021 00:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yhcsVJDCGmO8vdquAAVbJ4OUoDKYZvMoi0HpKCVmDdY=;
 b=jCzErUQsT9GmAJgLFvO/LTPFshxj8yX50cIsIkcKYkz8iYvxHF6uIKf0QXTrvW+b0v
 MbxUi7loxRlpMeJLHPLwYlnBl6rx8az/gKvmCShRyWKMiqTc1fEct+xQQVDym2f4PRV/
 w+AyrG6TktPuDKl/SfJevSZNM1Velx8RWvSAJAU5pbTg02PcDX4j/H06TssaWTcmWgEr
 cQlCwATY/2u00IzfZZumAI+H4DLp7ttGbWu0iLq5/jyuUR7BM97KSNmFcjJSdWbo1/vd
 XFumCIsocvd8nkPgrMzAwplBKBw6woOitg+hBEKs3SwGCl16di2a4jN51FogjZJl71u8
 Yc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yhcsVJDCGmO8vdquAAVbJ4OUoDKYZvMoi0HpKCVmDdY=;
 b=VzHf9qayzgY6Qyc6yR1TE0oWgvXflzp9A54GKdZv0NRofQP4saHFF4CYC4BG3QjBGJ
 CWca7qCSU42V1qEaZ05S8RAo6StTqaPcHlgpjp2g2SKNHG+3j4qEzxwYg8YRhLZknof2
 wvk5DHWMh1ip7B+Q5I+N/JL2raVO3DdjHXG4MAGfoPzNYh5RzHviD09rXZ2dUticPEx3
 U7jtjRyGf+31UoqFMbNNxZKrx5fzN4HFdpEvdrGilUrkgj+t/H8tlLuThxCH8Y5EK7Lh
 I/6tkUSuYlllHYqSgEYLDDtGFAE5Qm6Otijb5SdK6rL7dmhVwwRM8k5PsW+JpjAH/fhF
 9UdQ==
X-Gm-Message-State: AOAM531nXKfGJphB/82E+APWQjLmyQ9E4LJ1CXtVJ/ROZFZRNXvg6wxw
 WpmmmqRBGIIHyBJ3qZ5LvO9VkCQjggg=
X-Google-Smtp-Source: ABdhPJyZt5vb/sxukamoEkrFDdieBnGPpwZQi1mIZKiX1rZLNcFbhs/DbOB3VPSg8uh3okQh89YZGw==
X-Received: by 2002:aa7:c58a:: with SMTP id g10mr2138393edq.243.1614329937213; 
 Fri, 26 Feb 2021 00:58:57 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id kd13sm4806344ejc.106.2021.02.26.00.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 00:58:56 -0800 (PST)
Subject: Re: [PATCH 2/4] arm: ast2600: Fix iBT IRQ ID
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20210226065758.547824-1-andrew@aj.id.au>
 <20210226065758.547824-3-andrew@aj.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c74d23df-d90b-93e8-fe40-7de905b5af3e@amsat.org>
Date: Fri, 26 Feb 2021 09:58:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226065758.547824-3-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.435,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 qemu-devel@nongnu.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 7:57 AM, Andrew Jeffery wrote:
> The AST2600 allocates individual GIC IRQ lines for the LPC sub-devices.
> This is a contrast to the AST2400 and AST2500 which use one shared VIC
> IRQ line for the LPC sub-devices. Switch the iBT device to use the
> GIC IRQ ID documented in the datasheet.

[*]

> 
> While we're here, set the number of IRQs to the allocated number of IRQs
> in the datasheet.

Please do one change per patch. This would be the first change,
and [*] is the second.

> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/arm/aspeed_ast2600.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

