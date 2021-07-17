Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABBD3CC699
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:21:13 +0200 (CEST)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4sgK-0000z3-Nh
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4se9-0006pB-NM
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:18:57 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:37584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4se7-0001ya-18
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:18:56 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t9so14558312pgn.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MazJOBrUNgCyJ9JDM+TMpHl/R3B/OHRmXwnfdJPX8J0=;
 b=OP4Dga/DzTvMv7Bz3CjoEfumWSU/XIQkcO6H9zsbAdAXe7oeLTgm7mvwDYT+H/be+8
 dOzSLKimZm6DGFcBa2RdJOWvyIfKQYQTI/iQbnSCbuIAAURtXyaJRr+tF00wknPmSOSF
 LEnT5B2LPe77mtTCWrUsZkJjr3i8eFmU49iHYxPtmC5UtdxLa5P6FD6mkO0gyp9k4JaG
 WKK9s5D9wJM0QyBzEFHxqCNHGw0zyEHLrwhOq5w1s0Wi96stXjE/2nMkZlAMT6St6q2M
 ehlYopS77GxrTTITJ/oo2hQ5+FGQgI+ZIDc8Se2VuZ06wvczDVql/q0S/jixM4bskaRs
 Na7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MazJOBrUNgCyJ9JDM+TMpHl/R3B/OHRmXwnfdJPX8J0=;
 b=mmlpfUyXHBN6tpQ2qp+3m0OHTUNO7rfxTodBNSyo9RliXNZfBjkN/jCXZHaIRvyJ45
 IxyG9tCYMYTWHlbW2UNWZwzYF52kfmyVDg+ETefjuvySHF3gETw55kir0FuxluI25nTH
 J9FNAYjrwxBKlbzm5SmMmRroF/kiazMOIpsg8BWPJ3hvaVryIvpATnAKEfH/DazPGNix
 TnPqlL5Q0JogeRTG6fI3d/bA1WhMngy4n70QzO62+VkQUNiczJG3BUBc4qPokDPhhO5T
 kuJQx5jMFoW3WaI/HgvLAAOxZSQtZlos485dMM7+0/8cXvSHdtORU//JtgzjFh7/6RTd
 mPXA==
X-Gm-Message-State: AOAM531ggTUs4zWWVM144+kKTIxKAvD+lu8L+nW1dfjApBBGO36idh3h
 aqDQAl9zzGb2/Q1F5rj1I1OEVl0ZM5yp8w==
X-Google-Smtp-Source: ABdhPJyON2Hd4qTGniORizLF1h1jVuQ0TRDp57oDz2qInqEjxyxEBKlSJJPxepm/p2jLLAKgFW+N8w==
X-Received: by 2002:a65:568c:: with SMTP id v12mr17438230pgs.88.1626560332866; 
 Sat, 17 Jul 2021 15:18:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n14sm2405091pjv.34.2021.07.17.15.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 15:18:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/13] tcg: breakpoint reorg
Date: Sat, 17 Jul 2021 15:18:38 -0700
Message-Id: <20210717221851.2124573-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Changes for v3:
  * Map CF_COUNT_MASK == 0 -> TCG_MAX_INSNS.
  * Split out *_breakpoint_check fixes for avr, mips, riscv.

Changes for v2:
  * All prerequisites and 7 of the patches from v1 with are merged.

Patches lacking review:
  08-target-avr-Advance-pc-in-avr_tr_breakpoint_check.patch
  09-target-mips-Reduce-mips_tr_breakpoint_check-pc-ad.patch
  10-target-riscv-Reduce-riscv_tr_breakpoint_check-pc-.patch
  13-accel-tcg-Encode-breakpoint-info-into-tb-cflags.patch


r~


Richard Henderson (13):
  accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS
  accel/tcg: Move curr_cflags into cpu-exec.c
  accel/tcg: Add CF_NO_GOTO_TB and CF_NO_GOTO_PTR
  accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
  accel/tcg: Handle -singlestep in curr_cflags
  accel/tcg: Use CF_NO_GOTO_{TB,PTR} in cpu_exec_step_atomic
  accel/tcg: Move cflags lookup into tb_find
  target/avr: Advance pc in avr_tr_breakpoint_check
  target/mips: Reduce mips_tr_breakpoint_check pc advance to 2
  target/riscv: Reduce riscv_tr_breakpoint_check pc advance to 2
  accel/tcg: Adjust interface of TranslatorOps.breakpoint_check
  accel/tcg: Hoist tb_cflags to a local in translator_loop
  accel/tcg: Encode breakpoint info into tb->cflags

 include/exec/exec-all.h       |  30 +++++---
 include/exec/translator.h     |  17 +++--
 accel/tcg/cpu-exec.c          | 130 ++++++++++++++++++++++++++++------
 accel/tcg/translate-all.c     |   7 +-
 accel/tcg/translator.c        |  79 ++++++++++++++-------
 cpu.c                         |  24 -------
 target/alpha/translate.c      |  12 +---
 target/arm/translate-a64.c    |  14 ++--
 target/arm/translate.c        |  20 +++---
 target/avr/translate.c        |   6 +-
 target/cris/translate.c       |  14 ++--
 target/hexagon/translate.c    |  13 +---
 target/hppa/translate.c       |   7 +-
 target/i386/tcg/translate.c   |  15 ++--
 target/m68k/translate.c       |  14 +---
 target/microblaze/translate.c |  14 +---
 target/mips/tcg/translate.c   |  14 ++--
 target/nios2/translate.c      |  13 +---
 target/openrisc/translate.c   |  11 +--
 target/ppc/translate.c        |  13 +---
 target/riscv/translate.c      |  11 +--
 target/rx/translate.c         |   8 +--
 target/s390x/tcg/translate.c  |  12 ++--
 target/sh4/translate.c        |  12 ++--
 target/sparc/translate.c      |   9 ++-
 target/tricore/translate.c    |  13 +---
 target/xtensa/translate.c     |  12 ++--
 tcg/tcg-op.c                  |  28 ++++----
 28 files changed, 280 insertions(+), 292 deletions(-)

-- 
2.25.1


