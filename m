Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1804A5AC1D7
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 02:25:12 +0200 (CEST)
Received: from localhost ([::1]:50552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUdRm-0008He-LD
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 20:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oUdQ3-0005Co-Sh
 for qemu-devel@nongnu.org; Sat, 03 Sep 2022 20:23:23 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oUdQ2-0004pp-13
 for qemu-devel@nongnu.org; Sat, 03 Sep 2022 20:23:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id k9so6921260wri.0
 for <qemu-devel@nongnu.org>; Sat, 03 Sep 2022 17:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=oy+DjU7yJfGPX4qhUk7XOJKW5EYiW3kn5X7wryKqmPU=;
 b=kRbQMd2QF8NFErCnfJW9vANad9GbWTlhhL5VONVpm0FAFv9DzGsapHQfyB/5gMDI48
 o+fYTSuyozVuNsHpJ4vkT4uRyWeBydOGqR02ZtTvHacxi3o+ZH6Y77VNkTYPH8XbyLYN
 NlA04nNxTo0yVFWjN3MI6HoXkoUpksBe74zqBznAdWQLSW3c6lex9BU0KybXeKz4Sdjy
 Ad0Om0/t84dbKzIXso2Z7tPRzUruhfBt2RSBO53py8fTkbak4Io2vZdDlTb7ciTu1J5K
 HKq0T4TaADe26EZGYmMCAIo1MapNOBtUAzMMcm85HE1Ch3W0+MYfdHGhIwclASCACuWa
 uA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=oy+DjU7yJfGPX4qhUk7XOJKW5EYiW3kn5X7wryKqmPU=;
 b=e4vPieIYO+SdcpCHMI6Txienv3/tAiXYe9Z44djgB4cGzmWaoSXfJyo1acKsPlv67z
 /5bbKRLhxpcNMno69Ql9JKfSnt2KhYZyfjd1wfhwHvw8Eq4qbZ6iFpg4CiZ4MXkaTyiM
 jK98Lrv7zdHfnBb8SMSPjtMJ9pCN0OlUEEKRsjJaICy4xi/a2DztvX31wOv3xQLqiJS3
 Y31bfL06c0OId3Qp6rW+9SOqxM4BRHGaljD5qqntajZPdhF30AzJzVzWy/Ey1OFbH8Ix
 mR5CDYQju9cRGHyxaUcmcGzLHEpa090ynHWoTdukDFP5fbUsexgXqQI89gucsGY+a5zE
 KR1Q==
X-Gm-Message-State: ACgBeo14i+7t6FeTbogBLfFcMiC8hVgr3fHd0Q9t0dWu5Wb9TTH4X6gR
 NPuEnIjEPIdLGQWzJPNqinVdtz2sTAstfPGt70Q=
X-Google-Smtp-Source: AA6agR4oi69Znib1NYuFkXc9AAfhmBfNK9QVQg/ZU+UpyB8ID/rpIXYIcf8lSYR3IZX35gah/amQww==
X-Received: by 2002:a5d:6e10:0:b0:226:ed14:e340 with SMTP id
 h16-20020a5d6e10000000b00226ed14e340mr10355921wrz.122.1662250999838; 
 Sat, 03 Sep 2022 17:23:19 -0700 (PDT)
Received: from stoup.. ([78.19.130.69]) by smtp.gmail.com with ESMTPSA id
 f16-20020adff590000000b0022865038308sm424771wro.93.2022.09.03.17.23.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 17:23:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/20] tcg patch queue
Date: Sun,  4 Sep 2022 01:23:16 +0100
Message-Id: <20220904002317.60158-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

v2: Fix incorretly resolved rebase conflict in patch 16.


r~


The following changes since commit 61fd710b8da8aedcea9b4f197283dc38638e4b60:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-09-02 13:24:28 -0400)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220904

for you to fetch changes up to cc64de1fdeb81bc1ab8bb6c7c24bfd4fc9b28ef2:

  target/riscv: Make translator stop before the end of a page (2022-09-03 09:27:05 +0100)

----------------------------------------------------------------
Respect PROT_EXEC in user-only mode.
Fix s390x, i386 and riscv for translations crossing a page.

