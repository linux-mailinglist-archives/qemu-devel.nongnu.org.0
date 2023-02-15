Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F031698466
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:22:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNLt-0005Nh-D4; Wed, 15 Feb 2023 14:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNLq-0005Mt-O0
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:21:58 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNLp-0005se-3R
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:21:58 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 d13-20020a17090ad3cd00b0023127b2d602so2858906pjw.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vSyBQMBBdhi2lQxQbMnFwA1JdejF6dqUxDffzPlbHJY=;
 b=tKiHpPHAs33T/mLspthI68BQqfce5Ni8xJAvu9pYT1FoWiFuZ6zgDME1E96q3gO3ox
 0mAAdPpivABnuD8gqZ3aeaMG9gLM6LFCHnkKI3wq6TxMa/WZ5p1UXBBin4qVlwk9H51b
 SdhrAxkIKd8VShKKF3VSri8q5RcYdGkeIMn2ui0mtEduxnIcSnddLe5wPU+xp0oP8dS7
 hGUnwRqJl8hYsaE0IiczvKT7nmJC4Dmy6/1SJ4/2ha12VvXzrbU5DPfX/0dJADT3wc+m
 MoY7TBKW+ld4H7a65zCm6tYb41vtvETjTO1VOC3txURINrnS2AtXF0591FgFfFSLzpk4
 Mh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vSyBQMBBdhi2lQxQbMnFwA1JdejF6dqUxDffzPlbHJY=;
 b=31mGeDdB1Kj4n0hcGSPMCMNUNP1VcPBTxaw/HB+lMASa/iCEE4ExJP17eRHgu5rxAQ
 3Tb0yBeNReDPGSg6lU26NqZPzK1LJHk1DG/u+P+p5cujurxljfZp1NIthQyBMHJ/GGmi
 IgkomjL3IutNnHlL1ZudAoPM/n3FCAJ/kBe01kp724DqvyndZrB6Ff32zIj/4M+gkYk3
 YMqCW3q47P2iFjTvho73x2dIetd0cSGKLOI6PXyuMw8Xz9bfJWi/xyFpKQ4qwObUGGII
 Hciw8gMVxCBwVY3VCHDfwqcXXvq49xJ9jMe0rvn/0E1BYy53PTuAwmaYrBlFPbdrlK7+
 OeRg==
X-Gm-Message-State: AO0yUKVzZGvwCqAeDw1bI1bqu4SFEwnKnlpWR3lmrKqXPREFPjpDJWD+
 B5olKeS8rwmSf1dxWp8DkSFH6g==
X-Google-Smtp-Source: AK7set+P2Rlnw1bgWqAmpq/4jAghANO6ETfn5DqZh4HclWFSLWNYtPZLp8Qh1JbrHdS719fOUFCyJw==
X-Received: by 2002:a17:90b:1c08:b0:234:5e7d:6d27 with SMTP id
 oc8-20020a17090b1c0800b002345e7d6d27mr3396567pjb.42.1676488915518; 
 Wed, 15 Feb 2023 11:21:55 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 l19-20020a17090ac59300b002339195a47bsm1796310pjt.53.2023.02.15.11.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:21:54 -0800 (PST)
Message-ID: <e725dd82-7c93-4e76-c210-8bb6e052d413@linaro.org>
Date: Wed, 15 Feb 2023 09:21:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 20/20] hw/ide/piix: Refactor pci_piix_init_ports as
 pci_piix_init_bus per bus
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-21-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-21-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 2/15/23 01:27, Philippe Mathieu-Daudé wrote:
> @@ -165,8 +162,10 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>   
>       vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
>   
> -    if (!pci_piix_init_ports(d, errp)) {
> -        return;
> +    for (unsigned i = 0; i < 2; i++) {
> +        if (!pci_piix_init_bus(d, i, errp)) {
> +            return;
> +        }

Oh, I see.  You can disregard my comment vs patch 19.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


