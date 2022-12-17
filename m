Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD4864F65E
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:34:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6L9W-0003yk-DB; Fri, 16 Dec 2022 19:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L9U-0003xr-D9
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:34:08 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L9S-0004PX-2E
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:34:08 -0500
Received: by mail-pg1-x536.google.com with SMTP id 62so2815722pgb.13
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zks5CY+W9Pho4LXKDAxl6+bG7Iz1efNDNfT4XHB1pXk=;
 b=CwZZBytAiRN9cUiS+lKT8jn4dh8eF8O7GLSdLnFWEsGdR/ayS4I7bOxASXvLIRrEda
 +NsXz1WKeXIp/oI51uqOsVEVzd+J42/0kypxMod7rRYfOjetAKQMgfFCkjbgoXuTpsL7
 MTVHB6536WeDT6GhY/clOwGJVqNukeE9CbSphsCZC3ODtSmXLDNvzNXRdF0CP05bBOy4
 8Ic2sG6eE4FAHteSR6ZMQsDePxE4gxIbvqEs9iMt1/U2rrfIMnU7MaQsWOvcleYoO5HY
 V3gfCnm8jRG5K0olGJwVMi3sZntJR+OWVrGfHlya2dlyYFiScKNAHZMmyyejCeNDPB2A
 ZZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zks5CY+W9Pho4LXKDAxl6+bG7Iz1efNDNfT4XHB1pXk=;
 b=3JEUH4+TVhZlQ45tG1h+AEsExLTHKIVcoJv5ALYjOWVDJ9wQwH+Urq4KhkxHV8F92i
 nes/wGog39lyrQdwmBXNI2ybHXiMJo21OsqVxSEeNT3EEZwHbWQ0m/JTpsjV8nDtQ6p6
 GUxfBoJzN5KRGbLqaa7FHNViSu569jlofEeMZjW8yISQ9PPV+xWKWKHCG/uXsSW3UMGt
 tkenNe2YaF4CfDciUJ4NoI6A1dGVeDbCNHWXkWIIgpLqvlWT87ZksxW9HD552pMDNnZx
 Cu/BymLa81kAel5HVxhVX0jtfFpgABTugIGT+2TXtYSh6oALuo8f7RCkKywt3eVaqZbw
 +w5A==
X-Gm-Message-State: AFqh2kr1ZhF+TMknAHlQLcPjVMzbR+rwwOKSiBFVA9jISiz/c/01RF1A
 xNsiKUH6ZnnMGTwsDJQ8mlI9BQ==
X-Google-Smtp-Source: AMrXdXt3wbHBozR/juTT5fozuutQ++NSiRDI85yiLJ/sA2jEK1oz5BKCbCJWkBHOew5lXU0DqNS9cQ==
X-Received: by 2002:aa7:9850:0:b0:566:94d0:8c96 with SMTP id
 n16-20020aa79850000000b0056694d08c96mr321268pfq.26.1671237244612; 
 Fri, 16 Dec 2022 16:34:04 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 v185-20020a6261c2000000b0056da63c8515sm2092151pfb.91.2022.12.16.16.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:34:04 -0800 (PST)
Message-ID: <28820b30-7a8b-6caf-2c4d-74a64a68beab@linaro.org>
Date: Fri, 16 Dec 2022 16:34:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 03/10] target/loongarch/cpu: Remove unused "sysbus.h"
 header
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
 <20221216220539.7065-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220539.7065-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/16/22 14:05, Philippe Mathieu-Daudé wrote:
> Nothing requires SysBus declarations here.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/loongarch/cpu.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

