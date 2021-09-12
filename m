Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F011B407FCD
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 21:51:32 +0200 (CEST)
Received: from localhost ([::1]:55972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPVVj-0006ZA-HK
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 15:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPVUa-0005aW-LT
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 15:50:20 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:45697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPVUY-0006kN-Sf
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 15:50:20 -0400
Received: by mail-pf1-x434.google.com with SMTP id w19so2468742pfn.12
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 12:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HfPZJmOm13m2Pl9H1Tlv70whteR6HdTlV2KxxVUS91w=;
 b=usGofVoKV8Sqn7JJiCSgwG3j90qEaN5CMRueaQQDHngkvY8F8pEeyifQAj9uP0NcKF
 eXbBMQhKLHfGAjS7ItGN5TSsTHQCblCsFLl7x8V6UtH2zwSbf97orOLZqZgmwNKzygXI
 SDI6sM5Obf+PaAEjpqNT5Dvaizoq41CFRD5AN+WrEf+dY332VtHpQRM1mTf8xu82rF7m
 1L9MLrjVcvkyi79qDsJTtQWfJ2EHaIht3G6eQHhuywYM8IgiX5K3ALSa9HeV9X2GirSd
 Cp92RtSNRuHHE4OA8pSeupQR1f/OmRuRPmxMvPR08GhMCoHZqnGVIMDaxbjUadTjIEGk
 l6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HfPZJmOm13m2Pl9H1Tlv70whteR6HdTlV2KxxVUS91w=;
 b=qCu6W20gcA1tAi/y01kk5agFLcvcOWB+itF0EgXKJDHFqcGidu+LRwt013Tk9p3Kdd
 wkvuVOlpDL8TZZCAj+8PFssj3wVEj2CEaSohrofg/EMb1BPXnPgIDtsF4WIGEAYNCSeW
 oXsnpIv7RRP/mw+j4QMhnvU6Ghyu5epODqDtepvxgYuvrOT63bmxOcLJIJntid7QCq4A
 ld8uirtVc0gBAnKmz6YoCx6nmzBeerFQb/NU+tMsfTIBxNb//4gEOHjj2H5fzM+KOw+E
 rWIebQAS9Lhpo2tIaWwxs69JSlBpltc01Hc3cExN3j5GSFtCoy3OKLcC10XSdrlvRs8q
 xX+Q==
X-Gm-Message-State: AOAM530yQFDb/G90IPuaOcJ9Kki14LNuyUtDvJbuyg7bquvSE4B27lHp
 egFHKYBKXNhnVuCfuN0bv+uGiw==
X-Google-Smtp-Source: ABdhPJwItOYnowHAu6Sp+Q95b6JvoDHmqQAEBa9cAMICddW2nfKl6h10HuHq3c1o3ITLpIDvkRnPtQ==
X-Received: by 2002:a63:4917:: with SMTP id w23mr7748965pga.344.1631476216761; 
 Sun, 12 Sep 2021 12:50:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l23sm4390542pji.45.2021.09.12.12.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 12:50:16 -0700 (PDT)
Subject: Re: [PATCH v3 00/24] accel/tcg: Restrict
 TCGCPUOps::cpu_exec_interrupt() to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210911165434.531552-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc7758c0-ca31-8913-47fe-8daa805e9145@linaro.org>
Date: Sun, 12 Sep 2021 12:50:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/11/21 9:54 AM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (24):
>    target/avr: Remove pointless use of CONFIG_USER_ONLY definition
>    target/i386: Restrict sysemu-only fpu_helper helpers
>    target/i386: Simplify TARGET_X86_64 #ifdef'ry
>    target/xtensa: Restrict do_transaction_failed() to sysemu
>    accel/tcg: Rename user-mode do_interrupt hack as fake_user_interrupt
>    target/alpha: Restrict cpu_exec_interrupt() handler to sysemu
>    target/arm: Restrict cpu_exec_interrupt() handler to sysemu
>    target/cris: Restrict cpu_exec_interrupt() handler to sysemu
>    target/hppa: Restrict cpu_exec_interrupt() handler to sysemu
>    target/i386: Restrict cpu_exec_interrupt() handler to sysemu
>    target/i386: Move x86_cpu_exec_interrupt() under sysemu/ folder
>    target/m68k: Restrict cpu_exec_interrupt() handler to sysemu
>    target/microblaze: Restrict cpu_exec_interrupt() handler to sysemu
>    target/mips: Restrict cpu_exec_interrupt() handler to sysemu
>    target/nios2: Restrict cpu_exec_interrupt() handler to sysemu
>    target/openrisc: Restrict cpu_exec_interrupt() handler to sysemu
>    target/ppc: Restrict cpu_exec_interrupt() handler to sysemu
>    target/riscv: Restrict cpu_exec_interrupt() handler to sysemu
>    target/sh4: Restrict cpu_exec_interrupt() handler to sysemu
>    target/sparc: Restrict cpu_exec_interrupt() handler to sysemu
>    target/rx: Restrict cpu_exec_interrupt() handler to sysemu
>    target/xtensa: Restrict cpu_exec_interrupt() handler to sysemu
>    accel/tcg: Restrict TCGCPUOps::cpu_exec_interrupt() to sysemu
>    user: Remove cpu_get_pic_interrupt() stubs

Queued, thanks.

r~

