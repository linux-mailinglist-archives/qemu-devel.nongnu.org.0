Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B064452FC0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:04:38 +0100 (CET)
Received: from localhost ([::1]:45850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwGT-0003pX-IG
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:04:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwEw-0001PE-Mt
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:02 -0500
Received: from [2a00:1450:4864:20::431] (port=33349
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwEu-0004uY-OP
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:02 -0500
Received: by mail-wr1-x431.google.com with SMTP id d24so36809605wra.0
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ADldwaXpsEjJ+HVJ8aUHNQHrxCDyb358evbW8YQ1vUY=;
 b=phK6lXw6toeA/6BwBK8IIqaSJyDh48TrVLXJlSH/9kCvgfvWj0dKaaBXNe2J+HB1lC
 ClhXbq/ejw6mlGU2axTZ7viyaVf//4OaeEBawoXWd5qNND0eoXvXk1AkTKsYyVtV22pH
 L4IvjQQanB7Euv+amdONZPKryMG+c0Ck4CtJg7n8iFrjOJ0L/5JfkITXTzrAikgBKMx4
 06pJg5tsOzAt+lI2vzK1YTKt5O3WEB6j6VdJBo1Wq9rHG84alVMwjkcMz3f1NlpMHc5u
 mL6k9uexpMa2BIRqbMF7JPK0dsacgwFZiFPcTP0Dn+pcrgMkm3DslJblcDYvZxxMo/Ma
 9Gnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ADldwaXpsEjJ+HVJ8aUHNQHrxCDyb358evbW8YQ1vUY=;
 b=UEEctjx9N14sexkKjrd2FuhBrg2mD4j7CBYyTQdoSmGCqpqrfQqWTxrbIu/BLBGxKF
 Y4olQKEuc5MLcq9o2ktPuPvsHAaEyTI196G1bE8Rb+Eq11alXIk5p5pIqMBsxb/72Wjy
 l9zuKoDoLvIw0mLcpuaT1UFJgRzwaaEaiHUycDSnjsKjHy6Ko7VyzWz5ZzxP66x9uQTX
 uJOzWoHT3fFXXJ6/zJbraFnY/qKAXRGrQaRTElr7hosI0flGztj5FiYNmYC9CA/ddPlr
 N9aXRSGqFfKuhINkrJPliB7xzg4PPkxVanWZfL4nSOKbsY0Zr/5k8e5tZOsjxYOSAz+x
 UUWw==
X-Gm-Message-State: AOAM533Xv42lfSfLUUz3XbRjUvKyIzw3u7zeyjLhe4bZd8tFL61nF7tc
 OVtSLoCMCn9pnh2Q+vV/yDpv5A0fPnuDq7orAiM=
X-Google-Smtp-Source: ABdhPJx6HW/ezMRidQ953tRaFaNVCT4owyb1GyXbSQ3IUTT0f4tU1WkNEgaV+recF4QopMpPMB0vpQ==
X-Received: by 2002:a5d:668f:: with SMTP id l15mr8303523wru.182.1637060579044; 
 Tue, 16 Nov 2021 03:02:59 -0800 (PST)
Received: from localhost.localdomain
 (145.red-37-158-173.dynamicip.rima-tde.net. [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id f15sm2639779wmg.30.2021.11.16.03.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:02:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/9] linux-user: simplify safe signal handling
Date: Tue, 16 Nov 2021 12:02:47 +0100
Message-Id: <20211116110256.365484-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Warner's v3:
https://patchew.org/QEMU/20211113045603.60391-1-imp@bsdimp.com/

Changes for v4:
  * Move errno handling into the assembly.  While returning the
    raw -errno is handy for x86 linux (and a few others), it is
    in fact more complex for other hosts that return a separate
    error indicator.  At which point we wind up jumping through
    hoops to return -errno, only to have the caller put it right
    back into +errno with -1 result, just like syscall(3).

    Pass in &errno, because the method of calculating this
    varies wildly between glibc, musl, etc.  This means that
    the assembly need only store to a provided pointer.

  * Add mips and sparc safe-syscall implementations.
    Both of which, btw, have separate error indicators.  ;-)

  * All hosts now have it, so remove HAVE_SAFE_SYSCALL.

  * Add meson.build rules for common-user/safe-syscall.S, so
    that we don't have to have weird includes from *-user.

    I'll note that this last patch will at present break bsd-user,
    because TARGET_ERESTARTSYS and the header from whence it comes
    is currently missing there.

    In addition, I think that this should be reorganized further
    so that TARGET_ERESTARTSYS is (1) renamed because in *this*
    context it is pretending to be a host errno, and (2) placed
    in a file of its own under include/user/.  At which point,
    meson.build could be simplified further so that safe-syscall.S
    is compiled once, not per target.

    Anyway, the final patch needs some bsd-user changes sorted first.


r~


Richard Henderson (4):
  common-user: Move syscall error detection into safe_syscall_base
  common-user/host/mips: Add safe-syscall.inc.S
  common-user/host/sparc64: Add safe-syscall.inc.S
  linux-user: Remove HAVE_SAFE_SYSCALL and hostdep.h

Warner Losh (5):
  linux-user: Add host_signal_set_pc to set pc in mcontext
  linux-user/signal.c: Create a common rewind_if_in_safe_syscall
  linux-user/safe-syscall.inc.S: Move to common-user
  common-user: Adjust system call return on FreeBSD
  common-user: Move safe-syscall.* from *-user

 meson.build                                   |   9 +-
 {linux-user => include/user}/safe-syscall.h   |  31 ++--
 linux-user/host/aarch64/host-signal.h         |   5 +
 linux-user/host/aarch64/hostdep.h             |  38 -----
 linux-user/host/alpha/host-signal.h           |   5 +
 linux-user/host/arm/host-signal.h             |   5 +
 linux-user/host/arm/hostdep.h                 |  38 -----
 linux-user/host/i386/host-signal.h            |   5 +
 linux-user/host/i386/hostdep.h                |  38 -----
 linux-user/host/ia64/hostdep.h                |  15 --
 linux-user/host/mips/host-signal.h            |   5 +
 linux-user/host/mips/hostdep.h                |  15 --
 linux-user/host/ppc/host-signal.h             |   5 +
 linux-user/host/ppc/hostdep.h                 |  15 --
 linux-user/host/ppc64/hostdep.h               |  38 -----
 linux-user/host/riscv/host-signal.h           |   5 +
 linux-user/host/riscv/hostdep.h               |  34 -----
 linux-user/host/s390/host-signal.h            |   5 +
 linux-user/host/s390/hostdep.h                |  15 --
 linux-user/host/s390x/hostdep.h               |  38 -----
 linux-user/host/sparc/host-signal.h           |   9 ++
 linux-user/host/sparc/hostdep.h               |  15 --
 linux-user/host/sparc64/hostdep.h             |  15 --
 linux-user/host/x32/hostdep.h                 |  15 --
 linux-user/host/x86_64/host-signal.h          |   5 +
 linux-user/host/x86_64/hostdep.h              |  38 -----
 linux-user/user-internals.h                   |   1 -
 linux-user/signal.c                           |  13 +-
 linux-user/syscall.c                          |   2 +-
 .../host/aarch64/safe-syscall.inc.S           |  65 ++++++---
 .../host/arm/safe-syscall.inc.S               |  69 ++++++---
 .../host/i386/safe-syscall.inc.S              |  61 +++++---
 common-user/host/mips/safe-syscall.inc.S      | 135 ++++++++++++++++++
 .../host/ppc64/safe-syscall.inc.S             |  63 ++++----
 .../host/riscv/safe-syscall.inc.S             |  50 ++++---
 .../host/s390x/safe-syscall.inc.S             |  50 ++++---
 common-user/host/sparc64/safe-syscall.inc.S   |  91 ++++++++++++
 .../host/x86_64/safe-syscall.inc.S            |  80 +++++++----
 common-user/meson.build                       |   2 +
 {linux-user => common-user}/safe-syscall.S    |   3 -
 linux-user/meson.build                        |   1 -
 41 files changed, 585 insertions(+), 562 deletions(-)
 rename {linux-user => include/user}/safe-syscall.h (85%)
 delete mode 100644 linux-user/host/aarch64/hostdep.h
 delete mode 100644 linux-user/host/arm/hostdep.h
 delete mode 100644 linux-user/host/i386/hostdep.h
 delete mode 100644 linux-user/host/ia64/hostdep.h
 delete mode 100644 linux-user/host/mips/hostdep.h
 delete mode 100644 linux-user/host/ppc/hostdep.h
 delete mode 100644 linux-user/host/ppc64/hostdep.h
 delete mode 100644 linux-user/host/riscv/hostdep.h
 delete mode 100644 linux-user/host/s390/hostdep.h
 delete mode 100644 linux-user/host/s390x/hostdep.h
 delete mode 100644 linux-user/host/sparc/hostdep.h
 delete mode 100644 linux-user/host/sparc64/hostdep.h
 delete mode 100644 linux-user/host/x32/hostdep.h
 delete mode 100644 linux-user/host/x86_64/hostdep.h
 rename {linux-user => common-user}/host/aarch64/safe-syscall.inc.S (64%)
 rename {linux-user => common-user}/host/arm/safe-syscall.inc.S (64%)
 rename {linux-user => common-user}/host/i386/safe-syscall.inc.S (71%)
 create mode 100644 common-user/host/mips/safe-syscall.inc.S
 rename {linux-user => common-user}/host/ppc64/safe-syscall.inc.S (68%)
 rename {linux-user => common-user}/host/riscv/safe-syscall.inc.S (77%)
 rename {linux-user => common-user}/host/s390x/safe-syscall.inc.S (71%)
 create mode 100644 common-user/host/sparc64/safe-syscall.inc.S
 rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S (64%)
 create mode 100644 common-user/meson.build
 rename {linux-user => common-user}/safe-syscall.S (94%)

-- 
2.25.1


