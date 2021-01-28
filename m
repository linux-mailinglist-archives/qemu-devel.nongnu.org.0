Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD35308147
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:45:11 +0100 (CET)
Received: from localhost ([::1]:49044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5G2I-0007nm-1m
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:45:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzC-0005P7-Bb
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:41:58 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:38169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fz1-00083f-T3
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:41:58 -0500
Received: by mail-pf1-x436.google.com with SMTP id y205so4965891pfc.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=58Y2BWHPpBtCNBlBSdo8EMqqUyTjMdnU8TZUneOpgds=;
 b=cCw7EZV0fbusih35UkR62uQ7pI2uPVEFJOODRDPyURe9Ze4WxA4o41+b/ShlSEODYO
 EWIbGuM9bZJGz4aQAz2K2e7OTj5iVtr+EgcJ79NFvjwj7cZhsQ7gsPJYMux2Rm1oqs/s
 Gwo3H1xQZpd3LcY8eD6yCWc0sRYAMj4fqWipwKvtTnrwuFZR6JJ0RSQEsvG7cCJcAwFj
 cVhPNFcl0udiymApH+cHl9aPRdUsHyTPO01E7SDcxw/9Ao+Z2EE98KjuwgHzeNDZb1Ae
 +ccnzqsmqVOODrVPw5YRcnE0w2hbGSgOEAztAy+9JeSnRU7lCi01bBeEYTtbP9xC+VIA
 picQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=58Y2BWHPpBtCNBlBSdo8EMqqUyTjMdnU8TZUneOpgds=;
 b=ihOOLPULTdsGR+hd9Li6VUzu8wlKnROvdEEkDO4X6EUcJiNdZfSdtz5uClMZ/o4Zgn
 DgTJ0ET3NCLD9KgKnmV9CVXYhkf+nutMc6V9XyR5/rts255tVrtEaHfjpC1WQiSQWsQN
 1ZhBjazZJ6d/iVsoykJ3XFLfT5RqvKuaBHGSfpLZbDu5fDz39s1CIBu9zPzKMo2izqOx
 zOGudowUa5BvScAEgKyX6pEeD0lmlUHDkmJub4anSF233Uuam3Td+hHqbGZJJtH/zvtt
 H4NgSDpdpw/Ui4aOT33EptvliEyeVMk6g3uvnKHFM6+7m89ul2mkKjD1SE9CJJWN8+iT
 2nNg==
X-Gm-Message-State: AOAM533imj/kb8mlQ2ZcpVCWgz9tNBNbVxRo7uuemKtGE6PO5w17c3gM
 bv17lp1pA3oz5E6VGOn+21mZqdFXQ8IIpfAe
X-Google-Smtp-Source: ABdhPJwjpqylOjCDnbgoUQKM6Oj7kiKk5YL1x+Ffls35XoHtV6Zg9x9IgXk+j/AQsJxVDR06tkTvIA==
X-Received: by 2002:a63:5805:: with SMTP id m5mr1536885pgb.352.1611873704819; 
 Thu, 28 Jan 2021 14:41:44 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/23] target-arm: Implement ARMv8.5-MemTag, user mode
Date: Thu, 28 Jan 2021 12:41:18 -1000
Message-Id: <20210128224141.638790-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel abi was finally merged into 5.10.

Changes for v4:
  * Revamp "Add support for TARGET_TAGGED_ADDRESSES".  There are now two
    sets of functions in include/exec/, one for tagged and one for
    untagged addresses.  The former takes a CPUState, and does not
    assume current_cpu is a thing.  So much for the generic bits...
    However, use of current_cpu remains, pushed down to lock_user.
    Changing everything that touches that, or get/put_user, is daunting.
  * Fix tbi0 vs tbi1 for linux-user.
    This had a number of cascading effects.
  * Adjust when async errors are noticed.

Changes for v3:
  * Split out type changes to separate patches.
  * Add doc comments; tweak alloc so that the !PAGE_VALID case is clear.
  * Do not overlap PAGE_TARGET_2 with PAGE_RESERVED.
  * Use syndrome.h, arm_deliver_fault.


r~


Richard Henderson (23):
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
  exec: Add support for TARGET_TAGGED_ADDRESSES
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
 include/exec/cpu_ldst.h             |  42 +++--
 linux-user/aarch64/target_signal.h  |   3 +
 linux-user/aarch64/target_syscall.h |  13 ++
 linux-user/qemu.h                   |  19 +-
 linux-user/syscall_defs.h           |   1 +
 target/arm/cpu-param.h              |   3 +
 target/arm/cpu.h                    |  32 ++++
 target/arm/internals.h              | 249 +------------------------
 target/arm/syndrome.h               | 273 ++++++++++++++++++++++++++++
 tests/tcg/aarch64/mte.h             |  60 ++++++
 accel/tcg/translate-all.c           |  28 +++
 bsd-user/main.c                     |   4 +-
 linux-user/aarch64/cpu_loop.c       |  38 +++-
 linux-user/elfload.c                |   4 +-
 linux-user/main.c                   |   4 +-
 linux-user/mmap.c                   |  29 ++-
 linux-user/syscall.c                |  71 +++++++-
 target/arm/cpu.c                    |  25 ++-
 target/arm/mte_helper.c             |  39 +++-
 target/arm/tlb_helper.c             |  15 +-
 target/arm/translate-a64.c          |  25 +--
 tests/tcg/aarch64/mte-1.c           |  28 +++
 tests/tcg/aarch64/mte-2.c           |  45 +++++
 tests/tcg/aarch64/mte-3.c           |  51 ++++++
 tests/tcg/aarch64/mte-4.c           |  45 +++++
 tests/tcg/aarch64/pauth-2.c         |   1 -
 tests/tcg/aarch64/Makefile.target   |   6 +
 tests/tcg/configure.sh              |   4 +
 30 files changed, 888 insertions(+), 325 deletions(-)
 create mode 100644 target/arm/syndrome.h
 create mode 100644 tests/tcg/aarch64/mte.h
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c
 create mode 100644 tests/tcg/aarch64/mte-3.c
 create mode 100644 tests/tcg/aarch64/mte-4.c

-- 
2.25.1


