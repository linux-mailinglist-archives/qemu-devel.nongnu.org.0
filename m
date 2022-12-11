Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCFA649510
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 17:21:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4P37-0005I4-RT; Sun, 11 Dec 2022 11:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4P32-0005Hg-Ux
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 11:19:29 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4P31-0003Fd-FN
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 11:19:28 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-14455716674so5779296fac.7
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 08:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=htcOxVKjG96eVQoBp+oziytQG+YXvEk5RE0Q2BZh7wQ=;
 b=DcezSFXx7ZByJZ2fGZ8010QmgkIYlXQ4FrUBS9fsrAY6M7a9jFVIIbWW0SZgvrNeji
 S+HTn2FsQwDJ5tx1Ju/ig/680veQPN8WJrRomJ3ZZE8OpZrCSv+PNn3MIllG+3stWBNz
 J4RSR1mty4GpUc4J2CqRu0NRMDJSxC51etu5h/Dzqyp9lPjeHrk6m59gE016brs80HzM
 aQW16a7qp5Kscgm6jOjAVse9zD1ZoUOtZYjnuPTJrNiyAefYLID6HlD06GziDklRP77O
 Ks3TMtKs/3lMJZmOajysE6A2hTJVB825NWxfhrb2CuFsQ+o0CnvaK11ymsNiUMBFcF+/
 SgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=htcOxVKjG96eVQoBp+oziytQG+YXvEk5RE0Q2BZh7wQ=;
 b=GU0t3oIlunkZ9QxJVSsxOyKjWfIxbAss7/W/t/tWYD1YNuDbgC0oOQuFvybR+I5S20
 gOUosQl8k7kVh+MXCX5wkLjAOf+Ly7y9Dk2i+FAEdfQhgSRJIfsAbA9hyFoFJx9XXTBp
 Zz4q2TAuhu5qa5l4FKzmx+PdChTyS2OvhcuZPOOaMaukB5J2izEwRNBErJTd2a5QvkyX
 zbdhNeMH3uoH2BjjpcaiRDpaMEh2dPs4argS9vclZjYRt82/VxdPRTolUTBUywlMBlda
 3EriMuVvmB4GQMg4RRulZsnXMXbpaWxDPgbocwxMTRosVGjqfUw6TNstySUxs0Bklv2O
 Z9cw==
X-Gm-Message-State: ANoB5plFkCWGXj1sMI0fvGiXbuedLcNI7giz66Zhz7Q/YPMw8qTY3Mk1
 MJPB/RV+PzAXtaV3A/orgdn9bA==
X-Google-Smtp-Source: AA0mqf7JRAKdm3cWal0pwBVzOblH1L/WsyMZPm3e3Hd1t+/mfNn+sA+vep0yjhfI9S61Huaqul2kyg==
X-Received: by 2002:a05:6870:2044:b0:13b:cead:54b9 with SMTP id
 l4-20020a056870204400b0013bcead54b9mr6467148oad.26.1670775565779; 
 Sun, 11 Dec 2022 08:19:25 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:7b4f:f28b:eca6:b583?
 ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a056870e2d500b0012d939eb0bfsm3845410oad.34.2022.12.11.08.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 08:19:25 -0800 (PST)
Message-ID: <5872a501-f4fe-723b-6279-5f2cca523945@linaro.org>
Date: Sun, 11 Dec 2022 10:19:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 3/7] hw/mips/bootloader: Implement nanoMIPS NOP
 opcode
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
References: <20221210155502.74609-1-philmd@linaro.org>
 <20221210155502.74609-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221210155502.74609-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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

On 12/10/22 09:54, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/mips/bootloader.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
> index 3a4573118c..7f7d938f2e 100644
> --- a/hw/mips/bootloader.c
> +++ b/hw/mips/bootloader.c
> @@ -59,7 +59,11 @@ static void bl_gen_nop(void **ptr)
>   {
>       uint32_t *p = (uint32_t *)*ptr;
>   
> -    stl_p(p, 0);
> +    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
> +        stl_p(p, 0x8000c000);
> +    } else {
> +        stl_p(p, 0);
> +    }
>       p++;
>       *ptr = p;
>   }


