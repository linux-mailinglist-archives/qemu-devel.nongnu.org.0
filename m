Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475965048D4
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:14:38 +0200 (CEST)
Received: from localhost ([::1]:42722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9Px-0007cU-C2
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xH-0001BF-2h
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:59 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xC-0003Mu-3c
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:58 -0400
Received: by mail-pl1-x631.google.com with SMTP id n8so10761844plh.1
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/4nUFEFhPbECEOcrTf7ZSJ5Kp+IM3GRGZb7ARPXAT8=;
 b=yPJTe1c7sOJCp/e1oT5nef6QSoIo50mecnTYeB9cY9dK55pG+/Vug8eB15kCD27i5z
 kJwOHzN8bpfsrN5JRC6JDOKGhr22Pt5x0emPb621Xp2xojObvPLcyUqEjQ4vMJsorjMj
 fherkXS4QHi2QQ8ZARvNkGqoVvHDL/tstXXS99M6OMyF7SLU67NVgRdUJIxoRNmyGhcV
 o15tohShjtUW0f9Af6NyuV7U+XaQBMfB0hwIbas6d009q6COjvA+2Sfent8zzcNpXugs
 G5knGw2Geh1S7jnO444blBKvdsl3F+rBgH5dGyn3bMWD8y5LcurCq4HMvFlIh+j0kPPP
 jC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v/4nUFEFhPbECEOcrTf7ZSJ5Kp+IM3GRGZb7ARPXAT8=;
 b=C8TLxDrXA0t8ba1s208NB7gl7m3kSSghLoj9+Qjkjo9e7w4Dxd3EJk9gisTVg/VZj2
 V/wvfN92FwsiQqi2edmXrNfikEghnVavbKJ0/RWkLPL8c7tzidOMfpXP8a+0tGtRHmE4
 MEU+9Nv8oysOcQfQ8IuGWWx3wUfGi2mxdGehEkx8ZAdpyg/iiXA21CEQfr62gjW4qtfo
 bN5ady4628+vfzAtJPJhhaByur+0Wr47zWq3PQ6Vl28pGxNEDQ7584yX1+hDIuYKYxGr
 2Fnj4ZZ9IFFUksXtc4cjL4ii/nxrubiOQC/L5bioUJU9TB3bOPtjrW6ln2WPgj6R+APC
 0Vkg==
X-Gm-Message-State: AOAM531Z0YD66XKbr4pzwRF7bCCLMLuBCei0rm//CGFqtcP946qCVwp+
 eiEcsnUDrmXDN3CJoXYOJbyrk1XvdfZ4+w==
X-Google-Smtp-Source: ABdhPJyRmUmLfwHm3CjxjNE35jqHzghLXMPg572auEJhKomuP5gWIIyVTgH93RHqGEz0fmaTzPxmhg==
X-Received: by 2002:a17:902:70c1:b0:156:16c0:dc7b with SMTP id
 l1-20020a17090270c100b0015616c0dc7bmr7830230plt.85.1650217490615; 
 Sun, 17 Apr 2022 10:44:50 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/60] target/arm: Split out cpregs.h
