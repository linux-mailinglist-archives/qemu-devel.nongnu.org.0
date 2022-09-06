Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6031A5AE33C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:43:27 +0200 (CEST)
Received: from localhost ([::1]:51002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUB0-00086O-L5
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6B-0002TN-PD
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:23 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU68-0005SJ-06
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:22 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bp20so13826723wrb.9
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=bzeuBela6nVLGaacXhGVmTig1x96h3AngeqL04awuiw=;
 b=zzR4M0RUFauDkYvff6ayRxo2N6bziXeGNvCv5Nh7dBb787daMHAO/RhZxDqEyd3pUs
 aTNgX+7EatxtGzbgu/GLTn8/bqJbBqo8ikOPUtnBjUuGrM6xGfnq11jXs9LhFJBUVzhu
 AicGxnWRtVSVDJIvshYkJKfXZIFSFFhxcFmoK1mQ0ZkhZ0TakehHFhnmkLtbFA0xFM4d
 33oyZWbvq1XvPFZFo2YufbZV9lqikKA9CvGp6bd99exnQdKeUbi0azr3H9bTHUF3symc
 IhaInnvaROfPsJPKSwjvIn3c4PdOLuUkeg1POZttwILJx8qJvSdoRe2J5M/LIYgORHUW
 VSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=bzeuBela6nVLGaacXhGVmTig1x96h3AngeqL04awuiw=;
 b=qHLA8Skb01soLbWBMSPvO61joqQPAdjDvui4CuFN5ZIcUcQAiuBdhhAQUT7qtVuLWl
 WgQ070KsYvXinrhEjwGvzRipHF5PWzSngKB5l8+HkI+pbVR4d3OcIkg3vUpdXrk+iN9Q
 oj7eB8gylwOM7c96gRWRTBjUL+Jxa0+8+h6ieYpLi3rp0eKZ5LeNWjSPuRFE2Z5o8ZUF
 nlD6nOYakBhhd6cu25DWDGVdD6yhemh5levmoCh/ULuQohV/Fn6j2nPSgPu5m/FTMlUC
 yz81NJyRYhFMlS5UI6G6csAyUVXL+SE6uRKxsrLcdXXrjr4WqcWCBJuOEqgIqRT0J/U7
 PC1Q==
X-Gm-Message-State: ACgBeo11Zvs9EaX5buUqne8Xb0861I5wu7fSn8D3igA3J72oeqlyu+6q
 OqlZz3QTkl4oQT7ngvXAaJuWRSGwRPHwe2Y4
X-Google-Smtp-Source: AA6agR46h30g+Jei/zABfXRtK+m3B/6T0MIweN3vTaFomW2wR5QQAFGhp8C5Ewr208ibJSzvqJqLhg==
X-Received: by 2002:adf:fb4f:0:b0:225:28cb:3331 with SMTP id
 c15-20020adffb4f000000b0022528cb3331mr27390857wrs.317.1662453498045; 
 Tue, 06 Sep 2022 01:38:18 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com
Subject: [PULL v3 00/20] tcg patch queue
Date: Tue,  6 Sep 2022 09:37:55 +0100
Message-Id: <20220906083815.252478-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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
v3: Work around clang preprocessor bug in patch 3.


r~


The following changes since commit fd28528ece590dc709d1a893fce2ff2f68ddca70:

  Merge tag 'pull-or1k-20220904' of https://github.com/stffrdhrn/qemu into staging (2022-09-05 18:01:02 -0400)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220906

for you to fetch changes up to 00c07344fa245b22e895b363320ba4cd0ec1088a:

  target/riscv: Make translator stop before the end of a page (2022-09-06 08:04:26 +0100)

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

