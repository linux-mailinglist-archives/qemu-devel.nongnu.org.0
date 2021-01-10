Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F6B2F0697
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 12:18:11 +0100 (CET)
Received: from localhost ([::1]:40170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyYja-00033w-OR
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 06:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyYhz-00024q-7i; Sun, 10 Jan 2021 06:16:31 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyYhv-0005nD-Ls; Sun, 10 Jan 2021 06:16:28 -0500
Received: by mail-wr1-x431.google.com with SMTP id i9so13419725wrc.4;
 Sun, 10 Jan 2021 03:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i5toWxa+Bct64DrGqhY4wcp40g07cf1OYL4IixF/BgA=;
 b=E3wsVnBXwUcn2UOHA3/sbRwnm54GOi8OUjc9eljCRIhI41rJfDjnsWxngs9tyIwm5j
 fkbLZ0NaVB1bUrYsAgLyuIgdqrAsXuJNtHwqDyGzZXnbUbC3aaT3kl1h1nYGCEaYcM0k
 0mlHLdQIi28i5rWoCYuRhSHWdiuXLmLmyuWAZQ4LkqUOWHws7nQBu7PWf/B1btWac5h9
 /gu0kd3cAbX2vHyxA5pwWtuFVovAu8BeOY5T3HhlE2ZGGO5AZrgJbKPE07EKAFVbqNkS
 jhAut1VxtAMSWu4cM8Tf+NfWFlpW8l3C04IlhVUXuxVfxwLXuziKLxtZWWi/xhIWCO/A
 wFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i5toWxa+Bct64DrGqhY4wcp40g07cf1OYL4IixF/BgA=;
 b=fYFAxf1cU7KjtwHuszZNworj6YeJ7Q4otZVzfdFj/OOAN/sB74ZU5g4YHXw39MAlw6
 4A2CAkGVj0KdYzwFGFHSclOBBpVbVd+hT3AZEvd+mMMKRhLBKXx0K5YG9pJvcM060b15
 7KDmuA3tkmgqti7vf156AixKuyj4euyf1GeSCnftw/GYlzZezQYXeYPjAkqsxGv7ZHNg
 ZX//utwUB9DkYvXR9eiMvwqjg0maZjhBDFXOMEwcko3dBSIhiJEA3Rs73UOhk16su+7a
 kdPvVcEwT6may+A1L7MW35jNPr/q2+dFwiwXyVX2KJTL33U36yRNs0GHcE18pvzFRECf
 KImg==
X-Gm-Message-State: AOAM531wuBRAmY62tglwpE8UGWzcICrvlOJwhw9feGT7kOTbSxmenrDB
 odHlfd6cP1sSsxAkaTK6jx4=
X-Google-Smtp-Source: ABdhPJxqLtk4u8qb20bQChtBvM4yCC1HluqoA3UfmUpIPEujDVD0i05BQhFP9kPoFXLnLbLFYBoQ1A==
X-Received: by 2002:adf:fb52:: with SMTP id c18mr11614862wrs.186.1610277385521; 
 Sun, 10 Jan 2021 03:16:25 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id r7sm17937812wmh.2.2021.01.10.03.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 03:16:24 -0800 (PST)
Subject: Re: [PATCH v4 3/6] hw/ssi: imx_spi: Disable chip selects when
 controller is disabled
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
 <20210110081429.10126-4-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <36530f58-0aa7-b861-fbd5-6a41a0cd3a76@amsat.org>
Date: Sun, 10 Jan 2021 12:16:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210110081429.10126-4-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/21 9:14 AM, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> When a write to ECSPI_CONREG register to disable the SPI controller,
> imx_spi_reset() is called to reset the controller, but chip select
> lines should have been disabled, otherwise the state machine of any
> devices (e.g.: SPI flashes) connected to the SPI master is stuck to
> its last state and responds incorrectly to any follow-up commands.
> 
> Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Move the chip selects disable out of imx_spi_reset()
> 
> Changes in v2:
> - Fix the "Fixes" tag in the commit message
> 
>  hw/ssi/imx_spi.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

