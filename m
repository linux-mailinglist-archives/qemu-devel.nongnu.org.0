Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E83698577
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:22:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOHf-0007aW-TP; Wed, 15 Feb 2023 15:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSOHd-0007aA-8U
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:21:41 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSOHb-0008D9-Jr
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:21:40 -0500
Received: by mail-pl1-x635.google.com with SMTP id i18so13018189pli.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K4YTFx+GgrvnPkvciwZNt5ZuA3g5RS00z3ldgstfjV8=;
 b=rnXFRJTdF6n/ZEtZQwxBmtBiA1FLBqrkTh5hYdSjLVxaSzHkOGtQMIwEsDd5/d0gI4
 c7or56IUdCHdDO/TVTwQM5/JXDpyLl+eWVSnVuerAhk1thVQ1PJZqOa4Lacs2ggAy5zc
 ypCOWrwxn/2IGsi86HJHQqpSoB5L9p7gH8H9x6Zbnog1Wn4lFUg0UjN8VOgpPBvtvhpm
 ZdxtT7NKOX5MPE4LvdzKZfeLHIDEsF3fRpnfXfaGUfUUn9ci2CNAcqlcQ6w154qYrtW0
 gdL7JYR2vfQBpc9qVZDy3BVEGW1KU+V8PQjN4ns+81cqSHwspZUGok5qqv0ldxZ8nwvP
 SOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K4YTFx+GgrvnPkvciwZNt5ZuA3g5RS00z3ldgstfjV8=;
 b=U128dakvQTVXxSHqrFBNuSZ7TLj5nUyxFkGQ5Sk1D1adURFmIBRoSr+WVEyFS1vHTZ
 6DZm6laOQtl8iuXSIMAXQtzNSTJM6OFHg0mmcLxgy7yCqFU/vJ+iKhIAnKeCwMcWe1uT
 rl+3sM2PVdT/iLUCBzr9EMehdEE4iTLJ7+3G0IxFu2+Aa5ehizGEItiYrV/DO94tQ19y
 EXqIq+6KNBljNlN07lrQbJWlRu09TBITec2bRDnYUGAc22jCXkvnuCGvsmuYffAwhXiT
 +V4MWpIOMFnnb2CDwRkl1eFNwKiekdJsaABx+iqXIfG51RZCRFWifihbq6fTvIB5RBt2
 l1Cw==
X-Gm-Message-State: AO0yUKVMIPWlYn8pBaRRbnM1B4DnpXetBaWGG8tSIBhLfB3lejIo3HLn
 IAgyrJ7RIpBKzD2ph++z1f9p2A==
X-Google-Smtp-Source: AK7set/7+rQwRG5Er+H2sHtuKbtq7bvMkg9t3JO6VeIp+VbszGPLxMIX3x0PeEiUJTMpYCndS2H2uA==
X-Received: by 2002:a17:90a:cf8e:b0:233:fa78:7c9e with SMTP id
 i14-20020a17090acf8e00b00233fa787c9emr4392636pju.12.1676492497813; 
 Wed, 15 Feb 2023 12:21:37 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 a3-20020a17090aa50300b0022bb3ee9b68sm1897387pjq.13.2023.02.15.12.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 12:21:37 -0800 (PST)
Message-ID: <645427aa-2630-a2be-9f1a-bee60a2d2885@linaro.org>
Date: Wed, 15 Feb 2023 10:21:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] target/mips: fix JALS32/J32 instruction handling for
 microMIPS
Content-Language: en-US
To: Marcin Nowakowski <marcin.nowakowski@fungible.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20230215084754.3816747-1-marcin.nowakowski@fungible.com>
 <20230215084754.3816747-2-marcin.nowakowski@fungible.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215084754.3816747-2-marcin.nowakowski@fungible.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

On 2/14/23 22:47, Marcin Nowakowski wrote:
> @@ -4860,6 +4860,7 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
>       target_ulong btgt = -1;
>       int blink = 0;
>       int bcond_compute = 0;
> +    int jal_mask = 0;

Better to limit the scope of the variable to the block below.

> @@ -4917,6 +4918,11 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
>           break;
>       case OPC_J:
>       case OPC_JAL:
> +        /* Jump to immediate */
> +        jal_mask = ctx->hflags & MIPS_HFLAG_M16 ? 0xF8000000 : 0xF0000000;
> +        btgt = ((ctx->base.pc_next + insn_bytes) & jal_mask) |
> +            (uint32_t)offset;

Ideally we wouldn't have one huge helper function, and could pass down the mask from the 
translator.  But that's on-going cleanup.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

