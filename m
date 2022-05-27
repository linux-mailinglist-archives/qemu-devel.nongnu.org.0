Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B77536499
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:22:10 +0200 (CEST)
Received: from localhost ([::1]:57788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nubmz-0001QP-Ga
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nubkz-0008OF-GN
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:20:05 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nubkx-000858-9p
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:20:04 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 137so4183039pgb.5
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zoCwxcuH2b8rGwgm6KSF3G9aCrA6QYEFHmGKr/thAUc=;
 b=vmkcAcITv/dO0g0CxkeUJXpbb8GS5T/6e2Zx8mL4FZNMg1WZGkUt6CmYpnhYZQqor4
 bHRscYQGvlgZBeGfwuYM6yEkyOfCaAOckxFhPMCNn02eq8Dp5k6k1yjbt1SzI9OkR1+C
 xP/MOsyX5OF/5Kc3wPPivc6TdLK4Nv3ONWXA2HyogJXbIzr/0h5CH5+LkGQej5xL4SOZ
 V5H6Nf+KTxha8ZeDea5a5YM23RLD20OjfCLZ5LRXTwBkOjrks0coqH/IKQXTn92Y88AT
 biZdxjA2EQAuL3EJsp3wJ8Mvz9V5uuMB/dUMRSJzaYH/wSIrqpPv1MZ5dr3oNO8og3K/
 JDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zoCwxcuH2b8rGwgm6KSF3G9aCrA6QYEFHmGKr/thAUc=;
 b=y8j+BrhTiwVr4LYg1AJIh4FTlmXbEr+GiELFJ97MM8Dz3yhqPDC6QJw0fI1THMXaX7
 FluT9/2FuIqOzKTrpSg168lNYWvqIYm2TAzEOjcdoGhbw0FzgP1iPtR9An6z2Nn4TwQ9
 I7KJ4WHGnhUJQVLDm4h8CB8y6JAuyLncIH5UGGWCSCxCNl3cf/0wfZX5tPpSigb/BPo5
 Wl8cHNSJBgv6YYdFvscL2fAfuxh6CN19/gtX3GZBe/aM6wZKGPSqsvWUUaFdUuctUtIs
 +ZKdhUQ8HXk4gVwMGgjjR4GxRx6XpQcnoVvSqaBUsjGRZUmID4Wo4QR/aVNgs1XVhsU8
 S9fA==
X-Gm-Message-State: AOAM533Q9Rty5Xavak7P4XSq8ZWMjoOZSL5LOyI4XgGGOiHi3UFwX+3u
 3hZ78nYcUhhdg5y/jknqkER/Bg==
X-Google-Smtp-Source: ABdhPJyzPCXKeeEzH0WFOkSPWmoz5LlwRQ1R6TQYwMPCShM1DOu22TBbTSBbG/FWGDpeaS5EAO2E7g==
X-Received: by 2002:a63:4e1c:0:b0:3f2:5b1f:3e41 with SMTP id
 c28-20020a634e1c000000b003f25b1f3e41mr37503088pgb.37.1653664790847; 
 Fri, 27 May 2022 08:19:50 -0700 (PDT)
Received: from [192.168.0.4] (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a1709028c8200b0015e8d4eb2afsm3677238plo.249.2022.05.27.08.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 May 2022 08:19:50 -0700 (PDT)
Message-ID: <e8324b4c-a9e0-4112-bff2-012a37d89750@linaro.org>
Date: Fri, 27 May 2022 08:19:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/34] ppc queue
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, peter.maydell@linaro.org
References: <20220526213815.92701-1-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

On 5/26/22 14:37, Daniel Henrique Barboza wrote:
> The following changes since commit 2417cbd5916d043e0c56408221fbe9935d0bc8da:
> 
>    Merge tag 'ak-pull-request' of https://gitlab.com/berrange/qemu into staging (2022-05-26 07:00:04 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220526
> 
> for you to fetch changes up to 96c343cc774b52b010e464a219d13f8e55e1003f:
> 
>    linux-user: Add PowerPC ISA 3.1 and MMA to hwcap (2022-05-26 17:11:33 -0300)
> 
> ----------------------------------------------------------------
> ppc patch queue for 2022-05-26:
> 
> Most of the changes are enhancements/fixes made in TCG ppc emulation
> code. Several bugs fixes were made across the board as well.
> 
> Changes include:
> 
> - tcg and target/ppc: VSX MMA implementation, fixes in helper
> declarations to use call flags, memory ordering, tlbie and others
> - pseries: fixed stdout-path setting with -machine graphics=off
> - pseries: allow use of elf parser for kernel address
> - other assorted fixes and improvements

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alexey Kardashevskiy (2):
>        spapr: Use address from elf parser for kernel address
>        spapr/docs: Add a few words about x-vof
> 
> Bernhard Beschow (1):
>        hw/ppc/e500: Remove unused BINARY_DEVICE_TREE_FILE
> 
> Frederic Barrat (1):
>        pnv/xive2: Don't overwrite PC registers when writing TCTXT registers
> 
> Joel Stanley (1):
>        linux-user: Add PowerPC ISA 3.1 and MMA to hwcap
> 
> Leandro Lupori (1):
>        target/ppc: Fix tlbie
> 
> Lucas Mateus Castro (alqotel) (7):
>        target/ppc: Implement xxm[tf]acc and xxsetaccz
>        target/ppc: Implemented xvi*ger* instructions
>        target/ppc: Implemented pmxvi*ger* instructions
>        target/ppc: Implemented xvf*ger*
>        target/ppc: Implemented xvf16ger*
>        target/ppc: Implemented pmxvf*ger*
>        target/ppc: Implemented [pm]xvbf16ger2*
> 
> Matheus Ferst (12):
>        target/ppc: declare darn32/darn64 helpers with TCG_CALL_NO_RWG
>        target/ppc: use TCG_CALL_NO_RWG in vector helpers without env
>        target/ppc: use TCG_CALL_NO_RWG in BCD helpers
>        target/ppc: use TCG_CALL_NO_RWG in VSX helpers without env
>        target/ppc: Use TCG_CALL_NO_RWG_SE in fsel helper
>        target/ppc: declare xscvspdpn helper with call flags
>        target/ppc: declare xvxsigsp helper with call flags
>        target/ppc: declare xxextractuw and xxinsertw helpers with call flags
>        target/ppc: introduce do_va_helper
>        target/ppc: declare vmsum[um]bm helpers with call flags
>        target/ppc: declare vmsumuh[ms] helper with call flags
>        target/ppc: declare vmsumsh[ms] helper with call flags
> 
> Murilo Opsfelder Araujo (1):
>        mos6522: fix linking error when CONFIG_MOS6522 is not set
> 
> Nicholas Piggin (4):
>        target/ppc: Fix eieio memory ordering semantics
>        tcg/ppc: ST_ST memory ordering is not provided with eieio
>        tcg/ppc: Optimize memory ordering generation with lwsync
>        target/ppc: Implement lwsync with weaker memory ordering
> 
> Paolo Bonzini (1):
>        pseries: allow setting stdout-path even on machines with a VGA
> 
> Víctor Colombo (3):
>        target/ppc: Fix FPSCR.FI bit being cleared when it shouldn't
>        target/ppc: Fix FPSCR.FI changing in float_overflow_excp()
>        target/ppc: Rename sfprf to sfifprf where it's also used as set fi flag
> 
>   docs/system/ppc/pseries.rst         |  29 ++
>   hmp-commands-info.hx                |   2 +-
>   hw/intc/pnv_xive2.c                 |   3 -
>   hw/ppc/e500.c                       |   1 -
>   hw/ppc/spapr.c                      |  25 +-
>   include/hw/ppc/spapr.h              |   2 +-
>   linux-user/elfload.c                |   4 +
>   monitor/misc.c                      |   3 +
>   target/ppc/cpu.h                    |  19 +-
>   target/ppc/cpu_init.c               |  13 +-
>   target/ppc/fpu_helper.c             | 571 ++++++++++++++++++++++++++++--------
>   target/ppc/helper.h                 | 259 +++++++++-------
>   target/ppc/helper_regs.c            |   2 +-
>   target/ppc/insn32.decode            |  80 ++++-
>   target/ppc/insn64.decode            |  79 +++++
>   target/ppc/int_helper.c             | 152 +++++++++-
>   target/ppc/internal.h               |  15 +
>   target/ppc/machine.c                |   3 +-
>   target/ppc/translate.c              |  35 ++-
>   target/ppc/translate/fp-impl.c.inc  |  30 +-
>   target/ppc/translate/fp-ops.c.inc   |   1 -
>   target/ppc/translate/vmx-impl.c.inc |  54 ++--
>   target/ppc/translate/vmx-ops.c.inc  |   4 -
>   target/ppc/translate/vsx-impl.c.inc | 237 ++++++++++++---
>   target/ppc/translate/vsx-ops.c.inc  |   4 -
>   tcg/ppc/tcg-target.c.inc            |  12 +-
>   26 files changed, 1286 insertions(+), 353 deletions(-)


