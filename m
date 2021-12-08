Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F9046D9C0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 18:32:01 +0100 (CET)
Received: from localhost ([::1]:53526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv0nP-0002ZR-V4
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 12:31:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv0mD-0001me-Pt
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 12:30:45 -0500
Received: from [2607:f8b0:4864:20::633] (port=45822
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv0lv-0000jX-Be
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 12:30:44 -0500
Received: by mail-pl1-x633.google.com with SMTP id b11so1961371pld.12
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 09:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NB9VJkg3K1p9MWxpmDOu8nvLk89O01H7aLBrBuVEtbY=;
 b=EnnLPU20waOgSbZfsBQwbQjoJOpbJgqr8efri37snvO68UE1uxSS8d6ebWAi8JoyYf
 Q8jyAQ02jLwRctG3i/2hTIN8UdgW6f6rvtorP3ZrYqnBe7VDgBJgDgJc7wEZgrVt8/nT
 GvC2kyvnex8RfV+sdJGkUjL0WA2NUDzi1ycGnKwYHZajnhrAz2Dlwzl2XilNsKVwxVyQ
 h+99WeR9vl8eHrazeSW+iHMmWA/AX5mjxDtChJ7QuxFksnaoBPirys8JrdmgbTnzdbzj
 aAsFd7/Ubr2zkEf0FMebvhdaYwYm8GN/JaCUyuqXJElpM2S48UgDoRpOGB/B3E/Wkil2
 Okgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NB9VJkg3K1p9MWxpmDOu8nvLk89O01H7aLBrBuVEtbY=;
 b=H3e+wUUxLRp858K+YMyTCGOmU4SP0D8eghW46vwQ82PMxu0Wy3zoYD8tTBbbVEVtyZ
 X0f28bJjEZCZ+cnyW6voXqGrA8+nycxnYzBsXMqrnuU9/KUHvC3Vp/QFSeaNSRpgDupm
 w16BixLCYCYGh4FebRcPXO/SXWPbmjhYrNpTqB2g5vVTpO6c3RnaSkUKvdMdecRNliqf
 zuuv1C+TawHOziVf1Wyy9H/l8LuFrysGpOdM+fm/xXWGnLAC+KGGevT2w8IlndvWjDAk
 hN6EovFVjCl6pDlGtmZy2v2QBKqNYbYZR/ZTxRj9fE7tma0XYR52BuFbrx1Tgw6MDYKH
 l3Vw==
X-Gm-Message-State: AOAM533UtegoZ5IZH8Jlp3hOF+syQ8NtFdQvP3RwXQXEprk7D2tK5Ytb
 YbQocU1zXy6PbFXzCi0ah7PqBA==
X-Google-Smtp-Source: ABdhPJxHHavxXYndhWWvlWr5wmNB1fQf4FwaShOC8CNsGUQegoud9naJ4jaUUPpZQgFJ99GsC9yXQg==
X-Received: by 2002:a17:90a:17a5:: with SMTP id
 q34mr8775278pja.122.1638984625473; 
 Wed, 08 Dec 2021 09:30:25 -0800 (PST)
Received: from [172.20.1.20] (45-19-222-18.lightspeed.sntcca.sbcglobal.net.
 [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id d1sm4504297pfv.194.2021.12.08.09.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 09:30:25 -0800 (PST)
Subject: Re: [PATCH 2/7] hw/intc: sifive_plic: Cleanup the write function
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
 <20211208064252.375360-3-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <670c37f6-092b-f569-d984-1f640c12346d@linaro.org>
Date: Wed, 8 Dec 2021 09:30:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211208064252.375360-3-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 bmeng.cn@gmail.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/21 10:42 PM, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>   hw/intc/sifive_plic.c | 82 +++++++++++++++++--------------------------
>   1 file changed, 33 insertions(+), 49 deletions(-)
> 
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 35f097799a..c1fa689868 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -33,6 +33,17 @@
>   
>   #define RISCV_DEBUG_PLIC 0
>   
> +static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
> +{
> +    uint32_t end = base + num;
> +
> +    if (addr >= base && addr < end) {
> +        return true;
> +    }
> +
> +    return false;
> +}

It may well not matter for your use case, but this will fail for addresses at the end of 
the range.  Better as

     return addr >= base && addr - base < num;


r~

