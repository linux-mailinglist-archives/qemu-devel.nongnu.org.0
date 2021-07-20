Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D593D0264
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 21:57:33 +0200 (CEST)
Received: from localhost ([::1]:48282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5vrw-0001fy-DI
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 15:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpG-00070J-5Y
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:46 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:37681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpE-0007vv-6s
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:45 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 o3-20020a17090a6783b0290173ce472b8aso2612310pjj.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FA7esMvnDwx6o2DONUSD8RQvzJFz7ltYkp9CrGy5nz4=;
 b=VLGtbzgP66sCvycelOLZtXB1u1qSE/ggBA7Www19gat9y9cSmSdlNawTSLU3ts6tzX
 8/3pltZbP/qxrruRVfRlroK0hyaOyi1St/KPqO3ZV7j8+iM+RxKAsztCFmGIin4S3mcI
 cUMyMoXvbWVWWV6FVzv8bDmxgzU21p5K1mna7C0Meaou5QT4RYyWBt+15fT6eeM1jP06
 VKyd/TaUb8BHOJOq46py+xZVlTjcOmg8QdIExdSxx/npqiCe2+CdRbq1L6jawXQPiGag
 rMFlv0fkcQzBqK3QKaltl6Zsh4GUquHsU7ZvHNSLiBWUhNYWQnvq5CCwPBAlGDYzgVPB
 7VIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FA7esMvnDwx6o2DONUSD8RQvzJFz7ltYkp9CrGy5nz4=;
 b=okixPEVX3Mp8kT6vBw8oM76RScL9XBB/ioFdDL7OpG0wD97684KfXq6laM9xWSjeZL
 iPKbORePKGEoaZi8x5Hl+LXBCxKSFPnOfEPraGJvBFf500TDGp6tHq5l55TD0Y8vzsZ5
 uiH0pJD4TupKNwN4Sl8kdCfvMcmZMxLQR8fxuO+OyokagGqM8GmZqFzDqjwJLt3fa1qV
 uJ6d0HoTWF2rZzPE5tSDHLzxgd+phtFmPvdPkcKEeecY0c//l9FkPm38hG3iu/DhJJ0Z
 HnyF8YmYy2V5BOSySy/JZtvmaCv7SZ2mrtV3mccF2cyRkNrpAbGfGFsM23lfEpKm2dFV
 Rpkw==
X-Gm-Message-State: AOAM531CoJKFFVBot5VeR76fxECwCbSHh6OVoTRm/hZN+CsG0aMyEzTO
 B4whjFwzBFJMikKpQA7n0bvwEVyQChZHTA==
X-Google-Smtp-Source: ABdhPJzWJCtUlzMb2gGPZKNwNG9QtSPyLfFP+3RPTEMnNkQlZxqAfJdT5FrWVBOVnCRT2PjQEiHGwQ==
X-Received: by 2002:a17:90b:8f:: with SMTP id bb15mr34927pjb.209.1626810882627; 
 Tue, 20 Jul 2021 12:54:42 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:54:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 00/17] tcg: breakpoint reorg
Date: Tue, 20 Jul 2021 09:54:22 -1000
Message-Id: <20210720195439.626594-1-richard.henderson@linaro.org>
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

Changes for v6:
  * Reinstate accidental loss of singlestep overriding breakpoint check.
    Shows up in the record-replay avocado tests failing to make progress.
  * Add CPUState.gdb_adjust_breakpoint hook for AVR weirdness.

Changes for v5:
  * Include missing hunk in tb_gen_code, as noted in reply to v4.
  * Remove helper_check_breakpoints from target/arm/.
  * Reorg cflags_for_breakpoints into check_for_breakpoints;
    reorg cpu_exec to use a break instead of a longjmp.
  * Move singlestep_enabled check from cflags_for_breakpoints
    to curr_cflags, which makes cpu_exec_step_atomic cleaner.

