Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A2B69B39B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 21:15:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT77Y-0002Np-Sw; Fri, 17 Feb 2023 15:14:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pT77X-0002NK-Jx; Fri, 17 Feb 2023 15:14:15 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pT77V-0000kB-M7; Fri, 17 Feb 2023 15:14:15 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4C85C20FB6;
 Fri, 17 Feb 2023 20:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676664852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pRXEAJI1jnhHZqXBSNTBSrxJuIrP6vE92++nhV6fyUM=;
 b=zKh04i4JBpV0p3WK7XHbabsIbeTAJsdMP61o2qVxGU1pGM5lLZJzQ39DK0HtuuCdnpsf3i
 xiOqJVZaeOCMD9yKA3NhTCW9el9oHu6pOidcTHZKHZwtciYdUqXr8/soQW63hXfhyG6FHK
 t6yPcvdKCR4OUBdpbBhODslKCzQKW4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676664852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pRXEAJI1jnhHZqXBSNTBSrxJuIrP6vE92++nhV6fyUM=;
 b=0iAn4e8ICv7QGOfeMmt4UjKECGAHQgvrYsWw5Z+t9GG1F5n/nvRPVREF4mw91UaHPvhj7J
 oGabnBhtRHAptQDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62F73138E3;
 Fri, 17 Feb 2023 20:14:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WDUNCxHg72MwIAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:14:09 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v6 05/29] target/arm: Move cpregs code out of cpu.h
Date: Fri, 17 Feb 2023 17:11:26 -0300
Message-Id: <20230217201150.22032-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Since commit cf7c6d1004 ("target/arm: Split out cpregs.h") we now have
a cpregs.h header which is more suitable for this code.

Code moved verbatim.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpregs.h | 98 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h    | 91 -----------------------------------------
 2 files changed, 98 insertions(+), 91 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index efcf9181b9..1ee64e99de 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -120,6 +120,104 @@ enum {
     ARM_CP_SME                   = 1 << 19,
 };
 
