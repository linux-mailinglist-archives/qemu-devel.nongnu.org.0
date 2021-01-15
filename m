Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26AC2F88C5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:49:51 +0100 (CET)
Received: from localhost ([::1]:54094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Xug-0005OP-H8
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xro-0003UW-K5
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:46:52 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xrm-0005AB-Kv
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:46:52 -0500
Received: by mail-pl1-x630.google.com with SMTP id be12so5452309plb.4
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pILtCL3+WOm9enm51rY0JFGFgNs8LZRCjkNlG93rpNA=;
 b=W3vq9ozSZ255uAJRfsRNCK1EHdnjZPBsiN71XY2PMGdxkttPVUfvVFaZJXW9qH9+8M
 1lguNXyPerolwKYRjTSXNS3OLXbWJP5CeqREWLEeqgq2dj4EPhAGim+LRuWds2LKoLME
 q18nPaJOj2GsSadHNfY9pVDxcHR+WTqAPEAbcxetM0HapurKC+qa/Na6DXYtdBRoOy5R
 Nqnp8piu0bBelGwUquuaYZxRIkeAYghF4HvVbauM9ijF21gAoYxPmYWyO5PX44mJFmP/
 6W+ys/dg22LUfoW4GcynMwcQz1CjoZF0j53enhSAIVTPfrYwQZ+3iDRSIY8uDYV2WOUt
 fqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pILtCL3+WOm9enm51rY0JFGFgNs8LZRCjkNlG93rpNA=;
 b=dgpCoP9+9873ENAMiorJDUXaT6MNv2aFFtuwYccHP/xyHSCDLL/NnSxdzwskBIML15
 NUDmggaGPITyBKbdM2ItyQ9cSOnoytqej7Kr+7F2EsEpjsTNELQnEqvSiJwWH+2zQbnr
 ThkbMLDJ1Qt7TN62UB3AuQLtxQ8UyJHF/cJlXMKUD+VytlD+V4DLZ4Ofzdjkf8xofLQ5
 5Zl8CuTzgCxzZiAvGUaTAIMHdMgxXKE8eTMkjGRBpNhAhEmjGhprzD5LAfiV3tIA9YcR
 gU0rs6YoPGp4YvId3XOU8C/zzIUPKgGVs1Q8o5YNh31BlI9X/a84xkN2GiXxG7sqs/qT
 HnIQ==
X-Gm-Message-State: AOAM531kB41dJ/WbKfKPNjIs/OjHA1X+DcmpLARAVA8vHeaAwl85BoDP
 rX/UYGlMhJ6gn8uxfnbcr2mQlzv0wpPG6vMm
X-Google-Smtp-Source: ABdhPJyZCr+loFoofn2cQ90wzf97f/x07++6nTNXjl0OAmUjwrPHVwZm6IZWxHe9eFqNPUAjmyuANg==
X-Received: by 2002:a17:902:b717:b029:dc:3e69:80e8 with SMTP id
 d23-20020a170902b717b02900dc3e6980e8mr14707442pls.40.1610750809022; 
 Fri, 15 Jan 2021 14:46:49 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/21] target-arm: Implement ARMv8.5-MemTag, user mode
Date: Fri, 15 Jan 2021 12:46:24 -1000
Message-Id: <20210115224645.1196742-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel abi was finally merged into 5.10.

Changes for v3:
  * Split out type changes to separate patches.
  * Add doc comments; tweak alloc so that the !PAGE_VALID case is clear.
  * Do not overlap PAGE_TARGET_2 with PAGE_RESERVED.
  * Use syndrome.h, arm_deliver_fault.


r~


v1: https://patchew.org/QEMU/20191015163254.12041-1-richard.henderson@linaro.org/
v2: https://patchew.org/QEMU/20200605041733.415188-1-richard.henderson@linaro.org/

Richard Henderson (21):
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
 target/arm/cpu.h                    |  24 +++
 target/arm/internals.h              | 245 +------------------------
 target/arm/syndrome.h               | 273 ++++++++++++++++++++++++++++
 tests/tcg/aarch64/mte.h             |  53 ++++++
 accel/tcg/translate-all.c           |  28 +++
 bsd-user/main.c                     |   2 +-
 linux-user/aarch64/cpu_loop.c       |  61 +++++--
 linux-user/main.c                   |   2 +-
 linux-user/mmap.c                   |  29 ++-
 linux-user/syscall.c                |  73 +++++++-
 target/arm/cpu.c                    |  19 ++
 target/arm/mte_helper.c             |  39 +++-
 target/arm/tlb_helper.c             |  15 +-
 tests/tcg/aarch64/mte-1.c           |  25 +++
 tests/tcg/aarch64/mte-2.c           |  42 +++++
 tests/tcg/aarch64/mte-3.c           |  47 +++++
 tests/tcg/aarch64/mte-4.c           |  42 +++++
 tests/tcg/aarch64/Makefile.target   |   6 +
 tests/tcg/configure.sh              |   4 +
 27 files changed, 856 insertions(+), 310 deletions(-)
 create mode 100644 target/arm/syndrome.h
 create mode 100644 tests/tcg/aarch64/mte.h
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c
 create mode 100644 tests/tcg/aarch64/mte-3.c
 create mode 100644 tests/tcg/aarch64/mte-4.c

-- 
2.25.1


