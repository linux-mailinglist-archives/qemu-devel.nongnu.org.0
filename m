Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8225845D3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 20:30:58 +0200 (CEST)
Received: from localhost ([::1]:46126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH8Hh-0002ut-4L
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 14:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oH8E9-0001LI-2i
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 14:27:17 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:51885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oH8E6-0006Ql-Si
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 14:27:16 -0400
Received: by mail-pj1-x1029.google.com with SMTP id e1so2756693pjl.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 11:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QJuoaF6HanB6+cIcxJhozG4V2eIb+DKq4APwWck+WDI=;
 b=wkhVdzcPaQhfSpYBmy8vx/Mq9c1/VGoZj+mFq8kcxdelxQ/C47W+uHbiHidBE1Gryq
 ZfPZ0IpPzp6yrHvUbOxKdY02PZtHIVl5OjDZUcCIo3VfzTjavjiwkuFZkes2tysQUx69
 FvbNpRBJ7bCv2CEQ4xx36SvXIAvnmj8pnmEb7Bytmzr/GFNNilintrtT/2m258+oFyKt
 poZBdLtnpyRhepHzCMGX0oq0LyM6bWUWfjAK7AlCWV5E41l92F7lG+vuW9mEc+NVxaOg
 jMCxrosWPVNl2XlbzavYXuNNLayuzItTVgWpL6ZrAM/pEUZJtppCl6Ca/77YVBtm9b2X
 uKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QJuoaF6HanB6+cIcxJhozG4V2eIb+DKq4APwWck+WDI=;
 b=XecVHbKrqx8Zmnet60arO3Dv6x8CAlw9aJj+qyECkuJK6LZ0J9w7yHgwwVoeJRvanf
 Sq4jAE+njy4yN9oRsQe9rezCqIZN/Xs2O6gaqw8vCWIGaqJAE/qFIElHV/WVEGTxO4Qd
 VSZ/hDqsbM9ccwPvcHJdGNjc/fVqvv3ZjjM4o3m1S0T/UaDDSrokrwNjrnwwvL9o87k0
 +ZLWHIZIjCnkuK85DttCZTtKiUiBrG463xhTJsEhPiIv0usIiZbYmi5Cc2ts26zqbCSS
 5LHXlaKkDa7S0s8VuN5GehdFCYxJ4vdqP6Gx2ITdu1tNKqUVCAE3XS2o+5VNJRG+ffp1
 Jctg==
X-Gm-Message-State: ACgBeo0pKH4XpE7o6yZmMx0vg2f+463HIzBW8qeQCKAkYn/XrSj6IV4A
 5ss0x0zFUTQ6LYdy8Ut44NqKGw==
X-Google-Smtp-Source: AA6agR5YL555DTCEOw71cgibmGvpIl5oRQMk2/WeQIeIKmd0rVfFBw3icmWCcxPSFXLlwxJ7fgxwdw==
X-Received: by 2002:a17:90b:4c10:b0:1f2:5c6c:a278 with SMTP id
 na16-20020a17090b4c1000b001f25c6ca278mr11586pjb.44.1659032833424; 
 Thu, 28 Jul 2022 11:27:13 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:d1a3:8e57:d847:7607?
 ([2602:ae:1549:801:d1a3:8e57:d847:7607])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a170902cec400b0016cd74dae66sm1739563plg.28.2022.07.28.11.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 11:27:12 -0700 (PDT)
Message-ID: <c510c72f-648d-791a-57e2-58aaa8165d94@linaro.org>
Date: Thu, 28 Jul 2022 11:27:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/2] riscv-to-apply queue
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
References: <20220728010000.2764631-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220728010000.2764631-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/27/22 17:59, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit 7b17a1a841fc2336eba53afade9cadb14bd3dd9a:
> 
>    Update version for v7.1.0-rc0 release (2022-07-26 18:03:16 -0700)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220728
> 
> for you to fetch changes up to 54f218363052be210e77d2ada8c0c1e51b3ad6cd:
> 
>    hw/intc: sifive_plic: Fix multi-socket plic configuraiton (2022-07-28 09:08:44 +1000)
> 
> ----------------------------------------------------------------
> Sixth RISC-V PR for QEMU 7.1
> 
> This is a PR to go in for RC1. It fixes a segfault that occurs
> when using multiple sockets on the RISC-V virt board. It also
> includes a small fix to allow both Zmmul and M extensions.
> 
> * Allow both Zmmul and M extension
> * Fix multi-socket plic configuraiton

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Atish Patra (1):
>        hw/intc: sifive_plic: Fix multi-socket plic configuraiton
> 
> Palmer Dabbelt (1):
>        RISC-V: Allow both Zmmul and M
> 
>   hw/intc/sifive_plic.c | 4 ++--
>   target/riscv/cpu.c    | 5 -----
>   2 files changed, 2 insertions(+), 7 deletions(-)
> 


