Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A3B45AA28
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:39:52 +0100 (CET)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZlm-0006QT-MZ
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:39:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZk7-0003xk-Vm
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:08 -0500
Received: from [2a00:1450:4864:20::42a] (port=39434
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZk5-0004zC-MW
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:07 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a18so3729872wrn.6
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cR+Fdb2K9lDpbOs/M6ixeY8dHtzDbo6/dWUebLM9KRA=;
 b=hPMlErbDwezC6zH+NQzCVL3suY/pcOiehlssuicn3NOFxlR/SShur7vnX34K1RYi12
 PrLbHz538MDVf4jKUfi3gpBaKWBptbRCZUZBx+Dyd/1D9o60fqBXxYjkcYVlZjXxwTdi
 iQGivqLWMNDJsVFMk0AqpGEDewF21zo3Yvg4UrDZAkxKvxcXQPgqIUmR4NEt8VT9x1Mq
 1NMD7h70PEt3yzHCVogs4QQORtQR7kbBsxoJCkhFVPm4ciUDKqvv9w707NhyWzZbsMAa
 oprjCXl8Iu6SCGvS61ATQU4shfTO5Dupw1kBpI+JrbxZDBWyrZYMf56mjK5zGwYCm5vo
 /XLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cR+Fdb2K9lDpbOs/M6ixeY8dHtzDbo6/dWUebLM9KRA=;
 b=dmlzwtkmJTF8u+QFHiLHyzidZ4A2g4cov/Ob1EC6C0hzMUGtFcLOTYqu+4yIAf23go
 AiX8LoxoFaWWsqxxXpMmGm4CdRgPFfQzUnw9QqgQ/soAgA1bFABnbAKHW8ljXerSdDn9
 cTtFd1QeLMeLuG6Ik1c/5Tr/F4zSfCc+lT+1lVd4Lyokooz4XeXOc2NU+0QHPAzZme2e
 61mRCWSlv6dnfEa3ogksNyJBexCO1YvO939B3aDjpMJT02ZjDtAhCwZVYwl8pnC5YgmK
 hx/FdbU1lE1aeSJcKhjI8HmgH8rxoWyDZautzeB988osF+SLYylGAETJ231WMtEDGy43
 Su1A==
X-Gm-Message-State: AOAM533w+XV4LNQSNp++WSk20LuMO1UuHMYgdHHzRIjaOrGJ9tKNS2iJ
 9Ur4tObCJRHLogNDy3rtF4dAsKIDCMkb4H88Ccc=
X-Google-Smtp-Source: ABdhPJymg5xOoAed+ziaqwu1sivZDrYId0YQ7nZJb4mImDfai2RVMXh8X0jE6hiZ8V2SBUQ8dv1k8w==
X-Received: by 2002:a5d:6244:: with SMTP id m4mr9290200wrv.186.1637689083300; 
 Tue, 23 Nov 2021 09:38:03 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id n13sm13054883wrt.44.2021.11.23.09.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:38:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v6 00/16] linux-user: simplify safe signal handling
Date: Tue, 23 Nov 2021 18:37:43 +0100
Message-Id: <20211123173759.1383510-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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

Changes for v5:
  * Fix safe-syscall.S FreeBSD typos.
  * Rename special TARGET_EFOO to QEMU_EFOO.
  * Create *-user/special-errno.h.
  * Build safe-syscall.o only once.
  * meson.build cleanups.
  * bsd-user builds without modification on master.

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

Warner's v3:
  https://patchew.org/QEMU/20211113045603.60391-1-imp@bsdimp.com/

Patches needing review:
  01-linux-user-Untabify-all-safe-syscall.inc.S.patch
  02-linux-user-host-ppc64-Use-r11-for-signal_pending-.patch
  03-linux-user-Move-syscall-error-detection-into-safe.patch
  04-linux-user-host-mips-Add-safe-syscall.inc.S.patch
  05-linux-user-host-sparc64-Add-safe-syscall.inc.S.patch


r~


Richard Henderson (16):
  linux-user: Untabify all safe-syscall.inc.S
  linux-user/host/ppc64: Use r11 for signal_pending address
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

 meson.build                                   |  23 +++-
 bsd-user/errno_defs.h                         |   6 +-
 bsd-user/special-errno.h                      |  24 ++++
 {linux-user => include/user}/safe-syscall.h   |  37 ++---
 linux-user/cpu_loop-common.h                  |   1 +
 linux-user/generic/target_errno_defs.h        |  17 ---
 linux-user/host/aarch64/hostdep.h             |  18 ---
 linux-user/host/arm/hostdep.h                 |  18 ---
 linux-user/host/i386/hostdep.h                |  18 ---
 linux-user/host/ia64/hostdep.h                |  15 ---
 linux-user/host/mips/hostdep.h                |  15 ---
 linux-user/host/ppc/hostdep.h                 |  15 ---
 linux-user/host/ppc64/hostdep.h               |  18 ---
 linux-user/host/riscv/hostdep.h               |  14 --
 linux-user/host/s390/hostdep.h                |  15 ---
 linux-user/host/s390x/hostdep.h               |  18 ---
 linux-user/host/sparc/hostdep.h               |  15 ---
 linux-user/host/sparc64/hostdep.h             |  15 ---
 linux-user/host/x32/hostdep.h                 |  15 ---
 linux-user/host/x86_64/hostdep.h              |  18 ---
 linux-user/signal-common.h                    |   4 +-
 linux-user/special-errno.h                    |  32 +++++
 linux-user/user-internals.h                   |   1 -
 common-user/safe-syscall-error.c              |  25 ++++
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
 common-user/host/aarch64/safe-syscall.inc.S   |  88 ++++++++++++
 common-user/host/arm/safe-syscall.inc.S       | 108 +++++++++++++++
 common-user/host/i386/safe-syscall.inc.S      | 126 ++++++++++++++++++
 common-user/host/mips/safe-syscall.inc.S      | 123 +++++++++++++++++
 common-user/host/ppc64/safe-syscall.inc.S     |  90 +++++++++++++
 common-user/host/riscv/safe-syscall.inc.S     |  79 +++++++++++
 common-user/host/s390x/safe-syscall.inc.S     |  98 ++++++++++++++
 common-user/host/sparc64/safe-syscall.inc.S   |  89 +++++++++++++
 .../host/x86_64/safe-syscall.inc.S            |  44 +++---
 common-user/meson.build                       |   6 +
 {linux-user => common-user}/safe-syscall.S    |   5 +-
 linux-user/host/aarch64/safe-syscall.inc.S    |  75 -----------
 linux-user/host/arm/safe-syscall.inc.S        |  90 -------------
 linux-user/host/i386/safe-syscall.inc.S       | 100 --------------
 linux-user/host/ppc64/safe-syscall.inc.S      |  96 -------------
 linux-user/host/riscv/safe-syscall.inc.S      |  77 -----------
 linux-user/host/s390x/safe-syscall.inc.S      |  90 -------------
 linux-user/meson.build                        |   9 +-
 80 files changed, 1070 insertions(+), 932 deletions(-)
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


