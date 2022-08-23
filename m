Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C5A59EEA4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:08:37 +0200 (CEST)
Received: from localhost ([::1]:54024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQc4a-0005SN-3a
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc1s-0008Et-Nt
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:48 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc1q-0001PW-Rk
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:48 -0400
Received: by mail-pl1-x633.google.com with SMTP id m2so14038440pls.4
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Ied0v7m+SLcDpljrRMW4umj/LKgigmTe7h9ULeQdiOM=;
 b=D6uff1QBkswk49qsc4e9D1cB29IbrV+kjKiiAbjihXDs+AaTQRxutYoYi4yLbrurMB
 M3HdPPkFurs0mgfO5caFZPUq9GJMjQ7mmRTGNNNs5CiR5n31euy4W6vGPYy8r5BbWuh0
 4nJCFZXKz7BiIZoN+AO8UnQ/3nOpJw1wedZ/p+zs2dK6NZ6SY30xctIqFJ7Uc/IfJ2JU
 i3aJLg8sBMI8J3OVe+YJro/D59LGm8jm4DPtKs1iY69xP5WuFL9Mn5VybvcMVwMo3jlD
 lEc7ZUBBAp9Ojv48uSkORAvp+B4z5Jzfv9/jcvsaEcadJhU0ECfJkeFQJMfqbiV0INKq
 dJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Ied0v7m+SLcDpljrRMW4umj/LKgigmTe7h9ULeQdiOM=;
 b=jvK/yNw3il1BNXTLiYtm+O8ba4nxX+ZObagjUmgwVhuG6fz9ADt65GkFF9a2jrJwcH
 n1L+DjSHQBFpbXf6qN2/Wl073r+lz+VRKS6NeHRDAnEzPTB97B64lFE6vSe9xcuE8zot
 4OwiH0IlxHF6EeKunEv81VX/i8rK18e0H6BSF5IR8gGzOoPSekwbw70wbNRmpcoump4+
 Aw1yml3BAXUnfeS5oFuEOVlJBJzMJLb0UxquS+4cwxA5Qs8AEJezLU37NoVIvCA+Nb3Y
 BYc02E5R8m7BGtrbyU7l8yROxTAknnXKoGDvg86OMPyQ9Feh5gtt+3HRYs/MwcWTJtDV
 RQlw==
X-Gm-Message-State: ACgBeo0KSzjG6iUSFQiTb+HpYuRYMS4a3N4VayfuhFXufR1ZqEQX0XK3
 vJj+zgKjXwHX3D4tjx/4b+shVCHjzChg7g==
X-Google-Smtp-Source: AA6agR5WC2ztB8K+uWF8/tSAUqhP7Vkyx6ooHdFW2fizqiuJ+DB6g1wKoN0PXcmOrhg2EUTIO3mHxg==
X-Received: by 2002:a17:90b:1194:b0:1fa:c41a:59c0 with SMTP id
 gk20-20020a17090b119400b001fac41a59c0mr5205551pjb.165.1661292345172; 
 Tue, 23 Aug 2022 15:05:45 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:05:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com,
	laurent@vivier.eu,
	alex.bennee@linaro.org
Subject: [PATCH v7 00/20] linux-user: Fix siginfo_t contents when jumping to
 non-readable pages
Date: Tue, 23 Aug 2022 15:05:22 -0700
Message-Id: <20220823220542.1993395-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Changes from v6:
  * Fix an unintentional behaviour change in patches 8 & 12, which
    had inspired the old patches 13 & 14 to fix (removed).
  * Added a new documentation patch 13.


r~


Ilya Leoshkevich (4):
  linux-user: Clear translations and tb_jmp_cache on mprotect()
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
  accel/tcg: Use probe_access_internal for softmmu
    get_page_addr_code_hostp
  accel/tcg: Document the faulting lookup in tb_lookup_cmp
  accel/tcg: Remove translator_ldsw
  accel/tcg: Add pc and host_pc params to gen_intermediate_code
  accel/tcg: Add fast path for translator_ld*
  target/riscv: Add MAX_INSN_LEN and insn_len
  target/riscv: Make translator stop before the end of a page

 include/elf.h                     |   1 +
 include/exec/cpu-common.h         |   1 +
 include/exec/exec-all.h           |  89 ++++++-------------
 include/exec/translator.h         |  96 +++++++++++++-------
 linux-user/arm/target_cpu.h       |   4 +-
 linux-user/qemu.h                 |   1 +
 accel/tcg/cpu-exec.c              | 143 ++++++++++++++++--------------
 accel/tcg/cputlb.c                |  93 ++++++-------------
 accel/tcg/translate-all.c         |  29 +++---
 accel/tcg/translator.c            | 135 +++++++++++++++++++++-------
 accel/tcg/user-exec.c             |  18 +++-
 linux-user/elfload.c              |  82 +++++++++++++++--
 linux-user/mmap.c                 |   8 ++
 softmmu/physmem.c                 |  12 +++
 target/alpha/translate.c          |   5 +-
 target/arm/translate.c            |   5 +-
 target/avr/translate.c            |   5 +-
 target/cris/translate.c           |   5 +-
 target/hexagon/translate.c        |   6 +-
 target/hppa/translate.c           |   5 +-
 target/i386/tcg/translate.c       |  71 +++++++++------
 target/loongarch/translate.c      |   6 +-
 target/m68k/translate.c           |   5 +-
 target/microblaze/translate.c     |   5 +-
 target/mips/tcg/translate.c       |   5 +-
 target/nios2/translate.c          |   5 +-
 target/openrisc/translate.c       |   6 +-
 target/ppc/translate.c            |   5 +-
 target/riscv/translate.c          |  32 +++++--
 target/rx/translate.c             |   5 +-
 target/s390x/tcg/translate.c      |  20 +++--
 target/sh4/translate.c            |   5 +-
 target/sparc/translate.c          |   5 +-
 target/tricore/translate.c        |   6 +-
 target/xtensa/translate.c         |   6 +-
 tests/tcg/i386/test-i386.c        |   2 +-
 tests/tcg/riscv64/noexec.c        |  79 +++++++++++++++++
 tests/tcg/s390x/noexec.c          | 106 ++++++++++++++++++++++
 tests/tcg/x86_64/noexec.c         |  75 ++++++++++++++++
 tests/tcg/multiarch/noexec.c.inc  | 139 +++++++++++++++++++++++++++++
 tests/tcg/riscv64/Makefile.target |   1 +
 tests/tcg/s390x/Makefile.target   |   1 +
 tests/tcg/x86_64/Makefile.target  |   3 +-
 43 files changed, 971 insertions(+), 365 deletions(-)
 create mode 100644 tests/tcg/riscv64/noexec.c
 create mode 100644 tests/tcg/s390x/noexec.c
 create mode 100644 tests/tcg/x86_64/noexec.c
 create mode 100644 tests/tcg/multiarch/noexec.c.inc

-- 
2.34.1


