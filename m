Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357AC6266DB
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 05:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1othyy-0002co-3e; Fri, 11 Nov 2022 23:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1othyw-0002cY-BP
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 23:19:02 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1othyu-0006cl-RD
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 23:19:02 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso9363584pjc.0
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 20:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pH9uhdGtaF0AWIeJlB8FbPYt5YyXxxf/W6S0LpZALuc=;
 b=DXkFoFjR/MWJHe2rLLFlntYaCvoUnCcoCENOBSPiftOzYWc8sWwZ/ogazN5uj0vGsn
 GfNY2S58gR/NHfPzBbvVbAW/3rYITB4xuuAiV/rjKtSXil7XzJomYm7vY20TFkvCgQVB
 i1quvIDntT8iW6J5lP3nItROEdYLjCyBKtcmm0UZPe2J5b0e+it125xSe2T0K7hnQ9gM
 a4pzHnuKRe9XQBo1hzoRUlqmstytKMcPSS9AVCQJOkd5E4bgottianjiVQVePPIrxsD6
 NB8lrFeRq2UMW2+BYfnBRHCR0SQQxg/Oyl1fInW1JLfsnngNF0Mt9jZgNnIkxpxlXiNM
 UOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pH9uhdGtaF0AWIeJlB8FbPYt5YyXxxf/W6S0LpZALuc=;
 b=OC4l1fgOd4w0MyMpLSLSFzmm6MH9xK9WgvoFZGXaqvf1/sCktp2GOm2g8Cl8a3xs2A
 1t3DXutlYkgltHCutmEXEwIgnjFTqiXNzwdA9Wsmhj8utVEECqRamqJxf9f3c9qxjhE2
 KMl06L84dRblt9b3y3nl5SaxJNQR7HMVyMrNYeHrBCku0KPqfRBvCeQUkw87wHkbgxJ4
 0rUm/ahWZ09S7TW26CeKEjFhEWUrZkX7Xl/JmzPzpdIwkso1bBK+znJox6eYUvOV4gjg
 8ROCCH7n/V5dIm94uGfyt0pwHfiypxqoqx/jG3h+vk4xQ9O/nIyOR4LJOZs9owgzisTP
 9m2w==
X-Gm-Message-State: ANoB5plWqLJinOXg4kn3nAF9fO3qf5gHcj4f47aEzrHj733fi/YuzOAj
 q/Pu/OhF3Otw+2dEb9WdRrfFnw==
X-Google-Smtp-Source: AA0mqf4k8iUXpaQG0rh5xqA3g/9vQXHAcBIYtpy57CrlGSXCfkgbg2Xe5vyYCT9tEOvkz1FniSAJWQ==
X-Received: by 2002:a17:902:ead1:b0:17d:a81a:5dc2 with SMTP id
 p17-20020a170902ead100b0017da81a5dc2mr5288554pld.90.1668226738861; 
 Fri, 11 Nov 2022 20:18:58 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170902e54d00b00186b280a441sm2537111plf.239.2022.11.11.20.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 20:18:58 -0800 (PST)
Message-ID: <e5d17f8d-cb93-a2cc-39f8-c9dc972f2bf4@linaro.org>
Date: Sat, 12 Nov 2022 14:18:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 01/20] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-2-alex.bennee@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 11/12/22 04:25, Alex Bennée wrote:
> +/*
> + * Bus masters which don't specify any attributes will get this which
> + * indicates none of the attributes can be used.
> + */
> +#define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) \
> +                                { .requester_type = MTRT_UNSPECIFIED })
> +
> +/*
> + * Helper for setting a basic CPU sourced transaction, it expects a
> + * CPUState *
> + */
> +#define MEMTXATTRS_CPU(cs) ((MemTxAttrs) \
> +                            {.requester_type = MTRT_CPU, \
> +                             .requester_id = cs->cpu_index})
> +
> +/*
> + * Helper for setting a basic PCI sourced transaction, it expects a
> + * PCIDevice *
>   */
> +#define MEMTXATTRS_PCI(dev) ((MemTxAttrs) \
> +                             {.requester_type = MTRT_PCI,   \
> +                             .requester_id = pci_requester_id(dev)})

Any reason these second two shouldn't be inlines?
Anything with arguments gets better type checking that way, unless you need preprocessor 
magic, which is not the case here.


Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

