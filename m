Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7DB6903EE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 10:36:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ3KJ-0005Sb-DQ; Thu, 09 Feb 2023 04:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQ3KH-0005SK-7n
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:34:45 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQ3KF-0006rw-IH
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:34:44 -0500
Received: by mail-oi1-x234.google.com with SMTP id bx13so1127713oib.13
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 01:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G1lmfvxAWzUgVJy3T6U8BQVMZEKMgEo2vXB3KHcfUqg=;
 b=nmcIsJpKM2TPSP2Xo+aCq86pon3Hiha2k97OgkfFZvpB0b5zpsnEwN5lkVzyznKAe1
 UKGLZ+DopKsSVjbHFJGjJdOrFtxFKIwSk42gSzj5aYBz0HOnzU7znaL6d8rep26DL3Y7
 WMM2A+vEhQqwvHAdrRxAzf8VJlnt9Ca8qi5Law5fxwQ3GgPISfi2hwEtZfOnn5Gew71X
 hnMaD8WS374wZDhFB+jRZ+H6wJay3qQkVLsMACfmqJhsug9kb0dZEB98L2KullRETlzP
 p8mtmg3rmRLPKyO03ikQOtEEypU1aT0l7nrbz5KupfKtO4Fjdv5dTRbLeNboxcMbDMFS
 PKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G1lmfvxAWzUgVJy3T6U8BQVMZEKMgEo2vXB3KHcfUqg=;
 b=KXcGZBWPLb+HCL54MQl9Ev0eS6WcMPeWOyeE9rMgoS3mzjsGKlPwQmE5/mkWBGQI1G
 ZNMO1PPLvG26/NXYd5TVlcLp50EYAcfnO01z6Nj4+NyQkDbTkHk1fhDpm0lUaffStyTb
 eoHX/Zy40AJDhuIKr3u+YIXRzoEfbkrPrKF92oZ/S+00v8grCs3AMRfao2NmItzjDKgm
 rC3jwkLO0G81hlsS6yoPswlYa6u3YnJ8gyy5tMqzUdTCWzpgakzn2YSWrLx3srzxotsi
 89BvCVAv9HaNtqx2/FTjWXC/8lB5wWzcTOYC5BqJmtnuEtHh1wfER+zd6t3i2Rs+ba4n
 XulQ==
X-Gm-Message-State: AO0yUKUVBRzyADUMFgUrKANfJJ9V65Vit8VWc/n+gmWtxr8E7qAdVpD3
 ksZkzLRi+0c1iP56Dw9xJQvpqw==
X-Google-Smtp-Source: AK7set9rX+7qq6zGdDPRocisZFntESM6ZIN8B1nyWUCzQtFY3P/KdTCW3/ODEP/TzJwtp1BQB8w0dg==
X-Received: by 2002:a05:6808:dc7:b0:378:6396:13cc with SMTP id
 g7-20020a0568080dc700b00378639613ccmr3802297oic.56.1675935281972; 
 Thu, 09 Feb 2023 01:34:41 -0800 (PST)
Received: from [192.168.68.107] ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 x133-20020acae08b000000b0037868f9e657sm564747oig.37.2023.02.09.01.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 01:34:41 -0800 (PST)
Message-ID: <9e5accd3-9602-ac66-fc17-2d341ffe2821@ventanamicro.com>
Date: Thu, 9 Feb 2023 06:34:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] MAINTAINERS: Add some RISC-V reviewers
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com, alistair23@gmail.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, liweiwei@iscas.ac.cn
References: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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



On 2/8/23 21:33, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> This patch adds some active RISC-V members as reviewers to the
> MAINTAINERS file.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   MAINTAINERS | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96e25f62ac..847bc7f131 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -287,6 +287,9 @@ RISC-V TCG CPUs
>   M: Palmer Dabbelt <palmer@dabbelt.com>
>   M: Alistair Francis <alistair.francis@wdc.com>
>   M: Bin Meng <bin.meng@windriver.com>
> +R: Weiwei Li <liweiwei@iscas.ac.cn>
> +R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> +R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
>   L: qemu-riscv@nongnu.org
>   S: Supported
>   F: target/riscv/

