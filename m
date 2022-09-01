Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844035A8EF5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 08:59:54 +0200 (CEST)
Received: from localhost ([::1]:58586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeB7-0003AK-Dg
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 02:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe3n-0005my-6D
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:19 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe3k-0003G2-RT
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:18 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w5so4830600wrn.12
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=8PHg1CcIroSNM7BtVmVxL97bvtpUxPSvMiB/+m+fxUg=;
 b=lvGrA1dcySpNxAcHdtLlf4YUQJRjMDC9OrO8pc+Am0Ag+rLWh0unc7jTuqYSVnyk0Y
 6HsVOBzv7CJz+qBE1LnUMEo87oqJc47qpYFQSP1Prkj+ViHr/hTY1PsFSL4YNlbXznV7
 YkMmcFApq8k+6YRg+wX86HNg7PBIg8h/QHqzCx2bKBEfkGgUvLCcKcbKI2kzcldI7Srh
 kAqWaBkGiCYbzDGbm3d1+BRjwKzKf+JP4eX7xPV14Xr5nRKZYW1I2s8eNKg+3GQ5+br3
 nC6NJ7tKLxazGnZy75L4gi/Y3jscw4rpfc8ceaFpTs1QP9jaZk2oq1LdEIIoRyiyU7Hw
 moEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=8PHg1CcIroSNM7BtVmVxL97bvtpUxPSvMiB/+m+fxUg=;
 b=s1lxGHhm+Xovye7n/Dl2tnvaVXSPqI88vy7INXPUrDzy7w8T1KJbntnAwKyrtWsHlW
 cHrtfZ2XXcf/gNskFmhB52UPxvQ6a55K0PamNPEVv2CqmdaBXtuxmZvr7PK7lDPdYXLB
 9mzSREOvXDUqDCp7ZKcAPxrxnS9MO9D2bMnpZJJcbM9uUhzgZ+0dbgFQJsk5ShRjDdBp
 rf19Lsax1kNDAMkQ4+Na/hztF2VjqNIZKUwIwef6yjaEJf7E7F0dJ0ieWBXW9Shj5khW
 VQAwMg8un3MIhO0KSiQaaF9NBmMG1RLwBHsqylY9SG1/D7NfcPZHyytfBWSW1WU6jcUe
 0lyA==
X-Gm-Message-State: ACgBeo1r+Sv5+7NlwFw61MhVkVuUjSqQX9YI58Wm5d4fkTvhi8WbdxZ2
 /OFPnbeVj3gIbVc8xN/FDgC4nTt3tNUUq9Xy
X-Google-Smtp-Source: AA6agR504vjqqohYT3fI2ZGPxZ6yMw1T4s2qLrqKYZhAQRaO3Tk0x6N5EbBosQNAPZGgpn4cyOkFQg==
X-Received: by 2002:a05:6000:1568:b0:226:e2d0:abcb with SMTP id
 8-20020a056000156800b00226e2d0abcbmr6884853wrz.456.1662015135087; 
 Wed, 31 Aug 2022 23:52:15 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/20] tcg patch queue
Date: Thu,  1 Sep 2022 07:51:46 +0100
Message-Id: <20220901065210.117081-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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

The following changes since commit e93ded1bf6c94ab95015b33e188bc8b0b0c32670:

  Merge tag 'testing-pull-request-2022-08-30' of https://gitlab.com/thuth/qemu into staging (2022-08-31 18:19:03 -0400)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220901

for you to fetch changes up to 20011be2e30b8aa8ef1fc258485f00c688703deb:

  target/riscv: Make translator stop before the end of a page (2022-09-01 07:43:08 +0100)

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

