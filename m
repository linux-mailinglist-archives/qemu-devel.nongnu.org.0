Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADB347C981
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 00:10:38 +0100 (CET)
Received: from localhost ([::1]:37500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzoHF-0003MS-Ib
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 18:10:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoEb-0000ih-Sc
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:07:55 -0500
Received: from [2607:f8b0:4864:20::52a] (port=42823
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoEK-0005xv-9I
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:07:52 -0500
Received: by mail-pg1-x52a.google.com with SMTP id g2so352525pgo.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 15:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b24jEBEusA4PPjTxAdWyceWFQ9Iog9i0Ch1AUixijG0=;
 b=HKppGzGlUYqLnVS7vzie+mZWX8fzQQW9HRFDl0k35lShnwiEJ0+UF3lx9AxxMYQ1Ol
 aqbTuucaB2Klzzpm8GNfOBUm5LFERK9R6/aScxlJEAr7xqpwf6MEaUMysx5/jhgFn7DX
 Mlkq6d3E+7H2niUK1mv9j5E+hAns6f09ORAVDS6GwyqY/b3xpo8B2R+ixE5aUrjNcL+U
 IvQaAzJRQ/ORWxritRiQAu0ALWqPxKYuRWb7XbXgoKjbnBqokj8NIKlcVslVOC9ylS8v
 qn5h+17VBq4ly/7vgYv5+JB7928HgEiUzEXxiiB+L3hHyXWyWZSNztc94D7H38+l8wxX
 eGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b24jEBEusA4PPjTxAdWyceWFQ9Iog9i0Ch1AUixijG0=;
 b=JMMuHJNN9gYHR2PyKrul4eaz+I9eMe9Vt2+qw8GlCDi/a7neJjh+OjoH6mybEwfj/E
 MpPuMfHMpy8xk/iA64rs/NKIRtb9NVLaHxcFTfaYmP3UVtPKm6ek3C7kEbdKvEQLDIg/
 v6i+CEVuj4YAxOjRsVtcD4Rd93mM5Eg0UQP+RTovvaNnbX6yFBNrCeJWmVpV/7JiWdf2
 BXJa7pJ0Du6Gasvawqpxiydg5Da2j67sUc4cWTgsyOuh6yMlx6TIPWO+a40dObdD6GkU
 9qURoLRHZzfXWR4WUNY/q8WP3bWkoSgG4hGiH/hAshSmaydsm+YuHRCZvFOtQNyR5ly9
 bTrQ==
X-Gm-Message-State: AOAM532rLmSZeOzTpNcE0g9gPrKtlYfbe76xoEfkGd2IEp0jU8JNuV3Z
 wIV7zIjGIQLl5qz4OoQwPv3isw==
X-Google-Smtp-Source: ABdhPJyRc+XJjzF++xew+/lhGrLi/AqBiadD9jiolKDe30ho8onsgIIrE3OrTZnSawjbwVCHt6y90w==
X-Received: by 2002:a63:4b11:: with SMTP id y17mr479260pga.214.1640128055064; 
 Tue, 21 Dec 2021 15:07:35 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id h10sm122142pgj.64.2021.12.21.15.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 15:07:34 -0800 (PST)
Subject: Re: [PATCH 3/4] dma: Let st*_dma() propagate MemTxResult
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211218145111.1540114-1-philmd@redhat.com>
 <20211218145111.1540114-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c13a0c57-5692-d2ea-0943-6d9fa5943d13@linaro.org>
Date: Tue, 21 Dec 2021 15:07:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211218145111.1540114-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-2.012, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
> dma_memory_write() returns a MemTxResult type. Do not discard
> it, return it to the caller.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   include/sysemu/dma.h | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

