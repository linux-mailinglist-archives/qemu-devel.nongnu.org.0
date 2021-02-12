Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7A631A4E9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:03:19 +0100 (CET)
Received: from localhost ([::1]:39602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdio-00047V-BY
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdV6-0001Rh-9f
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:08 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdV3-0007eZ-Ls
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:07 -0500
Received: by mail-pg1-x529.google.com with SMTP id z21so252770pgj.4
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kUnbSPv20rAmUBo87jZNnYS5273cnOGBXrn2xIvI+Yw=;
 b=H/sWCzzleN/+bsCQfy8g1bwcPoYUv6/4VUm4H3flvSlB2xP6C7jEpkS52gAiZ1jHTD
 GpMCw3cJ4KmpBUHNKG4CqzLI742ubpsx9jhw87V54vQ8iciqxC2dzmBVmVPn4+sgTOtA
 4GKUXXuhl6FTvQV9USbYOib9CDBD6jwPzfggM1w8HNPfUbrYeamgBnFr414O+9vG/mcE
 cgUAMTikuf6DNg5ca96aRtl7gbw/BeY03bW/G4qsrD7JCEadKCQufgvaaRTTYbvnZcDR
 vLxAWqtHWtblcCERBZsAwHONa9N/rEyE989EIrDnEFvWVR4k5w9XXwA/MimmJOdmQIzH
 J7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kUnbSPv20rAmUBo87jZNnYS5273cnOGBXrn2xIvI+Yw=;
 b=mzHbMA6sqM4yRaZzYwHP/TrMtqJV4HHRIc6Z9ZNt/nmUXqavi61ky0JreKb8BltKXe
 tDkftW9zOQ5WLwSWn4SG52DeiDmo8JWWvLP0Yg6WRDpIe+UAXXxGrJdRgHpHvSgFpYAE
 CsMmBJiadCGl3OVwWptsJoLUuTpQNn6UEHfACIMe3ba+k9tIYoWQ16XrIDa3qkPol7m7
 Bd57E+/nSN02ZnoijDnxhYvOGhzHx/GsGgIkHDRhgymnKU9SCvtuhPxcEs8EBkOJ4gXW
 FmFQEnK+evGSsSroDBoewXkN1Bgz6ej7T9GYoPtSp+4OSjuvqGJb8+wxY3a/XdKPpeFW
 Wu+w==
X-Gm-Message-State: AOAM53138B+8sqP0R37WJ9tcvpeXRcZs7ml9IUfQDUS1UcJYC+yIZT2n
 w4T8MKsZcSDe97uMPtAcqxeWrlesIDjMNQ==
X-Google-Smtp-Source: ABdhPJzgtQ9nLBkY90b3Jvuh5nxEZO3SOmz5UCphuLUWJZwUCtNTp6aLDvVpodA43vP4XjaoIC3cEA==
X-Received: by 2002:aa7:9ec5:0:b029:1e7:a1c:8f8a with SMTP id
 r5-20020aa79ec50000b02901e70a1c8f8amr4347973pfq.41.1613155744242; 
 Fri, 12 Feb 2021 10:49:04 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/31] target-arm: Implement ARMv8.5-MemTag, user mode
Date: Fri, 12 Feb 2021 10:48:31 -0800
Message-Id: <20210212184902.1251044-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v7:
  * Fix bsd-user vs g2h_untagged.


r~


