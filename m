Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3EE473989
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 01:28:35 +0100 (CET)
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwvgH-0002LS-Rj
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 19:28:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwvdy-0007on-Lr
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:10 -0500
Received: from [2607:f8b0:4864:20::102f] (port=42962
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwvdv-0005Qo-OY
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:10 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so14725181pjb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7qxwy6Bpv8th+fFIx6+h/QbVO7sgK1Yy++DwUW/9vgA=;
 b=vxKj0Yg4frLo8UhZPByCbOw7FqPIOCczmBBzlkFKUlORx57njldZfjjrUjc5X9ClMU
 knzBYOZaWfpraN6Us+ShZNu7QZxKkFVl42rLHxJD4rvb1vau+zsSUtx1nRn+PCXWeNEu
 xIWcqQ0QLqn9KdeFdg6HInAhGaGFtXYErx8p5GQWXMr+eHMx00zWaCY8pHmH5j2KcVyF
 jvpnuO/obVkblWuBTYAZxqKe2vvPCYP0lSyBDQur5LWONKBwGuGSOL1LsClbTkGGSJoy
 LR+Sw6hgml5QqZQbciPkiciW9rLjFmgrzxSn53d79eLH8cltx3D2zmZ0cVX2TLF/vjKG
 pSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7qxwy6Bpv8th+fFIx6+h/QbVO7sgK1Yy++DwUW/9vgA=;
 b=N2vJLrbAi4B7whSsL3RooI14kMxd9Uwh7gR/ML6lKxfwYBWUusLLI8BSmU3VzuXLDh
 6P4X6XjKFbhk+CZz4/eSnTeXm5viYFmGic8DPUADXlqeqa0kiojgn4plVqHmQ2EC2H4H
 TRrCnjKlAQh5CzLCmmZbP/Yi4Vc0q1VXiWruaC/7SujkVr5Prv6LXYCPH5lgQHcEl5Tu
 F1qiwWbvTE0vkFMOsvnSTa12Ws3UGDTgASry4sJFZwQjGAetkOvX/B+I7NeXO/55akQl
 pRQXjGUSHXSbapOLwROTpBY0++8QE+NU8+VyhGunn5MjeeepNlUG0bw2BgVJfoR2vPfJ
 tNmA==
X-Gm-Message-State: AOAM530eTnSeL6hS0vmuLFNkpkXn/Bu1lKRY7YA2e7E4cOh55mrwpIqM
 81SZSeQ7LhUX7h4xIozqjOzdouvgTVPIjg==
X-Google-Smtp-Source: ABdhPJyMT9nL5frWe2dc/RTGwNNG+UszpBwKJASM3Z78ttPgagfcxcHQSgy+xRcFTT0qnoPBAI2Qbw==
X-Received: by 2002:a17:90b:1d0b:: with SMTP id
 on11mr1668448pjb.163.1639441566177; 
 Mon, 13 Dec 2021 16:26:06 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w7sm11320253pgo.56.2021.12.13.16.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 16:26:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/15] linux-user: simplify safe signal handling
Date: Mon, 13 Dec 2021 16:25:49 -0800
Message-Id: <20211214002604.161983-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v7:
  * Drop incorrect ppc64 "cleanup", which reminded me that we
    need to select a non-syscall-clobbered register.  So that
    meant changes to the mips edition.

Changes for v6:
  * Re-order patches so that the move to common happens after
    all of the changes to linux-user.  Seems less confusing
    this way.  As a consequence, the meson.build changes for
    common-user have to happen at the same time, lest we get
    meson configure errors for missing directories.
  * Use a helper, safe_syscall_set_errno_tail, to set errno
    instead of passing in &errno to safe_syscall_base.
    This avoids the aligned register pairs problem that Peter
    mentioned, as well as being more efficient in the common
    case of syscall success.  As a consequence, some R-B have
    been dropped.
  * New untabify patch (peter).
  * PPC64 cleanup split out of larger change.

For convenience the tree is at

  https://gitlab.com/rth7680/qemu/-/tree/lu-safesignal

