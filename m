Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00826A8F78
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:59:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvcf-0007PO-R2; Thu, 02 Mar 2023 21:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcY-0007Op-T9
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:11 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcX-0001lC-5i
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:10 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so968804pjz.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/AVfTEc7lShISFso5PS8rOT8H1Sq7wkxu6ZYeyQZkig=;
 b=I92xeVEx6QZKm0oqPxwERZWKqAUglGqR+OssWhbt1SR0DTQJzU607pIM3hBShpb/Tr
 urHlz1sChj2Jc8tHwbNySrEvYTY59zjYr+nH/0NRC46q8AzPv0tLsSfJSX8QXOXfQJsk
 kNtk7YsVdvLpGH2SgfUPR6STDYFzl0Gg0MRgIg0RYdknaGzEVZQEYTGWafLiKm6gOiYi
 vRhKiijQxM2829eNCSSWGXWBDqyq4tBTesozZCHGUnyBAQIvEVe9na4TOXr/M7usjK7X
 Bx9zzYRuhb81TZCjE0ezNGNo3xSAMWGhh8Tdft5CFbwzZTOaN1EKAwVh7iSy1RDYYycR
 bwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/AVfTEc7lShISFso5PS8rOT8H1Sq7wkxu6ZYeyQZkig=;
 b=V3gQgIeuVaM+8Pr9o1atnkVf/BIoYMto/AlXq70hkQrRDGSpoLe50ntT61yRCYFDEz
 oDOo19duQqEC1UZ9ol/UUWwwa5yWn+vTPres74mSOGozRZov017IP6uDslJzTNRgo/VO
 FPAcjNB51Dc/EDLoD2B0ytd9jvPJz9y4k9CebWG2Qoa3w81stRWFnctW2GFQevj2u5TR
 USUu4MTb/EsLTACKCmUZbc2RKstfwWKJW3s+GZqzCmiNkezjgmtEbOt6U7V9GZ8Y/Vx+
 tK/pK6xEIUOh8qInrfAEErBSDfJ/cerem8NvC5MN1BalEQJGU3aPB2LURB4MD5SCxDsC
 bSLw==
X-Gm-Message-State: AO0yUKVbNxXn3u7SlV0g6u6suf20O1buMbsEy2ySJ9ZOhA/joT/sArYm
 vjgqkmuTDXhRKTs7eH2kQITg+e8+l3aTZxO8ymw=
X-Google-Smtp-Source: AK7set8YwwwdiaNbEeUVQJT2nEDBfsk7j4cc4wjLJ8D6EZ4/Wj27oKXhTZVbxPZ4itceb4RbPbZexA==
X-Received: by 2002:a17:902:d483:b0:19a:95ab:6b38 with SMTP id
 c3-20020a170902d48300b0019a95ab6b38mr724875plg.1.1677812287484; 
 Thu, 02 Mar 2023 18:58:07 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v4.5 00/29] gdbstub/next: re-organise and split build
Date: Thu,  2 Mar 2023 18:57:36 -0800
Message-Id: <20230303025805.625589-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Alex,

This is what I came up with when thinking about your user/softmmu
and syscall split.


r~


Alex Bennée (24):
  gdbstub/internals.h: clean up include guard
  gdbstub: fix-up copyright and license files
  gdbstub: clean-up indent on gdb_exit
  gdbstub: define separate user/system structures
  gdbstub: move GDBState to shared internals header
  includes: move tb_flush into its own header
  gdbstub: move fromhex/tohex routines to internals
  gdbstub: make various helpers visible to the rest of the module
  gdbstub: move chunk of softmmu functionality to own file
  gdbstub: move chunks of user code into own files
  gdbstub: rationalise signal mapping in softmmu
  gdbstub: abstract target specific details from gdb_put_packet_binary
  gdbstub: specialise handle_query_attached
  gdbstub: specialise target_memory_rw_debug
  gdbstub: introduce gdb_get_max_cpus
  gdbstub: specialise stub_can_reverse
  gdbstub: fix address type of gdb_set_cpu_pc
  gdbstub: don't use target_ulong while handling registers
  gdbstub: move register helpers into standalone include
  gdbstub: move syscall handling to new file
  gdbstub: only compile gdbstub twice for whole build
  testing: probe gdb for supported architectures ahead of time
  include: split target_long definition from cpu-defs
  gdbstub: split out softmmu/user specifics for syscall handling

Mads Ynddal (1):
  gdbstub: move update guest debug to accel ops

Philippe Mathieu-Daudé (1):
  gdbstub: Make syscall_complete/[gs]et_reg target-agnostic typedefs