Date: Sun, 17 Apr 2022 10:43:50 -0700
Message-Id: <20220417174426.711829-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move ARMCPRegInfo and all related declarations to a new
internal header, out of the public cpu.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h        | 413 +++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h           | 368 ---------------------------------
 hw/arm/pxa2xx.c            |   1 +
 hw/arm/pxa2xx_pic.c        |   1 +
 hw/intc/arm_gicv3_cpuif.c  |   1 +
 hw/intc/arm_gicv3_kvm.c    |   2 +
 target/arm/cpu.c           |   1 +
 target/arm/cpu64.c         |   1 +
 target/arm/cpu_tcg.c       |   1 +
 target/arm/gdbstub.c       |   3 +-
 target/arm/helper.c        |   1 +
 target/arm/op_helper.c     |   1 +
 target/arm/translate-a64.c |   4 +-
 target/arm/translate.c     |   3 +-
 14 files changed, 427 insertions(+), 374 deletions(-)
 create mode 100644 target/arm/cpregs.h

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
new file mode 100644
index 0000000000..005aa2d3a5
--- /dev/null
+++ b/target/arm/cpregs.h
@@ -0,0 +1,413 @@
+/*
+ * QEMU ARM CP Register access and descriptions
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#ifndef TARGET_ARM_CPREGS_H
+#define TARGET_ARM_CPREGS_H 1
+
+/*
+ * ARMCPRegInfo type field bits. If the SPECIAL bit is set this is a
+ * special-behaviour cp reg and bits [11..8] indicate what behaviour
+ * it has. Otherwise it is a simple cp reg, where CONST indicates that
+ * TCG can assume the value to be constant (ie load at translate time)
+ * and 64BIT indicates a 64 bit wide coprocessor register. SUPPRESS_TB_END
+ * indicates that the TB should not be ended after a write to this register
+ * (the default is that the TB ends after cp writes). OVERRIDE permits
+ * a register definition to override a previous definition for the
+ * same (cp, is64, crn, crm, opc1, opc2) tuple: either the new or the
+ * old must have the OVERRIDE bit set.
+ * ALIAS indicates that this register is an alias view of some underlying
+ * state which is also visible via another register, and that the other
+ * register is handling migration and reset; registers marked ALIAS will not be
+ * migrated but may have their state set by syncing of register state from KVM.
+ * NO_RAW indicates that this register has no underlying state and does not
+ * support raw access for state saving/loading; it will not be used for either
+ * migration or KVM state synchronization. (Typically this is for "registers"
+ * which are actually used as instructions for cache maintenance and so on.)
+ * IO indicates that this register does I/O and therefore its accesses
+ * need to be marked with gen_io_start() and also end the TB. In particular,
+ * registers which implement clocks or timers require this.
+ * RAISES_EXC is for when the read or write hook might raise an exception;
+ * the generated code will synchronize the CPU state before calling the hook
+ * so that it is safe for the hook to call raise_exception().
+ * NEWEL is for writes to registers that might change the exception
+ * level - typically on older ARM chips. For those cases we need to
+ * re-read the new el when recomputing the translation flags.
+ */
+#define ARM_CP_SPECIAL           0x0001
+#define ARM_CP_CONST             0x0002
+#define ARM_CP_64BIT             0x0004
+#define ARM_CP_SUPPRESS_TB_END   0x0008
+#define ARM_CP_OVERRIDE          0x0010
+#define ARM_CP_ALIAS             0x0020
+#define ARM_CP_IO                0x0040
+#define ARM_CP_NO_RAW            0x0080
+#define ARM_CP_NOP               (ARM_CP_SPECIAL | 0x0100)
+#define ARM_CP_WFI               (ARM_CP_SPECIAL | 0x0200)
+#define ARM_CP_NZCV              (ARM_CP_SPECIAL | 0x0300)
+#define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
+#define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
+#define ARM_CP_DC_GVA            (ARM_CP_SPECIAL | 0x0600)
+#define ARM_CP_DC_GZVA           (ARM_CP_SPECIAL | 0x0700)
+#define ARM_LAST_SPECIAL         ARM_CP_DC_GZVA
+#define ARM_CP_FPU               0x1000
+#define ARM_CP_SVE               0x2000
+#define ARM_CP_NO_GDB            0x4000
+#define ARM_CP_RAISES_EXC        0x8000
+#define ARM_CP_NEWEL             0x10000
+/* Used only as a terminator for ARMCPRegInfo lists */
+#define ARM_CP_SENTINEL          0xfffff
+/* Mask of only the flag bits in a type field */
+#define ARM_CP_FLAG_MASK         0x1f0ff
+
+/*
+ * Valid values for ARMCPRegInfo state field, indicating which of
+ * the AArch32 and AArch64 execution states this register is visible in.
+ * If the reginfo doesn't explicitly specify then it is AArch32 only.
+ * If the reginfo is declared to be visible in both states then a second
+ * reginfo is synthesised for the AArch32 view of the AArch64 register,
+ * such that the AArch32 view is the lower 32 bits of the AArch64 one.
+ * Note that we rely on the values of these enums as we iterate through
+ * the various states in some places.
+ */
+enum {
+    ARM_CP_STATE_AA32 = 0,
+    ARM_CP_STATE_AA64 = 1,
+    ARM_CP_STATE_BOTH = 2,
+};
+
+/*
+ * ARM CP register secure state flags.  These flags identify security state
+ * attributes for a given CP register entry.
+ * The existence of both or neither secure and non-secure flags indicates that
+ * the register has both a secure and non-secure hash entry.  A single one of
+ * these flags causes the register to only be hashed for the specified
+ * security state.
+ * Although definitions may have any combination of the S/NS bits, each
+ * registered entry will only have one to identify whether the entry is secure
+ * or non-secure.
+ */
+enum {
+    ARM_CP_SECSTATE_S =   (1 << 0), /* bit[0]: Secure state register */
+    ARM_CP_SECSTATE_NS =  (1 << 1), /* bit[1]: Non-secure state register */
+};
+
+/*
+ * Return true if cptype is a valid type field. This is used to try to
+ * catch errors where the sentinel has been accidentally left off the end
+ * of a list of registers.
+ */
+static inline bool cptype_valid(int cptype)
+{
+    return ((cptype & ~ARM_CP_FLAG_MASK) == 0)
+        || ((cptype & ARM_CP_SPECIAL) &&
+            ((cptype & ~ARM_CP_FLAG_MASK) <= ARM_LAST_SPECIAL));
+}
+
+/*
+ * Access rights:
+ * We define bits for Read and Write access for what rev C of the v7-AR ARM ARM
+ * defines as PL0 (user), PL1 (fiq/irq/svc/abt/und/sys, ie privileged), and
+ * PL2 (hyp). The other level which has Read and Write bits is Secure PL1
+ * (ie any of the privileged modes in Secure state, or Monitor mode).
+ * If a register is accessible in one privilege level it's always accessible
+ * in higher privilege levels too. Since "Secure PL1" also follows this rule
+ * (ie anything visible in PL2 is visible in S-PL1, some things are only
+ * visible in S-PL1) but "Secure PL1" is a bit of a mouthful, we bend the
+ * terminology a little and call this PL3.
+ * In AArch64 things are somewhat simpler as the PLx bits line up exactly
+ * with the ELx exception levels.
+ *
+ * If access permissions for a register are more complex than can be
+ * described with these bits, then use a laxer set of restrictions, and
+ * do the more restrictive/complex check inside a helper function.
+ */
+#define PL3_R 0x80
+#define PL3_W 0x40
+#define PL2_R (0x20 | PL3_R)
+#define PL2_W (0x10 | PL3_W)
+#define PL1_R (0x08 | PL2_R)
+#define PL1_W (0x04 | PL2_W)
+#define PL0_R (0x02 | PL1_R)
+#define PL0_W (0x01 | PL1_W)
+
+/*
+ * For user-mode some registers are accessible to EL0 via a kernel
+ * trap-and-emulate ABI. In this case we define the read permissions
+ * as actually being PL0_R. However some bits of any given register
+ * may still be masked.
+ */
+#ifdef CONFIG_USER_ONLY
+#define PL0U_R PL0_R
+#else
+#define PL0U_R PL1_R
+#endif
+
+#define PL3_RW (PL3_R | PL3_W)
+#define PL2_RW (PL2_R | PL2_W)
+#define PL1_RW (PL1_R | PL1_W)
+#define PL0_RW (PL0_R | PL0_W)
+
+typedef enum CPAccessResult {
+    /* Access is permitted */
+    CP_ACCESS_OK = 0,
+    /*
+     * Access fails due to a configurable trap or enable which would
+     * result in a categorized exception syndrome giving information about
+     * the failing instruction (ie syndrome category 0x3, 0x4, 0x5, 0x6,
+     * 0xc or 0x18). The exception is taken to the usual target EL (EL1 or
+     * PL1 if in EL0, otherwise to the current EL).
+     */
+    CP_ACCESS_TRAP = 1,
+    /*
+     * Access fails and results in an exception syndrome 0x0 ("uncategorized").
+     * Note that this is not a catch-all case -- the set of cases which may
+     * result in this failure is specifically defined by the architecture.
+     */
+    CP_ACCESS_TRAP_UNCATEGORIZED = 2,
+    /* As CP_ACCESS_TRAP, but for traps directly to EL2 or EL3 */
+    CP_ACCESS_TRAP_EL2 = 3,
+    CP_ACCESS_TRAP_EL3 = 4,
+    /* As CP_ACCESS_UNCATEGORIZED, but for traps directly to EL2 or EL3 */
+    CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = 5,
+    CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = 6,
+} CPAccessResult;
+
+typedef struct ARMCPRegInfo ARMCPRegInfo;
+
+/*
+ * Access functions for coprocessor registers. These cannot fail and
+ * may not raise exceptions.
+ */
+typedef uint64_t CPReadFn(CPUARMState *env, const ARMCPRegInfo *opaque);
+typedef void CPWriteFn(CPUARMState *env, const ARMCPRegInfo *opaque,
+                       uint64_t value);
+/* Access permission check functions for coprocessor registers. */
+typedef CPAccessResult CPAccessFn(CPUARMState *env,
+                                  const ARMCPRegInfo *opaque,
+                                  bool isread);
+/* Hook function for register reset */
+typedef void CPResetFn(CPUARMState *env, const ARMCPRegInfo *opaque);
+
+#define CP_ANY 0xff
+
+/* Definition of an ARM coprocessor register */
+struct ARMCPRegInfo {
+    /* Name of register (useful mainly for debugging, need not be unique) */
+    const char *name;
+    /*
+     * Location of register: coprocessor number and (crn,crm,opc1,opc2)
+     * tuple. Any of crm, opc1 and opc2 may be CP_ANY to indicate a
+     * 'wildcard' field -- any value of that field in the MRC/MCR insn
+     * will be decoded to this register. The register read and write
+     * callbacks will be passed an ARMCPRegInfo with the crn/crm/opc1/opc2
+     * used by the program, so it is possible to register a wildcard and
+     * then behave differently on read/write if necessary.
+     * For 64 bit registers, only crm and opc1 are relevant; crn and opc2
+     * must both be zero.
+     * For AArch64-visible registers, opc0 is also used.
+     * Since there are no "coprocessors" in AArch64, cp is purely used as a
+     * way to distinguish (for KVM's benefit) guest-visible system registers
+     * from demuxed ones provided to preserve the "no side effects on
+     * KVM register read/write from QEMU" semantics. cp==0x13 is guest
+     * visible (to match KVM's encoding); cp==0 will be converted to
+     * cp==0x13 when the ARMCPRegInfo is registered, for convenience.
+     */
+    uint8_t cp;
+    uint8_t crn;
+    uint8_t crm;
+    uint8_t opc0;
+    uint8_t opc1;
+    uint8_t opc2;
+    /* Execution state in which this register is visible: ARM_CP_STATE_* */
+    int state;
+    /* Register type: ARM_CP_* bits/values */
+    int type;
+    /* Access rights: PL*_[RW] */
+    int access;
+    /* Security state: ARM_CP_SECSTATE_* bits/values */
+    int secure;
+    /*
+     * The opaque pointer passed to define_arm_cp_regs_with_opaque() when
+     * this register was defined: can be used to hand data through to the
+     * register read/write functions, since they are passed the ARMCPRegInfo*.
+     */
+    void *opaque;
+    /*
+     * Value of this register, if it is ARM_CP_CONST. Otherwise, if
+     * fieldoffset is non-zero, the reset value of the register.
+     */
+    uint64_t resetvalue;
+    /*
+     * Offset of the field in CPUARMState for this register.
+     * This is not needed if either:
+     *  1. type is ARM_CP_CONST or one of the ARM_CP_SPECIALs
+     *  2. both readfn and writefn are specified
+     */
+    ptrdiff_t fieldoffset; /* offsetof(CPUARMState, field) */
+
+    /*
+     * Offsets of the secure and non-secure fields in CPUARMState for the
+     * register if it is banked.  These fields are only used during the static
+     * registration of a register.  During hashing the bank associated
+     * with a given security state is copied to fieldoffset which is used from
+     * there on out.
+     *
+     * It is expected that register definitions use either fieldoffset or
+     * bank_fieldoffsets in the definition but not both.  It is also expected
+     * that both bank offsets are set when defining a banked register.  This
+     * use indicates that a register is banked.
+     */
+    ptrdiff_t bank_fieldoffsets[2];
+
+    /*
+     * Function for making any access checks for this register in addition to
+     * those specified by the 'access' permissions bits. If NULL, no extra
+     * checks required. The access check is performed at runtime, not at
+     * translate time.
+     */
+    CPAccessFn *accessfn;
+    /*
+     * Function for handling reads of this register. If NULL, then reads
+     * will be done by loading from the offset into CPUARMState specified
+     * by fieldoffset.
+     */
+    CPReadFn *readfn;
+    /*
+     * Function for handling writes of this register. If NULL, then writes
+     * will be done by writing to the offset into CPUARMState specified
+     * by fieldoffset.
+     */
+    CPWriteFn *writefn;
+    /*
+     * Function for doing a "raw" read; used when we need to copy
+     * coprocessor state to the kernel for KVM or out for
+     * migration. This only needs to be provided if there is also a
+     * readfn and it has side effects (for instance clear-on-read bits).
+     */
+    CPReadFn *raw_readfn;
+    /*
+     * Function for doing a "raw" write; used when we need to copy KVM
+     * kernel coprocessor state into userspace, or for inbound
+     * migration. This only needs to be provided if there is also a
+     * writefn and it masks out "unwritable" bits or has write-one-to-clear
+     * or similar behaviour.
+     */
+    CPWriteFn *raw_writefn;
+    /*
+     * Function for resetting the register. If NULL, then reset will be done
+     * by writing resetvalue to the field specified in fieldoffset. If
+     * fieldoffset is 0 then no reset will be done.
+     */
+    CPResetFn *resetfn;
+
+    /*
+     * "Original" writefn and readfn.
+     * For ARMv8.1-VHE register aliases, we overwrite the read/write
+     * accessor functions of various EL1/EL0 to perform the runtime
+     * check for which sysreg should actually be modified, and then
+     * forwards the operation.  Before overwriting the accessors,
+     * the original function is copied here, so that accesses that
+     * really do go to the EL1/EL0 version proceed normally.
+     * (The corresponding EL2 register is linked via opaque.)
+     */
+    CPReadFn *orig_readfn;
+    CPWriteFn *orig_writefn;
+};
+
+/*
+ * Macros which are lvalues for the field in CPUARMState for the
+ * ARMCPRegInfo *ri.
+ */
+#define CPREG_FIELD32(env, ri) \
+    (*(uint32_t *)((char *)(env) + (ri)->fieldoffset))
+#define CPREG_FIELD64(env, ri) \
+    (*(uint64_t *)((char *)(env) + (ri)->fieldoffset))
+
+#define REGINFO_SENTINEL { .type = ARM_CP_SENTINEL }
+
+void define_arm_cp_regs_with_opaque(ARMCPU *cpu,
+                                    const ARMCPRegInfo *regs, void *opaque);
+void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
+                                       const ARMCPRegInfo *regs, void *opaque);
+static inline void define_arm_cp_regs(ARMCPU *cpu, const ARMCPRegInfo *regs)
+{
+    define_arm_cp_regs_with_opaque(cpu, regs, 0);
+}
+static inline void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *regs)
+{
+    define_one_arm_cp_reg_with_opaque(cpu, regs, 0);
+}
+const ARMCPRegInfo *get_arm_cp_reginfo(GHashTable *cpregs, uint32_t encoded_cp);
+
+/*
+ * Definition of an ARM co-processor register as viewed from
+ * userspace. This is used for presenting sanitised versions of
+ * registers to userspace when emulating the Linux AArch64 CPU
+ * ID/feature ABI (advertised as HWCAP_CPUID).
+ */
+typedef struct ARMCPRegUserSpaceInfo {
+    /* Name of register */
+    const char *name;
+
+    /* Is the name actually a glob pattern */
+    bool is_glob;
+
+    /* Only some bits are exported to user space */
+    uint64_t exported_bits;
+
+    /* Fixed bits are applied after the mask */
+    uint64_t fixed_bits;
+} ARMCPRegUserSpaceInfo;
+
+#define REGUSERINFO_SENTINEL { .name = NULL }
+
+void modify_arm_cp_regs(ARMCPRegInfo *regs, const ARMCPRegUserSpaceInfo *mods);
+
+/* CPWriteFn that can be used to implement writes-ignored behaviour */
+void arm_cp_write_ignore(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value);
+/* CPReadFn that can be used for read-as-zero behaviour */
+uint64_t arm_cp_read_zero(CPUARMState *env, const ARMCPRegInfo *ri);
+
+/*
+ * CPResetFn that does nothing, for use if no reset is required even
+ * if fieldoffset is non zero.
+ */
+void arm_cp_reset_ignore(CPUARMState *env, const ARMCPRegInfo *opaque);
+
+/*
+ * Return true if this reginfo struct's field in the cpu state struct
+ * is 64 bits wide.
+ */
+static inline bool cpreg_field_is_64bit(const ARMCPRegInfo *ri)
+{
+    return (ri->state == ARM_CP_STATE_AA64) || (ri->type & ARM_CP_64BIT);
+}
+
+static inline bool cp_access_ok(int current_el,
+                                const ARMCPRegInfo *ri, int isread)
+{
+    return (ri->access >> ((current_el * 2) + isread)) & 1;
+}
+
+/* Raw read of a coprocessor register (as needed for migration, etc) */
+uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri);
+
+#endif /* TARGET_ARM_CPREGS_H */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e7f669d0a9..76c0dd37cd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2594,144 +2594,6 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
     return kvmid;
 }
 
