Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F349F454A82
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:06:23 +0100 (CET)
Received: from localhost ([::1]:38114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNS2-0002Ke-Jv
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:06:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQ3-0008Mf-Pv
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:19 -0500
Received: from [2a00:1450:4864:20::434] (port=39822
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQ1-000318-Nu
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:19 -0500
Received: by mail-wr1-x434.google.com with SMTP id d27so5660435wrb.6
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9C7oUFsFuXfDsv9e8ujFuZJy3nlEJ0t/NGbaLVoBHkI=;
 b=cHCnKfX9Jyq3IFLqwCLjs2KFCOBGn04VnHKBGzi8KDqgH1A/FI3SDx0eaQR4DhALfi
 2PDxuJ4GJ1kb97QTmrGON8GMrbEOdSUB4/RcGo4ygsIlwISyK+gcLOouq0qrL4UjnHhx
 NjhTRyubgqUPGRw9yjGiFy9vT+wiliO2cRMdxUY+8E9ZRdn+HdiHxIVpaa030kCIkpSV
 adRCI8i6ZS1VUWB3pTiXU0sm04EKry1e6P1pCRMk9+eUC4rT8r0R6JF7T2S2XF/PevgY
 WdWmyXpFVpgt0/FP4C0YAUy8aip42YPr8Cis2WEkbi7CEv5WQ0MQJUtLYnFi878wLzVn
 Ioqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9C7oUFsFuXfDsv9e8ujFuZJy3nlEJ0t/NGbaLVoBHkI=;
 b=lEtsNbaszAV/YcASUcXHtlW9uHerX3ci8ZOvkOH3Bho5w2OCsBiBGvDYvSFgagnkZW
 /a7GCte3Fr309UEb1rPnGdd8IUu3Mn7NLiZD6tjwTZFeCkN+W2zck8pVBASeN8ZpeeYc
 Dfk4JxuHrlsaQG6YgjaLnbe5LQ3zv5xnvCT3wvNlkVdrhKsg/iNkZv4409rm4utaMU+3
 EVjMWIwFyQOBpMQzPt89LcgnnHdDU1+iAMVsO0HKzn+wchyWEGrYaq0nqyFA9+pb+8J7
 CtJSYzDSR87F5p8lxhXSf7C3yynxrdpg6VYoczx+j7v3Xm5+x9U0edmh6MRL8csYL0oV
 pN8w==
X-Gm-Message-State: AOAM5320mo+RmuatqO39zuUZTGofwwlgH+ypyq8ObV2rfZDUCFxGyjh4
 AJAD/8Zw0oFaZFN9EtRB0xLDhME1SrPTRORNxVs=
X-Google-Smtp-Source: ABdhPJxbCxPn0tU5WisUitTdYsOpdrS3AdSpWGx8iIA7VVoBmoy++Ji+0nyn0UgFLtc2OB1dm0UOSA==
X-Received: by 2002:a5d:604b:: with SMTP id j11mr22081331wrt.22.1637165055084; 
 Wed, 17 Nov 2021 08:04:15 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/17] linux-user: simplify safe signal handling
Date: Wed, 17 Nov 2021 17:03:55 +0100
Message-Id: <20211117160412.71563-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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


r~


Richard Henderson (13):
  common-user: Move syscall error detection into safe_syscall_base
  common-user/host/mips: Add safe-syscall.inc.S
  common-user/host/sparc64: Add safe-syscall.inc.S
  linux-user: Remove HAVE_SAFE_SYSCALL and hostdep.h
  *-user: Rename TARGET_ERESTARTSYS to QEMU_ERESTARTSYS
  linux-user: Rename TARGET_QEMU_ESIGRETURN to QEMU_ESIGRETURN
  bsd-user: Create special-errno.h
  linux-user: Create special-errno.h
  meson: Add build infrastructure for common-user
  common-user: Move safe-syscall.* from linux-user
  linux-user: Move thunk.c from top-level
  meson: Move linux_user_ss to linux-user/
  meson: Move bsd_user_ss to bsd-user/

Warner Losh (4):
  linux-user: Add host_signal_set_pc to set pc in mcontext
  linux-user/signal.c: Create a common rewind_if_in_safe_syscall
  linux-user/safe-syscall.inc.S: Move to common-user
  common-user: Adjust system call return on FreeBSD

 meson.build                                   |  23 ++-
 bsd-user/errno_defs.h                         |   6 +-
 bsd-user/special-errno.h                      |  24 ++++
 {linux-user => include/user}/safe-syscall.h   |  39 ++---
 linux-user/cpu_loop-common.h                  |   1 +
 linux-user/generic/target_errno_defs.h        |  17 ---
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
 linux-user/signal-common.h                    |   4 +-
 linux-user/special-errno.h                    |  32 +++++
 linux-user/user-internals.h                   |   1 -
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
 linux-user/signal.c                           |  19 ++-
 linux-user/sparc/cpu_loop.c                   |   2 +-
 linux-user/sparc/signal.c                     |   8 +-
 linux-user/syscall.c                          |  21 +--
 thunk.c => linux-user/thunk.c                 |   0
 linux-user/xtensa/cpu_loop.c                  |   4 +-
 linux-user/xtensa/signal.c                    |   4 +-
 bsd-user/meson.build                          |   6 +
 .../host/aarch64/safe-syscall.inc.S           |  65 ++++++---
 .../host/arm/safe-syscall.inc.S               |  69 ++++++---
 .../host/i386/safe-syscall.inc.S              |  61 +++++---
 common-user/host/mips/safe-syscall.inc.S      | 135 ++++++++++++++++++
 .../host/ppc64/safe-syscall.inc.S             |  63 ++++----
 .../host/riscv/safe-syscall.inc.S             |  50 ++++---
 .../host/s390x/safe-syscall.inc.S             |  50 ++++---
 common-user/host/sparc64/safe-syscall.inc.S   |  91 ++++++++++++
 .../host/x86_64/safe-syscall.inc.S            |  80 +++++++----
 common-user/meson.build                       |   3 +
 {linux-user => common-user}/safe-syscall.S    |   5 +-
 linux-user/meson.build                        |   9 +-
 82 files changed, 778 insertions(+), 689 deletions(-)
 create mode 100644 bsd-user/special-errno.h
 rename {linux-user => include/user}/safe-syscall.h (81%)
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
 rename thunk.c => linux-user/thunk.c (100%)
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
 rename {linux-user => common-user}/safe-syscall.S (91%)

-- 
2.25.1


