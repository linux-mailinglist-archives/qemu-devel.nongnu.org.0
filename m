Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F5444C026
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 12:33:19 +0100 (CET)
Received: from localhost ([::1]:37984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mklqw-0004pt-UB
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 06:33:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklpd-0003ra-B5
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:31:57 -0500
Received: from [2a00:1450:4864:20::329] (port=50885
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklpb-0007V5-7T
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:31:57 -0500
Received: by mail-wm1-x329.google.com with SMTP id 133so1886559wme.0
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 03:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GpT5Vgn46qco/QbqL3TPeFY6gev9zMkidHKtnQBQiqE=;
 b=eTVF20Xxl0s+XKKee9OxOOf9I/3V/JPlbrAClRXuzp4ApZivT/IauRDcyU33dksP+h
 +8e7udyXUEgGL7K6jxkUEwUtCb3lsMTJ3Sz4AUtI7ZMZGq25aznkEOfOlfFtpMJ0LPTe
 iqf469qZ59EJckZLUVzsgG+DwUwkGXY1dio0BLpn/O5OnHLyZXJU28ZRSSpSLB1n3KVW
 k4HQlcdQStY3wlfPs4x/7ggboBpkjCwZceUI9jCcxEL6GLTOhUCKVgWkMkJGJ+vkA1gH
 RHeI9Y0BawMik29TKOqOuea9YoOjzbKGI6zGPsKzPqfz6S7Noxm7CG3AkXjbn92Pv19a
 SeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GpT5Vgn46qco/QbqL3TPeFY6gev9zMkidHKtnQBQiqE=;
 b=0hWCNLrolno8kCKxr4Zgs/1hO1GZrD9Ooi7sAGgjotfvZBSCYpzdhKisAX4+eHUcCl
 N+/Yk/cAtpv4O8+cTE7CQh6pRHiv9ue5t7AFzVc1YxjaF8G/mmcjndmEjaqYBDaRljUe
 GOIrOFQYjjCZCKiMlkwJioxsMTXAmvEzv3BwD82Y+rxZl4ZraAVh43pR5x6ZKb6V435e
 15kP1t4uvn6p8rH0nVXtSRL2DL1BLW6+QU38yRfP9dMNdszQGu4/dpro2j/kjjsfj3V7
 eAYkQH968X+bt/kI4ctvhWYBDFPxxVgQHzSCRiRv8apxgUi926bC5Wu7c+9raIsQ7STY
 deKA==
X-Gm-Message-State: AOAM5319LnCfyxNstskeEbxG7jESJxV/Sq1TqDXTxmLbhDBioTvXLNPt
 HawdNq/agEJS4nbgb0GT7536tA==
X-Google-Smtp-Source: ABdhPJxKSUSDA2nkwGFAGOT/qyDLeF+CuS1Tujewfi7SPkkb/mqtckau4QzakRXstuET+zAECNfRJw==
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr15437677wmi.139.1636543913761; 
 Wed, 10 Nov 2021 03:31:53 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id u23sm16402438wru.21.2021.11.10.03.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 03:31:53 -0800 (PST)
Subject: Re: [PATCH v2 09/14] target/riscv: Relax debug check for pm write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alexey Baturo <baturo.alexey@gmail.com>
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-10-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3dcee028-4020-b8ca-e98c-92af22a5ed9a@linaro.org>
Date: Wed, 10 Nov 2021 12:31:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110070452.48539-10-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 8:04 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/csr.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9f41954894..74c0b788fd 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1445,6 +1445,9 @@ static bool check_pm_current_disabled(CPURISCVState *env, int csrno)
>       int csr_priv = get_field(csrno, 0x300);
>       int pm_current;
>   
> +    if (env->debugger) {
> +        return false;
> +    }
>       /*
>        * If priv lvls differ that means we're accessing csr from higher priv lvl,
>        * so allow the access

Seems reasonable.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

