Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D5D4005B4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:17:03 +0200 (CEST)
Received: from localhost ([::1]:49064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEgQ-00082M-F4
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEYp-0003VZ-5J
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:09:11 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEYb-0001Kl-0A
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:09:10 -0400
Received: by mail-wr1-x435.google.com with SMTP id b6so86974wrh.10
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bNawZA+iiFWKHVH1C9qcUdpIzLY56k93AuR3hOCtsAQ=;
 b=blyy2Qcq3ys7NOCvDyC8LIH2WNtvRXNUBgIwD/R7GSOUVE9wYVoYzHJGPK69ZYwCjA
 /S+Qc9/SdTZlxmOIBExVgufjoLdFU4+jgy3FXzLa4+tyhGho9wBXZlcoEIVwOUJFCD3F
 mgy63j0TY1qxnocUld0trkmVqpIKL6cVxSttgmPwtQl51Hg/RP9gK747OSfHVrizYbwd
 Micckh16om7iN2OIXLNXwMa3zoWgNLx3sBg5GepSQ4b151h1FUxRi90O3ywDB1/4Zeef
 /aU+BgTBjwOp+y3dNUFgFNT0evBnmbIcdE1aMrJjbf676wCa7Jm/8Lc4P/eQjyPluN1U
 eAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bNawZA+iiFWKHVH1C9qcUdpIzLY56k93AuR3hOCtsAQ=;
 b=Y71njyVUkvD84gEPRlAIq+RYoLKnB05p23Y/oAptvXVe1jgt1Pw1oyJKsdRKAY1SIY
 IHUSXaYgDRiZVoxKA4HP0G3zr5lq80jcgE5bUsAnpCO304NcgsMx1XuzEjO9qcpD4h49
 ddMhYOkVqNAQND4rJ+fKt+nIpi/EHMUaiEUMpdzHSc6/Rb5lA5EbUYJQCts2uyMJ+jjk
 V37mhWkw3/Bj+rsWobDT/Q0zBRlfUgDkvpS1PVcpvPSP9Kk8z9VZscYOn1zXpfFG2H6w
 WuL4/1a07gTbzc27ywNVUzgXrDdDVFBS9Z7gyNu6oLtbECVwh/sA8cw6+AKF5S1JsuVG
 7m6A==
X-Gm-Message-State: AOAM533UDjimxfuXUJmJMAvCatDWiolMX3Z2ezbbLf5a2XmsAwWFebe4
 WV6ZykRqJzX/ZN7K3SMb/2LCpA==
X-Google-Smtp-Source: ABdhPJwGy4Hl0Kp/sF6gZVGlrWRB35x93Jy2sQjV6NpFST12HsjPqu1badXhKkBnspeVECad2SVmOQ==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr543312wrz.369.1630696132260; 
 Fri, 03 Sep 2021 12:08:52 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id d24sm166620wmb.35.2021.09.03.12.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:08:51 -0700 (PDT)
Subject: Re: [PATCH 05/24] accel/tcg: Assert most of cpu_handle_interrupt() is
 sysemu-specific
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3ce44beb-77a0-30dc-d4fa-9c47865e86e9@linaro.org>
Date: Fri, 3 Sep 2021 21:08:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> To prove TCGCPUOps::cpu_exec_interrupt() is limited to system
> emulation, start by asserting it is not called under user emulation.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/tcg/cpu-exec.c | 3 +++
>   1 file changed, 3 insertions(+)

Eh, sure, I guess.  I meant this merely as a diagnostic aid.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

