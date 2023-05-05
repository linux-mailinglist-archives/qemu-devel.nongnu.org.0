Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F312D6F7A43
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:04:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujqv-0007tD-Pu; Thu, 04 May 2023 21:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujqq-0007sw-Vp
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:13 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujqo-0006nB-EO
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:12 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-51b4ef5378bso1004609a12.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248588; x=1685840588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CDKJRSmp+8LBUXM/U1uyhUhRRYsrO5iBQwAcawvqGyk=;
 b=Nr7PKko5iwoILqKzjDxaTJPAMWvmpLfOAM2SqUwXGEACpr19mVshU7a8ZRdKfi92Xz
 r8gnbxYNlYf2OJZQ1WPEH5zrmZNhgqGtMLsko2j15r3aP7AmRIJ42+6z6vQK0D0xwsSX
 PmLRexviKiuwuHwrBEK9UCz8GE6rNjtoVXYNTRcs3ooLbzuI4KgDleRdsjiqI7S6aaPz
 Zz/PSmJKQrf9Vv+H/9pGMTVrVWEGsmEGWnpq+ceBb4G/gfBazcXw4zI94loqfv0/84sL
 93yOCK6GvOVq3kG3HchXX3IiJlLAGmgndhyCj6Dxc/EyLg1/578BTSXe6ioIsV7LRIC+
 sXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248588; x=1685840588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CDKJRSmp+8LBUXM/U1uyhUhRRYsrO5iBQwAcawvqGyk=;
 b=hezGKyEeIhGFW1/TNnrT9+iMJ08Vt/hlx4IWtYa9tv4d4im52W1LZ+8ru440BC4laN
 5Wf3C3Evw1v/M+rLNshqWu+lpIPd3YeJEk/6/lYH3VsDWI3KyvG/kgM4eKXagY6+kKQh
 AjRA9lTdgBNtHq3KmQJthJtSMUorpbvhvRYNy8AiN+YLdsisElE1q9Lgr0nDT6D/CTHA
 M/+CgwZNL/W3IdYyLu9srZSlsndhfLea2BafF0p9qu7NYR63XxBsxLeg0XVERVm0sekd
 +89y63HqvM7w5unr7MWSLwd4qAN1uYAnXqABqPV2bm9WaLHDLTsZ8XC+VwqUL0TWVLa1
 bCBw==
X-Gm-Message-State: AC+VfDwSh6BFbg2qBYN7B54GVrNEv34U9QYfk9kPloM35K22xm3EjXtO
 eTnY0Mr5aDGm2Nsl8BnKe2bNB6q9kL5Smg==
X-Google-Smtp-Source: ACHHUZ47VKguvt524nq5A+aSjoUpzBC4EEPwkV5pH7yQPuhn9IWgIon/Ix1Y7pCqRfx/wsVqrh9QHw==
X-Received: by 2002:a17:903:25c5:b0:1a9:7eea:2626 with SMTP id
 jc5-20020a17090325c500b001a97eea2626mr4720254plb.10.1683248587541; 
 Thu, 04 May 2023 18:03:07 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:03:06 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/89] riscv-to-apply queue
Date: Fri,  5 May 2023 11:01:12 +1000
Message-Id: <20230505010241.21812-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit f6b761bdbd8ba63cee7428d52fb6b46e4224ddab:

  Merge tag 'qga-pull-2023-05-04' of https://github.com/kostyanf14/qemu into staging (2023-05-04 12:08:00 +0100)

are available in the Git repository at:

  https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-20230505-1

for you to fetch changes up to e1d084a8524a9225a46d485e2d164bb258f326f7:

  target/riscv: add Ventana's Veyron V1 CPU (2023-05-05 10:49:50 +1000)

----------------------------------------------------------------
First RISC-V PR for 8.1

* CPURISCVState related cleanup and simplification
* Refactor Zicond and reuse in XVentanaCondOps
* Fix invalid riscv,event-to-mhpmcounters entry
* Support subsets of code size reduction extension
* Fix itrigger when icount is used
* Simplification for RVH related check and code style fix
* Add signature dump function for spike to run ACT tests
* Rework MISA writing
* Fix mstatus.MPP related support
* Use check for relationship between Zdinx/Zhinx{min} and Zfinx
* Fix the H extension TVM trap
* A large collection of mstatus sum changes and cleanups
* Zero init APLIC internal state
* Implement query-cpu-definitions
* Restore the predicate() NULL check behavior
* Fix Guest Physical Address Translation
* Make sure an exception is raised if a pte is malformed
* Add Ventana's Veyron V1 CPU

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Make sure an exception is raised if a pte is malformed