+/*
+ * Interface for defining coprocessor registers.
+ * Registers are defined in tables of arm_cp_reginfo structs
+ * which are passed to define_arm_cp_regs().
+ */
+
+/*
+ * When looking up a coprocessor register we look for it
+ * via an integer which encodes all of:
+ *  coprocessor number
+ *  Crn, Crm, opc1, opc2 fields
+ *  32 or 64 bit register (ie is it accessed via MRC/MCR
+ *    or via MRRC/MCRR?)
+ *  non-secure/secure bank (AArch32 only)
+ * We allow 4 bits for opc1 because MRRC/MCRR have a 4 bit field.
+ * (In this case crn and opc2 should be zero.)
+ * For AArch64, there is no 32/64 bit size distinction;
+ * instead all registers have a 2 bit op0, 3 bit op1 and op2,
+ * and 4 bit CRn and CRm. The encoding patterns are chosen
+ * to be easy to convert to and from the KVM encodings, and also
+ * so that the hashtable can contain both AArch32 and AArch64
+ * registers (to allow for interprocessing where we might run
+ * 32 bit code on a 64 bit core).
+ */
+/*
+ * This bit is private to our hashtable cpreg; in KVM register
+ * IDs the AArch64/32 distinction is the KVM_REG_ARM/ARM64
+ * in the upper bits of the 64 bit ID.
+ */
+#define CP_REG_AA64_SHIFT 28
+#define CP_REG_AA64_MASK (1 << CP_REG_AA64_SHIFT)
+
+/*
+ * To enable banking of coprocessor registers depending on ns-bit we
+ * add a bit to distinguish between secure and non-secure cpregs in the
+ * hashtable.
+ */
+#define CP_REG_NS_SHIFT 29
+#define CP_REG_NS_MASK (1 << CP_REG_NS_SHIFT)
+
+#define ENCODE_CP_REG(cp, is64, ns, crn, crm, opc1, opc2)   \
+    ((ns) << CP_REG_NS_SHIFT | ((cp) << 16) | ((is64) << 15) |   \
+     ((crn) << 11) | ((crm) << 7) | ((opc1) << 3) | (opc2))
+
+#define ENCODE_AA64_CP_REG(cp, crn, crm, op0, op1, op2) \
+    (CP_REG_AA64_MASK |                                 \
+     ((cp) << CP_REG_ARM_COPROC_SHIFT) |                \
+     ((op0) << CP_REG_ARM64_SYSREG_OP0_SHIFT) |         \
+     ((op1) << CP_REG_ARM64_SYSREG_OP1_SHIFT) |         \
+     ((crn) << CP_REG_ARM64_SYSREG_CRN_SHIFT) |         \
+     ((crm) << CP_REG_ARM64_SYSREG_CRM_SHIFT) |         \
+     ((op2) << CP_REG_ARM64_SYSREG_OP2_SHIFT))
+
+/*
+ * Convert a full 64 bit KVM register ID to the truncated 32 bit
+ * version used as a key for the coprocessor register hashtable
+ */
+static inline uint32_t kvm_to_cpreg_id(uint64_t kvmid)
+{
+    uint32_t cpregid = kvmid;
+    if ((kvmid & CP_REG_ARCH_MASK) == CP_REG_ARM64) {
+        cpregid |= CP_REG_AA64_MASK;
+    } else {
+        if ((kvmid & CP_REG_SIZE_MASK) == CP_REG_SIZE_U64) {
+            cpregid |= (1 << 15);
+        }
+
+        /*
+         * KVM is always non-secure so add the NS flag on AArch32 register
+         * entries.
+         */
+         cpregid |= 1 << CP_REG_NS_SHIFT;
+    }
+    return cpregid;
+}
+
+/*
+ * Convert a truncated 32 bit hashtable key into the full
+ * 64 bit KVM register ID.
+ */
+static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
+{
+    uint64_t kvmid;
+
+    if (cpregid & CP_REG_AA64_MASK) {
+        kvmid = cpregid & ~CP_REG_AA64_MASK;
+        kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM64;
+    } else {
+        kvmid = cpregid & ~(1 << 15);
+        if (cpregid & (1 << 15)) {
+            kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM;
+        } else {
+            kvmid |= CP_REG_SIZE_U32 | CP_REG_ARM;
+        }
+    }
+    return kvmid;
+}
+
 /*
  * Valid values for ARMCPRegInfo state field, indicating which of
  * the AArch32 and AArch64 execution states this register is visible in.
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7bc97fece9..9d4573c53c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2680,97 +2680,6 @@ static inline bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
 }
 #endif
 
-/* Interface for defining coprocessor registers.
- * Registers are defined in tables of arm_cp_reginfo structs
- * which are passed to define_arm_cp_regs().
- */
-
-/* When looking up a coprocessor register we look for it
- * via an integer which encodes all of:
- *  coprocessor number
- *  Crn, Crm, opc1, opc2 fields
- *  32 or 64 bit register (ie is it accessed via MRC/MCR
- *    or via MRRC/MCRR?)
- *  non-secure/secure bank (AArch32 only)
- * We allow 4 bits for opc1 because MRRC/MCRR have a 4 bit field.
- * (In this case crn and opc2 should be zero.)
- * For AArch64, there is no 32/64 bit size distinction;
- * instead all registers have a 2 bit op0, 3 bit op1 and op2,
- * and 4 bit CRn and CRm. The encoding patterns are chosen
- * to be easy to convert to and from the KVM encodings, and also
- * so that the hashtable can contain both AArch32 and AArch64
- * registers (to allow for interprocessing where we might run
- * 32 bit code on a 64 bit core).
- */
-/* This bit is private to our hashtable cpreg; in KVM register
- * IDs the AArch64/32 distinction is the KVM_REG_ARM/ARM64
- * in the upper bits of the 64 bit ID.
- */
-#define CP_REG_AA64_SHIFT 28
-#define CP_REG_AA64_MASK (1 << CP_REG_AA64_SHIFT)
-
-/* To enable banking of coprocessor registers depending on ns-bit we
- * add a bit to distinguish between secure and non-secure cpregs in the
- * hashtable.
- */
-#define CP_REG_NS_SHIFT 29
-#define CP_REG_NS_MASK (1 << CP_REG_NS_SHIFT)
-
-#define ENCODE_CP_REG(cp, is64, ns, crn, crm, opc1, opc2)   \
-    ((ns) << CP_REG_NS_SHIFT | ((cp) << 16) | ((is64) << 15) |   \
-     ((crn) << 11) | ((crm) << 7) | ((opc1) << 3) | (opc2))
-
-#define ENCODE_AA64_CP_REG(cp, crn, crm, op0, op1, op2) \
-    (CP_REG_AA64_MASK |                                 \
-     ((cp) << CP_REG_ARM_COPROC_SHIFT) |                \
-     ((op0) << CP_REG_ARM64_SYSREG_OP0_SHIFT) |         \
-     ((op1) << CP_REG_ARM64_SYSREG_OP1_SHIFT) |         \
-     ((crn) << CP_REG_ARM64_SYSREG_CRN_SHIFT) |         \
-     ((crm) << CP_REG_ARM64_SYSREG_CRM_SHIFT) |         \
-     ((op2) << CP_REG_ARM64_SYSREG_OP2_SHIFT))
-
-/* Convert a full 64 bit KVM register ID to the truncated 32 bit
- * version used as a key for the coprocessor register hashtable
- */
-static inline uint32_t kvm_to_cpreg_id(uint64_t kvmid)
-{
-    uint32_t cpregid = kvmid;
-    if ((kvmid & CP_REG_ARCH_MASK) == CP_REG_ARM64) {
-        cpregid |= CP_REG_AA64_MASK;
-    } else {
-        if ((kvmid & CP_REG_SIZE_MASK) == CP_REG_SIZE_U64) {
-            cpregid |= (1 << 15);
-        }
-
-        /* KVM is always non-secure so add the NS flag on AArch32 register
-         * entries.
-         */
-         cpregid |= 1 << CP_REG_NS_SHIFT;
-    }
-    return cpregid;
-}
-
-/* Convert a truncated 32 bit hashtable key into the full
- * 64 bit KVM register ID.
- */
-static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
-{
-    uint64_t kvmid;
-
-    if (cpregid & CP_REG_AA64_MASK) {
-        kvmid = cpregid & ~CP_REG_AA64_MASK;
-        kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM64;
-    } else {
-        kvmid = cpregid & ~(1 << 15);
-        if (cpregid & (1 << 15)) {
-            kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM;
-        } else {
-            kvmid |= CP_REG_SIZE_U32 | CP_REG_ARM;
-        }
-    }
-    return kvmid;
-}
-
 /* Return the highest implemented Exception Level */
 static inline int arm_highest_el(CPUARMState *env)
 {
-- 
2.35.3


