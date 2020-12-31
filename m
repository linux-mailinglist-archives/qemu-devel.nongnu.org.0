Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BEC2E7F63
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 11:33:15 +0100 (CET)
Received: from localhost ([::1]:38172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuvGc-0000Hs-3n
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 05:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kuvF3-00088u-A7; Thu, 31 Dec 2020 05:31:37 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kuvF1-0004pK-Jh; Thu, 31 Dec 2020 05:31:37 -0500
Received: by mail-wr1-x42a.google.com with SMTP id m5so19712431wrx.9;
 Thu, 31 Dec 2020 02:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WPx1iocbta06SxpXz6wAK958Jrbur3/ssrv6o1PPK9w=;
 b=Z64TDczLcfhYsKsgZKh7Gpnnu1egr7n1y9Iq+XATpAHrviIYntJhF9O4QdM9IqnlfB
 4PZWSQNfhNEZ9q4IW/+C1D0LjqRBpQ9UWFARlPLvkfFsheMCTFMDoYhlUa8NjNNtrbwe
 5PaOrpVX0jJuG1Hd2nUolvk8TyA8x/CSfgYagXQ5GJxkCx14slVA28xT0LBJZNEtT1f+
 aZMV+XpkE+ggCOtL1+Mz0flb6j37jJuV5su7X5PebBadnXEGRjWWVa59GOfn/6Lh6ni1
 rNl3TLXQlVavOgy0WURwvozYDGw5Tom1XEl2mPDFUuIWobhcuBnLFjxu1d3wpLz4tb1R
 rtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WPx1iocbta06SxpXz6wAK958Jrbur3/ssrv6o1PPK9w=;
 b=dR2rtUhal8PGF+jc27MmrFMIdXs6xMiJ3b4+jaDx7ggXWQB6Lfds8SCoH97eh3UmBF
 4mmRFRrYX4kIyoAdKwK5JYejKq0rBHSnfUGsB8iHAFaNuyWjC9SYnTA7d1moeFh8Ls6N
 9w7yM9ed63OQkoZCcPamn+/6VK0dcGLYAy/bIcQK/pIQXhdx9IS+AuBAkZGiUmIWj1bv
 sFDiPmigQw9jZGojuegaEXgiZlcEgpmDZFB6pePTG+eUuU7lMQPjzuzvg9NrIxxl1CPf
 3+/e4aRQAKaHZMaa2mmhPlCk014oWeWIyHird0eLAL9nakGblffwuBk4cS4bFo9Q22Aa
 vzzA==
X-Gm-Message-State: AOAM532WaM86TCK0R/9VmOFdc9SA00V1GXLYgsteP2tlFv0lv3yMa9kj
 XLb5B4crHBbwaw0A/rRFpkI=
X-Google-Smtp-Source: ABdhPJwbPL/mOuXg3kMJwaSxjwm2Z+lYUgvXzgTXpEx9WJ8fWHJLDtWPi5kHwpt+eMHJj26Ujfe5Vg==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr63353225wrw.134.1609410693412; 
 Thu, 31 Dec 2020 02:31:33 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id v4sm68853731wrw.42.2020.12.31.02.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Dec 2020 02:31:32 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <1608182913-54603-1-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <54a57f94-e0e5-6dfd-2813-a38e374f221c@amsat.org>
Date: Thu, 31 Dec 2020 11:31:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1608182913-54603-1-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.399,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/20 6:28 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> For the ECSPIx_CONREG register BURST_LENGTH field, the manual says:
> 
> 0x020 A SPI burst contains the 1 LSB in first word and all 32 bits in second word.
> 0x021 A SPI burst contains the 2 LSB in first word and all 32 bits in second word.
> 
> Current logic uses either s->burst_length or 32, whichever smaller,
> to determine how many bits it should read from the tx fifo each time.
> For example, for a 48 bit burst length, current logic transfers the
> first 32 bit from the first word in the tx fifo, followed by a 16
> bit from the second word in the tx fifo, which is wrong. The correct
> logic should be: transfer the first 16 bit from the first word in
> the tx fifo, followed by a 32 bit from the second word in the tx fifo.
> 
> With this change, SPI flash can be successfully probed by U-Boot on
> imx6 sabrelite board.
> 
>   => sf probe
>   SF: Detected sst25vf016b with page size 256 Bytes, erase size 4 KiB, total 2 MiB
> 
> Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/ssi/imx_spi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 85c172e..509fb9f 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -178,7 +178,10 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>  
>          DPRINTF("data tx:0x%08x\n", tx);
>  
> -        tx_burst = MIN(s->burst_length, 32);
> +        tx_burst = s->burst_length % 32;
> +        if (tx_burst == 0) {
> +            tx_burst = 32;
> +        }

Or alternatively using ternary operator:

           tx_burst = (s->burst_length % 32) ?: 32;

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  
>          rx = 0;
>  
> 


