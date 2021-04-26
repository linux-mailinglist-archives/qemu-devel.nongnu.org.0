Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0927936AAE9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:02:16 +0200 (CEST)
Received: from localhost ([::1]:44652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larVn-0008HH-2V
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNe-0007vw-9U
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:55 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:55810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNR-0007UR-UH
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:50 -0400
Received: by mail-pj1-x1035.google.com with SMTP id s14so21280987pjl.5
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n2YxBxeu7xgEQHw5w3fw1vnEKP1AZ7p/eBcj+Cdx6cg=;
 b=gvcWMoIlk+eWE2lJomsxyf6dxiv41nZ/vfmKJSo5TLV0k1QErMlJm/VUO0kPekaOSU
 Gs8Amyvue/wUyISLzifMB7opK57JWnjZQNNVK0wy9QWezFZp2b7X6eP5JZ/vG9JrrhcR
 ZTNW/k3GcDwhYAKlNooTDr5AIZFPaTkWN2zF+CTjhqBumWk5N330vTpCola120I5k/nb
 1XeVzjJ/suZpPdggqGXDidvMuhqBthXE1emJXTLCtHE1pRJsh4KyG5pTaeasbxLY/6y9
 F9Bvg6ul5CLNSPZpGt4X8XMmlwfZX8cFSkXv5DKy4nZN4+lsdtkx5mkeC2zjSHRHY4K3
 CalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n2YxBxeu7xgEQHw5w3fw1vnEKP1AZ7p/eBcj+Cdx6cg=;
 b=Vv+SIe4kOoNOpWvVyJN0x+ljxyBHWEIVFUigsE4Phe2d37ebz4s+jrQVR0FLN1jEiK
 k1iMQQSRvoUUKQMbMQ5saUtD+SZEXC4mLz3B3uGH6BGbzHBUgxNvdal+YwYt9w3VnkBU
 +zEaHwQIuwKDueq+wSgMm8++MnYnBfcTI+I0+I7TwjT7Hhx7fr4iDAMgYkXm7dvpkBOW
 AkVePas4L6Z1H3HCb3cYOTpj8xeenNyvCUP+Rd2G4ycnuvZ95H/oDN0BZW1QfWCvoOy+
 tNRgJgXGfi8BfzaTvds6mKerpTa6rTf7ag5EC2MLFTVZvxp59M0cDS8S85JXOrv07fuJ
 R3Uw==
X-Gm-Message-State: AOAM533UzBty2/5kiIwenQ0NSSf1TtnJ6bhXXw9odKn3Y8Eq/0vIHBPx
 UD3KqCAK+6zO4VjH5WEqMvgHWr+oQM+WGQ==
X-Google-Smtp-Source: ABdhPJzzmrWI7RdYhPwnANPHyoL1G1b5LuXS4v7JnRlyEksPOZmYD471ubjB5F3yAGBgOhjDnBfrTg==
X-Received: by 2002:a17:902:7847:b029:ea:c45a:29fc with SMTP id
 e7-20020a1709027847b02900eac45a29fcmr16089660pln.46.1619405616222; 
 Sun, 25 Apr 2021 19:53:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/25] linux-user/sparc: Implement rt signals
Date: Sun, 25 Apr 2021 19:53:09 -0700
Message-Id: <20210426025334.1168495-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Supercedes: 20210425155749.896330-1-richard.henderson@linaro.org
("linux-user/sparc64: Implement signals")

This time, in the lead-up, merge the sparc and sparc64 directories.
Implement rt signals for sparc32 as well, since there are only a few
differences between the two.


r~