Bin Meng (1):
      target/riscv: Restore the predicate() NULL check behavior

Conor Dooley (1):
      target/riscv: fix invalid riscv,event-to-mhpmcounters entry

Daniel Henrique Barboza (23):
      target/riscv: sync env->misa_ext* with cpu->cfg in realize()
      target/riscv: remove MISA properties from isa_edata_arr[]
      target/riscv/cpu.c: remove 'multi_letter' from isa_ext_data
      target/riscv: introduce riscv_cpu_add_misa_properties()
      target/riscv: remove cpu->cfg.ext_a
      target/riscv: remove cpu->cfg.ext_c
      target/riscv: remove cpu->cfg.ext_d
      target/riscv: remove cpu->cfg.ext_f
      target/riscv: remove cpu->cfg.ext_i
      target/riscv: remove cpu->cfg.ext_e
      target/riscv: remove cpu->cfg.ext_m
      target/riscv: remove cpu->cfg.ext_s
      target/riscv: remove cpu->cfg.ext_u
      target/riscv: remove cpu->cfg.ext_h
      target/riscv: remove cpu->cfg.ext_j
      target/riscv: remove cpu->cfg.ext_v
      target/riscv: remove riscv_cpu_sync_misa_cfg()
      target/riscv: remove cfg.ext_g setup from rv64_thead_c906_cpu_init()
      target/riscv: add RVG and remove cpu->cfg.ext_g
      target/riscv/cpu.c: redesign register_cpu_props()
      target/riscv: add CPU QOM header
      target/riscv: add query-cpy-definitions support
      target/riscv: add TYPE_RISCV_DYNAMIC_CPU

Fei Wu (2):
      target/riscv: Separate priv from mmu_idx
      target/riscv: Reduce overhead of MSTATUS_SUM change

Irina Ryapolova (1):
      target/riscv: Fix Guest Physical Address Translation

Ivan Klokov (1):
      hw/intc/riscv_aplic: Zero init APLIC internal state

LIU Zhiwei (7):
      target/riscv: Fix priv version dependency for vector and zfh
      target/riscv: Fix itrigger when icount is used
      target/riscv: Convert env->virt to a bool env->virt_enabled
      target/riscv: Extract virt enabled state from tb flags
      target/riscv: Add a general status enum for extensions
      target/riscv: Encode the FS and VS on a normal way for tb flags
      target/riscv: Add a tb flags field for vstart

Philipp Tomsich (2):
      target/riscv: refactor Zicond support
      target/riscv: redirect XVentanaCondOps to use the Zicond functions

Rahul Pathak (1):
      target/riscv: add Ventana's Veyron V1 CPU

Richard Henderson (18):
      target/riscv: Remove mstatus_hs_{fs, vs} from tb_flags
      target/riscv: Use cpu_ld*_code_mmu for HLVX
      target/riscv: Handle HLV, HSV via helpers
      target/riscv: Rename MMU_HYP_ACCESS_BIT to MMU_2STAGE_BIT
      target/riscv: Introduce mmuidx_sum
      target/riscv: Introduce mmuidx_priv
      target/riscv: Introduce mmuidx_2stage
      target/riscv: Move hstatus.spvp check to check_access_hlsv
      target/riscv: Set MMU_2STAGE_BIT in riscv_cpu_mmu_index
      target/riscv: Check SUM in the correct register
      target/riscv: Hoist second stage mode change to callers
      target/riscv: Hoist pbmte and hade out of the level loop
      target/riscv: Move leaf pte processing out of level loop
      target/riscv: Suppress pte update with is_debug
      target/riscv: Don't modify SUM with is_debug
      target/riscv: Merge checks for reserved pte flags
      target/riscv: Reorg access check in get_physical_address
      target/riscv: Reorg sum check in get_physical_address

