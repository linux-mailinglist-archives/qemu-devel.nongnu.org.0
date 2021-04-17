Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB936362FD8
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 15:01:30 +0200 (CEST)
Received: from localhost ([::1]:36716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXkZl-0000MI-TQ
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 09:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXkXa-0008N6-Ps
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 08:59:14 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXkXW-0008Jz-6q
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 08:59:14 -0400
Received: by mail-wr1-x429.google.com with SMTP id s7so29157384wru.6
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 05:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i0WrbCrOlsRbfL6PPRJzlriiHHyOqwtNM9zbILshCGw=;
 b=aI+kBGoCtu1dYuHySyiqkKtf/UNS/jwcNmMiyVvKdUbT4O+Zzx9iwXNPe1Jf4paAnG
 8galm9L3JWQYXKHm6/axE/nlHzKhJ1kotGropYoti3m3pwzSmcT3fu2jOyIIuWWuNIi2
 0OVONN/wm4FftBZYkoEchNYy3wzxy7fmDDQTrsv5vi81vGcSh3iGYBF4F5lXH7Fg/Ou0
 VVUay9HVbuhGP5JyD7IGROGXw6TCnHmUp/j32F0hUYbwNnzZfL+0hAKhP3yBFLZw2TjY
 rEnXDS+0zmxaAcH+Vk/BNnp9Bd4ifROg1v75VxUTg28GjOQNe40YYvq0QExQEjSnTZSN
 SC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i0WrbCrOlsRbfL6PPRJzlriiHHyOqwtNM9zbILshCGw=;
 b=izklh+4kFxmhnWAEOzptr7JlIsR9e0gONqgAKSDpIygDZGV7rxGLwND+Rg8otBgejn
 XuBjxlxtgU16S8EAqGYLkMHwUB0jDmil5PBKkgB9LOf5tUv8pOqeKKIGHQvVwmvUzVS4
 rXebPxrC6z0Acjjv+EOOqkfnm1JJly33UQe/CS+QNRSp2ZAAODakQzFrShYjUoJ00jmw
 Baq2cRlzkvjo792iK6JEMlLj8PpXswC+UHy5tdi6RuwbAbvOGBtllkc0lC8mrWzw9UdM
 nTcuhfh2xPzq3BgTf/ifaach6+2QSK/AlB2/dufyhbQOiV5CTQF4zEcdtSDlmp2krBNX
 tpWw==
X-Gm-Message-State: AOAM533veXJZ+de+TwebP067S/urjaFZD0Y85dhFMWT/gNtRoZtMPFQ5
 mjtevRjv7QJPhStyjdNJ7hA=
X-Google-Smtp-Source: ABdhPJz7yR/Jb2mhYI74h0sGdQ5WOFGYhLu8Pu6rutTnE8a+s56bWQAz7q6Ddic+BOg9/wFJ9aTx2g==
X-Received: by 2002:adf:e747:: with SMTP id c7mr4233888wrn.220.1618664348704; 
 Sat, 17 Apr 2021 05:59:08 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l14sm3543113wrv.94.2021.04.17.05.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Apr 2021 05:59:08 -0700 (PDT)
Subject: Re: [PATCH] memory: Forbid memory_region_set_address() on AS root
To: qemu-devel@nongnu.org
References: <20210417125353.632589-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4be18f51-4e17-fc4f-fdea-3e1ba726d8eb@amsat.org>
Date: Sat, 17 Apr 2021 14:59:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210417125353.632589-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/17/21 2:53 PM, Philippe Mathieu-Daudé wrote:
> To be sure an AddressSpace is zero-based, forbid changing
> base address of MemoryRegion used as AddressSpace container.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Based-on: <20210417103028.601124-1-f4bug@amsat.org>
> ---
>  softmmu/memory.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 409bcaec7f5..73c0e6f84f5 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2522,6 +2522,7 @@ static void memory_region_readd_subregion(MemoryRegion *mr)
>  
>  void memory_region_set_address(MemoryRegion *mr, hwaddr addr)
>  {
> +    assert(!mr->is_root_mr);

Hmm to not discriminate the API usage, maybe safer as:

       assert(!(addr && mr->is_root_mr));

>      if (addr != mr->addr) {
>          mr->addr = addr;
>          memory_region_readd_subregion(mr);
> 

