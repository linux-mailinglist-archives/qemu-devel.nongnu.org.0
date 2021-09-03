Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B63400593
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:12:57 +0200 (CEST)
Received: from localhost ([::1]:35608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEcS-0007E6-5s
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEZK-0003y6-Mk
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:09:43 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEZF-0001tr-VA
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:09:42 -0400
Received: by mail-wm1-x329.google.com with SMTP id u15so4137466wmj.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d2f3Ph/ntZxA5OIRFxM0NkPVcVIY7tJmN/5TzZTd+sw=;
 b=ptIeMzygBxniK4GFmpcdybITkROV8gzJ4bJ66hTihivE0KlfgILn2EK5lgfZko1vzS
 AZU7M6XEvHTEP3XfbINTOCIUJXPyCoS2j0xmJAnAbGMTNN+EZTamV9nfrcXIQPPBkG/r
 udWjS8bAZh1BuA7YCmQfzsiWImJNERh/N8u41eDTGdad8At+UacNySmIiDIEZ3KhiPbj
 Zja0vxJ74VFq+10e2V6Ff/sogjSjtNfXuXe5QTYZbTkt0leKvto5SXf3lKefK9yJr9ZE
 zQdONd0+wKl+aAj9hTCqZPTrHql3AeqlLojRghoYTgiH+nXU34VYFB+bOW/IQhPzTON5
 MEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d2f3Ph/ntZxA5OIRFxM0NkPVcVIY7tJmN/5TzZTd+sw=;
 b=tRihHYFis9hj7InhRp05bbQWWfweeRFzI7/5pNGPrBU0qaadzN3rj0vO62D9x6poMD
 4A2E6qy8UPALKvajLyyzeCMi7Gel94V7VhWcHmgcmDnKIBZoM2wN8vRagY1D8xsGLKB+
 8ZWThFVgJRCGvPnVPbk83TNJyUMSPs/OAm2bOfqV7wfFOHI2NI6vVYPn+X3nTsiKjmO5
 C+76shRfgZ4pyIvKl2ABiN2Nu/DHjBsm2gqXXH+fH2jODolBOS3X0Sz4FFBEXR+MS3ML
 grtLXbLe2JwTwCvUEeS7qWYqkeEyfLeiYBMASqgPy0OurOE4gBTa5oIE03kLBny6nN17
 JOPQ==
X-Gm-Message-State: AOAM530w8D9u7pITVWfzWiu2bWqTacZr0g81hsu1eML4JUY24GG+dMSS
 ibuD0vmTTJL8cJUsWUmedy+fEg==
X-Google-Smtp-Source: ABdhPJyPSGdqaPC89X1tU7ouxlCf3esrACwEZC/VxyJjnG9yZ4kOF0/wkw3nEbZFncfKHsPtusP2qw==
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr314671wme.34.1630696176482; 
 Fri, 03 Sep 2021 12:09:36 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c4sm220491wme.14.2021.09.03.12.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:09:36 -0700 (PDT)
Subject: Re: [PATCH 06/24] target/alpha: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dc88952c-68ac-db70-a01d-212e66576888@linaro.org>
Date: Fri, 3 Sep 2021 21:09:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/alpha/cpu.h    | 2 +-
>   target/alpha/cpu.c    | 2 +-
>   target/alpha/helper.c | 5 ++---
>   3 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