Richard Henderson (31):
  tcg: Introduce target-specific page data for user-only
  linux-user: Introduce PAGE_ANON
  exec: Use uintptr_t for guest_base
  exec: Use uintptr_t in cpu_ldst.h
  exec: Improve types for guest_addr_valid
  linux-user: Check for overflow in access_ok
  linux-user: Tidy VERIFY_READ/VERIFY_WRITE
  bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
  linux-user: Do not use guest_addr_valid for h2g_valid
  linux-user: Fix guest_addr_valid vs reserved_va
  exec: Introduce cpu_untagged_addr
  exec: Use cpu_untagged_addr in g2h; split out g2h_untagged
  linux-user: Explicitly untag memory management syscalls
  linux-user: Use guest_range_valid in access_ok
  exec: Rename guest_{addr,range}_valid to *_untagged
  linux-user: Use cpu_untagged_addr in access_ok; split out *_untagged
  linux-user: Move lock_user et al out of line
  linux-user: Fix types in uaccess.c
  linux-user: Handle tags in lock_user/unlock_user
  linux-user/aarch64: Implement PR_TAGGED_ADDR_ENABLE
  target/arm: Improve gen_top_byte_ignore
  target/arm: Use the proper TBI settings for linux-user
  linux-user/aarch64: Implement PR_MTE_TCF and PR_MTE_TAG
  linux-user/aarch64: Implement PROT_MTE
  target/arm: Split out syndrome.h from internals.h
  linux-user/aarch64: Pass syndrome to EXC_*_ABORT
  linux-user/aarch64: Signal SEGV_MTESERR for sync tag check fault
  linux-user/aarch64: Signal SEGV_MTEAERR for async tag check error
  target/arm: Add allocation tag storage for user mode
  target/arm: Enable MTE for user-only
  tests/tcg/aarch64: Add mte smoke tests

 bsd-user/qemu.h                     |  17 +-
 include/exec/cpu-all.h              |  47 ++++-
 include/exec/cpu_ldst.h             |  39 ++--
 include/exec/exec-all.h             |   2 +-
 linux-user/aarch64/target_signal.h  |   3 +
 linux-user/aarch64/target_syscall.h |  13 ++
 linux-user/qemu.h                   |  76 +++-----
 linux-user/syscall_defs.h           |   1 +
 target/arm/cpu-param.h              |   3 +
 target/arm/cpu.h                    |  32 ++++
 target/arm/internals.h              | 249 +------------------------
 target/arm/syndrome.h               | 273 ++++++++++++++++++++++++++++
 tests/tcg/aarch64/mte.h             |  60 ++++++
 accel/tcg/translate-all.c           |  32 +++-
 accel/tcg/user-exec.c               |  51 +++---
 bsd-user/elfload.c                  |   2 +-
 bsd-user/main.c                     |   8 +-
 bsd-user/mmap.c                     |  23 +--
 linux-user/aarch64/cpu_loop.c       |  38 +++-
 linux-user/elfload.c                |  18 +-
 linux-user/flatload.c               |   2 +-
 linux-user/hppa/cpu_loop.c          |  39 ++--
 linux-user/i386/cpu_loop.c          |   6 +-
 linux-user/i386/signal.c            |   5 +-
 linux-user/main.c                   |   4 +-
 linux-user/mmap.c                   |  86 +++++----
 linux-user/ppc/signal.c             |   4 +-
 linux-user/syscall.c                | 165 +++++++++++++----
 linux-user/uaccess.c                |  82 +++++++--
 target/arm/cpu.c                    |  25 ++-
 target/arm/helper-a64.c             |   4 +-
 target/arm/mte_helper.c             |  39 +++-
 target/arm/tlb_helper.c             |  15 +-
 target/arm/translate-a64.c          |  25 +--
 target/hppa/op_helper.c             |   2 +-
 target/i386/tcg/mem_helper.c        |   2 +-
 target/s390x/mem_helper.c           |   4 +-
 tests/tcg/aarch64/mte-1.c           |  28 +++
 tests/tcg/aarch64/mte-2.c           |  45 +++++
 tests/tcg/aarch64/mte-3.c           |  51 ++++++
 tests/tcg/aarch64/mte-4.c           |  45 +++++
 tests/tcg/aarch64/pauth-2.c         |   1 -
 tests/tcg/aarch64/Makefile.target   |   6 +
 tests/tcg/configure.sh              |   4 +
 44 files changed, 1141 insertions(+), 535 deletions(-)
 create mode 100644 target/arm/syndrome.h
 create mode 100644 tests/tcg/aarch64/mte.h
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c
 create mode 100644 tests/tcg/aarch64/mte-3.c
 create mode 100644 tests/tcg/aarch64/mte-4.c

-- 
2.25.1


