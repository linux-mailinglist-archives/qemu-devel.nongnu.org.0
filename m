Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA18F403D50
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:07:38 +0200 (CEST)
Received: from localhost ([::1]:52588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO06r-0003PG-SR
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNzyj-0006rg-Kq
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:59:13 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:43688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNzyh-0006aP-1e
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:59:13 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so1939459wms.2
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gwWKZnYds/G/I2GZRUuUImjPiW4o8ceSJM6V//gprM0=;
 b=IP03jRjeP7nFc7+9JS10I6OU9imzMk3kghx/rpSR9pKX6gmQkZdwfn06pnTiHccd6F
 MUl16rd7QsSGezlMs5pPb3AKQ4lk8H7LZ1e9YjZ4d4/6ghGArT8p8wk81pW61isM2IKm
 wzeaKLcxn6h1Cde9IZETcYhSu32XNHPJcVp3CAFpRGikhPsW8cgyDFDPi1XuUoHjQ23F
 9tRB16SNCbGb8G8flb+pSvCQTQQTU+YzU0Wv8mMGpphlA7KllbwLROuspbsM1Wqiq0ER
 7K6W45JtYn9/Lw7mIUWu8ctEiyBqskg2uIA73Xpdn7+iH43cQpvPAJIsKTWxguet7oZs
 CmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gwWKZnYds/G/I2GZRUuUImjPiW4o8ceSJM6V//gprM0=;
 b=F3bBBi7QjIBreaK5NOztw8JRdFlKlex3hbSRvngpOPD05AYZyKDBsLnVaXx6oMto/o
 e8CNvhW4qZlIT0PvzgHLd0sO3f5KhU+QlOz5NAlsVEyK0fjh9mZHfC+SWuDwuFRTZSuc
 XdFAqNnOfFm0KPrO82UT4u6rQ3rr/nYXSW6x/lt7pT/qQ7XDaYsyyaPG5ndWRoo922Tb
 kdx6Dno0OAAY08dez9fg9vvLArzXUaCnH+KoRSY6aHKv+lMJKiECuhKZo+xN6h1v3280
 X3PBOFGNuFzt05HzbGmYZlK0LXCROdDevt4TltqFA/DHmd2KscaSqTGgx2Pb8qWFo9M0
 RDyQ==
X-Gm-Message-State: AOAM532irmWxMFWSPGw+njYs8LXfyhdG8i+Nw8Fow1lYXLy30WBk3jEq
 ZeF+qoRjZePRl9Y1HTkc0hQ=
X-Google-Smtp-Source: ABdhPJzG8te3N31NwT/VNao6TWHawN1pywi08g32gJIKLw0L6raXGLQmvxrVYU77TAwHMW8DOh6MQQ==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr4400734wmp.165.1631116749089; 
 Wed, 08 Sep 2021 08:59:09 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id y15sm3026729wmi.18.2021.09.08.08.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 08:59:08 -0700 (PDT)
Subject: Re: [PATCH v2 3/9] linux-user: Split signal-related prototypes into
 signal-common.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210908154405.15417-1-peter.maydell@linaro.org>
 <20210908154405.15417-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b4ce00df-ecdb-0f9e-0c85-de0a8cce01e5@amsat.org>
Date: Wed, 8 Sep 2021 17:59:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908154405.15417-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.922,
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 5:43 PM, Peter Maydell wrote:
> Split the signal related prototypes into the existing header file
> signal-common.h, and include it in those places that now require it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: use existing signal-common.h instead of new header
> ---
>  linux-user/qemu.h                | 36 --------------------------------
>  linux-user/signal-common.h       | 36 ++++++++++++++++++++++++++++++++
>  linux-user/aarch64/cpu_loop.c    |  1 +
>  linux-user/alpha/cpu_loop.c      |  1 +
>  linux-user/arm/cpu_loop.c        |  1 +
>  linux-user/cris/cpu_loop.c       |  1 +
>  linux-user/fd-trans.c            |  1 +
>  linux-user/hexagon/cpu_loop.c    |  1 +
>  linux-user/hppa/cpu_loop.c       |  1 +
>  linux-user/i386/cpu_loop.c       |  1 +
>  linux-user/m68k/cpu_loop.c       |  1 +
>  linux-user/main.c                |  1 +
>  linux-user/microblaze/cpu_loop.c |  1 +
>  linux-user/mips/cpu_loop.c       |  1 +
>  linux-user/nios2/cpu_loop.c      |  1 +
>  linux-user/openrisc/cpu_loop.c   |  1 +
>  linux-user/ppc/cpu_loop.c        |  1 +
>  linux-user/riscv/cpu_loop.c      |  1 +
>  linux-user/s390x/cpu_loop.c      |  1 +
>  linux-user/sh4/cpu_loop.c        |  1 +
>  linux-user/sparc/cpu_loop.c      |  1 +
>  linux-user/syscall.c             |  1 +
>  linux-user/xtensa/cpu_loop.c     |  1 +
>  23 files changed, 57 insertions(+), 36 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

