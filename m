Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F2A3CC4BE
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:17:05 +0200 (CEST)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4nvz-00040i-VX
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4nvA-0003MG-Mc
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:16:12 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4nv5-0001lR-4M
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:16:10 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 d9-20020a17090ae289b0290172f971883bso10974243pjz.1
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kduANBN55wh/Z8xS7QxlAMlajaaErw/66kZ76LS9Kqg=;
 b=TNGyMtyEFlzAewZHz4GWskGxpu3MI57cKONRUgaPHZc/lI/LKhWc37n3vbMQPC6vmz
 Zpl1FTLVVRBT0UXO5EXxlrSMp1SRW9WRt6wfpUJlvTSsdVRLtcdkIQL9ky37itRwnXPl
 xaUVOO48kIgTNE5egMBs9dB8egrzeYEvP4W3xqOvq5ygKldtGwFRCREzRsjTqdD585be
 98+3gWa+4oHMhwOY/869Vra8KPXrlFLfNFRaVNWn4Cba+x1B02cgR2aR1ZXnxDkzkNkN
 B3G48mxYvN2Oi7e2hfwmSbwhMNMYx/28q9xgTHtmiCUWIeigEiGK1QFjyM9cBvxumBHg
 e4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kduANBN55wh/Z8xS7QxlAMlajaaErw/66kZ76LS9Kqg=;
 b=ZWLSp1NZpu905uDn4jXwDElHm+GzhrA9qSIbNBAiQYz3Be7ZEjDwZpurjp1CABoP0U
 /1X3g8dJ7+VB1yvda79hDsEbAXBd30fc18WWP3Fv6lVppI4q81mueWCI03toVcZ9jugp
 vllz/V5Z11iVAkE547ETBt1c2kUg8JKi8BmzP+MZba4NlsD/d9CgzC9tXA6yVobveCJu
 PFmnj1Nmo8EsrVRPacBstum+1UnxAOEWbOOgojEb1w5vQFw/JDsQD6ixVUJUu1y6LSF0
 6dxkGbu3LlpcE4BreWFGqutn5E2klhCiUSh6yGXmTIdKbO/korGY8WfC6oMKqNuDtZD7
 zQOA==
X-Gm-Message-State: AOAM531F9tGQUSLoetN1D9+63SVlMSwXhNRmbGxxqZ8CT7oDwuu2mB3u
 PGcAqUDwf8TUwriQDCyHN9oIZg==
X-Google-Smtp-Source: ABdhPJz17atHhKW93Ws/jMLb5uq/z/42aGcamBx8iyDYZ395+me0ZQ7zXX7we/0dRKljfV1Ki2hByQ==
X-Received: by 2002:a17:90b:224f:: with SMTP id
 hk15mr21397013pjb.180.1626542164717; 
 Sat, 17 Jul 2021 10:16:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h8sm13363311pfi.47.2021.07.17.10.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 10:16:04 -0700 (PDT)
Subject: Re: [PATCH v2 00/10] tcg: breakpoint reorg
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
Message-ID: <bf770c82-09f4-c0ca-cabe-bb065c39cbac@linaro.org>
Date: Sat, 17 Jul 2021 10:16:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712154004.1410832-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.  A Tested-by is nice, but Reviewed-by is better,
and time is running out, even for bug fixes.

r~

On 7/12/21 8:39 AM, Richard Henderson wrote:
> This is fixing #404 ("windows xp boot takes much longer...")
> and several other similar reports.
> 
> For v2, all prerequisites and 7 of the patches from v1 with
> reviews are now upstream.
> 
> Mark Cave-Ayland reported success with WinXP with v1, with
> this patch set being even faster than b55f54bc~1.  Which was
> a bit of a surprise, but I'll take it.  It means that it's
> probably not worth making the breakpoint detection scheme
> any more complicated.
> 
> I'd still like some more feedback.  Given this is fixing a
> regression from qemu 5.2 I feel comfortable delaying this
> past soft freeze, but not past hard freeze on the 20th.
> 
> 
> r~
> 
> 
> Richard Henderson (10):
>    accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS
>    accel/tcg: Move curr_cflags into cpu-exec.c
>    accel/tcg: Add CF_NO_GOTO_TB and CF_NO_GOTO_PTR
>    accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
>    accel/tcg: Handle -singlestep in curr_cflags
>    accel/tcg: Use CF_NO_GOTO_{TB,PTR} in cpu_exec_step_atomic
>    accel/tcg: Move cflags lookup into tb_find
>    accel/tcg: Adjust interface of TranslatorOps.breakpoint_check
>    accel/tcg: Hoist tb_cflags to a local in translator_loop
>    accel/tcg: Encode breakpoint info into tb->cflags
> 
>   include/exec/exec-all.h       |  30 +++++---
>   include/exec/translator.h     |  17 +++--
>   accel/tcg/cpu-exec.c          | 130 ++++++++++++++++++++++++++++------
>   accel/tcg/translate-all.c     |   7 +-
>   accel/tcg/translator.c        |  79 ++++++++++++++-------
>   cpu.c                         |  24 -------
>   target/alpha/translate.c      |  12 +---
>   target/arm/translate-a64.c    |  14 ++--
>   target/arm/translate.c        |  20 +++---
>   target/avr/translate.c        |   6 +-
>   target/cris/translate.c       |  14 ++--
>   target/hexagon/translate.c    |  13 +---
>   target/hppa/translate.c       |   7 +-
>   target/i386/tcg/translate.c   |  15 ++--
>   target/m68k/translate.c       |  14 +---
>   target/microblaze/translate.c |  14 +---
>   target/mips/tcg/translate.c   |  14 ++--
>   target/nios2/translate.c      |  13 +---
>   target/openrisc/translate.c   |  11 +--
>   target/ppc/translate.c        |  13 +---
>   target/riscv/translate.c      |  11 +--
>   target/rx/translate.c         |   8 +--
>   target/s390x/translate.c      |  12 ++--
>   target/sh4/translate.c        |  12 ++--
>   target/sparc/translate.c      |   9 ++-
>   target/tricore/translate.c    |  13 +---
>   target/xtensa/translate.c     |  12 ++--
>   tcg/tcg-op.c                  |  28 ++++----
>   28 files changed, 280 insertions(+), 292 deletions(-)
> 