Changes for v4:
  * Issue breakpoints directly from cflags_for_breakpoints.
    Do not generate code for a TB beginning with a BP at all.
  * Drop the problematic TranslatorOps.breakpoint_check hook entirely.

Changes for v3:
  * Map CF_COUNT_MASK == 0 -> TCG_MAX_INSNS.
  * Split out *_breakpoint_check fixes for avr, mips, riscv.

Changes for v2:
  * All prerequisites and 7 of the patches from v1 with are merged.

Patches lacking review:
  11-hw-core-Introduce-CPUClass.gdb_adjust_breakpoint.patch
  12-target-avr-Implement-gdb_adjust_breakpoint.patch
  15-accel-tcg-Remove-TranslatorOps.breakpoint_check.patch
  17-accel-tcg-Record-singlestep_enabled-in-tb-cflags.patch


r~


Richard Henderson (17):
  accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS
  accel/tcg: Move curr_cflags into cpu-exec.c
  target/alpha: Drop goto_tb path in gen_call_pal
  accel/tcg: Add CF_NO_GOTO_TB and CF_NO_GOTO_PTR
  accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
  accel/tcg: Handle -singlestep in curr_cflags
  accel/tcg: Use CF_NO_GOTO_{TB, PTR} in cpu_exec_step_atomic
  hw/core: Introduce TCGCPUOps.debug_check_breakpoint
  target/arm: Implement debug_check_breakpoint
  target/i386: Implement debug_check_breakpoint
  hw/core: Introduce CPUClass.gdb_adjust_breakpoint
  target/avr: Implement gdb_adjust_breakpoint
  accel/tcg: Merge tb_find into its only caller
  accel/tcg: Move breakpoint recognition outside translation
  accel/tcg: Remove TranslatorOps.breakpoint_check
  accel/tcg: Hoist tb_cflags to a local in translator_loop
  accel/tcg: Record singlestep_enabled in tb->cflags

 include/exec/exec-all.h       |  24 ++--
 include/exec/translator.h     |  11 --
 include/hw/core/cpu.h         |   4 +
 include/hw/core/tcg-cpu-ops.h |   6 +
 target/arm/helper.h           |   2 -
 target/arm/internals.h        |   3 +
 target/avr/cpu.h              |   1 +
 accel/tcg/cpu-exec.c          | 205 ++++++++++++++++++++++++++--------
 accel/tcg/translate-all.c     |   7 +-
 accel/tcg/translator.c        |  39 ++-----
 cpu.c                         |  34 ++----
 target/alpha/translate.c      |  31 +----
 target/arm/cpu.c              |   1 +
 target/arm/cpu_tcg.c          |   1 +
 target/arm/debug_helper.c     |  12 +-
 target/arm/translate-a64.c    |  25 -----
 target/arm/translate.c        |  29 -----
 target/avr/cpu.c              |   1 +
 target/avr/gdbstub.c          |  13 +++
 target/avr/translate.c        |  32 ------
 target/cris/translate.c       |  20 ----
 target/hexagon/translate.c    |  17 ---
 target/hppa/translate.c       |  11 --
 target/i386/tcg/tcg-cpu.c     |  12 ++
 target/i386/tcg/translate.c   |  28 -----
 target/m68k/translate.c       |  18 ---
 target/microblaze/translate.c |  18 ---
 target/mips/tcg/translate.c   |  19 ----
 target/nios2/translate.c      |  27 -----
 target/openrisc/translate.c   |  17 ---
 target/ppc/translate.c        |  18 ---
 target/riscv/translate.c      |  17 ---
 target/rx/translate.c         |  14 ---
 target/s390x/tcg/translate.c  |  24 ----
 target/sh4/translate.c        |  18 ---
 target/sparc/translate.c      |  17 ---
 target/tricore/translate.c    |  16 ---
 target/xtensa/translate.c     |  17 ---
 tcg/tcg-op.c                  |  28 ++---
 39 files changed, 248 insertions(+), 589 deletions(-)

-- 
2.25.1


