Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35643273A4
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 18:28:43 +0100 (CET)
Received: from localhost ([::1]:38118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGPs2-0006RF-KQ
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 12:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGPo8-0002YT-6I
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 12:24:40 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGPo6-0005Eb-JO
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 12:24:39 -0500
Received: by mail-wr1-x431.google.com with SMTP id d11so13623275wrj.7
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 09:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zdQEC660FEPa/zGa3AqmK9zxWSHlzGraC18PV8k2PIQ=;
 b=U1FchKXe8Zy1U1a9wb7cqctzOBevZ6xgavOmJTmMFjQJ86h0JyQJ8a0Tpbdq9L98PJ
 WNcRG/yFOvN+CFzZ6zevyYHbfC6Rhu3BxyJ0flxHmMaZz7frRVWY/B9dcBGTgIm79PnS
 ieYeGAhGbUpSdMl/B92IkIQdkAG2r1pzzdp6UZcjlf3AKT3gqUxyzPipPHRAW2TVjGED
 js65LZ9W07ak8BOTyUJ3NShn0FX9eDRWW7dkNgqDFQSKx13AFDu5TzXYMizwaHXkFzvT
 Zizb9bIiheyd7Z0ShNrDN/hXEa7TCKmGHE8WvYQ6Ec8sXGKjCnLN/RPVTovDUQPjE0hB
 2rNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zdQEC660FEPa/zGa3AqmK9zxWSHlzGraC18PV8k2PIQ=;
 b=E72vRIpchAhpa2x8dnjaPspRiZ6H+VHv6Ddop6kudnL8/v0B+IcRnuI0+m0CtOrQyk
 k1s6vLpMScwgYyoFB/gfBi8K5lKE/EUY/gZGtcFAbCThJOgSA/DFwwoqXRAswX5PSYTz
 FTLicqJXZ48C05a6F5PJZ0xF+bKl2rpVV8fMRNe3wRUYPwsiACrOLyAYAkzPo7RXNIyS
 qFfXMPiLgqUke5Yt+lZpICoM33S+o8squ0Zx/cOLbrumu89y5hbHHiwC4/by2/77CgPm
 /Q8wv58UV7BxcPbSNws8MxXgKfZWFyS8QcU3CxC3upfqfWPDltFQ/HRfZ0QxMfd41bL2
 pm+g==
X-Gm-Message-State: AOAM533ZVWftnKo0JGf6CcigNrzEequJnP5pVFAYFi7ucEx6aGbt/z2V
 5203SUqNOeKxpv2cbkoLzRXBlc5/U/g=
X-Google-Smtp-Source: ABdhPJy5yP0r702pmqlX34233lmD/jgnQAYAeT5AVy1RSJWfDPWxd5ZeLEAz+Md8aboIGVIPHbPtqQ==
X-Received: by 2002:a05:6000:1545:: with SMTP id
 5mr12506455wry.90.1614528881679; 
 Sun, 28 Feb 2021 08:14:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c9sm19430301wmb.33.2021.02.28.08.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 08:14:41 -0800 (PST)
Subject: Re: [PATCH 2/2] hw/core: Constify TCGCPUOps
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210227232519.222663-1-richard.henderson@linaro.org>
 <20210227232519.222663-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <18b9b14d-2d13-4ccd-f1ec-13432ab4dc58@amsat.org>
Date: Sun, 28 Feb 2021 17:14:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210227232519.222663-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/21 12:25 AM, Richard Henderson wrote:
> We no longer have any runtime modifications to this struct,
> so declare them all const.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/cpu.h           | 2 +-
>  target/alpha/cpu.c              | 2 +-
>  target/arm/cpu.c                | 2 +-
>  target/arm/cpu_tcg.c            | 2 +-
>  target/avr/cpu.c                | 2 +-
>  target/cris/cpu.c               | 4 ++--
>  target/hexagon/cpu.c            | 2 +-
>  target/hppa/cpu.c               | 2 +-
>  target/i386/tcg/tcg-cpu.c       | 2 +-
>  target/lm32/cpu.c               | 2 +-
>  target/m68k/cpu.c               | 2 +-
>  target/microblaze/cpu.c         | 2 +-
>  target/mips/cpu.c               | 2 +-
>  target/moxie/cpu.c              | 2 +-
>  target/nios2/cpu.c              | 2 +-
>  target/openrisc/cpu.c           | 2 +-
>  target/riscv/cpu.c              | 2 +-
>  target/rx/cpu.c                 | 2 +-
>  target/s390x/cpu.c              | 2 +-
>  target/sh4/cpu.c                | 2 +-
>  target/sparc/cpu.c              | 2 +-
>  target/tilegx/cpu.c             | 2 +-
>  target/tricore/cpu.c            | 2 +-
>  target/unicore32/cpu.c          | 2 +-
>  target/xtensa/cpu.c             | 2 +-
>  target/ppc/translate_init.c.inc | 2 +-
>  26 files changed, 27 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