Richard Henderson (25):
  linux-user: Split out target_restore_altstack
  linux-user: Use target_restore_altstack in all sigreturn
  linux-user: Pass CPUArchState to do_sigaltstack
  linux-user: Pass CPUArchState to target_restore_altstack
  linux-user/sparc: Include TARGET_STACK_BIAS in get_sp_from_cpustate
  linux-user/sparc: Clean up init_thread
  linux-user/sparc: Merge sparc64 target_syscall.h
  linux-user/sparc: Merge sparc64 target_elf.h
  linux-user/sparc: Merge sparc64 target_structs.h
  linux-user/sparc: Merge sparc64 termbits.h
  linux-user/sparc: Merge sparc64/ into sparc/
  linux-user/sparc: Remove target_sigcontext as unused
  linux-user/sparc: Remove target_rt_signal_frame as unused
  linux-user/sparc: Fix the stackframe structure
  linux-user/sparc: Use target_pt_regs
  linux-user/sparc: Split out save_reg_win
  linux-user/sparc: Clean up get_sigframe
  linux-user/sparc: Save and restore fpu in signal frame
  linux-user/sparc: Add rwin_save to signal frame
  linux-user/sparc: Clean up setup_frame
  linux-user/sparc: Minor corrections to do_sigreturn
  linux-user/sparc: Add 64-bit support to fpu save/restore
  linux-user/sparc: Implement sparc32 rt signals
  linux-user/sparc: Implement sparc64 rt signals
  tests/tcg/sparc64: Re-enable linux-test

 .../targets/sparc64-linux-user.mak            |   1 +
 linux-user/qemu.h                             |   3 +-
 linux-user/signal-common.h                    |   1 +
 linux-user/sparc/target_cpu.h                 |   9 +-
 linux-user/sparc/target_signal.h              |   2 +
 linux-user/sparc/target_structs.h             |  36 +-
 linux-user/sparc/target_syscall.h             |  42 +-
 linux-user/sparc64/sockbits.h                 |   1 -
 linux-user/sparc64/target_cpu.h               |   1 -
 linux-user/sparc64/target_elf.h               |  14 -
 linux-user/sparc64/target_fcntl.h             |   1 -
 linux-user/sparc64/target_signal.h            |   1 -
 linux-user/sparc64/target_structs.h           |  58 --
 linux-user/sparc64/target_syscall.h           |  35 --
 linux-user/sparc64/termbits.h                 | 291 ----------
 linux-user/aarch64/signal.c                   |   6 +-
 linux-user/alpha/signal.c                     |   6 +-
 linux-user/arm/signal.c                       |   9 +-
 linux-user/elfload.c                          |  33 +-
 linux-user/hexagon/signal.c                   |   6 +-
 linux-user/hppa/signal.c                      |   8 +-
 linux-user/i386/signal.c                      |   5 +-
 linux-user/m68k/signal.c                      |   5 +-
 linux-user/microblaze/signal.c                |   6 +-
 linux-user/mips/signal.c                      |   6 +-
 linux-user/nios2/signal.c                     |   8 +-
 linux-user/openrisc/signal.c                  |   5 +-
 linux-user/ppc/signal.c                       |   4 +-
 linux-user/riscv/signal.c                     |   6 +-
 linux-user/s390x/signal.c                     |   6 +-
 linux-user/sh4/signal.c                       |   7 +-
 linux-user/signal.c                           | 120 ++--
 linux-user/sparc/signal.c                     | 535 ++++++++++++------
 linux-user/sparc64/cpu_loop.c                 |  20 -
 linux-user/sparc64/signal.c                   |  19 -
 linux-user/syscall.c                          |   3 +-
 linux-user/xtensa/signal.c                    |   6 +-
 linux-user/meson.build                        |   1 -
 linux-user/sparc64/meson.build                |   5 -
 linux-user/sparc64/syscall.tbl                | 487 ----------------
 linux-user/sparc64/syscallhdr.sh              |  32 --
 tests/tcg/sparc64/Makefile.target             |   7 +-
 42 files changed, 504 insertions(+), 1353 deletions(-)
 delete mode 100644 linux-user/sparc64/sockbits.h
 delete mode 100644 linux-user/sparc64/target_cpu.h
 delete mode 100644 linux-user/sparc64/target_elf.h
 delete mode 100644 linux-user/sparc64/target_fcntl.h
 delete mode 100644 linux-user/sparc64/target_signal.h
 delete mode 100644 linux-user/sparc64/target_structs.h
 delete mode 100644 linux-user/sparc64/target_syscall.h
 delete mode 100644 linux-user/sparc64/termbits.h
 delete mode 100644 linux-user/sparc64/cpu_loop.c
 delete mode 100644 linux-user/sparc64/signal.c
 delete mode 100644 linux-user/sparc64/meson.build
 delete mode 100644 linux-user/sparc64/syscall.tbl
 delete mode 100644 linux-user/sparc64/syscallhdr.sh

-- 
2.25.1