-/* ARMCPRegInfo type field bits. If the SPECIAL bit is set this is a
- * special-behaviour cp reg and bits [11..8] indicate what behaviour
- * it has. Otherwise it is a simple cp reg, where CONST indicates that
- * TCG can assume the value to be constant (ie load at translate time)
- * and 64BIT indicates a 64 bit wide coprocessor register. SUPPRESS_TB_END
- * indicates that the TB should not be ended after a write to this register
- * (the default is that the TB ends after cp writes). OVERRIDE permits
- * a register definition to override a previous definition for the
- * same (cp, is64, crn, crm, opc1, opc2) tuple: either the new or the
- * old must have the OVERRIDE bit set.
- * ALIAS indicates that this register is an alias view of some underlying
- * state which is also visible via another register, and that the other
- * register is handling migration and reset; registers marked ALIAS will not be
- * migrated but may have their state set by syncing of register state from KVM.
- * NO_RAW indicates that this register has no underlying state and does not
- * support raw access for state saving/loading; it will not be used for either
- * migration or KVM state synchronization. (Typically this is for "registers"
- * which are actually used as instructions for cache maintenance and so on.)
- * IO indicates that this register does I/O and therefore its accesses
- * need to be marked with gen_io_start() and also end the TB. In particular,
- * registers which implement clocks or timers require this.
- * RAISES_EXC is for when the read or write hook might raise an exception;
- * the generated code will synchronize the CPU state before calling the hook
- * so that it is safe for the hook to call raise_exception().
- * NEWEL is for writes to registers that might change the exception
- * level - typically on older ARM chips. For those cases we need to
- * re-read the new el when recomputing the translation flags.
- */
-#define ARM_CP_SPECIAL           0x0001
-#define ARM_CP_CONST             0x0002
-#define ARM_CP_64BIT             0x0004
-#define ARM_CP_SUPPRESS_TB_END   0x0008
-#define ARM_CP_OVERRIDE          0x0010
-#define ARM_CP_ALIAS             0x0020
-#define ARM_CP_IO                0x0040
-#define ARM_CP_NO_RAW            0x0080
-#define ARM_CP_NOP               (ARM_CP_SPECIAL | 0x0100)
-#define ARM_CP_WFI               (ARM_CP_SPECIAL | 0x0200)
-#define ARM_CP_NZCV              (ARM_CP_SPECIAL | 0x0300)
-#define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
-#define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
-#define ARM_CP_DC_GVA            (ARM_CP_SPECIAL | 0x0600)
-#define ARM_CP_DC_GZVA           (ARM_CP_SPECIAL | 0x0700)
-#define ARM_LAST_SPECIAL         ARM_CP_DC_GZVA
-#define ARM_CP_FPU               0x1000
-#define ARM_CP_SVE               0x2000
-#define ARM_CP_NO_GDB            0x4000
-#define ARM_CP_RAISES_EXC        0x8000
-#define ARM_CP_NEWEL             0x10000
-/* Used only as a terminator for ARMCPRegInfo lists */
-#define ARM_CP_SENTINEL          0xfffff
-/* Mask of only the flag bits in a type field */
-#define ARM_CP_FLAG_MASK         0x1f0ff
-
-/* Valid values for ARMCPRegInfo state field, indicating which of
- * the AArch32 and AArch64 execution states this register is visible in.
- * If the reginfo doesn't explicitly specify then it is AArch32 only.
- * If the reginfo is declared to be visible in both states then a second
- * reginfo is synthesised for the AArch32 view of the AArch64 register,
- * such that the AArch32 view is the lower 32 bits of the AArch64 one.
- * Note that we rely on the values of these enums as we iterate through
- * the various states in some places.
- */
-enum {
-    ARM_CP_STATE_AA32 = 0,
-    ARM_CP_STATE_AA64 = 1,
-    ARM_CP_STATE_BOTH = 2,
-};
-
-/* ARM CP register secure state flags.  These flags identify security state
- * attributes for a given CP register entry.
- * The existence of both or neither secure and non-secure flags indicates that
- * the register has both a secure and non-secure hash entry.  A single one of
- * these flags causes the register to only be hashed for the specified
- * security state.
- * Although definitions may have any combination of the S/NS bits, each
- * registered entry will only have one to identify whether the entry is secure
- * or non-secure.
- */
-enum {
-    ARM_CP_SECSTATE_S =   (1 << 0), /* bit[0]: Secure state register */
-    ARM_CP_SECSTATE_NS =  (1 << 1), /* bit[1]: Non-secure state register */
-};
-
-/* Return true if cptype is a valid type field. This is used to try to
- * catch errors where the sentinel has been accidentally left off the end
- * of a list of registers.
- */
-static inline bool cptype_valid(int cptype)
-{
-    return ((cptype & ~ARM_CP_FLAG_MASK) == 0)
-        || ((cptype & ARM_CP_SPECIAL) &&
-            ((cptype & ~ARM_CP_FLAG_MASK) <= ARM_LAST_SPECIAL));
-}
-
-/* Access rights:
- * We define bits for Read and Write access for what rev C of the v7-AR ARM ARM
- * defines as PL0 (user), PL1 (fiq/irq/svc/abt/und/sys, ie privileged), and
- * PL2 (hyp). The other level which has Read and Write bits is Secure PL1
- * (ie any of the privileged modes in Secure state, or Monitor mode).
- * If a register is accessible in one privilege level it's always accessible
- * in higher privilege levels too. Since "Secure PL1" also follows this rule
- * (ie anything visible in PL2 is visible in S-PL1, some things are only
- * visible in S-PL1) but "Secure PL1" is a bit of a mouthful, we bend the
- * terminology a little and call this PL3.
- * In AArch64 things are somewhat simpler as the PLx bits line up exactly
- * with the ELx exception levels.
- *
- * If access permissions for a register are more complex than can be
- * described with these bits, then use a laxer set of restrictions, and
- * do the more restrictive/complex check inside a helper function.
- */
-#define PL3_R 0x80
-#define PL3_W 0x40
-#define PL2_R (0x20 | PL3_R)
-#define PL2_W (0x10 | PL3_W)
-#define PL1_R (0x08 | PL2_R)
-#define PL1_W (0x04 | PL2_W)
-#define PL0_R (0x02 | PL1_R)
-#define PL0_W (0x01 | PL1_W)
-
-/*
- * For user-mode some registers are accessible to EL0 via a kernel
- * trap-and-emulate ABI. In this case we define the read permissions
- * as actually being PL0_R. However some bits of any given register
- * may still be masked.
- */
-#ifdef CONFIG_USER_ONLY
-#define PL0U_R PL0_R
-#else
-#define PL0U_R PL1_R
-#endif
-
-#define PL3_RW (PL3_R | PL3_W)
-#define PL2_RW (PL2_R | PL2_W)
-#define PL1_RW (PL1_R | PL1_W)
-#define PL0_RW (PL0_R | PL0_W)
-
 /* Return the highest implemented Exception Level */
 static inline int arm_highest_el(CPUARMState *env)
 {
@@ -2783,236 +2645,6 @@ static inline int arm_current_el(CPUARMState *env)
     }
 }
 
