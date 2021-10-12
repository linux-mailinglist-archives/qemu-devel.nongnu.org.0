Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F6C42A955
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:24:09 +0200 (CEST)
Received: from localhost ([::1]:50384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKZT-0000GH-O9
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXU-0005yO-Qh
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:04 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXS-0003zv-V1
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:04 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 75so14322839pga.3
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t69l7OginBn0arCjGEwAKimGOwlun2z6Uax0cQ4RYhM=;
 b=GZMEImQRF3dnkq4k5l7hYs6VRSkPTNS1ezHRn2NEZvGkuLMuI8etSATM08YSDIh8JN
 6rVDUbn/cGEZZMq7aCmQr2q2/Ni05qPm+IdQ9SMzJ3HbiFj2XlWuLFiRypJrhZ5TSiZH
 bJlggcTFGtZH5J85mbCCPSWFfek6ioY5v3kXQu5GT9vMnw21TgP1wlRhaxkaD2wCmPtQ
 AYKsjbpMnSWZnODL5JBKnxky8Lh61dl8lM/d3YfHqnpfx7vuqIrTa38sVSQ66UpGRB16
 eJdJRJjnVzrs6PV0ji2+feej+Mp4ZJyuqpPdAd8OQ1VIB3VmOjFVt0txLrPooYucQJKv
 mYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t69l7OginBn0arCjGEwAKimGOwlun2z6Uax0cQ4RYhM=;
 b=8DkigBKG/Zn66TwLI1OACLxFHi7upxnEcWhukH0v2SjYjIJrsOobbiCd3RClVcM6fD
 e2BGtjN9gVO1q/4k3HEHNiGC1E0GBH+8ZjTaGMI97rTo+a6OXVnibPs5MmHGB1hDLdBS
 K5ZQqVoKMp+9wNxZP5M41tYUbxv+JOWm/VRFNz/Psb5GE9H+iiwbTfAZ5ZkXXckZxV5Q
 PzqOWuL3aBiSZi5yj2kV/d5j1P96nFQ3owdWmyXuAlMwLrd6WTyRrmtSYnPlDxW1zzoE
 wV0Y2OuO+XAF83Pw8mgaEsCWLmQInJxFn+/IRv7rK8sWNkS5WZV3IZj/es+LSuOu5OhL
 4vAA==
X-Gm-Message-State: AOAM531oU5xxiIfbcL73B8hX7uwUDgU66yaA465wH/Rbf+Xrge5OXHtU
 uHwUce9MpwUsuAt5QDtf+LGYmUl7XpOcWQ==
X-Google-Smtp-Source: ABdhPJz0QdyMLM47Ornah9TvRQwsq63+hcAvaLQaGu9FSbAtBy0qRfDTByr5stluJrESe+W4E1OoOw==
X-Received: by 2002:a65:6107:: with SMTP id z7mr23738415pgu.43.1634055721098; 
 Tue, 12 Oct 2021 09:22:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/23] tcg: singlestep reorg
Date: Tue, 12 Oct 2021 09:21:36 -0700
Message-Id: <20211012162159.471406-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Consolidate all handling for gdb singlestep to 4 lines in cpu_tb_exec.
Drop all of the code from target/*.  Note that nios2 and sparc, lacked
support for gdb singlestep entirely, which was a bit of a surprise.


r~


Changes for v2:
  * Rebase; prereq is now upstream.

v1:
https://lore.kernel.org/qemu-devel/20210721064155.645508-1-richard.henderson@linaro.org/


Richard Henderson (23):
  accel/tcg: Handle gdb singlestep in cpu_tb_exec
  target/alpha: Drop checks for singlestep_enabled
  target/avr: Drop checks for singlestep_enabled
  target/cris: Drop checks for singlestep_enabled
  target/hexagon: Drop checks for singlestep_enabled
  target/arm: Drop checks for singlestep_enabled
  target/hppa: Drop checks for singlestep_enabled
  target/i386: Check CF_NO_GOTO_TB for dc->jmp_opt
  target/i386: Drop check for singlestep_enabled
  target/m68k: Drop checks for singlestep_enabled
  target/microblaze: Check CF_NO_GOTO_TB for DISAS_JUMP
  target/microblaze: Drop checks for singlestep_enabled
  target/mips: Fix single stepping
  target/mips: Drop exit checks for singlestep_enabled
  target/openrisc: Drop checks for singlestep_enabled
  target/ppc: Drop exit checks for singlestep_enabled
  target/riscv: Remove dead code after exception
  target/riscv: Remove exit_tb and lookup_and_goto_ptr
  target/rx: Drop checks for singlestep_enabled
  target/s390x: Drop check for singlestep_enabled
  target/sh4: Drop check for singlestep_enabled
  target/tricore: Drop check for singlestep_enabled
  target/xtensa: Drop check for singlestep_enabled

 target/i386/helper.h                          |  1 -
 target/rx/helper.h                            |  1 -
 target/sh4/helper.h                           |  1 -
 target/tricore/helper.h                       |  1 -
 accel/tcg/cpu-exec.c                          | 11 +++
 target/alpha/translate.c                      | 13 +---
 target/arm/translate-a64.c                    | 10 +--
 target/arm/translate.c                        | 36 ++-------
 target/avr/translate.c                        | 19 +----
 target/cris/translate.c                       | 16 ----
 target/hexagon/translate.c                    | 12 +--
 target/hppa/translate.c                       | 17 +----
 target/i386/tcg/misc_helper.c                 |  8 --
 target/i386/tcg/translate.c                   |  9 +--
 target/m68k/translate.c                       | 44 +++--------
 target/microblaze/translate.c                 | 18 +----
 target/mips/tcg/translate.c                   | 75 +++++++++----------
 target/openrisc/translate.c                   | 18 +----
 target/ppc/translate.c                        | 38 ++--------
 target/riscv/translate.c                      | 27 +------
 target/rx/op_helper.c                         |  8 --
 target/rx/translate.c                         | 12 +--
 target/s390x/tcg/translate.c                  |  8 +-
 target/sh4/op_helper.c                        |  5 --
 target/sh4/translate.c                        | 14 +---
 target/tricore/op_helper.c                    |  7 --
 target/tricore/translate.c                    | 14 +---
 target/xtensa/translate.c                     | 25 ++-----
 .../riscv/insn_trans/trans_privileged.c.inc   | 10 +--
 target/riscv/insn_trans/trans_rvi.c.inc       |  8 +-
 target/riscv/insn_trans/trans_rvv.c.inc       |  2 +-
 31 files changed, 118 insertions(+), 370 deletions(-)

-- 
2.25.1


