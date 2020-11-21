Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677EC2BC1E6
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:04:13 +0100 (CET)
Received: from localhost ([::1]:38146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZ7E-0006u9-Gs
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:04:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZ5h-0006Og-10
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:02:37 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZ5f-0002RR-EI
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:02:36 -0500
Received: by mail-pf1-x442.google.com with SMTP id w6so11178726pfu.1
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 12:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F42d7duENdM6HYNODPKulT1Jv4pAm9GuDhZ2U/McF4M=;
 b=qAogI4m/+D39xLDHFq4HOATycuVRKXeP552ySyliWQRuuxKPw6slbcjBlWxYC59uPy
 5H4c32zlyqTx9OgX6+z/RUzBfJSGm9IzlGfDIERdWJxwTOwr58Gxi17QTfTrMdPfUL4U
 6hdtu6btby4WisGoZPI5Id7U7BOY/EqCpB6LYr2l5XD1L8acpmM/p2+tXv4I9/A9kDRU
 VULKCoN4R7hjaURBo38oE161l2XpyfBW+Oq95GNfY8SFQb+/vaSoEtMINEisneb2u1zK
 C2wZvnV9FoDMmtEZ+dvB67L/N8FEHVB7jhampDxDwNBuYqTsUehInjDzQWgY3XWrRUmS
 Wnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F42d7duENdM6HYNODPKulT1Jv4pAm9GuDhZ2U/McF4M=;
 b=uDOR9oguFDWtswPs6bVAQP2ZZbHWFMX+G3EaepYGjBzs6BEPHDgsn/RaqBiPUa3Nj7
 e6NPuQ5vimT5ox0Dd7okVWcV5wOt/YzbyzIk9GbSvt06btA5BtziDNRId7Nfd82DY32l
 aeEM3z13ksTChAI9fMyDXZYVqRoRnvqcZeKm/mAjJTiC366GwMc7haoEoSzzEiaCdpnd
 wVAFCSysn3CvasBO4rgrclXV/RvyRmrRrmBc68BhOnzNu2DA/o5dMR15merY8jE2W1WN
 BwBcJtvjN2qv7pKnNrSmmFsVAhOad419Gp3/HGJiPR4zRUk5Xvpw/1UPNY9eMnGAZovW
 djlw==
X-Gm-Message-State: AOAM530VdDq5ujYAToX5LDEBxe5aLM/ldrC6Yc/xvfmS3l/txqxVH67R
 T7TmQlG4KMbiCcKil3WfOsb7IA==
X-Google-Smtp-Source: ABdhPJwK6F4bjQZQtMw140tO05qXDjtPnkLwb2J63gpm7Gb5pCPk6pg3o6E2nMX90j+w0bU/pSDIcw==
X-Received: by 2002:a17:90b:3798:: with SMTP id
 mz24mr17431600pjb.35.1605988953954; 
 Sat, 21 Nov 2020 12:02:33 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v19sm6605243pgi.2.2020.11.21.12.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 12:02:32 -0800 (PST)
Subject: Re: [PATCH 11/26] target/mips: Extract the microMIPS ISA translation
 routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f58bf7ab-6a7c-e26a-c815-4523a7b6fbd5@linaro.org>
Date: Sat, 21 Nov 2020 12:02:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> Extract 3300 lines from the huge translate.c to a new file,
> 'isa-micromips_translate.c.inc'. As there are too many inter-
> dependencies we don't compile it as another object, but
> keep including it in the big translate.o. We gain in code
> maintainability.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c                   | 3309 +-------------------
>  target/mips/isa-micromips_translate.c.inc | 3316 +++++++++++++++++++++
>  2 files changed, 3317 insertions(+), 3308 deletions(-)
>  create mode 100644 target/mips/isa-micromips_translate.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


