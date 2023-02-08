Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696D468F7DB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:14:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPptE-0000mD-Hd; Wed, 08 Feb 2023 14:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPpt9-0000li-OQ
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:13:52 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPpt8-0003cK-4A
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:13:51 -0500
Received: by mail-pf1-x431.google.com with SMTP id 144so13789448pfv.11
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=La3wT0QT5AljMTBg5TvDszp8vEbXXkJIaZHxJVL4p6w=;
 b=SbSi6dIpfHnb6sv1bwo5LaBu4A41hxAT7tDiTOCCUN4xGQV3H9epqxKn1TBkT89XGW
 iMjpwetzukHFFW2v76jXBfpccIIgE4MIwz5WC7BKfXa8MnxzDY5r8KMVULwBBG5OfEr8
 sVE1bFW6YDoKHrnRh/NsaZF7f4cbrPmkLMY2jkWkM3zjwoQ2vOwjYYAGhPwxlj6K4hv7
 qVOKbPSeGkKzUDolzPr4CMCKlNE5dCa74Aq1q8TOQrKY7fGjGS+Q3FBSroD4r2eaLmzi
 2h/K3RXOV44LxiGzn7Auqq9Aim6s6nJX+QSNSLJTKaMbo/oqFCP/PL7BBN+vebR2MMNq
 cJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=La3wT0QT5AljMTBg5TvDszp8vEbXXkJIaZHxJVL4p6w=;
 b=e6KICDlW6MplBIePZ4Mku+wSbzOxi2MY5rFsbBqZ7sD+sJs4gH1pbI0XnG95JA+U5s
 hq9gE1ZuwcQJpmXBgf/PDc/yDoXWVR5RknwW/Uoqad4a1x9sUEZ3qIuwkeBVS02SO4gY
 7igv7i9qLmQOxn6lQrbkHOgNHtw6mUEOFAdy+8fA8l6KpZpGXyUlWfyEiy60Axf0rhgZ
 YdWvs+BU8SaF2xbII0znQ/jL0o+zRsJQYKRz2I1EX4pDRg+XzwOsolBx3mYjIFWEylqK
 DKZ+O7OAv8KDBSfkMxI3WcAUI6XKY8Ef4TjTEe6FYm2eLMEN1/6Ic5Cf7EJHAW6cC0H1
 0z0g==
X-Gm-Message-State: AO0yUKXaXW1yKx1r5Dd7m3wQNH/abCi81qke3Cg7PtJTWXyuRUSd+nWS
 SWAITI8sx+OQbfjphI8ZWTiW+w==
X-Google-Smtp-Source: AK7set+X6M2M0/SzC1JCYDGUve3ixrsZBSMz86Wt8DpWJxF2Vhs4i6lU/sm/5awWhSrZEiIVAYjj1g==
X-Received: by 2002:aa7:9f1e:0:b0:5a8:494a:e48d with SMTP id
 g30-20020aa79f1e000000b005a8494ae48dmr2315211pfr.28.1675883628557; 
 Wed, 08 Feb 2023 11:13:48 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 s19-20020a62e713000000b005939de7104asm11582989pfh.215.2023.02.08.11.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 11:13:48 -0800 (PST)
Message-ID: <3d313346-1a59-444c-fd7a-6c856f16d9fb@linaro.org>
Date: Wed, 8 Feb 2023 09:13:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] exec/ioport: Factor portio_list_register() out
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Bernhard Beschow <shentey@gmail.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230207234615.77300-1-philmd@linaro.org>
 <20230207234615.77300-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230207234615.77300-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 2/7/23 13:46, Philippe Mathieu-Daudé wrote:
> We always follow the same pattern when registering
> non-coalesced portio:
> 
>    - portio_list_init()
>    - portio_list_add()
> 
> Factor these 2 operations in a single helper named
> portio_list_register(). Since both calls become local
> to ioport.c, reduce their scope by declaring them static.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/audio/adlib.c        |  4 ++--
>   hw/display/vga.c        |  4 ++--
>   hw/dma/i82374.c         |  7 +++----
>   hw/isa/isa-bus.c        |  6 ++----
>   hw/watchdog/wdt_ib700.c |  4 ++--
>   include/exec/ioport.h   | 10 ++++------
>   softmmu/ioport.c        | 21 ++++++++++++++-------
>   7 files changed, 29 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