Weiwei Li (30):
      target/riscv: Avoid env_archcpu() when reading RISCVCPUConfig
      target/riscv: Simplify getting RISCVCPU pointer from env
      target/riscv: Simplify type conversion for CPURISCVState
      target/riscv: Simplify arguments for riscv_csrrw_check
      target/riscv: add cfg properties for Zc* extension
      target/riscv: add support for Zca extension
      target/riscv: add support for Zcf extension
      target/riscv: add support for Zcd extension
      target/riscv: add support for Zcb extension
      target/riscv: add support for Zcmp extension
      target/riscv: add support for Zcmt extension
      target/riscv: expose properties for Zc* extension
      disas/riscv.c: add disasm support for Zc*
      target/riscv: Add support for Zce
      target/riscv: Remove redundant call to riscv_cpu_virt_enabled
      target/riscv: Remove redundant check on RVH
      target/riscv: Remove check on RVH for riscv_cpu_virt_enabled
      target/riscv: Remove check on RVH for riscv_cpu_set_virt_enabled
      target/riscv: Remove redundant parentheses
      target/riscv: Fix addr type for get_physical_address
      target/riscv: Set opcode to env->bins for illegal/virtual instruction fault
      target/riscv: Remove riscv_cpu_virt_enabled()
      target/riscv: Fix format for indentation
      target/riscv: Fix format for comments
      target/riscv: Fix lines with over 80 characters
      hw/riscv: Add signature dump function for spike to run ACT tests
      target/riscv: Fix the mstatus.MPP value after executing MRET
      target/riscv: Use PRV_RESERVED instead of PRV_H
      target/riscv: Legalize MPP value in write_mstatus
      target/riscv: Use check for relationship between Zdinx/Zhinx{min} and Zfinx

Yi Chen (1):
      target/riscv: fix H extension TVM trap

 MAINTAINERS                                        |   2 +-
 qapi/machine-target.json                           |   6 +-
 include/hw/char/riscv_htif.h                       |   3 +
 target/riscv/cpu-qom.h                             |  71 +++
 target/riscv/cpu.h                                 | 155 ++---
 target/riscv/cpu_bits.h                            |  27 +-
 target/riscv/cpu_vendorid.h                        |   4 +
 target/riscv/helper.h                              |  15 +-
 target/riscv/internals.h                           |  35 ++
 target/riscv/pmp.h                                 |   9 +-
 target/riscv/sbi_ecall_interface.h                 |   8 +-
 target/riscv/time_helper.h                         |   2 +-
 target/riscv/insn16.decode                         |  62 +-
 disas/riscv.c                                      | 228 ++++++-
 hw/char/riscv_htif.c                               |  44 +-
 hw/intc/riscv_aplic.c                              |   2 +-
 hw/riscv/spike.c                                   |  13 +
 target/riscv/arch_dump.c                           |   7 +-
 target/riscv/cpu.c                                 | 571 +++++++++++-------
 target/riscv/cpu_helper.c                          | 671 +++++++++++----------
 target/riscv/csr.c                                 | 331 +++++-----
 target/riscv/debug.c                               |  21 +-
 target/riscv/fpu_helper.c                          |  24 +-
 target/riscv/gdbstub.c                             |   9 +-
 target/riscv/m128_helper.c                         |  16 +-
 target/riscv/machine.c                             |  43 +-
 target/riscv/op_helper.c                           | 147 ++++-
 target/riscv/pmp.c                                 |  66 +-
 target/riscv/pmu.c                                 |  23 +-
 target/riscv/riscv-qmp-cmds.c                      |  57 ++
 target/riscv/time_helper.c                         |  15 +-
 target/riscv/translate.c                           | 109 ++--
 target/riscv/vector_helper.c                       | 317 +++++-----
 target/riscv/zce_helper.c                          |  55 ++
 target/riscv/insn_trans/trans_privileged.c.inc     |   8 +-
 target/riscv/insn_trans/trans_rvd.c.inc            |  18 +
 target/riscv/insn_trans/trans_rvf.c.inc            |  20 +-
 target/riscv/insn_trans/trans_rvh.c.inc            | 127 ++--
 target/riscv/insn_trans/trans_rvi.c.inc            |   4 +-
 target/riscv/insn_trans/trans_rvv.c.inc            |  58 +-
 target/riscv/insn_trans/trans_rvzce.c.inc          | 311 ++++++++++
 target/riscv/insn_trans/trans_rvzicond.c.inc       |  36 +-
 target/riscv/insn_trans/trans_xthead.c.inc         |  14 +-
 .../riscv/insn_trans/trans_xventanacondops.c.inc   |  18 +-
 target/riscv/meson.build                           |   6 +-
 45 files changed, 2488 insertions(+), 1300 deletions(-)
 create mode 100644 target/riscv/cpu-qom.h
 create mode 100644 target/riscv/riscv-qmp-cmds.c
 create mode 100644 target/riscv/zce_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc

