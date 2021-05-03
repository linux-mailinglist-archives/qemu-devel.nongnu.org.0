Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64D5371947
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:30:37 +0200 (CEST)
Received: from localhost ([::1]:51800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbSu-00007U-S2
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldbQ7-0006br-VT
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:27:44 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldbQ5-0000K5-V1
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:27:43 -0400
Received: by mail-pj1-x1035.google.com with SMTP id lp4so2000652pjb.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dYrEU+nipR0bNudJwCmCXvG8W4obmoeVcSZzgFtE4sg=;
 b=i8CU7PXju501v/5iCF1iXnGWMAUUVKojbZaj8qks17VAYD1Jio04g40fJJNDXcdQ/+
 zJPJcx0BNeMXzg4MF6eZaISvxOUuxOBGVYA4GbedwFUl9fbBvcUbEK8w0H3lsQsG78Ve
 VSxjY2PVxFNBLIYAiBMK8FIkYuzyWL+JdLWL2yeDv5b2UU6+gO486LnjqvAf2v3pgy12
 dspmvmGQqe7sXanL9uwHmHbZXZ8z9UEN/pSSEShCdd11qnzUikMAg8aSt8tNAYn3bIRV
 amzdLCNT8Bfm9PEk9jQ0OnRS/GwIlbJaG8ewHaWiIqZMSsjD/EeF7AsZP6L9YXH6Bg7e
 q/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dYrEU+nipR0bNudJwCmCXvG8W4obmoeVcSZzgFtE4sg=;
 b=RccXSRQ1jngwktlRVfrfBWctF8U408y0PSAK2h2IdMr9SADM3B7iIKp1BHlOh7aC+h
 5nqlEhYoAJeYulqOM3adFSdu1yq0cpYkWFXxJH89G88bYe7yJ6H0V1zL8jA3hpIMtLZy
 p+MamwrERBQfF7dpzD5X01LfZ7Hkl1Lo9+WpdBAm7oytQvOz7PWdX63ogN3hFWYx2BzO
 ULKlHHD9cbj1piVU3QpWghpIReEADAUg3Xmof+pzdYOcBowcsoiq/O+aBKcPuI9pRst2
 K6cuLJGZojkHI6tS2yKTG7HCao+juFmb2mYGdyZzDuOhkR/y/Nx7/si1W4LHak9wW55C
 JjZA==
X-Gm-Message-State: AOAM532b620z2aHj/HHYRrxt4Kut2m1MTIM3nIxQPTO4BFVL5M5TzktY
 c34VDH15dpeiP388rEhNgVyDo/BW2tfG6Q==
X-Google-Smtp-Source: ABdhPJwBi9zy+0qOJSfMQ8BZHiFhcN2v7U3LFSUQeZwhS9H4NZJMhE0Mxb2wgw6kpdKxN25/3jDsvw==
X-Received: by 2002:a17:902:6b8c:b029:ea:f54f:c330 with SMTP id
 p12-20020a1709026b8cb02900eaf54fc330mr21160994plk.10.1620059260810; 
 Mon, 03 May 2021 09:27:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 31sm87444pgw.3.2021.05.03.09.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 09:27:40 -0700 (PDT)
Subject: Re: [PATCH v2 6/6] hw/sparc/sun4m: Move each sun4m_hwdef definition
 in its class_init
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210502185441.599980-1-f4bug@amsat.org>
 <20210502185441.599980-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d29589e2-ae7b-0569-d422-e59642f2fdac@linaro.org>
Date: Mon, 3 May 2021 09:27:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210502185441.599980-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/21 11:54 AM, Philippe Mathieu-Daudé wrote:
> +static void ss5_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
> +
> +    mc->desc = "Sun4m platform, SPARCstation 5";
> +    mc->is_default = true;
> +    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
> +    smc->hwdef = &(const struct sun4m_hwdef) {
>           .iommu_base   = 0x10000000,
>           .iommu_pad_base = 0x10004000,
>           .iommu_pad_len  = 0x0fffb000,

This is incorrect.  You're creating an anonymous object on the local stack 
frame and saving a pointer to it.

You need to use a static const function scope variable.


r~

