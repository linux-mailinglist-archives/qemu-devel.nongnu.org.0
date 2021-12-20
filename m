Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA51C47B452
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:27:57 +0100 (CET)
Received: from localhost ([::1]:40310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPGG-0004IY-Oz
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:27:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDW-0001dz-6Z
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:06 -0500
Received: from [2607:f8b0:4864:20::52d] (port=42681
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDU-0006zF-BQ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:05 -0500
Received: by mail-pg1-x52d.google.com with SMTP id g2so7772706pgo.9
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mQyeZ/kfCDijU7a7oY4mRcz0X5kVxfY5QPPcWNigXmA=;
 b=hpWy8lxHxb9ADCZ14P85582RZMg/nzLPcyDC29E5QQ/xoBvcYrBPK7u4lqOQYeSV6M
 E9Zm5+U1De0J8gXpnefzHAm4Ya0PYeimyYumvsxiweAJGrGF1wJ0Cebfhiqi/r4PJjY6
 fei6vKmW4cUQaSR3U3hwYWDEz0n/7Wi4R8aq1TqhYz+1syx4iElpixyiMFnG6bJH6mHD
 Qs3/Fmt5YJ9yKn6132+Vyly9H09K/A0Oc3AMTZ6AE/6wjk+tA7/YqE/P+OHNNIzr4f9c
 FPbnZJ4yIDl+sJsWbDm4pBAGyfgg91rn9OZyVkuVdh1e+js5oBoJZtRtVFx+TjzcpoZL
 kBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mQyeZ/kfCDijU7a7oY4mRcz0X5kVxfY5QPPcWNigXmA=;
 b=GgfU4w/vwydohUi+TSDVUOeLAKXkm/tK/ip1tWBiWTFj8Q+NlWrYzojw6QJjZ5p2jq
 unxQdl1AszGl578UUxGgXURpR3rKmSh5G6sSk6qZkSEroGR67Vl4nNNSpGZuXiBP0Box
 vqorDE3Uz5RUg7F8MhTLVl3CPYQgltx8LNXOqnirOWRr96Dv6giRMntJzUQ+mHjWJ9Cq
 MtK1FWyUFufn804IF/9sky04vQ9eLeQ5q/4r2GwdqjHJqMLJEsq5M5cUZ5mCyAJSoknM
 vciMJLUVo6Y1PzWcXtgHozmPxCK//r3CNbKnYhKxX1vE4zfH464bwW7nYa6DEu5g+yGS
 HdWw==
X-Gm-Message-State: AOAM531NqFilAgjMIFiFoTLarv4F5skc/CeKYcvmRe773rPW0hNGXVg7
 uA8pmsGLcdqDd9jqzCNvMRZciaFxVYJ68g==
X-Google-Smtp-Source: ABdhPJzfPNX2mLc+LQmjri4IEQP3GRZXQ9hSUJhEOS49E2gl50qc99rADuocezNlzva1Hv9pO99tMQ==
X-Received: by 2002:a05:6a00:22d1:b0:494:72c5:803b with SMTP id
 f17-20020a056a0022d100b0049472c5803bmr18062299pfj.84.1640031902681; 
 Mon, 20 Dec 2021 12:25:02 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm233118pjd.21.2021.12.20.12.25.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 12:25:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] *-user: simplify safe signal handling
Date: Mon, 20 Dec 2021 12:24:45 -0800
Message-Id: <20211220202500.111897-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 212a33d3b0c65ae2583bb1d06cb140cd0890894c:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2021-12-19 16:36:10 -0800)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-user-20211220

for you to fetch changes up to 3363615a65af8a09d8adbd19ed3ae6b52f26ca7a:

  meson: Move bsd_user_ss to bsd-user/ (2021-12-20 10:13:43 -0800)

----------------------------------------------------------------
Move errno processing from safe_syscall() to safe_syscall_base().
Move safe_syscall() from linux-user to common-user.
Add FreeBSD support to safe_syscall_base().
Tidy top-level meson.build wrt {bsd,linux}-user.

