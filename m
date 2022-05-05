Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD4651C70D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:20:32 +0200 (CEST)
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmg5W-0001qD-2O
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfhK-00067p-0b
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:55:30 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:42683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfhI-00025C-Cd
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:55:29 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 s12-20020a0568301e0c00b00605f30530c2so3409668otr.9
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=CS8Nomew2BnvggE5sTiuZQOYKvdPb+xLl+7irq6Lt54=;
 b=HL8mh9/XzdYX1GvRkIY81lbMyXsga9w/uySqRNhE2WPNGCNgYqNlUnlb02+E0RteY1
 rX5mJktfJ3UjBi7WgAkBUCuCdSNJl5/2GX/I+WNlllzKJDjyMkaLfr48HkkV6LXDzsbf
 6dbj/Lr0TAnnfOCgF9iUAFha8WjxmaWX4UZc/9n/oLx6pvNI/j+rTwx34IpK+Eagw6Yc
 dHDf9GnJit7yiigjUCXL7k2Ss5WV6p3r6S3NRU5ieVWOxVQ+mxhId87AzwjCp4zDQeXg
 2SRYwKZ3Tq5/zb1KKqATkCMb3eVjFd935qRHkEbrECCIaqIwZ5y3Pf/D+V/krUZLcxwh
 8kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CS8Nomew2BnvggE5sTiuZQOYKvdPb+xLl+7irq6Lt54=;
 b=IcKbUjG8yqPjOYfU7TQDPb94I5fhIXExr/yDSGKRky8Ffr36BVmP5h0EA+ZfxAkNMv
 3cAKGx9ArizitGfKJLKxcwiRP7wPs6mTgVXP99jWasRvZjMmPhzUOskZPBON6t54W5+m
 rIUJFaUAJzhZKj2QGCePVsZz1Fho+rKiIStrp+DZAxchdsdjWy6T05N+ef8D7n4SqjGs
 U1zHmWrxVVoHbzTjitVPrzX+5Xp4qKmF8tY3VqdYMxklj6tXWqLZWGVMkwbrHCGKiyAH
 JJndsWJqcTguImj6JtkX8k1QQAYgUQncCnl3wH+PUXUcnMkjR4eH25i1yXELtBTLUGKL
 sSSA==
X-Gm-Message-State: AOAM5321qWPcehBdvwfKtPR7Ldnbkx0JuZoKql9XxCY4x+4wdoQ0Q4ER
 NrlkFOM5Wt2M2vz9mKnQCL4KXQ==
X-Google-Smtp-Source: ABdhPJy2IJ8tZd6dbrtZQrK5WZvpOL/YCzR+ibTKfGrJRbOtnXl4ncwpO6TaYVx/jWtEFAHdCJO1Kw==
X-Received: by 2002:a05:6830:2705:b0:606:5c00:e45d with SMTP id
 j5-20020a056830270500b006065c00e45dmr550889otu.375.1651773327090; 
 Thu, 05 May 2022 10:55:27 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6?
 ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a9d53c7000000b006060322127esm798127oth.78.2022.05.05.10.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:55:26 -0700 (PDT)
Message-ID: <39ae26f2-0210-cb8a-a0af-123c832e2187@linaro.org>
Date: Thu, 5 May 2022 12:55:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 22/50] dino: move from hw/hppa to hw/pci-host
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-23-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-23-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> Move the DINO device implementation from hw/hppa to hw/pci-host so that it is
> located with all the other PCI host bridges.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   MAINTAINERS                             | 2 ++
>   hw/hppa/Kconfig                         | 2 +-
>   hw/hppa/machine.c                       | 2 +-
>   hw/hppa/meson.build                     | 2 +-
>   hw/hppa/trace-events                    | 5 -----
>   hw/pci-host/Kconfig                     | 4 ++++
>   hw/{hppa => pci-host}/dino.c            | 3 +--
>   hw/pci-host/meson.build                 | 3 +++
>   hw/pci-host/trace-events                | 5 +++++
>   {hw/hppa => include/hw/pci-host}/dino.h | 0
>   10 files changed, 18 insertions(+), 10 deletions(-)
>   rename hw/{hppa => pci-host}/dino.c (99%)
>   rename {hw/hppa => include/hw/pci-host}/dino.h (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

