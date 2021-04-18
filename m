Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35507363757
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 21:37:17 +0200 (CEST)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYDEK-0007gt-Am
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 15:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDD9-0006mE-4q
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:36:03 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:35748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDD5-0007Ls-Ly
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:36:02 -0400
Received: by mail-qt1-x833.google.com with SMTP id f12so24675053qtf.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 12:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=un/5jBzAQEvNBcYegYHJMgqRb6WxlP2J24T7HrmVOZY=;
 b=iHfUEU+IMrRVHnxhbX4A1RxxvFfJ3C3K7x4u3DGvp1JWaTna50AiwE0qHEAzpX4Z7q
 tK/MfFqhIiIw+K3KrNe8DN2nTNPyapf9aNNsliXjOEwgucxaLYT/6e8wxQzGz6BAvkX7
 WuuoNnGU0jSyM5onIBbzUThAswmH7i8enoQFv/RPftaREZcfdwlWFV+e/L9SSvK1d2Vc
 w80bZX13K1ako04dYc60b5wGYGA5lz3mNsfD3taBp5GdYYeWBPaPPLl+2jvE01//Of2E
 eVUYEQIzlp5CxfKiIsw3fxElPcGCLy7IfUDQ/Q6/b/vz7BGkkfxeL2Ubg0byO7686/oR
 dHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=un/5jBzAQEvNBcYegYHJMgqRb6WxlP2J24T7HrmVOZY=;
 b=aRyMlZTAEJDskzI7sFcfF+6Y4hbDhDBBl4vwPtUnRh60zhZ0lfEa+vpbURAZertsBU
 3uWb2yx5LJzwNxTRrusJ2z9z7vC79msjRul2xX/3yZ+6EX9N/tbKpFg0fDdqWKYp3Rlz
 NQ1x80oM17k/4m1Av8MgoMEczaZTrAsGJRGLVhIOMY1Vr3sZPfFdBTegs55tx6NoCiLR
 ZitQKcozJhCPaFOIGOd04QOch/izwcYitPh9PTb8NDC2yzXNfa5SvSFqJcWr+yktRNFH
 ce0VqWpmG14tE8HmfQNLQdjOmSAojDYI2mBepA2ld7m5a2oRrQsYS+BPeNQJNLH2I0NE
 RfZQ==
X-Gm-Message-State: AOAM530TNMS04ecpuSJYxLdm1uiFa4pHAgPzhlagDo1N3B61D5xA1rgW
 qLm6ZHZmd64QxSNP2MffdNNp4Q==
X-Google-Smtp-Source: ABdhPJwOhxbQpKmt960aOPBOaRe9VKqu/0qClPCXTVeKzF6v9ex3NIxDIiWB6ZH2x0MsIdqBCQaUfA==
X-Received: by 2002:ac8:4899:: with SMTP id i25mr8658167qtq.59.1618774558669; 
 Sun, 18 Apr 2021 12:35:58 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id f2sm5147332qkh.76.2021.04.18.12.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 12:35:58 -0700 (PDT)
Subject: Re: [PATCH 15/26] target/mips: Restrict mmu_init() to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c2da0f0-0ec2-e2b8-ad86-0f5d76983ce1@linaro.org>
Date: Sun, 18 Apr 2021 12:35:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> mmu_init() is only required by TCG accelerator.
> Restrict its declaration and call to TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/internal.h         | 3 ---
>   target/mips/tcg/tcg-internal.h | 2 ++
>   target/mips/cpu.c              | 2 +-
>   3 files changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