----------------------------------------------------------------
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

 meson.build                                        |  23 +++-
 bsd-user/errno_defs.h                              |   6 +-
 bsd-user/special-errno.h                           |  24 ++++
 {linux-user => include/user}/safe-syscall.h        |  37 ++----
 linux-user/cpu_loop-common.h                       |   1 +
 linux-user/generic/target_errno_defs.h             |  17 ---
 linux-user/host/aarch64/hostdep.h                  |  18 ---
 linux-user/host/arm/hostdep.h                      |  18 ---
 linux-user/host/i386/hostdep.h                     |  18 ---
 linux-user/host/ia64/hostdep.h                     |  15 ---
 linux-user/host/mips/hostdep.h                     |  15 ---
 linux-user/host/ppc/hostdep.h                      |  15 ---
 linux-user/host/ppc64/hostdep.h                    |  18 ---
 linux-user/host/riscv/hostdep.h                    |  14 --
 linux-user/host/s390/hostdep.h                     |  15 ---
 linux-user/host/s390x/hostdep.h                    |  18 ---
 linux-user/host/sparc/hostdep.h                    |  15 ---
 linux-user/host/sparc64/hostdep.h                  |  15 ---
 linux-user/host/x32/hostdep.h                      |  15 ---
 linux-user/host/x86_64/hostdep.h                   |  18 ---
 linux-user/signal-common.h                         |   4 +-
 linux-user/special-errno.h                         |  32 +++++
 linux-user/user-internals.h                        |   1 -
 common-user/safe-syscall-error.c                   |  25 ++++
 linux-user/aarch64/cpu_loop.c                      |   4 +-
 linux-user/aarch64/signal.c                        |   4 +-
 linux-user/alpha/cpu_loop.c                        |   4 +-
 linux-user/alpha/signal.c                          |   8 +-
 linux-user/arm/cpu_loop.c                          |   4 +-
 linux-user/arm/signal.c                            |   8 +-
 linux-user/cris/cpu_loop.c                         |   4 +-
 linux-user/cris/signal.c                           |   4 +-
 linux-user/hexagon/cpu_loop.c                      |   4 +-
 linux-user/hexagon/signal.c                        |   2 +-
 linux-user/hppa/cpu_loop.c                         |   4 +-
 linux-user/hppa/signal.c                           |   4 +-
 linux-user/i386/cpu_loop.c                         |  12 +-
 linux-user/i386/signal.c                           |   8 +-
 linux-user/m68k/cpu_loop.c                         |   4 +-
 linux-user/m68k/signal.c                           |   8 +-
 linux-user/microblaze/cpu_loop.c                   |   4 +-
 linux-user/microblaze/signal.c                     |   4 +-
 linux-user/mips/cpu_loop.c                         |   4 +-
 linux-user/mips/signal.c                           |   8 +-
 linux-user/openrisc/cpu_loop.c                     |   4 +-
 linux-user/ppc/cpu_loop.c                          |   4 +-
 linux-user/ppc/signal.c                            |  10 +-
 linux-user/riscv/cpu_loop.c                        |   4 +-
 linux-user/riscv/signal.c                          |   2 +-
 linux-user/s390x/cpu_loop.c                        |   4 +-
 linux-user/s390x/signal.c                          |   8 +-
 linux-user/sh4/cpu_loop.c                          |   4 +-
 linux-user/sh4/signal.c                            |   8 +-
 linux-user/signal.c                                |  10 +-
 linux-user/sparc/cpu_loop.c                        |   2 +-
 linux-user/sparc/signal.c                          |   8 +-
 linux-user/syscall.c                               |  21 +--
 thunk.c => linux-user/thunk.c                      |   0
 linux-user/xtensa/cpu_loop.c                       |   4 +-
 linux-user/xtensa/signal.c                         |   4 +-
 MAINTAINERS                                        |   3 +-
 bsd-user/meson.build                               |   6 +
 common-user/host/aarch64/safe-syscall.inc.S        |  88 ++++++++++++
 common-user/host/arm/safe-syscall.inc.S            | 108 +++++++++++++++
 common-user/host/i386/safe-syscall.inc.S           | 126 ++++++++++++++++++
 common-user/host/mips/safe-syscall.inc.S           | 148 +++++++++++++++++++++
 common-user/host/ppc64/safe-syscall.inc.S          |  94 +++++++++++++
 common-user/host/riscv/safe-syscall.inc.S          |  79 +++++++++++
 common-user/host/s390x/safe-syscall.inc.S          |  98 ++++++++++++++
 common-user/host/sparc64/safe-syscall.inc.S        |  89 +++++++++++++
 .../host/x86_64/safe-syscall.inc.S                 |  44 +++---
 common-user/meson.build                            |   6 +
 {linux-user => common-user}/safe-syscall.S         |   5 +-
 linux-user/host/aarch64/safe-syscall.inc.S         |  75 -----------
 linux-user/host/arm/safe-syscall.inc.S             |  90 -------------
 linux-user/host/i386/safe-syscall.inc.S            | 100 --------------
 linux-user/host/ppc64/safe-syscall.inc.S           |  96 -------------
 linux-user/host/riscv/safe-syscall.inc.S           |  77 -----------
 linux-user/host/s390x/safe-syscall.inc.S           |  90 -------------
 linux-user/meson.build                             |   9 +-
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