-typedef struct ARMCPRegInfo ARMCPRegInfo;
-
-typedef enum CPAccessResult {
-    /* Access is permitted */
-    CP_ACCESS_OK = 0,
-    /* Access fails due to a configurable trap or enable which would
-     * result in a categorized exception syndrome giving information about
-     * the failing instruction (ie syndrome category 0x3, 0x4, 0x5, 0x6,
-     * 0xc or 0x18). The exception is taken to the usual target EL (EL1 or
-     * PL1 if in EL0, otherwise to the current EL).
-     */
-    CP_ACCESS_TRAP = 1,
-    /* Access fails and results in an exception syndrome 0x0 ("uncategorized").
-     * Note that this is not a catch-all case -- the set of cases which may
-     * result in this failure is specifically defined by the architecture.
-     */
-    CP_ACCESS_TRAP_UNCATEGORIZED = 2,
-    /* As CP_ACCESS_TRAP, but for traps directly to EL2 or EL3 */
-    CP_ACCESS_TRAP_EL2 = 3,
-    CP_ACCESS_TRAP_EL3 = 4,
-    /* As CP_ACCESS_UNCATEGORIZED, but for traps directly to EL2 or EL3 */
-    CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = 5,
-    CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = 6,
-} CPAccessResult;
-
-/* Access functions for coprocessor registers. These cannot fail and
- * may not raise exceptions.
- */
-typedef uint64_t CPReadFn(CPUARMState *env, const ARMCPRegInfo *opaque);
-typedef void CPWriteFn(CPUARMState *env, const ARMCPRegInfo *opaque,
-                       uint64_t value);
-/* Access permission check functions for coprocessor registers. */
-typedef CPAccessResult CPAccessFn(CPUARMState *env,
-                                  const ARMCPRegInfo *opaque,
-                                  bool isread);
-/* Hook function for register reset */
-typedef void CPResetFn(CPUARMState *env, const ARMCPRegInfo *opaque);
-
-#define CP_ANY 0xff
-
-/* Definition of an ARM coprocessor register */
-struct ARMCPRegInfo {
-    /* Name of register (useful mainly for debugging, need not be unique) */
-    const char *name;
-    /* Location of register: coprocessor number and (crn,crm,opc1,opc2)
-     * tuple. Any of crm, opc1 and opc2 may be CP_ANY to indicate a
-     * 'wildcard' field -- any value of that field in the MRC/MCR insn
-     * will be decoded to this register. The register read and write
-     * callbacks will be passed an ARMCPRegInfo with the crn/crm/opc1/opc2
-     * used by the program, so it is possible to register a wildcard and
-     * then behave differently on read/write if necessary.
-     * For 64 bit registers, only crm and opc1 are relevant; crn and opc2
-     * must both be zero.
-     * For AArch64-visible registers, opc0 is also used.
-     * Since there are no "coprocessors" in AArch64, cp is purely used as a
-     * way to distinguish (for KVM's benefit) guest-visible system registers
-     * from demuxed ones provided to preserve the "no side effects on
-     * KVM register read/write from QEMU" semantics. cp==0x13 is guest
-     * visible (to match KVM's encoding); cp==0 will be converted to
-     * cp==0x13 when the ARMCPRegInfo is registered, for convenience.
-     */
-    uint8_t cp;
-    uint8_t crn;
-    uint8_t crm;
-    uint8_t opc0;
-    uint8_t opc1;
-    uint8_t opc2;
-    /* Execution state in which this register is visible: ARM_CP_STATE_* */
-    int state;
-    /* Register type: ARM_CP_* bits/values */
-    int type;
-    /* Access rights: PL*_[RW] */
-    int access;
-    /* Security state: ARM_CP_SECSTATE_* bits/values */
-    int secure;
-    /* The opaque pointer passed to define_arm_cp_regs_with_opaque() when
-     * this register was defined: can be used to hand data through to the
-     * register read/write functions, since they are passed the ARMCPRegInfo*.
-     */
-    void *opaque;
-    /* Value of this register, if it is ARM_CP_CONST. Otherwise, if
-     * fieldoffset is non-zero, the reset value of the register.
-     */
-    uint64_t resetvalue;
-    /* Offset of the field in CPUARMState for this register.
-     *
-     * This is not needed if either:
-     *  1. type is ARM_CP_CONST or one of the ARM_CP_SPECIALs
-     *  2. both readfn and writefn are specified
-     */
-    ptrdiff_t fieldoffset; /* offsetof(CPUARMState, field) */
-
-    /* Offsets of the secure and non-secure fields in CPUARMState for the
-     * register if it is banked.  These fields are only used during the static
-     * registration of a register.  During hashing the bank associated
-     * with a given security state is copied to fieldoffset which is used from
-     * there on out.
-     *
-     * It is expected that register definitions use either fieldoffset or
-     * bank_fieldoffsets in the definition but not both.  It is also expected
-     * that both bank offsets are set when defining a banked register.  This
-     * use indicates that a register is banked.
-     */
-    ptrdiff_t bank_fieldoffsets[2];
-
-    /* Function for making any access checks for this register in addition to
-     * those specified by the 'access' permissions bits. If NULL, no extra
-     * checks required. The access check is performed at runtime, not at
-     * translate time.
-     */
-    CPAccessFn *accessfn;
-    /* Function for handling reads of this register. If NULL, then reads
-     * will be done by loading from the offset into CPUARMState specified
-     * by fieldoffset.
-     */
-    CPReadFn *readfn;
-    /* Function for handling writes of this register. If NULL, then writes
-     * will be done by writing to the offset into CPUARMState specified
-     * by fieldoffset.
-     */
-    CPWriteFn *writefn;
-    /* Function for doing a "raw" read; used when we need to copy
-     * coprocessor state to the kernel for KVM or out for
-     * migration. This only needs to be provided if there is also a
-     * readfn and it has side effects (for instance clear-on-read bits).
-     */
-    CPReadFn *raw_readfn;
-    /* Function for doing a "raw" write; used when we need to copy KVM
-     * kernel coprocessor state into userspace, or for inbound
-     * migration. This only needs to be provided if there is also a
-     * writefn and it masks out "unwritable" bits or has write-one-to-clear
-     * or similar behaviour.
-     */
-    CPWriteFn *raw_writefn;
-    /* Function for resetting the register. If NULL, then reset will be done
-     * by writing resetvalue to the field specified in fieldoffset. If
-     * fieldoffset is 0 then no reset will be done.
-     */
-    CPResetFn *resetfn;
-
-    /*
-     * "Original" writefn and readfn.
-     * For ARMv8.1-VHE register aliases, we overwrite the read/write
-     * accessor functions of various EL1/EL0 to perform the runtime
-     * check for which sysreg should actually be modified, and then
-     * forwards the operation.  Before overwriting the accessors,
-     * the original function is copied here, so that accesses that
-     * really do go to the EL1/EL0 version proceed normally.
-     * (The corresponding EL2 register is linked via opaque.)
-     */
-    CPReadFn *orig_readfn;
-    CPWriteFn *orig_writefn;
-};
-
-/* Macros which are lvalues for the field in CPUARMState for the
- * ARMCPRegInfo *ri.
- */
-#define CPREG_FIELD32(env, ri) \
-    (*(uint32_t *)((char *)(env) + (ri)->fieldoffset))
-#define CPREG_FIELD64(env, ri) \
-    (*(uint64_t *)((char *)(env) + (ri)->fieldoffset))
-
-#define REGINFO_SENTINEL { .type = ARM_CP_SENTINEL }
-
-void define_arm_cp_regs_with_opaque(ARMCPU *cpu,
-                                    const ARMCPRegInfo *regs, void *opaque);
-void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
-                                       const ARMCPRegInfo *regs, void *opaque);
-static inline void define_arm_cp_regs(ARMCPU *cpu, const ARMCPRegInfo *regs)
-{
-    define_arm_cp_regs_with_opaque(cpu, regs, 0);
-}
-static inline void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *regs)
-{
-    define_one_arm_cp_reg_with_opaque(cpu, regs, 0);
-}
-const ARMCPRegInfo *get_arm_cp_reginfo(GHashTable *cpregs, uint32_t encoded_cp);
-
-/*
- * Definition of an ARM co-processor register as viewed from
- * userspace. This is used for presenting sanitised versions of
- * registers to userspace when emulating the Linux AArch64 CPU
- * ID/feature ABI (advertised as HWCAP_CPUID).
- */
-typedef struct ARMCPRegUserSpaceInfo {
-    /* Name of register */
-    const char *name;
-
-    /* Is the name actually a glob pattern */
-    bool is_glob;
-
-    /* Only some bits are exported to user space */
-    uint64_t exported_bits;
-
-    /* Fixed bits are applied after the mask */
-    uint64_t fixed_bits;
-} ARMCPRegUserSpaceInfo;
-
-#define REGUSERINFO_SENTINEL { .name = NULL }
-
-void modify_arm_cp_regs(ARMCPRegInfo *regs, const ARMCPRegUserSpaceInfo *mods);
-
-/* CPWriteFn that can be used to implement writes-ignored behaviour */
-void arm_cp_write_ignore(CPUARMState *env, const ARMCPRegInfo *ri,
-                         uint64_t value);
-/* CPReadFn that can be used for read-as-zero behaviour */
-uint64_t arm_cp_read_zero(CPUARMState *env, const ARMCPRegInfo *ri);
-
-/* CPResetFn that does nothing, for use if no reset is required even
- * if fieldoffset is non zero.
- */
-void arm_cp_reset_ignore(CPUARMState *env, const ARMCPRegInfo *opaque);
-
-/* Return true if this reginfo struct's field in the cpu state struct
- * is 64 bits wide.
- */
-static inline bool cpreg_field_is_64bit(const ARMCPRegInfo *ri)
-{
-    return (ri->state == ARM_CP_STATE_AA64) || (ri->type & ARM_CP_64BIT);
-}
-
-static inline bool cp_access_ok(int current_el,
-                                const ARMCPRegInfo *ri, int isread)
-{
-    return (ri->access >> ((current_el * 2) + isread)) & 1;
-}
-
-/* Raw read of a coprocessor register (as needed for migration, etc) */
-uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri);
-
 /**
  * write_list_to_cpustate
  * @cpu: ARMCPU
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index a6f938f115..0683714733 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -30,6 +30,7 @@
 #include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qom/object.h"
+#include "target/arm/cpregs.h"
 
 static struct {
     hwaddr io_base;
diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index ed032fed54..b80d75d839 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -17,6 +17,7 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
+#include "target/arm/cpregs.h"
 
 #define ICIP	0x00	/* Interrupt Controller IRQ Pending register */
 #define ICMR	0x04	/* Interrupt Controller Mask register */
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 1a3d440a54..d43ba970f9 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -20,6 +20,7 @@
 #include "gicv3_internal.h"
 #include "hw/irq.h"
 #include "cpu.h"
