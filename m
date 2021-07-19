Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62F13CEE15
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:25:07 +0200 (CEST)
Received: from localhost ([::1]:53992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5al9-0007Vw-0i
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5ais-0003fZ-En
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:46 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aiq-0000k2-SF
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:46 -0400
Received: by mail-pj1-x102b.google.com with SMTP id g24so12408975pji.4
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TXEq2xPXWBbdlMbCfB41BQi5mLMAmZ2g98mHeCiQ7IQ=;
 b=qxL7DWGXpU6+XecrchcC7dlERwkqK7b9/1HlvQCyxQYI6xZuNb7qehbVKivrTJ3rPX
 WMacMifVjieTugPS+KNuPFNMqMu/yHfPhULPjCAU5nhIyf2ATYLT45ZF9Kg2m2ol6JdQ
 T98O0amtrQ7YPdzdsKXGCep/4lAt6xSiUBkHHIhSlyMXqhhg3ZQq9ptVadXb6YsCptIj
 2d+qnpMggolDbhT7zXFeoTZBafJI0JRhQSo3HWsTB4EHy9WdH03ZloTfuoZFj/4Wuvgw
 hNXkjQBGA4O7hhZbCgOV7JPjbTlQ3UiWiHeBaKba92d4dnYBVOWLkR8CQJiGeLnItqN0
 9pDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TXEq2xPXWBbdlMbCfB41BQi5mLMAmZ2g98mHeCiQ7IQ=;
 b=KHr8vnylfVUvsN/Shn+3fCFuP5+XMxdvcDA+Z8XeEWu9PUutCkETxvGipMbuwbRgQZ
 zxBTaxovXW5VHZWQpgjfC5Hi1sJmln/ouYEQfuYHaoSY3BuKY/S2jaFk6Pd6nT4HMlEL
 zQWVn8IFocoElj3nzYIyzKRr0kCdQcULVXFLppzLJ7xdY5HVUK2loEcPMWv7WI6vxZf5
 xIu+u0eZNHDlX4qd0B/JpihUlEpQI3++yfgLeEnWSk5oQ2/mMGxRAGPwH5WDjRbuzvcn
 c+Wxcn0hKupsJNzoUOKZjP2hbChc7R4Z+biNy4Pf4g5nFLv16E/BUuD8/OUQMQG66yix
 P/rA==
X-Gm-Message-State: AOAM530uA4/uAkvp8Y/7MsSr+C85Rt0WYGCC/d9wjiYvxKtP4nSAn8wd
 42oofyUTO08dZeNzrrg+7qMJMEFBU16rhw==
X-Google-Smtp-Source: ABdhPJy9V/6lYBr/uRAjuMq6u8hf6Ljj8wNwO2Trn2vc4Q5bXaAA2adpMFKBlwgmV99NQ6EK+GIUFQ==
X-Received: by 2002:a17:902:ecd2:b029:12b:25f7:9d52 with SMTP id
 a18-20020a170902ecd2b029012b25f79d52mr21021897plh.18.1626729763332; 
 Mon, 19 Jul 2021 14:22:43 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25008434pgi.94.2021.07.19.14.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:22:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v4 00/15] tcg: breakpoint reorg
Date: Mon, 19 Jul 2021 11:22:24 -1000
Message-Id: <20210719212239.428740-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is fixing #404 ("windows xp boot takes much longer...")
and several other similar reports.

Changes for v4:
  * Issue breakpoints directly from cflags_for_breakpoints.
    Do not generate code for a TB beginning with a BP at all.
  * Drop the problematic TranslatorOps.breakpoint_check hook entirely.

Changes for v3:
  * Map CF_COUNT_MASK == 0 -> TCG_MAX_INSNS.
  * Split out *_breakpoint_check fixes for avr, mips, riscv.

Changes for v2:
  * All prerequisites and 7 of the patches from v1 with are merged.

Patches lacking review are all new:
  03-target-alpha-Drop-goto_tb-path-in-gen_call_pal.patch
  09-hw-core-Introduce-TCGCPUOps.debug_check_breakpoin.patch
  10-target-arm-Implement-debug_check_breakpoint.patch
  11-target-i386-Implement-debug_check_breakpoint.patch
  12-accel-tcg-Move-breakpoint-recognition-outside-tra.patch
  13-accel-tcg-Remove-TranslatorOps.breakpoint_check.patch
  15-accel-tcg-Record-singlestep_enabled-in-tb-cflags.patch


r~


Richard Henderson (15):
  accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS
  accel/tcg: Move curr_cflags into cpu-exec.c
  target/alpha: Drop goto_tb path in gen_call_pal
  accel/tcg: Add CF_NO_GOTO_TB and CF_NO_GOTO_PTR
  accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
  accel/tcg: Handle -singlestep in curr_cflags
  accel/tcg: Use CF_NO_GOTO_{TB, PTR} in cpu_exec_step_atomic
  accel/tcg: Move cflags lookup into tb_find
  hw/core: Introduce TCGCPUOps.debug_check_breakpoint
  target/arm: Implement debug_check_breakpoint
  target/i386: Implement debug_check_breakpoint
  accel/tcg: Move breakpoint recognition outside translation
  accel/tcg: Remove TranslatorOps.breakpoint_check
  accel/tcg: Hoist tb_cflags to a local in translator_loop
  accel/tcg: Record singlestep_enabled in tb->cflags

 include/exec/exec-all.h       |  24 +++---
 include/exec/translator.h     |  11 ---
 include/hw/core/tcg-cpu-ops.h |   6 ++
 target/arm/internals.h        |   3 +
 accel/tcg/cpu-exec.c          | 143 ++++++++++++++++++++++++++++------
 accel/tcg/translate-all.c     |   7 +-
 accel/tcg/translator.c        |  39 ++--------
 cpu.c                         |  24 ------
 target/alpha/translate.c      |  31 +-------
 target/arm/cpu.c              |   1 +
 target/arm/cpu_tcg.c          |   1 +
 target/arm/debug_helper.c     |   7 +-
 target/arm/translate-a64.c    |  25 ------
 target/arm/translate.c        |  29 -------
 target/avr/translate.c        |  10 ---
 target/cris/translate.c       |  20 -----
 target/hexagon/translate.c    |  17 ----
 target/hppa/translate.c       |  11 ---
 target/i386/tcg/tcg-cpu.c     |  12 +++
 target/i386/tcg/translate.c   |  28 -------
 target/m68k/translate.c       |  18 -----
 target/microblaze/translate.c |  18 -----
 target/mips/tcg/translate.c   |  19 -----
 target/nios2/translate.c      |  27 -------
 target/openrisc/translate.c   |  17 ----
 target/ppc/translate.c        |  18 -----
 target/riscv/translate.c      |  17 ----
 target/rx/translate.c         |  14 ----
 target/s390x/tcg/translate.c  |  24 ------
 target/sh4/translate.c        |  18 -----
 target/sparc/translate.c      |  17 ----
 target/tricore/translate.c    |  16 ----
 target/xtensa/translate.c     |  17 ----
 tcg/tcg-op.c                  |  28 +++----
 34 files changed, 185 insertions(+), 532 deletions(-)

-- 
2.25.1