Xuerui, if you could rebase your tcg/loongarch work on
top of this, I'd like to get both series in early in the
next development cycle.


r~


Richard Henderson (15):
  linux-user: Untabify all safe-syscall.inc.S
  linux-user: Move syscall error detection into safe_syscall_base
  linux-user/host/mips: Add safe-syscall.inc.S
  linux-user/host/sparc64: Add safe-syscall.inc.S
  linux-user: Remove HAVE_SAFE_SYSCALL and hostdep.h
  linux-user: Rename TARGET_ERESTARTSYS to QEMU_ERESTARTSYS
  bsd-user: Rename TARGET_ERESTARTSYS to QEMU_ERESTARTSYS
  linux-user: Rename TARGET_QEMU_ESIGRETURN to QEMU_ESIGRETURN
  linux-user: Create special-errno.h
  bsd-user: Create special-errno.h
  common-user: Move safe-syscall.* from linux-user
  common-user: Adjust system call return on FreeBSD
  linux-user: Move thunk.c from top-level
  meson: Move linux_user_ss to linux-user/
  meson: Move bsd_user_ss to bsd-user/

 meson.build                                   |  23 ++-
 bsd-user/errno_defs.h                         |   6 +-
 bsd-user/special-errno.h                      |  24 +++
 {linux-user => include/user}/safe-syscall.h   |  37 ++---
 linux-user/cpu_loop-common.h                  |   1 +
 linux-user/generic/target_errno_defs.h        |  17 --
 linux-user/host/aarch64/hostdep.h             |  18 ---
 linux-user/host/arm/hostdep.h                 |  18 ---
 linux-user/host/i386/hostdep.h                |  18 ---
 linux-user/host/ia64/hostdep.h                |  15 --
 linux-user/host/mips/hostdep.h                |  15 --
 linux-user/host/ppc/hostdep.h                 |  15 --
 linux-user/host/ppc64/hostdep.h               |  18 ---
 linux-user/host/riscv/hostdep.h               |  14 --
 linux-user/host/s390/hostdep.h                |  15 --
 linux-user/host/s390x/hostdep.h               |  18 ---
 linux-user/host/sparc/hostdep.h               |  15 --
 linux-user/host/sparc64/hostdep.h             |  15 --
 linux-user/host/x32/hostdep.h                 |  15 --
 linux-user/host/x86_64/hostdep.h              |  18 ---
 linux-user/signal-common.h                    |   4 +-
 linux-user/special-errno.h                    |  32 ++++
 linux-user/user-internals.h                   |   1 -
 common-user/safe-syscall-error.c              |  25 +++
 linux-user/aarch64/cpu_loop.c                 |   4 +-
 linux-user/aarch64/signal.c                   |   4 +-
 linux-user/alpha/cpu_loop.c                   |   4 +-
 linux-user/alpha/signal.c                     |   8 +-
 linux-user/arm/cpu_loop.c                     |   4 +-
 linux-user/arm/signal.c                       |   8 +-
 linux-user/cris/cpu_loop.c                    |   4 +-
 linux-user/cris/signal.c                      |   4 +-
 linux-user/hexagon/cpu_loop.c                 |   4 +-
 linux-user/hexagon/signal.c                   |   2 +-
 linux-user/hppa/cpu_loop.c                    |   4 +-
 linux-user/hppa/signal.c                      |   4 +-
 linux-user/i386/cpu_loop.c                    |  12 +-
 linux-user/i386/signal.c                      |   8 +-
 linux-user/m68k/cpu_loop.c                    |   4 +-
 linux-user/m68k/signal.c                      |   8 +-
 linux-user/microblaze/cpu_loop.c              |   4 +-
 linux-user/microblaze/signal.c                |   4 +-
 linux-user/mips/cpu_loop.c                    |   4 +-
 linux-user/mips/signal.c                      |   8 +-
 linux-user/openrisc/cpu_loop.c                |   4 +-
 linux-user/ppc/cpu_loop.c                     |   4 +-
 linux-user/ppc/signal.c                       |  10 +-
 linux-user/riscv/cpu_loop.c                   |   4 +-
 linux-user/riscv/signal.c                     |   2 +-
 linux-user/s390x/cpu_loop.c                   |   4 +-
 linux-user/s390x/signal.c                     |   8 +-
 linux-user/sh4/cpu_loop.c                     |   4 +-
 linux-user/sh4/signal.c                       |   8 +-
 linux-user/signal.c                           |  10 +-
 linux-user/sparc/cpu_loop.c                   |   2 +-
 linux-user/sparc/signal.c                     |   8 +-
 linux-user/syscall.c                          |  21 +--
 thunk.c => linux-user/thunk.c                 |   0
 linux-user/xtensa/cpu_loop.c                  |   4 +-
 linux-user/xtensa/signal.c                    |   4 +-
 MAINTAINERS                                   |   3 +-
 bsd-user/meson.build                          |   6 +
 common-user/host/aarch64/safe-syscall.inc.S   |  88 +++++++++++
 common-user/host/arm/safe-syscall.inc.S       | 108 +++++++++++++
 common-user/host/i386/safe-syscall.inc.S      | 126 +++++++++++++++
 common-user/host/mips/safe-syscall.inc.S      | 148 ++++++++++++++++++
 common-user/host/ppc64/safe-syscall.inc.S     |  94 +++++++++++
 common-user/host/riscv/safe-syscall.inc.S     |  79 ++++++++++
 common-user/host/s390x/safe-syscall.inc.S     |  98 ++++++++++++
 common-user/host/sparc64/safe-syscall.inc.S   |  89 +++++++++++
 .../host/x86_64/safe-syscall.inc.S            |  44 ++++--
 common-user/meson.build                       |   6 +
 {linux-user => common-user}/safe-syscall.S    |   5 +-
 linux-user/host/aarch64/safe-syscall.inc.S    |  75 ---------
 linux-user/host/arm/safe-syscall.inc.S        |  90 -----------
 linux-user/host/i386/safe-syscall.inc.S       | 100 ------------
 linux-user/host/ppc64/safe-syscall.inc.S      |  96 ------------
 linux-user/host/riscv/safe-syscall.inc.S      |  77 ---------
 linux-user/host/s390x/safe-syscall.inc.S      |  90 -----------
 linux-user/meson.build                        |   9 +-
 80 files changed, 1099 insertions(+), 932 deletions(-)
 create mode 100644 bsd-user/special-errno.h
 rename {linux-user => include/user}/safe-syscall.h (83%)
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
 create mode 100644 linux-user/special-errno.h
 create mode 100644 common-user/safe-syscall-error.c
 rename thunk.c => linux-user/thunk.c (100%)
 create mode 100644 common-user/host/aarch64/safe-syscall.inc.S
 create mode 100644 common-user/host/arm/safe-syscall.inc.S
 create mode 100644 common-user/host/i386/safe-syscall.inc.S
 create mode 100644 common-user/host/mips/safe-syscall.inc.S
 create mode 100644 common-user/host/ppc64/safe-syscall.inc.S
 create mode 100644 common-user/host/riscv/safe-syscall.inc.S
 create mode 100644 common-user/host/s390x/safe-syscall.inc.S
 create mode 100644 common-user/host/sparc64/safe-syscall.inc.S
 rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S (81%)
 create mode 100644 common-user/meson.build
 rename {linux-user => common-user}/safe-syscall.S (91%)
 delete mode 100644 linux-user/host/aarch64/safe-syscall.inc.S
 delete mode 100644 linux-user/host/arm/safe-syscall.inc.S
 delete mode 100644 linux-user/host/i386/safe-syscall.inc.S
 delete mode 100644 linux-user/host/ppc64/safe-syscall.inc.S
 delete mode 100644 linux-user/host/riscv/safe-syscall.inc.S
 delete mode 100644 linux-user/host/s390x/safe-syscall.inc.S

-- 
2.25.1


