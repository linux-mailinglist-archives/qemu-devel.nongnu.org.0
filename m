Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A24315ABE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:12:39 +0100 (CET)
Received: from localhost ([::1]:37528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9d7W-00048n-J7
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxy-0003V9-Ap
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:46 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxj-0007xS-Hb
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:46 -0500
Received: by mail-pj1-x102b.google.com with SMTP id z9so104670pjl.5
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7wJJk0AmDSVOKO6zAlZont9HbAKZZ2wtUoYixxurgWE=;
 b=g9GZeHTXopgrLSUqJ2MZwMPfxj9gSZYpZXGkZrnVwzzJeY9aTYnLpPKgsZnm3g4SeV
 dB0clskrEE0RU8MwHL9tHaY9wjx0/KmaGMJ/TeDiPY+m8NHTurS/U74lL3IlzPtrlT9+
 sCZkNCXbB7e1ux91KG0X7XQW7/EwFvj9QNlqezGYPwTEXVLW4j2UFfcLJTTis3w2SYk4
 IoZDZjpp1NOsBmzq6JUWUHjw4lQaQ93mkuc3nJvRWoJlhNUmVCMZjV8n/Dx/V7l/E5pV
 g9/g+qCUQG+0TYdMU3J63idbE1Qzb6Tg7RpMdghvblJNLisE9pQ+MJKrvWfBqCGXByPy
 8ApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7wJJk0AmDSVOKO6zAlZont9HbAKZZ2wtUoYixxurgWE=;
 b=bHJClL+c4Jj19/5Hgj/J4CmcqdzTJvPKpdAEHnQn7ZyhXSLyxZwSrwRYYHhIkPU432
 X6um2bGFrIRU45pw4KxoKoYQ+b+uoRc/XviVaAu0oxn1UUeEC6OyKAdkyeBdieNDGZ6c
 FL/XvyJylbBLwh6D5ee7VXzlKGPVznIRb7n78AAJHGpovJ1rJHd1wWSTPp3CIpYT2BjG
 pdFUeRc+rjDhgDSJHqtc9WMrYZMJLgvttjx57MtlgPMNS/QgYPSokXTUUi+EP45fYNE0
 HVJUQg7iK2Ce4wH49PnKybnDohUPf7WNEUzprlg/kfjp3WsQuEU//TjE8zbkLnzMm0/0
 IGPQ==
X-Gm-Message-State: AOAM533z6w0l62kWIYUMhDbKUuCjiSeUy96KTxjgkUrdrs5TFIaQIWtz
 xpr1jYFObE05ySkSzFqDT9NWUCWjRD0KDA==
X-Google-Smtp-Source: ABdhPJywrzpQjxpVeaLLot14+09wPaNap5rCYN1ZG+YXhcgzcHp5MRTr27C9IvesDiPKCcxipEm/EA==
X-Received: by 2002:a17:902:6ac2:b029:de:3560:391e with SMTP id
 i2-20020a1709026ac2b02900de3560391emr342536plt.60.1612915345678; 
 Tue, 09 Feb 2021 16:02:25 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/31] target-arm: Implement ARMv8.5-MemTag, user mode
Date: Tue,  9 Feb 2021 16:01:52 -0800
Message-Id: <20210210000223.884088-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Changes for v6:
  * Drop the change to probe_access.  The cpu_untagged_addr function
    isn't correct, since that's specifically for syscalls.  The uses
    of probe_access in target/arm/ are already done with clean addresses.
  * Move unlock_user comparison change from p19 to p18.

The only unreviewed patch is 19.


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

 bsd-user/qemu.h                     |   9 +-
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
 bsd-user/main.c                     |   4 +-
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
 42 files changed, 1122 insertions(+), 517 deletions(-)
 create mode 100644 target/arm/syndrome.h
 create mode 100644 tests/tcg/aarch64/mte.h
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c
 create mode 100644 tests/tcg/aarch64/mte-3.c
 create mode 100644 tests/tcg/aarch64/mte-4.c

-- 
2.25.1


