Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0795C4005CC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:24:27 +0200 (CEST)
Received: from localhost ([::1]:46284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEna-000866-1Z
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEgq-0002F6-9o
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:17:29 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEgm-0008Fq-HQ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:17:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id i3so4142200wmq.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MXxKo2UCC7ElJgov5HnxrIOOIv2JepBr3hCE3i9yQm0=;
 b=ekz8NBKCkNG5colzCqoVrdGik2xvl5PiPiUF/tiLlRM193rIeI7eFXLiBPOlv5Vp59
 Nu9a59QNxzDPXKZr+qm6fSL5vRx1H2fdPcUAQ1ZqqWAGlRZFKDl606azUJbWIMp3eb/2
 Vz9742NtKM7V6lD/ao+4RB5HmjtwLa7rYpiyhv65odSrkp4qpth6l9JxTyOuejmcIrt+
 yrz43wSPFIb6UUm9jgNwkzkXFhpiU/RyH+YZwLuw3OpNO+IvcUYqk1E+VUmrSLiIAa6x
 6f4R5FsFNhuV66ltXk3E8CseDyLIcEteqQ6yWLT6L/5LIrFtcnOhO5WApOOI5CFD7vUl
 lC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MXxKo2UCC7ElJgov5HnxrIOOIv2JepBr3hCE3i9yQm0=;
 b=ht2dxqc8ZfZqpM/kRMr92+Ye0FOqHtTs5+I+klCDWohUt0T5bjSeJ0HYdP/DjPBumI
 rFUCUggPasWFehGvEjGqkhqmpKSBo0+22Z+5JskMfa8oRzIsacfsPIj3SSka/AcAaPcQ
 74aquB6pr59OjA9sofIpaEX2KEqB33fkOcStxvB1n08zFHGAZgefOSWwR/T9CPK3dIi7
 JlDT+7SPA/HcRIum+Zhbu4/dGPfCWfkxckJu2ag1Jn2pp3pVgB/OCc1Mlv0AHq2fO1t7
 svAzHQ6ejm58wo2iUsfOYxpIP9Sc0qWKFS3Pq7MivqrjVEX38aLN96oafG/4xscT/J3v
 jd/A==
X-Gm-Message-State: AOAM533O1LE8RM0dMC73vFkI3nm3rlVnEpui3lqyY8xLKWBb9K3r+sKx
 68gRwXOcQBE3az2B2F+50dYWmA==
X-Google-Smtp-Source: ABdhPJzqcHET28930i2ttB4E/qwHeLjMD4UIc67Kma+wbPRKU3Bb4NDzUIAWiK4iL7hQzoHNts6zyg==
X-Received: by 2002:a1c:4a:: with SMTP id 71mr301738wma.87.1630696642107;
 Fri, 03 Sep 2021 12:17:22 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id y24sm294760wma.9.2021.09.03.12.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:17:21 -0700 (PDT)
Subject: Re: [PATCH 14/24] target/mips: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64429f05-fe84-89c3-0c97-1f5564218372@linaro.org>
Date: Fri, 3 Sep 2021 21:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
>   target/mips/tcg/tcg-internal.h      |  5 +++--
>   target/mips/cpu.c                   |  2 +-
>   target/mips/tcg/exception.c         | 18 ------------------
>   target/mips/tcg/sysemu/tlb_helper.c | 18 ++++++++++++++++++
>   target/mips/tcg/user/tlb_helper.c   |  5 -----
>   5 files changed, 22 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

