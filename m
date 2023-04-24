Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054CB6ED27D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:31:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqz5X-0007DA-Oh; Mon, 24 Apr 2023 12:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqz5E-0007B7-3B
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:30:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqz5C-0005sO-Ds
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:30:31 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so32485905e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 09:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682353828; x=1684945828;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mQy0dcr9/fOKupp9bGMAJiey693TsC3AcN+yrLmVqEo=;
 b=ihN9GyAaPYNrkq79O/MA4TBI9ZGIe6pWRJZpVZmRmzGc1DBvKxMC9lSGSrfgI/IOai
 u66VPKHdrmM1z+R1/zaIe4i77wkAXLlo22QpQN8FYJucLN51i9dis2hadUuHG1uYG//+
 9HNdoi585UScy0dJ5fhlIjudvaS5wi05ykuLLc5x+pDtAj7yOb+1ukBCj2PpA0L4o38S
 IfdbFlxK/FSJ3ZakF+wUQNv3vaQSVgpkg4lZFBNQdnb09q+OWb7FkeGX3DwrVV6StXgw
 Ut7PEDfAJY/G46UnX23yviZ1z0lcWaVKiO6vpZrvXg5SfMbVkn1sZXNwnGiycTgq5i0a
 aaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682353828; x=1684945828;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mQy0dcr9/fOKupp9bGMAJiey693TsC3AcN+yrLmVqEo=;
 b=TUBMCARUNHFZsXbAu0a1C3sqmae/MQ6yriYX0dhguXVWnbP4UREHLS+glQ43giBkDh
 UHGU5UC2cPgMdoNaEjsifV35PefG0E5C9ZU/rqTHQ4PtIYkXVjSnAyTvIHtTnVTvQYYu
 BYQ5IgaySRlYq84d8QToXR4UiqJOGw08YMo0IRoziLJFexNYoqq7sPOYhF+ggk+xcwtY
 sye/X2glr4nTHjT2IuHoUr9kz9zQDWwLabj5S2barmIdAuo0onlduWZdTqpxO22TVmmc
 Ff9ofzy3KWEw1zYHpYbS4fxZkk+LyZxI9YfzZM8F5ZOUfeLbyNQQD6Pgp8sF0EV1SBRW
 4KLA==
X-Gm-Message-State: AAQBX9fr73FT6y6nPYi6bMFfFi+bGTg65TJHgwChiJPaFejCahDi5y+k
 odrBNYiv97Th0beH7m62KwB6Ig==
X-Google-Smtp-Source: AKy350a2RO8inPhlw/1XH+iDFA097sG9vdLlh1J4f4LQUBBbHcyvGSH3lrqxdVZp/k39w5UYNK/gLQ==
X-Received: by 2002:a05:600c:d1:b0:3f1:6ec5:bc6f with SMTP id
 u17-20020a05600c00d100b003f16ec5bc6fmr7887557wmm.24.1682353828557; 
 Mon, 24 Apr 2023 09:30:28 -0700 (PDT)
Received: from [192.168.178.175] (106.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.106]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c210f00b003f17848673fsm12516226wml.27.2023.04.24.09.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 09:30:28 -0700 (PDT)
Message-ID: <e4b17094-2a41-fa46-af52-0318c52cd133@linaro.org>
Date: Mon, 24 Apr 2023 17:21:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/riscv/virt: Add a second UART for secure world
Content-Language: en-US
To: Yong Li <yong.li@intel.com>, qemu-devel@nongnu.org
Cc: Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20230424010132.3334748-1-yong.li@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424010132.3334748-1-yong.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/4/23 03:01, Yong Li wrote:
> The virt machine can have two UARTs and the second UART
> can be used when host secure-mode support is enabled.
> 
> Signed-off-by: Yong Li <yong.li@intel.com>
> Cc: "Zhiwei Liu" <zhiwei_liu@linux.alibaba.com>
> ---
>   hw/riscv/virt.c         | 4 ++++
>   include/hw/riscv/virt.h | 2 ++
>   2 files changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


