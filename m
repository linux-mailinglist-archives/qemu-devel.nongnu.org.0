Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9FE3CF137
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:20:06 +0200 (CEST)
Received: from localhost ([::1]:58176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eQX-0000Ue-Or
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOd-0006PE-DU
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:07 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOb-0003JZ-N0
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:07 -0400
Received: by mail-pl1-x633.google.com with SMTP id h1so10652191plf.6
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 18:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+usbVb2W8MZzTM+BhMzFQELuv+ybNVYlkCIWtr8xkMY=;
 b=aUwSGCY1vCVHMdaCi29/sVW+w+dBFXBSX0D9jneH6Ke1+XZswYIJBqpRTHv73dmCZ3
 d2XdGkHMkdNO7PWcz5Ff8Ip00k/47Ilvhyh9nAXhrzJrVxT4SSX66J6iLdK6UfiJyqqn
 6mdlUuusHiBKSFyFDAgrmy0K6kjIm9oz9lA7vHlcDTiAAHPpaWoVNJ7fDQtbKPJvHoRc
 HVCtr8wwZMZyhmViyCgOhTp45jya2j6guYHOq6a/sVTQ/0lKQmsRyRaz21doNiKIv93n
 GkxO6Olw9ZaomqusmNzKTaJ1Hc0UVRQ4LmsPfG6puVUIRUuCucIFWGF0JJvJF++vv7Ya
 aFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+usbVb2W8MZzTM+BhMzFQELuv+ybNVYlkCIWtr8xkMY=;
 b=U7G3g5+12sFz/C5ACoqRDOaWPSCAFr9O7sk3pCSqe/ZiBdu2uL2+yDDdO7ryIZ/7gM
 ElWvO0hy+Q559jN/EbiM8qxWYqi7LYk+80FtS22y1lhXK7JQxjcDSEeSf0AWqsow5Md6
 EjyzGotXRyfPUhkNYBJV78NQnYtBjt6tDpASD2jEa7PXqPvmdozrY1aB3clEfH5xBwlB
 5VIB01IrUMyBz/mdmHkbBIPUsOtjEsCIOa1y38ZuVktJCdKzWFh4vf0WpVL6VUhFMzd7
 LwGem+TSZRfHUDcDiOtjyg/+kzrUHxuOBL4HJDIOm69AUUNZZV7owisKn/LGRa7uVMYT
 bLrQ==
X-Gm-Message-State: AOAM531Az1DhBGUscx8SvR0WK49leqHGzcsgHZmVmlPzVA80Fb9zZaLA
 GihsSHiVY9tQm90etGnpFT/PQ1iocN5QEA==
X-Google-Smtp-Source: ABdhPJzwn7yPm1JD4KwS7ZLpM0TzuwfY3vKeq7/eezprqOB/jaDtU88g6wcd9v5O9xBFi/KyCkhahQ==
X-Received: by 2002:a17:90b:8f:: with SMTP id
 bb15mr27246943pjb.209.1626743883937; 
 Mon, 19 Jul 2021 18:18:03 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25378054pgi.94.2021.07.19.18.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 18:18:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v5 00/15] tcg: breakpoint reorg
Date: Mon, 19 Jul 2021 15:17:45 -1000
Message-Id: <20210720011800.483966-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Patches lacking review are all new:
  03-target-alpha-Drop-goto_tb-path-in-gen_call_pal.patch
  08-hw-core-Introduce-TCGCPUOps.debug_check_breakpoin.patch
  09-target-arm-Implement-debug_check_breakpoint.patch
  10-target-i386-Implement-debug_check_breakpoint.patch
  11-accel-tcg-Merge-tb_find-into-its-only-caller.patch
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
  hw/core: Introduce TCGCPUOps.debug_check_breakpoint
  target/arm: Implement debug_check_breakpoint
  target/i386: Implement debug_check_breakpoint
  accel/tcg: Merge tb_find into its only caller
  accel/tcg: Move breakpoint recognition outside translation
  accel/tcg: Remove TranslatorOps.breakpoint_check
  accel/tcg: Hoist tb_cflags to a local in translator_loop
  accel/tcg: Record singlestep_enabled in tb->cflags

 include/exec/exec-all.h       |  24 +++--
 include/exec/translator.h     |  11 --
 include/hw/core/tcg-cpu-ops.h |   6 ++
 target/arm/helper.h           |   2 -
 target/arm/internals.h        |   3 +
 accel/tcg/cpu-exec.c          | 192 +++++++++++++++++++++++++---------
 accel/tcg/translate-all.c     |   7 +-
 accel/tcg/translator.c        |  39 ++-----
 cpu.c                         |  24 -----
 target/alpha/translate.c      |  31 +-----
 target/arm/cpu.c              |   1 +
 target/arm/cpu_tcg.c          |   1 +
 target/arm/debug_helper.c     |  12 +--
 target/arm/translate-a64.c    |  25 -----
 target/arm/translate.c        |  29 -----
 target/avr/translate.c        |  10 --
 target/cris/translate.c       |  20 ----
 target/hexagon/translate.c    |  17 ---
 target/hppa/translate.c       |  11 --
 target/i386/tcg/tcg-cpu.c     |  12 +++
 target/i386/tcg/translate.c   |  28 -----
 target/m68k/translate.c       |  18 ----
 target/microblaze/translate.c |  18 ----
 target/mips/tcg/translate.c   |  19 ----
 target/nios2/translate.c      |  27 -----
 target/openrisc/translate.c   |  17 ---
 target/ppc/translate.c        |  18 ----
 target/riscv/translate.c      |  17 ---
 target/rx/translate.c         |  14 ---
 target/s390x/tcg/translate.c  |  24 -----
 target/sh4/translate.c        |  18 ----
 target/sparc/translate.c      |  17 ---
 target/tricore/translate.c    |  16 ---
 target/xtensa/translate.c     |  17 ---
 tcg/tcg-op.c                  |  28 +++--
 35 files changed, 206 insertions(+), 567 deletions(-)

-- 
2.25.1


