Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F49352F690
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:09:03 +0200 (CEST)
Received: from localhost ([::1]:57866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCg1-0002iS-ST
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbK-0007zs-80
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:11 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbG-0003y5-50
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:07 -0400
Received: by mail-pj1-x102c.google.com with SMTP id l14so9310166pjk.2
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aKx5f32wZeXF1bpQ2oWgZWUKZNBHgky88bygOTggs3c=;
 b=VjwV3rVQiMT56r9p5BgNRIPgaxSx794AgkLgUJT2Av12hHQThbqK5yi7MwJfNL+LLy
 5ytaAoH6onkuXKkqlNFdta2g40ZyNvLbqwgxGZ9qRLCwD6rKwJ2vy+xgrW7PnDK1rNtU
 V/GKK9F0vlInPTVDinvCmXMSSfSIE2stBnsFbSBNKd4313/10fpr5r6Je3wF/XdOmXVe
 MQZVTjLeQT3bNN1LIdoIsMBr+VRXG+Msdgo9KDwEDMJBkm0IPEgJ5ma8VC/OmxCZGSa5
 S+5Y7EO/P4uDZLQkvxEA9eWN6+SDxFgNVIiDQ2jUi7FQRbApiObW9pCTUwEK1/c+UVxZ
 1GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aKx5f32wZeXF1bpQ2oWgZWUKZNBHgky88bygOTggs3c=;
 b=Dw9PZrdbhAQrSLRkb6qsUyr/0aMy585wuVps3Z9Lc5X/DN8aXcwjaszwsPp9quR2rM
 hBIkxTS3aUjU5pbkGea7P1ZPWnz5B+Pdu61nt9yEArcA4Aze0S66bX0YwH0pfNM+w24d
 D0EH1yOTNRlgpNdR31/mtHwuGSXFbjBYHcCtibkONo8nGIkQD+pPYQZtiYDP2expL8bo
 w1b/Ubp9zs01LZR/EFBVhyHaSYrzg/lcQh05JKU9HLuVV5ksYx6Q/tTm3JMi/UnFUxm8
 wgIieMxzqNCHndrVgCTs5hnXAYs22twvoNfMBTkGx87Y6LObqUCDfTd5gf0o+Dd5iMVs
 9N2Q==
X-Gm-Message-State: AOAM53399Uwmbe8ngnYr5m2jzq6e62znjSAQj5k4yBb2O8uBUf6TcdLR
 MGiM2ACLmsu8qcz2a1aztyXjI3muo7Pkog==
X-Google-Smtp-Source: ABdhPJx9y9FTlmX+vUKx7ecMG7lUtvBHGtQ8hdSFlZrO5A4XvriTIM9/v7m7WdKa9wudYRCwLU4mxA==
X-Received: by 2002:a17:90b:3b8b:b0:1df:f2ca:c56d with SMTP id
 pc11-20020a17090b3b8b00b001dff2cac56dmr7415958pjb.199.1653091443136; 
 Fri, 20 May 2022 17:04:03 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 00/49] semihosting cleanup
Date: Fri, 20 May 2022 17:03:11 -0700
Message-Id: <20220521000400.454525-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Changes for v3:
  * Split the patch set -- only include arm-compat-semi.c changes here.
  * Fix softmmu_target_strlen vs mmio (pmm).
  * Add kerneldoc comments for guestfd.h.


r~


