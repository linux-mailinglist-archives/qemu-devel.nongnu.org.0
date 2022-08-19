Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 775D359936F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:28:42 +0200 (CEST)
Received: from localhost ([::1]:34304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOsgb-0006nJ-DJ
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseL-0001RP-Bv
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:21 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:41558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseJ-0002iF-LY
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:21 -0400
Received: by mail-pf1-x42b.google.com with SMTP id q19so3234008pfg.8
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=d1gtamk6pX7WUClRyqTutZZX1d+IhzKETwFCuS+1R14=;
 b=v4s78+wCgDtJ7DNujXJddRXqZm3MpyxMHMN4jbKWpw+WUCVL7vBozK+Fe+Jg4/f2wQ
 zwnJFcbVRJjeDpAOy4FJODjBYkYvQI+PzVg7vUpSyfYCOubL8bQULRZuaTrY1SqjPRa8
 iikY3uUHRDqPywOj3yzD51NNgbZLk/iyPDuaFHttm3/9FRlPQCed4RoVMERrzEN3w62w
 Vt0MFjtd4DboEAjKtPvGVuBqcBYYCJlN6D5onCRoHmqL0AgpYBLgURgdY0GpS36QmOnt
 2ZUy3VJvJgFl927LroKSH8n/uVkWZB+Js9GJsFX9xcstKbRSEmsZYoCZUOR2sT9S6N6Z
 19wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=d1gtamk6pX7WUClRyqTutZZX1d+IhzKETwFCuS+1R14=;
 b=6ezyRksG0xvhwAuKMm0gsjKGVBbSj8WYjVzcLmTf3RMOFlQmMU/L8U8PR1ik+llDy4
 2YwepUSSBBjKQIuChRRaHr6MaxChsUl2ny5pmKfFMZlhiLiDkDxsE//ROYYbqQNlBfbU
 hGXNclR+kEf0P7Sem9pReNttfsjTXIQYB/HRdGkOA3fcKCZb9oMRUXwjJtQcR86ZDnxJ
 T139wqtjPCOB0Z2VrzfkNnSg9pFWDaOmdY5GitL8yqqiMsCmVRDjpBUNeeSmzZ1JgIX0
 f+pbTjGH12yBF08lsXbQho8hOwtr8V4D7nXABLSIq4ns4yPmlsmacwSAv+K6nTu8PFSG
 qgRA==
X-Gm-Message-State: ACgBeo2TJIBstqSu3ooUcUsq5t4JpZ++B8+04sE5rEiqen06oTsYbTtE
 nZc0VpcQ4Uh24flms1/u1gnnCEoknX0Wng==
X-Google-Smtp-Source: AA6agR7ML3ZMhIQEJiwPRSz/OSAMiKn/3Dw5b1l15pAcQe3ltABAiLjtScooy9WyJQEyzzoBO//ReA==
X-Received: by 2002:a63:d703:0:b0:41a:8d7a:eb3d with SMTP id
 d3-20020a63d703000000b0041a8d7aeb3dmr4863416pgg.59.1660879577807; 
 Thu, 18 Aug 2022 20:26:17 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 00/21] linux-user: Fix siginfo_t contents when jumping to
 non-readable pages
Date: Thu, 18 Aug 2022 20:25:54 -0700
Message-Id: <20220819032615.884847-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Hi Ilya,

After adding support for riscv (similar to s390x, in that we can
find the total insn length from the first couple of bits, so, easy),
I find that the test case doesn't work without all of the other
changes for PROT_EXEC, including the translator_ld changes.

Other changes from your v5:
  - mprotect invalidates tbs.  The test case is riscv, with a
    4-byte insn at offset 0xffe, which was chained to from the
    insn at offset 0xffa.  The fact that the 0xffe tb was not
    invalidated meant that we chained to it and re-executed
    without revalidating page protections.

  - rewrote the test framework to be agnostic of page size, which
    reduces some of the repetition.  I ran into trouble with the
    riscv linker, which relaxed the segment such that .align+.org
    wasn't actually honored.  This new form doesn't require the
    test bytes to be aligned in the binary.


r~


Ilya Leoshkevich (4):
  linux-user: Clear translations and tb_jmp_cache on mprotect()
  accel/tcg: Introduce is_same_page()
  target/s390x: Make translator stop before the end of a page
  target/i386: Make translator stop before the end of a page

Richard Henderson (17):
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
  accel/tcg: Add nofault parameter to get_page_addr_code_hostp
  accel/tcg: Raise PROT_EXEC exception early
  accel/tcg: Remove translator_ldsw
  accel/tcg: Add pc and host_pc params to gen_intermediate_code
  accel/tcg: Add fast path for translator_ld*
  target/riscv: Add MAX_INSN_LEN and insn_len
  target/riscv: Make translator stop before the end of a page

 include/elf.h                     |   1 +
 include/exec/cpu-common.h         |   1 +
 include/exec/exec-all.h           |  87 ++++++------------
 include/exec/translator.h         |  96 +++++++++++++-------
 linux-user/arm/target_cpu.h       |   4 +-
 linux-user/qemu.h                 |   1 +
 accel/tcg/cpu-exec.c              | 134 ++++++++++++++--------------
 accel/tcg/cputlb.c                |  93 ++++++--------------
 accel/tcg/plugin-gen.c            |   4 +-
 accel/tcg/translate-all.c         |  29 +++---
 accel/tcg/translator.c            | 136 +++++++++++++++++++++-------
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
 target/i386/tcg/translate.c       |  32 ++++++-
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
 tests/tcg/multiarch/noexec.c.inc  | 141 ++++++++++++++++++++++++++++++
 tests/tcg/riscv64/Makefile.target |   1 +
 tests/tcg/s390x/Makefile.target   |   1 +
 tests/tcg/x86_64/Makefile.target  |   3 +-
 44 files changed, 951 insertions(+), 342 deletions(-)
 create mode 100644 tests/tcg/riscv64/noexec.c
 create mode 100644 tests/tcg/s390x/noexec.c
 create mode 100644 tests/tcg/x86_64/noexec.c
 create mode 100644 tests/tcg/multiarch/noexec.c.inc

-- 
2.34.1


