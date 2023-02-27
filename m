Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E19A6A4B43
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 20:38:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWjK5-00031E-93; Mon, 27 Feb 2023 14:38:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWjK1-00030p-5V
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:38:05 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWjJz-0004jz-5R
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:38:04 -0500
Received: by mail-pl1-x62b.google.com with SMTP id h8so4622775plf.10
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 11:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D6ZCke9Ay6QSXqhGf6wQj5aEUFvMuz6Te1tcT/t3SPA=;
 b=Vbsx8ggWpKQykf4F3bywn8ek4BRvGQbE4U22CnCAytg0Is7taI2rxm2mL9K9Mw+SV7
 OcH2q7fn4gU/l5tBA53V686QkJawZfiPKN5RnQrJQG2E/+QN6dhXhOqOfO1waJuBz50T
 FnvXRMYd8E1WiNkXQRYkuGTXTMhAExJ8zN83oKTpE72lNmAXPPqKSN2pBOj6Pug1WaWG
 HARljFJFIvToW+yqbA2Ai/AGZqj+yYlRZ/Fw6vN2PJ1YhjOa1nu8QE+dmgLsIFzcNsOp
 70IQzpU29n/nn8Oy9f8Jfm6uc0G1qNntkiQZaMmJAzgg0MCoQS3vUGp0FoeMw8MeCfPV
 AATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D6ZCke9Ay6QSXqhGf6wQj5aEUFvMuz6Te1tcT/t3SPA=;
 b=wArbM4Qf46TZw6xVsaquJMRrQNhvWbZGxUpqi5Il7NhYeFkMEQqHh6Vw672RA30d/V
 OfgKpzIP6bluQy7HDgQon1LYFCUOXmm+xjKD9UQB3+WsHC7jRstpaU9vHcHqocj+xOtb
 UeZwKc5dVVRWVR58S6dV7xON1SA1ZwTpHQ5Y7qQWlEEWyEiTqXaX3k8QIzxS6FZqRITK
 irpuonopj/6Rmvt2BT3Guc/lsBjSIbjklxZBBYZPo3TNoggHLl7TsdYAUwiDHIr/7ul9
 cKFs/sP0PKNAbfs2pAdmj3gqMsdSnoiChVGR0gzrhY5rZmwK8sIIaQ+MNaXl99MZ7GY1
 UYYw==
X-Gm-Message-State: AO0yUKX/gU+LXy0WEK/V9UVkj7eOEq75PS1vD82wqq8mhXGX1+pcF2a+
 +3g7M71HaaueERM0QWkahTZR/w==
X-Google-Smtp-Source: AK7set8V0l1fR3IPF5BoOEVg2Q3G3GaO2aLlcf809SLb0EJZzYelrG+3tkv/iSDL1FWZGc7f3qN06Q==
X-Received: by 2002:a17:90b:3810:b0:233:e9db:bd7d with SMTP id
 mq16-20020a17090b381000b00233e9dbbd7dmr326165pjb.23.1677526681256; 
 Mon, 27 Feb 2023 11:38:01 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 o23-20020a17090ac09700b00229b00cc8desm12913620pjs.0.2023.02.27.11.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 11:38:00 -0800 (PST)
Message-ID: <72f9cd37-3aa2-d268-629d-11754c7df34d@linaro.org>
Date: Mon, 27 Feb 2023 09:37:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] target/loongarch: Implement Chip Configuraiton Version
 Register(0x0000)
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn
References: <20230227071046.1445572-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227071046.1445572-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 2/26/23 21:10, Song Gao wrote:
> According to the 3A5000 manual 4.1 implement Chip Configuration
> Version Register(0x0000). The manual does not state that 0x0018 is
> reserved for the vendor name and 0x0028 is reserved for the chip name.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.c | 2 ++
>   target/loongarch/cpu.h | 3 +++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 290ab4d526..d1c803c9d6 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -545,6 +545,8 @@ static void loongarch_qemu_write(void *opaque, hwaddr addr,
>   static uint64_t loongarch_qemu_read(void *opaque, hwaddr addr, unsigned size)
>   {
>       switch (addr) {
> +    case VERSION_REG:
> +        return 0x11ULL;

This one is back in manual v1.03.
I can't find manual 4.1?

> +#define VENDOR_RESERVED_REG     0x18
> +#define CPUNAME_RESERVED_REG    0x28

Since these are unused, perhaps omit them?

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