Richard Henderson (49):
  semihosting: Move exec/softmmu-semi.h to semihosting/softmmu-uaccess.h
  semihosting: Return failure from softmmu-uaccess.h functions
  semihosting: Improve condition for config.c and console.c
  semihosting: Move softmmu-uaccess.h functions out of line
  semihosting: Add target_strlen for softmmu-uaccess.h
  semihosting: Simplify softmmu_lock_user_string
  semihosting: Split out guestfd.c
  semihosting: Inline set_swi_errno into common_semi_cb
  semihosting: Adjust error checking in common_semi_cb
  semihosting: Clean up common_semi_flen_cb
  semihosting: Clean up common_semi_open_cb
  semihosting: Return void from do_common_semihosting
  semihosting: Move common-semi.h to include/semihosting/
  include/exec: Move gdb open flags to gdbstub.h
  include/exec: Move gdb_stat and gdb_timeval to gdbstub.h
  include/exec: Define errno values in gdbstub.h
  semihosting: Use struct gdb_stat in common_semi_flen_cb
  semihosting: Split is_64bit_semihosting per target
  semihosting: Split common_semi_flen_buf per target
  semihosting: Split out common_semi_has_synccache
  semihosting: Use env more often in do_common_semihosting
  semihosting: Move GET_ARG/SET_ARG earlier in the file
  semihosting: Split out semihost_sys_open
  semihosting: Split out semihost_sys_close
  semihosting: Split out semihost_sys_read
  semihosting: Split out semihost_sys_write
  semihosting: Bound length for semihost_sys_{read,write}
  semihosting: Split out semihost_sys_lseek
  semihosting: Split out semihost_sys_isatty
  semihosting: Split out semihost_sys_flen
  semihosting: Split out semihost_sys_remove
  semihosting: Split out semihost_sys_rename
  semihosting: Split out semihost_sys_system
  semihosting: Create semihost_sys_{stat,fstat}
  semihosting: Create semihost_sys_gettimeofday
  gdbstub: Widen gdb_syscall_complete_cb return value
  semihosting: Fix docs comment for qemu_semihosting_console_inc
  semihosting: Pass CPUState to qemu_semihosting_console_inc
  semihosting: Expand qemu_semihosting_console_inc to read
  semihosting: Cleanup chardev init
  semihosting: Create qemu_semihosting_console_write
  semihosting: Add GuestFDConsole
  semihosting: Create qemu_semihosting_guestfd_init
  semihosting: Use console_in_gf for SYS_READC
  semihosting: Use console_out_gf for SYS_WRITEC
  semihosting: Remove qemu_semihosting_console_outc
  semihosting: Use console_out_gf for SYS_WRITE0
  semihosting: Remove qemu_semihosting_console_outs
  semihosting: Create semihost_sys_poll_one

 configs/targets/aarch64-linux-user.mak        |    1 +
 configs/targets/aarch64_be-linux-user.mak     |    1 +
 configs/targets/arm-linux-user.mak            |    1 +
 configs/targets/armeb-linux-user.mak          |    1 +
 configs/targets/riscv32-linux-user.mak        |    1 +
 configs/targets/riscv64-linux-user.mak        |    1 +
 include/exec/gdbstub.h                        |   67 +-
 include/exec/softmmu-semi.h                   |  101 --
 .../semihosting}/common-semi.h                |    2 +-
 include/semihosting/console.h                 |   71 +-
 include/semihosting/guestfd.h                 |   91 ++
 include/semihosting/semihost.h                |   14 +-
 include/semihosting/softmmu-uaccess.h         |   59 +
 include/semihosting/syscalls.h                |   75 ++
 target/arm/common-semi-target.h               |   62 +
 target/riscv/common-semi-target.h             |   50 +
 gdbstub.c                                     |    7 +-
 linux-user/aarch64/cpu_loop.c                 |    2 +-
 linux-user/arm/cpu_loop.c                     |    2 +-
 linux-user/main.c                             |    9 +
 linux-user/riscv/cpu_loop.c                   |    2 +-
 linux-user/semihost.c                         |   48 +-
 semihosting/arm-compat-semi.c                 |  984 ++++------------
 semihosting/config.c                          |   17 +-
 semihosting/console.c                         |  153 +--
 semihosting/guestfd.c                         |  160 +++
 semihosting/syscalls.c                        | 1008 +++++++++++++++++
 semihosting/uaccess.c                         |   91 ++
 softmmu/vl.c                                  |    3 +-
 stubs/semihost.c                              |    6 +-
 target/arm/helper.c                           |    4 +-
 target/arm/m_helper.c                         |    2 +-
 target/m68k/m68k-semi.c                       |   50 +-
 target/mips/tcg/sysemu/mips-semi.c            |    2 +-
 target/nios2/nios2-semi.c                     |   48 +-
 target/riscv/cpu_helper.c                     |    2 +-
 semihosting/meson.build                       |    6 +
 37 files changed, 2055 insertions(+), 1149 deletions(-)
 delete mode 100644 include/exec/softmmu-semi.h
 rename {semihosting => include/semihosting}/common-semi.h (96%)
 create mode 100644 include/semihosting/guestfd.h
 create mode 100644 include/semihosting/softmmu-uaccess.h
 create mode 100644 include/semihosting/syscalls.h
 create mode 100644 target/arm/common-semi-target.h
 create mode 100644 target/riscv/common-semi-target.h
 create mode 100644 semihosting/guestfd.c
 create mode 100644 semihosting/syscalls.c
 create mode 100644 semihosting/uaccess.c

-- 
2.34.1


