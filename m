Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B038262ECCB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 05:17:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovsnZ-0005eU-TJ; Thu, 17 Nov 2022 23:16:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovsnX-0005df-VL
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 23:16:16 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovsnW-0002RU-AX
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 23:16:15 -0500
Received: by mail-pf1-x433.google.com with SMTP id b185so3762145pfb.9
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 20:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NzOZtz2cD0xKNyx5/eDpDpQQLlAGNghQZrmpNSSiPYE=;
 b=cBy/c6j50IrR/d270QYBUuFX60vReR6VO5P5g+Y3ZgHB8uA9MLVBsxQl5JZjyVgU+O
 n8pc1HPsBqAozoMCKTDucG0JUS5pcDNcFz2qvoOaBbbNrHHfVvmICv8KhIHrvUIhE5Fi
 5JrqYb2okzKGAm8MRL08s6qWDZrCHmgMvYv8xxQBeNBEK7DqdzEwZDE4iQ1cqRrmwmMJ
 IM2blDaQv3C/YX2j3xMxtdpEyo8X1YS6qFCadOJMQQ/EvZE7BjSvL7aE9iHaOAC/sY+A
 /xcUktuA5jYNDvrgWz+SkgZ24Mye05SpGjMAixCTZYHEs8tjfV/U8Ybr7D2q+e6ofLbM
 tfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NzOZtz2cD0xKNyx5/eDpDpQQLlAGNghQZrmpNSSiPYE=;
 b=Upcsy7hsGnbdsYkYwsLh9Faa6xdDF7xhkeYjwQLfMRc/7fec7H5I9WfOGVaMDrxOGl
 XP6aMTE7iJetXbbUGHoaOZhoOBiMexMXRGbWbzzwg694YjLYUCQTOWrlg6rTvu1hw0Te
 D6OIXc9pYf5b2eh9gD/t8rDLyjCKT2HpjOM8I69Aks+zJ/ouOKTkemqI55rxJr3n8blc
 u1Eh5ImkiQ7Lm3KGpR2X30hOrzkGzvPbwFdgFFVFLl4FVVdqiwziIQp58no4N8SozRKr
 G2+N4Qm1pExHryC3LjQYE3utaVwvCALfGrodfGF98wj7ytAYcCxtExrGyY+9XymJ07rH
 T3XA==
X-Gm-Message-State: ANoB5plewVh8AygZja+LK5zX3KR93pbExIvCbtQQqZAE/qiyWQ1/3RFH
 MlDaGuqmIXZjfcqS/A1KdoW1ww==
X-Google-Smtp-Source: AA0mqf4u+btUjTpZev24w5GB8au5eW/K1SGEmiuneiw5dH1qCp6JDsfCZKEJeROfqzxq2GC/jS3oVg==
X-Received: by 2002:a62:65c3:0:b0:562:ce80:1417 with SMTP id
 z186-20020a6265c3000000b00562ce801417mr6082431pfb.19.1668744972631; 
 Thu, 17 Nov 2022 20:16:12 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:90b2:345f:bf0a:c412?
 ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 x15-20020aa78f0f000000b0056be4dbd4besm2003330pfr.111.2022.11.17.20.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 20:16:11 -0800 (PST)
Message-ID: <7cbd3750-23fc-6f60-5648-42ba3c785bc0@linaro.org>
Date: Thu, 17 Nov 2022 20:16:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] hw/loongarch: Fix setprop_sized method in fdt rtc node.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn
References: <20221116040300.3459818-1-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221116040300.3459818-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 11/15/22 20:03, Xiaojuan Yang wrote:
> Fix setprop_sized method in fdt rtc node.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/virt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