+#include "target/arm/cpregs.h"
 
 static GICv3CPUState *icc_cs_from_env(CPUARMState *env)
 {
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 5ec5ff9ef6..ed2a583b0c 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -31,6 +31,8 @@
 #include "vgic_common.h"
 #include "migration/blocker.h"
 #include "qom/object.h"
+#include "target/arm/cpregs.h"
+
 
 #ifdef DEBUG_GICV3_KVM
 #define DPRINTF(fmt, ...) \
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 561f180067..066fe6250a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -43,6 +43,7 @@
 #include "kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
+#include "cpregs.h"
 
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index eb44c05822..9561714c23 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -34,6 +34,7 @@
 #include "hvf_arm.h"
 #include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
+#include "cpregs.h"
 
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 13d0e9b195..0e693b182e 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -18,6 +18,7 @@
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/boards.h"
 #endif
+#include "cpregs.h"
 
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index ca1de47511..f01a126108 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -19,8 +19,9 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internals.h"
 #include "exec/gdbstub.h"
+#include "internals.h"
+#include "cpregs.h"
 
 typedef struct RegisterSysregXmlParam {
     CPUState *cs;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 60d9233b7e..8928ffb6a7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -37,6 +37,7 @@
 #include "exec/cpu_ldst.h"
 #include "semihosting/common-semi.h"
 #endif
+#include "cpregs.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 #define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 2b87e8808b..67be91c732 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -23,6 +23,7 @@
 #include "internals.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
+#include "cpregs.h"
 
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3867910ed4..92b91f0307 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -27,14 +27,12 @@
 #include "translate.h"
 #include "internals.h"
 #include "qemu/host-utils.h"
-
 #include "semihosting/semihost.h"
 #include "exec/gen-icount.h"
-
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/log.h"
-
+#include "cpregs.h"
 #include "translate-a64.h"
 #include "qemu/atomic128.h"
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5cb4b3da33..1fe48e4e1c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -30,11 +30,10 @@
 #include "qemu/bitops.h"
 #include "arm_ldst.h"
 #include "semihosting/semihost.h"
-
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
-
 #include "exec/log.h"
+#include "cpregs.h"
 
 
 #define ENABLE_ARCH_4T    arm_dc_feature(s, ARM_FEATURE_V4T)
-- 
2.25.1


