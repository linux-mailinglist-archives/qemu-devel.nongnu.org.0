Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E7F545475
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:54:04 +0200 (CEST)
Received: from localhost ([::1]:48288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzNIB-0000ze-IV
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzMfu-0005H7-9X
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 14:14:30 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzMfs-00037r-L1
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 14:14:29 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso2091547pjb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 11:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7kYVONRiEiCb2zN5kE1riIr4X3nY7DN1Uqdx2gn2svo=;
 b=mB7TrqSNybO/Ov/Dr6iGlC5g5BmX4w7HAbuW/ctOITM3Ec5sJVPCYmKza8/iNPQbdC
 9zz9l1oOMGYm6EEXK8RKa4K01q7VOSZl1jrix8YcsnCwkdCFZ24afIjdPKvqctTcWVXM
 x3ndRsBzTqR4dO8pvUI+xjwfENIk9ef8yNu4kc9qi7QTWcPSvnATilWOhOY9+mrKxu3B
 BDfnfv8NvY2c77puSGPhsyX2r2Z4CeYzocyVWG2d3HvTO087Xwlg7Ynn/HyOz2R4bYcS
 S0D+2567X39KMP9wHvB98Rzi+whFtS43KCD9aeAIVR/UEvOiT0Ly1KrxFncHDih0dWQs
 TH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7kYVONRiEiCb2zN5kE1riIr4X3nY7DN1Uqdx2gn2svo=;
 b=fDJv6A2dRSCBPoslQxiDyBO2N/yhvtGeo7KWPOdebAOMVPLNDiF1MqnwRb0gJSSQQJ
 5Vcg3IKZmQmljmbEaVWEVa6G21qYzjdzqf3ZOBzNcFzUSCY0wb85t56v7EXP5qqK4p3V
 16AXR7DF4wazgEQ7s2po0adT9Gvc68ps2Px0rd4X4XxxoFXS20y1UgMjS9g1NW0+aiv7
 ce3JEzeKzALMVHPwb1dMaq35Gd0qWoRA1GrLPM5p3Q0A+tz23tJcBOMNZul7YOdhCazK
 1yopMmMSAIyPGF6yXAk4zO8A3uDVIOQREiuCOdVj1SIGYygkKqzcx0mCAhF8DlmEgIiK
 kx0w==
X-Gm-Message-State: AOAM531A760eENqNlpWxbb0CSOPkDFgKnyKuT0YyJdU+2bFe0/wGCw7X
 vljIuqwj+ufo3KO9dM1zdWKc/A==
X-Google-Smtp-Source: ABdhPJyB/W6cpJao4eDZoZFnCT09GSAD6NEuYmfFi41nJ9f06uQnihJNbXUFMsnizulHGKpuEFhHyQ==
X-Received: by 2002:a17:90b:4a90:b0:1e8:626c:e1b2 with SMTP id
 lp16-20020a17090b4a9000b001e8626ce1b2mr4510773pjb.141.1654798466759; 
 Thu, 09 Jun 2022 11:14:26 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a17090311c900b0015e8d4eb277sm17380391plh.193.2022.06.09.11.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 11:14:26 -0700 (PDT)
Message-ID: <d0bb1ccd-976e-4a9a-fc8e-f5fca0e8cde3@linaro.org>
Date: Thu, 9 Jun 2022 11:14:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v15 6/9] default-configs: Add loongarch linux-user support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220609024209.2406188-1-gaosong@loongson.cn>
 <20220609024209.2406188-7-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220609024209.2406188-7-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/22 19:42, Song Gao wrote:
> This patch adds loongarch64 linux-user default configs file.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configs/targets/loongarch64-linux-user.mak | 3 +++
>   1 file changed, 3 insertions(+)
>   create mode 100644 configs/targets/loongarch64-linux-user.mak
> 
> diff --git a/configs/targets/loongarch64-linux-user.mak b/configs/targets/loongarch64-linux-user.mak
> new file mode 100644
> index 0000000000..7d1b964020
> --- /dev/null
> +++ b/configs/targets/loongarch64-linux-user.mak
> @@ -0,0 +1,3 @@
> +# Default configuration for loongarch64-linux-user
> +TARGET_ARCH=loongarch64
> +TARGET_BASE_ARCH=loongarch

This patch must be last, after you've fixed the build for linux-user in patch 8.


r~

