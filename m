Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B01447C993
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 00:14:52 +0100 (CET)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzoLK-0000Oe-Ki
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 18:14:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoGb-0003Px-5L
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:09:57 -0500
Received: from [2607:f8b0:4864:20::433] (port=38651
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoGZ-00068u-LE
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:09:56 -0500
Received: by mail-pf1-x433.google.com with SMTP id b22so609600pfb.5
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 15:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z6QANVnUj9KhCbgopT8XgNhoKY7S9ge/SwEAxUPMHgI=;
 b=jY0lgQbJofmwNApIBGQT+qDlyJuNBtgg7TxidrUPcMa9KWbxhAtwSyGl2ywrq9Rkxe
 E7sAYUKNof0EyPiJwukpWmHM6t43HF5F6UPfyZcuK1mW5usZFeY+igwDzJ7qIWLyOhKr
 Y8BnpfZLp8hT2AMCmmFtWL+ZRcF9NPj5FGVJ9aW22EZkInOXh2ULG1ocml5Z4fosM/OV
 jQQNqoTLXZDQdLeK0GynSYcoD7DWYk+suVEV0BQEHhyd/JjTW2Vr/MpSVX/rS11RAJMB
 4qzQg6G4m/thos8mekowfOb21xZzd4yciryGxjZgizpg82nCTOuzIx+n7Kc1q4erlCV5
 53Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z6QANVnUj9KhCbgopT8XgNhoKY7S9ge/SwEAxUPMHgI=;
 b=O2/TlWjU7vpDqwryaDbxvJzBf0UBJ0wr5M1Ze7k3r1Noj+Q/mDcJIJKmwwFCdsd1LR
 D3RSrtD/5oGuVEsqK81eJRZKf+wAf/YGNrKrLM+PX3pDqGatPBJVb05JWp2JlNfFYIWA
 Gmp/izKwhIP5yA4G/A93/OKm4i1JUfqn2MVrCiD2mM+CiqhmNs2Bg5mAegDFEOGwI9PP
 8Rh7elOP0ZB1qYQz5w9Tl2uE72UeRXmrJiCIA60NfIGiWgzALdw2QKZDhppKuVmO50+r
 4l/FkJKEdW08N77VkJSjlkoO7And/sR2aSIz6ubeS3b4cGRtnjmpwYMUOWUY7AGSBjfz
 V4Vw==
X-Gm-Message-State: AOAM5313AVe3UQaBrjItJx/t9gJRYJ4QaHcGr4ZcTOt9kXra+hPsDYqv
 TmXV1d67dlVtuyTfBnN1A33YxA==
X-Google-Smtp-Source: ABdhPJxgqClPi1comfcZPIcFU9+LKHsgtdOKHOq5nOA9W8wk7hFmSwT1nkvWdqbTRHDwtklhxh5hCA==
X-Received: by 2002:a63:2c06:: with SMTP id s6mr461217pgs.55.1640128194305;
 Tue, 21 Dec 2021 15:09:54 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id x33sm136769pfh.212.2021.12.21.15.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 15:09:53 -0800 (PST)
Subject: Re: [PATCH 4/4] dma: Let ld*_dma() propagate MemTxResult
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211218145111.1540114-1-philmd@redhat.com>
 <20211218145111.1540114-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf1074df-9f1e-60ea-2978-6afdab1f831e@linaro.org>
Date: Tue, 21 Dec 2021 15:09:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211218145111.1540114-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
> dma_memory_read() returns a MemTxResult type. Do not discard
> it, return it to the caller.
> 
> Update the few callers.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   include/hw/pci/pci.h       |  6 ++++--
>   include/hw/ppc/spapr_vio.h |  6 +++++-
>   include/sysemu/dma.h       | 25 ++++++++++++-------------
>   hw/intc/pnv_xive.c         |  8 ++++----
>   hw/usb/hcd-xhci.c          |  7 ++++---
>   5 files changed, 29 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

