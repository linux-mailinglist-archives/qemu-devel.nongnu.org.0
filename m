Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B89C47C980
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 00:10:03 +0100 (CET)
Received: from localhost ([::1]:35624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzoGg-00029O-KB
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 18:10:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoDj-0008Pr-Ts
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:07:01 -0500
Received: from [2607:f8b0:4864:20::431] (port=33622
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoDh-0005wc-Jk
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:06:58 -0500
Received: by mail-pf1-x431.google.com with SMTP id 205so649178pfu.0
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 15:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9BkgJEA7fgVgvUKkZP3HPK4/ory7mZkAokwDlTu4Rto=;
 b=BG1FSSvfyWvPbPAf4SuQRl3kksir4k/WIcG8H/dy+n7pQCyrQUSPJxINn5Xj8n8gy4
 g6yK7VYKMI7UZkSBbkQglDM9zYS4AoFyn8cRI7pyuIiLMzAP8LF/8BgqlAxp5W4/d2/V
 NSTyMvhqGGUo58T/CuUBA8efKL/VdfUn+CozO/MrhqINq3/9WPYPcZvw+Oq8JQfr82ef
 IeB+Kr3UX6NHhvLkCao2/lEU0vdfVOXPdq3ST7HX+qJYINRG4tGgD6e/LIncpMMugIx3
 XxsL8EjNbktK1EpNmW/73WOGfUd3dhl7mIc6VnFvT5PpbSPRISTeNS2ehCaTulYTkc1/
 NIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9BkgJEA7fgVgvUKkZP3HPK4/ory7mZkAokwDlTu4Rto=;
 b=1ws8oOyGzM7krC9E9g1TgH6rs0ckDa9tn8HUcHIpmdCDpXtzLyu5j+arXADKfB4Pq9
 p8hsstUYX81rsiUn4leAyqKK/Tv5i59n7MhEFDRu8x5Nqp/Hhpel7M/IRDX4dW7vMsn/
 ipQLjFP7BNS2ObGm/xaMAVY/rtWO0fDm3UBqVhXKeNMpZpB7hptkQVtf9cQ2MfezrqgN
 dTgBcEO/NNYWnaUMQYDcbgQXTP44Ircj+HmPC2GeZe/cdu0ZO+Pzj+DrIz5W2anFAIu6
 HXOKSwAfcDjmE96FDX0iQ1zgL6CsNVkaxa+HB3B2jfeyO2EBJoHmSNAhmGvnA9Hut6b/
 vnqg==
X-Gm-Message-State: AOAM530jBnWxU5cFYjk0da2bLZKgNUZf36yi/T/QpsEVJqqpi/mWxKWB
 u4YOgBnze4+gj/Xbt5CJqbQJuA==
X-Google-Smtp-Source: ABdhPJwaMDIJvleLu+WjWEJMpifk4TaDd5E6BvH+1tGLP+mtSlybzpo61QeXBMfQbAx6+2e9pDWySQ==
X-Received: by 2002:a63:565b:: with SMTP id g27mr463366pgm.564.1640128016191; 
 Tue, 21 Dec 2021 15:06:56 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id m18sm150702pfk.68.2021.12.21.15.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 15:06:55 -0800 (PST)
Subject: Re: [PATCH 2/4] dma: Let ld*_dma() take MemTxAttrs argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211218145111.1540114-1-philmd@redhat.com>
 <20211218145111.1540114-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c12502e4-a115-6e1c-a8b0-3229bf829506@linaro.org>
Date: Tue, 21 Dec 2021 15:06:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211218145111.1540114-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, David Hildenbrand <david@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Li Qiang <liq3ea@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Alexander Bulekov <alxndr@bu.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/21 6:51 AM, Philippe Mathieu-Daudé wrote:
> Let devices specify transaction attributes when calling ld*_dma().
> 
> Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   include/hw/pci/pci.h       |  3 ++-
>   include/hw/ppc/spapr_vio.h |  3 ++-
>   include/sysemu/dma.h       | 11 ++++++-----
>   hw/intc/pnv_xive.c         |  7 ++++---
>   hw/usb/hcd-xhci.c          |  6 +++---
>   5 files changed, 17 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

