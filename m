Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF6264F66C
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:42:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6LH4-0001k2-7s; Fri, 16 Dec 2022 19:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LH1-0001jS-RO
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:41:55 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LH0-0006Mc-BU
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:41:55 -0500
Received: by mail-pl1-x629.google.com with SMTP id x2so3840007plb.13
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iHMfgcJ27mHobZfw2i+QqcqBFZLqxaTDvDgPVYSK/Gs=;
 b=IV90rSZeI+X+b71xJwvuSM4jeFsayik/aGUOLIayQt6UfMfvcsoysxZmaQLbu5jUtD
 2E6Fcd+znKtlr3oTw9pdGYzkolKp1AtZJkuTjP7lStRgQ1pkrL4fL7TkXnVLp/jOZ/jD
 eNSdcyuInLTCJ/EuS1aACiNtrKRYE8s5PjIL26QGunHH0+WqJEFl51jopMtjbuJzSqT9
 SK3K522C+0LYx7ycRlCRPcMlEfIx8qk+tooOZD/XhpFy0+0ATMlvoCUlTxGIKSuUlG+k
 hqqCrTU6SsMdHmwsg9eQO+v90BiM32iY0kHLQmIuvOKXjerOQD5eoPOAMUBQvOnT17AO
 XGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iHMfgcJ27mHobZfw2i+QqcqBFZLqxaTDvDgPVYSK/Gs=;
 b=AYa10H3LIH8p3Ii+F7HM0lMyHujQg5IM8AufdyeWLctJIPTT8RrY+n7KOidx7soAvO
 T+A2rT6eOu/HXROgcA7H0LU6WpMVS0IFXU/DRsnvua934791PRaDZmLcAQ9thcsqa+JK
 H5RuVj0jGzg9PZ16XL0Z4MAiehZgLuTKGXuwV86CzCcR/n+bTpHBImUCfNZMH7dy6bhV
 QuVA5XZtFG425Pcki74TtdVDto8cEsb0xZznUlUa+/9KctdDPsfbB9CGW5FBWMMHAye3
 T5ecF3zxlIDBZ/9lshTrF9UmdW3MjEGGQMuqk+zaPE5u19lUd4ySaEKdqo8oHsxyhgmD
 SRPQ==
X-Gm-Message-State: ANoB5pliv+EBUOCt+3TqMP8XIM/pjVmJQnZm3iNV9HvubuAno5JBQLgo
 zCCJNc7A/2WQsDw44T4E0e+A1Q==
X-Google-Smtp-Source: AA0mqf6uTH/UGr/SZu5nUREN9+9OrwnoFUCeKOMyOIfFnSgIcOtXAn2HBQzZASSdNxSVqSyXZEMXpQ==
X-Received: by 2002:a17:902:c3c6:b0:18c:cee:b265 with SMTP id
 j6-20020a170902c3c600b0018c0ceeb265mr22308290plj.53.1671237712825; 
 Fri, 16 Dec 2022 16:41:52 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b00188b5d25438sm2234152plh.35.2022.12.16.16.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:41:52 -0800 (PST)
Message-ID: <12a2f05c-16c6-d1b9-c151-e33739ed6397@linaro.org>
Date: Fri, 16 Dec 2022 16:41:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 10/10] target/xtensa/cpu: Include missing "memory.h" header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20221216220539.7065-1-philmd@linaro.org>
 <20221216220539.7065-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220539.7065-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/16/22 14:05, Philippe Mathieu-Daudé wrote:
> Under system emulation, xtensa_cpu_initfn() calls
> memory_region_init_io(), itself declared in "exec/memory.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/xtensa/cpu.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


