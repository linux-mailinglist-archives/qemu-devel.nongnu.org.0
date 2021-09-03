Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DAC4005BF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:21:57 +0200 (CEST)
Received: from localhost ([::1]:34398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMElA-0000HK-4Y
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEff-0008P3-6l
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:16:15 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEfd-0007OW-M1
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:16:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u16so127617wrn.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D7GK+3sJj88BNk3sugq6u+9Wl9JlKFpYFPE0T1064sQ=;
 b=bl6/Cimfg0g13Ql9djnGtOTacGvGuIK7MPi8gRR21h1fvHOVy4VSsAhDy77qa1KRek
 dVRkJYDIsiE4l1pBV35G5S1Xbm5V/7f5VfpfVgy4SkjY6X1CcC8cXVnpJ4F3BHhze1J9
 uSvaLA5DG2vhZwtiEugnFtqP9W7IpvANZZopocn+/GrtXToUU6+93uLF3KPvVq2CV8wE
 ZzldyEpqdw6YNh1pcmbFS9Rwah3vXrsMB4VGBVQm67DMq9+IvzJYo/YuQHVkwRvlB6IC
 2zqxb2//+cAMlgcsjZdagKplPfqoCIvkjmCNKE1PYeSFAPe5TUaZS/msSwj6BxTysAVa
 qSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D7GK+3sJj88BNk3sugq6u+9Wl9JlKFpYFPE0T1064sQ=;
 b=pR603+2+h/UFvuEiV1p8vpwysRRvZfS0QAJ9tYThFd8fBtp6pBhkew7VaekovpKpEE
 2YSm2A7QurkH3nb+wPMFxv0S3lnwNEm7B1sEdniqyKvzhnmA/ZAf2DXSHrcl+wSYnKYt
 nvs/oAFRs7yABmzq5D16XPGhTmpCHfG73VA4TWOYebMiC5qrpsyyKjKUFdRPIkdQNa4m
 7KSXH4mOkEPqeHayCKcDes2NsiO+Ug59orMEYwzeSW8fdkR/W4kYK6Zz398ucnNOgU1g
 JsQDVbKm1eucnGDJ2fcuhUvLSTESxg4acr8y41f+SrEszvxofX3BWd9JfJG31e79xbje
 MEoQ==
X-Gm-Message-State: AOAM5301B7wEf9saLOQLXBZdP9H0u3VSslxHP6ITpiLOF+L5RI2/rZUA
 KfC17g7AWkAou235B1Y1WGIAQw==
X-Google-Smtp-Source: ABdhPJx9w7s3zbufC4iiXDsRVzgI9AR1f3D0gkr3llyec2vSyGKKIFOOa9I2iP/JQ74YpLpIWkVDdw==
X-Received: by 2002:adf:c451:: with SMTP id a17mr627979wrg.254.1630696572373; 
 Fri, 03 Sep 2021 12:16:12 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c15sm207795wmr.8.2021.09.03.12.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:16:12 -0700 (PDT)
Subject: Re: [PATCH 12/24] target/m68k: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a34a147-0f15-6dc4-752d-bd7cc7aae5dc@linaro.org>
Date: Fri, 3 Sep 2021 21:16:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/m68k/cpu.h       |  2 ++
>   target/m68k/cpu.c       |  2 +-
>   target/m68k/op_helper.c | 16 +++-------------
>   3 files changed, 6 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

