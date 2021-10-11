Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007054298C8
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 23:20:45 +0200 (CEST)
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma2iy-0002tB-JJ
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 17:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ma2eq-0004ux-35
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:16:28 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ma2el-0004oE-QA
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:16:27 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 lk8-20020a17090b33c800b001a0a284fcc2so360134pjb.2
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 14:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9jjLePzwBZaaMtpGJvnMD/t5ukgfexs4gvVLCH7061I=;
 b=hDJaEDNTIm7P7twNSLr+XQPCoXew3jytE3HA2MqwFPOyXWWc3cROgA1Lzhp9TjjauU
 I1WCsklw2ewmog0PRIwE7OKtlt2uoOaaQKaqGBtmKzUkU8eDaO/kY6s6vMEaotLpNqNL
 0BMQbItUkKC172dJQgHdV8q6eKU/+WrGrCyOO2sqo/hfsNzhHL9tTaGhfatn5psSDJpH
 4aIT+pii+YWlW1AJ8UJyerlPZmAoN7P9OOQvayjqpm8+hQSumwFU+l5cmcBKvzAf+2wX
 Zo9dzF2RSVmUxtwJ8BMFcH+RODGeu4nw1x50yXSZsmwyjg34XgcT4jKUsgqkZ5UpJLI0
 RSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9jjLePzwBZaaMtpGJvnMD/t5ukgfexs4gvVLCH7061I=;
 b=uY9rLvjVmpddY85Uj/WUcvpQx2pLGkd7BcLHB/ea4p6WWTiy1swzn7tj0ZR9GxET0i
 tfqpoTW7MaXmcPTov+tO8Ch9opJ6QnDAeBHxFhJNOhC2BXsCIO1Hkvj4bJN0v3U2Xxw6
 8WqxTofohhPh2G0FjzEja+NJkJgj0ZW4wC46WTkAfHdicA+90lzTqMZW86w4zki3ZbeU
 ZuvVD7Kfl6lXQeZ0H8GL4lfrjUbjkf4QPTGVFRfpdVT7cXTPaWaWmIb7A8Sy0/Lbteuf
 qwX8p6kcv5g4srWBAxw0AHrBgAH2X0O7tyFxA7ac6YG73Rer5gISTa2N06Xqm3uftYa4
 zGug==
X-Gm-Message-State: AOAM530E+GL1kTxg78Amazp+C9oprrZ8sVipfPKCeoRa8mLSFURgP8Jw
 ASx04LX3csYwnXPXG66p5q2P1g==
X-Google-Smtp-Source: ABdhPJxMTFiu6wlgfsqG8kN8IaAVjx3bbcib0UNXxbQyzs1w3gR+fw/43+c+2rW3+kZR6cu6cfIv+A==
X-Received: by 2002:a17:90a:8807:: with SMTP id
 s7mr1494011pjn.226.1633986980829; 
 Mon, 11 Oct 2021 14:16:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b11sm8751164pge.57.2021.10.11.14.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:16:20 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] machine: Use host_memory_backend_is_mapped() in
 machine_consume_memdev()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20211011174522.14351-1-david@redhat.com>
 <20211011174522.14351-2-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ffcabdc-e29a-1b6a-eb2c-bc8a1757ddfe@linaro.org>
Date: Mon, 11 Oct 2021 14:16:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011174522.14351-2-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 10:45 AM, David Hildenbrand wrote:
> memory_region_is_mapped() is the wrong check, we actually want to check
> whether the backend is already marked mapped.
> 
> For example, memory regions mapped via an alias, such as NVDIMMs,
> currently don't make memory_region_is_mapped() return "true". As the
> machine is initialized before any memory devices (and thereby before
> NVDIMMs are initialized), this isn't a fix but merely a cleanup.
> 
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   hw/core/machine.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

