Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D03366681C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:50:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlaU-0007be-8K; Wed, 11 Jan 2023 19:36:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaR-0007Zl-UP
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:55 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaQ-0001fh-DU
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:55 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so21868551pjj.2
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nwuYdBYbacb9IWlfEKWZ+6Ak12b3r2mxv1nKNS0ptTY=;
 b=JtvqOCMYzrzn6oTn2ep9CgKQhHe40kl/2mKYyMkXNhZIKwVNrfTGwTCOMzptoDImx0
 x0oXQ9Usvhjrs8fqHN3QaQDzGmvGK7ucdfd1F1Y0smxlkolyWebozjshUZWaPOUenkF3
 jApaX7doudMH1tvsBsaz0UnujSxwizd9BLnX4bFH9i30VxGMKbmtZBayTj/L9WcLhzED
 4SMg/gD58uyZI0ACUPGvP3+uwe6eqJ84Ke4AR7BfTa1foZ0Ep5dlfw8tI/bkqKYsbSNI
 vcU/hQdorB0fUBtNxyyEhYK3fgKgXgF1r5+wbWBiGfxomwIdDyhBw2Yc3cCZJ5x9xqin
 gP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nwuYdBYbacb9IWlfEKWZ+6Ak12b3r2mxv1nKNS0ptTY=;
 b=K6YVYyCndSCjUd+OdAbzPpfaHM7lZE7v4EZGaJcTO/S6uJYFRUHTD4aH78CocKcgK/
 RJ2XCZvoxv1+Sg5ZzUch6lGP4lbdgsJS68m1/8g89cybPTHgfN1PGiVrq+hgYJ9n1xY2
 RnFb0KZ82oQ0CYIWT00RnAji/MIfo8SW4HbE/5cqKEDwT3kOYCZUpJBFtsbQZBKPMnB1
 uu3xD0NUgqaizgZrczVozbYPByWDtpIPJGpDOtw6l3gKuwMz4ETAWJlQWC0sx2subTjb
 Ug4T3biSKbBNNnV4KNoUF8AqQdZm56OG0wDac+BCEttXiGxbiNOhrastcoUMkwLI42q+
 mXDw==
X-Gm-Message-State: AFqh2kp/xhn486CHo8IfxWje6as5ikKmBoe+BGVyTYw5PDMKZ+KQLRJM
 umzxxPiFwJZFI1YPpWv5A8gDQQ==
X-Google-Smtp-Source: AMrXdXvyY+3jSWw9f8vVzeUnmyUPbsbfJJMtVdgPU8mB68cIzDlO6YOL89teKNCCPIvW8eK1jFko8A==
X-Received: by 2002:a17:902:a5c1:b0:189:62fd:140e with SMTP id
 t1-20020a170902a5c100b0018962fd140emr73199788plq.29.1673483813705; 
 Wed, 11 Jan 2023 16:36:53 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 k7-20020a170902760700b00192bf7eaf28sm10716395pll.286.2023.01.11.16.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:36:53 -0800 (PST)
Message-ID: <6da2fab1-4318-f466-bdec-0c4296711bf9@linaro.org>
Date: Wed, 11 Jan 2023 09:48:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/4] bulk: Coding style fixes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org
References: <20230111083909.42624-1-philmd@linaro.org>
 <20230111083909.42624-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230111083909.42624-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 1/11/23 00:39, Philippe Mathieu-Daudé wrote:
> Fix the following checkpatch.pl violation on lines using the
> TARGET_FMT_plx definition to avoid:
> 
>    WARNING: line over 80 characters
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/block/pflash_cfi01.c       |  5 +++--
>   hw/char/digic-uart.c          |  8 ++++----
>   hw/core/sysbus.c              |  3 ++-
>   hw/dma/pl330.c                | 16 +++++++++-------
>   hw/i386/multiboot.c           |  3 ++-
>   hw/i386/xen/xen-hvm.c         |  3 ++-
>   hw/i386/xen/xen-mapcache.c    | 13 ++++++++-----
>   hw/intc/exynos4210_combiner.c | 20 ++++++++++----------
>   hw/misc/auxbus.c              |  3 ++-
>   hw/net/allwinner_emac.c       |  8 ++++----
>   hw/timer/digic-timer.c        |  8 ++++----
>   hw/timer/etraxfs_timer.c      |  3 +--
>   softmmu/memory.c              |  3 ++-
>   target/ppc/mmu-hash32.c       | 10 ++++++----
>   target/ppc/mmu_common.c       |  8 +++++---
>   target/sparc/mmu_helper.c     |  5 +++--
>   16 files changed, 67 insertions(+), 52 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