Richard Henderson (3):
  gdbstub: Remove gdb_do_syscallv
  gdbstub: Adjust gdb_do_syscall to only use uint32_t and uint64_t
  gdbstub: Build syscall.c once

 MAINTAINERS                                   |    4 +
 configure                                     |    8 +
 gdbstub/internals.h                           |  212 ++-
 include/exec/cpu-defs.h                       |   19 +-
 include/exec/exec-all.h                       |    1 -
 include/exec/gdbstub.h                        |  208 ---
 include/exec/target_long.h                    |   42 +
 include/exec/tb-flush.h                       |   26 +
 include/gdbstub/helpers.h                     |  103 +
 include/gdbstub/syscalls.h                    |  113 ++
 include/gdbstub/user.h                        |   43 +
 include/sysemu/accel-ops.h                    |    1 +
 linux-user/user-internals.h                   |    1 +
 accel/kvm/kvm-accel-ops.c                     |    8 +
 accel/stubs/tcg-stub.c                        |    1 +
 accel/tcg/tb-maint.c                          |    1 +
 accel/tcg/translate-all.c                     |    1 +
 cpu.c                                         |   12 +-
 gdbstub/gdbstub.c                             | 1655 ++---------------
 gdbstub/softmmu.c                             |  603 +++++-
 gdbstub/syscalls.c                            |  204 ++
 gdbstub/user-target.c                         |  283 +++
 gdbstub/user.c                                |  423 ++++-
 hw/ppc/spapr_hcall.c                          |    1 +
 linux-user/exit.c                             |    2 +-
 linux-user/main.c                             |    1 +
 linux-user/signal.c                           |    2 +-
 plugins/core.c                                |    1 +
 plugins/loader.c                              |    2 +-
 semihosting/arm-compat-semi.c                 |    1 +
 semihosting/guestfd.c                         |    2 +-
 semihosting/syscalls.c                        |   37 +-
 softmmu/runstate.c                            |    2 +-
 target/alpha/gdbstub.c                        |    2 +-
 target/alpha/sys_helper.c                     |    1 +
 target/arm/gdbstub.c                          |    1 +
 target/arm/gdbstub64.c                        |    2 +-
 target/arm/tcg/helper-a64.c                   |    2 +-
 target/arm/tcg/m_helper.c                     |    1 +
 target/avr/gdbstub.c                          |    2 +-
 target/cris/gdbstub.c                         |    2 +-
 target/hexagon/gdbstub.c                      |    2 +-
 target/hppa/gdbstub.c                         |    2 +-
 target/i386/gdbstub.c                         |    2 +-
 target/i386/whpx/whpx-all.c                   |    2 +-
 target/loongarch/gdbstub.c                    |    1 +
 target/m68k/gdbstub.c                         |    2 +-
 target/m68k/helper.c                          |    1 +
 target/m68k/m68k-semi.c                       |    3 +-
 target/microblaze/gdbstub.c                   |    2 +-
 target/mips/gdbstub.c                         |    2 +-
 target/mips/tcg/sysemu/mips-semi.c            |    3 +-
 target/nios2/cpu.c                            |    2 +-
 target/nios2/nios2-semi.c                     |    3 +-
 target/openrisc/gdbstub.c                     |    2 +-
 target/openrisc/interrupt.c                   |    2 +-
 target/openrisc/mmu.c                         |    2 +-
 target/ppc/cpu_init.c                         |    2 +-
 target/ppc/gdbstub.c                          |    1 +
 target/riscv/csr.c                            |    1 +
 target/riscv/gdbstub.c                        |    1 +
 target/rx/gdbstub.c                           |    2 +-
 target/s390x/gdbstub.c                        |    1 +
 target/s390x/helper.c                         |    2 +-
 target/sh4/gdbstub.c                          |    2 +-
 target/sparc/gdbstub.c                        |    2 +-
 target/tricore/gdbstub.c                      |    2 +-
 target/xtensa/core-dc232b.c                   |    2 +-
 target/xtensa/core-dc233c.c                   |    2 +-
 target/xtensa/core-de212.c                    |    2 +-
 target/xtensa/core-de233_fpu.c                |    2 +-
 target/xtensa/core-dsp3400.c                  |    2 +-
 target/xtensa/core-fsf.c                      |    2 +-
 target/xtensa/core-lx106.c                    |    2 +-
 target/xtensa/core-sample_controller.c        |    2 +-
 target/xtensa/core-test_kc705_be.c            |    2 +-
 target/xtensa/core-test_mmuhifi_c3.c          |    2 +-
 target/xtensa/gdbstub.c                       |    2 +-
 target/xtensa/helper.c                        |    2 +-
 gdbstub/meson.build                           |   34 +-
 gdbstub/trace-events                          |    4 +-
 scripts/probe-gdb-support.py                  |   88 +
 target/xtensa/import_core.sh                  |    2 +-
 tests/tcg/aarch64/Makefile.target             |    2 +-
 tests/tcg/multiarch/Makefile.target           |    5 +
 .../multiarch/system/Makefile.softmmu-target  |    6 +-
 tests/tcg/s390x/Makefile.target               |    2 +-
 87 files changed, 2439 insertions(+), 1813 deletions(-)
 create mode 100644 include/exec/target_long.h
 create mode 100644 include/exec/tb-flush.h
 create mode 100644 include/gdbstub/helpers.h
 create mode 100644 include/gdbstub/syscalls.h
 create mode 100644 include/gdbstub/user.h
 create mode 100644 gdbstub/syscalls.c
 create mode 100644 gdbstub/user-target.c
 create mode 100755 scripts/probe-gdb-support.py

-- 
2.34.1