----------------------------------------------------------------
Ilya Leoshkevich (4):
      linux-user: Clear translations on mprotect()
      accel/tcg: Introduce is_same_page()
      target/s390x: Make translator stop before the end of a page
      target/i386: Make translator stop before the end of a page

Richard Henderson (16):
      linux-user/arm: Mark the commpage executable
      linux-user/hppa: Allocate page zero as a commpage
      linux-user/x86_64: Allocate vsyscall page as a commpage
      linux-user: Honor PT_GNU_STACK
      tests/tcg/i386: Move smc_code2 to an executable section
      accel/tcg: Properly implement get_page_addr_code for user-only
      accel/tcg: Unlock mmap_lock after longjmp
      accel/tcg: Make tb_htable_lookup static
      accel/tcg: Move qemu_ram_addr_from_host_nofail to physmem.c
      accel/tcg: Use probe_access_internal for softmmu get_page_addr_code_hostp
      accel/tcg: Document the faulting lookup in tb_lookup_cmp
      accel/tcg: Remove translator_ldsw
      accel/tcg: Add pc and host_pc params to gen_intermediate_code
      accel/tcg: Add fast path for translator_ld*
      target/riscv: Add MAX_INSN_LEN and insn_len
      target/riscv: Make translator stop before the end of a page

 include/elf.h                     |   1 +
 include/exec/cpu-common.h         |   1 +
 include/exec/exec-all.h           |  89 ++++++++----------------
 include/exec/translator.h         |  96 ++++++++++++++++---------
 linux-user/arm/target_cpu.h       |   4 +-
 linux-user/qemu.h                 |   1 +
 accel/tcg/cpu-exec.c              | 143 ++++++++++++++++++++------------------
 accel/tcg/cputlb.c                |  93 +++++++------------------
 accel/tcg/translate-all.c         |  29 ++++----
 accel/tcg/translator.c            | 135 ++++++++++++++++++++++++++---------
 accel/tcg/user-exec.c             |  17 ++++-
 linux-user/elfload.c              |  82 ++++++++++++++++++++--
 linux-user/mmap.c                 |   6 +-
 softmmu/physmem.c                 |  12 ++++
 target/alpha/translate.c          |   5 +-
 target/arm/translate.c            |   5 +-
 target/avr/translate.c            |   5 +-
 target/cris/translate.c           |   5 +-
 target/hexagon/translate.c        |   6 +-
 target/hppa/translate.c           |   5 +-
 target/i386/tcg/translate.c       |  71 +++++++++++--------
 target/loongarch/translate.c      |   6 +-
 target/m68k/translate.c           |   5 +-
 target/microblaze/translate.c     |   5 +-
 target/mips/tcg/translate.c       |   5 +-
 target/nios2/translate.c          |   5 +-
 target/openrisc/translate.c       |   6 +-
 target/ppc/translate.c            |   5 +-
 target/riscv/translate.c          |  32 +++++++--
 target/rx/translate.c             |   5 +-
 target/s390x/tcg/translate.c      |  20 ++++--
 target/sh4/translate.c            |   5 +-
 target/sparc/translate.c          |   5 +-
 target/tricore/translate.c        |   6 +-
 target/xtensa/translate.c         |   6 +-
 tests/tcg/i386/test-i386.c        |   2 +-
 tests/tcg/riscv64/noexec.c        |  79 +++++++++++++++++++++
 tests/tcg/s390x/noexec.c          | 106 ++++++++++++++++++++++++++++
 tests/tcg/x86_64/noexec.c         |  75 ++++++++++++++++++++
 tests/tcg/multiarch/noexec.c.inc  | 139 ++++++++++++++++++++++++++++++++++++
 tests/tcg/riscv64/Makefile.target |   1 +
 tests/tcg/s390x/Makefile.target   |   1 +
 tests/tcg/x86_64/Makefile.target  |   3 +-
 43 files changed, 966 insertions(+), 367 deletions(-)
 create mode 100644 tests/tcg/riscv64/noexec.c
 create mode 100644 tests/tcg/s390x/noexec.c
 create mode 100644 tests/tcg/x86_64/noexec.c
 create mode 100644 tests/tcg/multiarch/noexec.c.inc

