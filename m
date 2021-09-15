Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF6640CCB7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:46:06 +0200 (CEST)
Received: from localhost ([::1]:53148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZv3-0004u7-Gv
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQZJE-0007Vb-OE
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 14:07:00 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:41651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQZJC-0000MU-Re
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 14:07:00 -0400
Received: by mail-pf1-x42b.google.com with SMTP id x7so3374570pfa.8
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 11:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iSR2h7Y5EaydBE4m5VwzcEYw2fFaLvssIjJCDW+t7zY=;
 b=kuhmOb4gr+7Y45S0U7Rw8X+Hxho7ri5c2Nv6q0RZCMJmaLBF+ulcBg1Z6POSxzC2X4
 gu/dQ9vw56KEP3KsMrzhFvwAiIPF12pscxkL+Du8Vma3A4GgyzVpD4BTxweMjsfzLOsw
 lQD3xgy1e0MWdj99+AGYsrbx243ZGQo/wjFRvzScpQCOGEyo7T/IpNdnz5KcB5loBSeW
 jv5llG5ve0IEwThJIZ4FR4Q6rfx3rQi81ncFmt6IdRdevx+pJkV5d85MkgumAQPAsnXw
 HP9QshwO3LjLJsvOmZfNoqV3xe4TdLVkYwk034Pwnr2uNIvCFRMYuI7ln2LbrzjnPf9E
 ajoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iSR2h7Y5EaydBE4m5VwzcEYw2fFaLvssIjJCDW+t7zY=;
 b=10hq6P7NKTxxYZ1iumX+8MYs/PR1q08ypVDKIqZyIWb1IUlXkUfNPFg1ceZKMuP1ZH
 DVKXc4WO4kzQZdRLhNb39mGW6V9Ndrwq30dNlBf/F7YYOCYALUZCJq4Ve7QwPBBubj3B
 WQEjmW/KnHIFLwvWjlxM2SV8GpB841GXtur28u8pcK2+6amrsjdQtUNSFAu4ClylD0Z0
 cjkmyH+VN2hKFtOjr0vTOOuCWG76CO6/6BK4Erz9KcAd4LMcac8WqiyzcGHCKr4xPUkk
 M1B8kgAdovEWVhjLANXuyBG7+ShZRRxhD4GmRZF2zDR9dYgHKvvAieEgwJexYTzCkCJI
 N34g==
X-Gm-Message-State: AOAM531wd+EiM4NmiU6Vac5r6temMgBoWNIqsj74dTGb30QhBDPUhK7y
 oPR7aBMjEwloOkXAKoazXUKsqQ==
X-Google-Smtp-Source: ABdhPJyVBj5jlpXfPBGAIUNbrYsgVKifr6od8QZQE+2QeDODwt3rZLcTkwyKvUGGy74OmQhg1u8baQ==
X-Received: by 2002:a63:9a19:: with SMTP id o25mr976116pge.61.1631729216920;
 Wed, 15 Sep 2021 11:06:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b17sm591791pgl.61.2021.09.15.11.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 11:06:56 -0700 (PDT)
Subject: Re: [PATCH v4 00/30] accel: Move has_work() from SysemuCPUOps to
 AccelOpsClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210912172731.789788-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb89cb3b-4a2b-860a-15ea-1168e7e4944a@linaro.org>
Date: Wed, 15 Sep 2021 11:06:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.698,
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 10:27 AM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (30):
>    accel/tcg: Restrict cpu_handle_halt() to sysemu
>    hw/core: Restrict cpu_has_work() to sysemu
>    hw/core: Un-inline cpu_has_work()
>    sysemu: Introduce AccelOpsClass::has_work()
>    accel/kvm: Implement AccelOpsClass::has_work()
>    accel/whpx: Implement AccelOpsClass::has_work()
>    accel/tcg: Implement AccelOpsClass::has_work() as stub
>    target/alpha: Restrict has_work() handler to sysemu
>    target/arm: Restrict has_work() handler to sysemu and TCG
>    target/avr: Restrict has_work() handler to sysemu
>    target/cris: Restrict has_work() handler to sysemu
>    target/hexagon: Remove unused has_work() handler
>    target/hppa: Restrict has_work() handler to sysemu
>    target/i386: Restrict has_work() handler to sysemu and TCG
>    target/m68k: Restrict has_work() handler to sysemu
>    target/microblaze: Restrict has_work() handler to sysemu
>    target/mips: Restrict has_work() handler to sysemu and TCG
>    target/nios2: Restrict has_work() handler to sysemu
>    target/openrisc: Restrict has_work() handler to sysemu
>    target/ppc: Introduce PowerPCCPUClass::has_work()
>    target/ppc: Restrict has_work() handlers to sysemu and TCG
>    target/riscv: Restrict has_work() handler to sysemu and TCG
>    target/rx: Restrict has_work() handler to sysemu
>    target/s390x: Restrict has_work() handler to sysemu and TCG
>    target/sh4: Restrict has_work() handler to sysemu
>    target/sparc: Remove pointless use of CONFIG_TCG definition
>    target/sparc: Restrict has_work() handler to sysemu
>    target/tricore: Restrict has_work() handler to sysemu
>    target/xtensa: Restrict has_work() handler to sysemu
>    accel: Add missing AccelOpsClass::has_work() and drop SysemuCPUOps one

Queued, thanks!

r~

