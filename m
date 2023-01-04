Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC0765DF95
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:06:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBpS-0005wA-LP; Wed, 04 Jan 2023 17:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pDBpM-0005n6-1q; Wed, 04 Jan 2023 17:01:40 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pDBpJ-00036D-H3; Wed, 04 Jan 2023 17:01:39 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AF1E83F16C;
 Wed,  4 Jan 2023 22:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672869695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GzK3pGTJKyDEl1gwCMgtKGNz2Apa9joJLmfLERsjCxM=;
 b=u4msEGIENeoOtaP6xy9KunHvDHvdojuIYwnxQK4DmUa0f/e83U5YWViKn21f48RmH4WoGO
 KVqQXDlmzyuC6PCNFLk2pAxsFlTMUWYRmxAW0Ad7kEgD4RDSoEFtt3WKhhG3WyAeZmzkZj
 CuBAHzalInMeOCS/h1QrC8iSSwY9tEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672869695;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GzK3pGTJKyDEl1gwCMgtKGNz2Apa9joJLmfLERsjCxM=;
 b=D5noml8cVFzROn6/nAfrTm92t6yaaoYwb5KsuxlZjaZ+Hm7vtq3F+XjJ7bIUVm6liFiXgn
 A3aEkpm4ADW21yBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1E6F1342C;
 Wed,  4 Jan 2023 22:01:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oG/WLTz3tWPwJAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:32 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH 17/27] target/arm: Extract cpustate list manipulation to a
 file
Date: Wed,  4 Jan 2023 18:58:25 -0300
Message-Id: <20230104215835.24692-18-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
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

This code doesn't need to be buried in helper.c. Let's move it to its
own file to keep things cleaner.

Code moved verbatim.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Extracted from:
https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de
[RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
---
 target/arm/cpregs.h        |   5 ++
 target/arm/cpustate-list.c | 148 +++++++++++++++++++++++++++++++++++++
 target/arm/helper.c        | 136 ----------------------------------
 target/arm/meson.build     |   1 +
 4 files changed, 154 insertions(+), 136 deletions(-)
 create mode 100644 target/arm/cpustate-list.c

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 7e78c2c05c..1c35574102 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -442,6 +442,11 @@ void arm_cp_write_ignore(CPUARMState *env, const ARMCPRegInfo *ri,
 /* CPReadFn that can be used for read-as-zero behaviour */
 uint64_t arm_cp_read_zero(CPUARMState *env, const ARMCPRegInfo *ri);
 
+/*
+ * default raw read/write of coprocessor register field,
+ * behavior if no other function defined, and not const.
+ */
+uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri);
 /* CPWriteFn that just writes the value to ri->fieldoffset */
 void raw_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value);
 
diff --git a/target/arm/cpustate-list.c b/target/arm/cpustate-list.c
new file mode 100644
index 0000000000..9411b25b6f
--- /dev/null
+++ b/target/arm/cpustate-list.c
@@ -0,0 +1,148 @@
+/*
+ * ARM CPUState list read/write
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "cpregs.h"
+
+uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    assert(ri->fieldoffset);
+    if (cpreg_field_is_64bit(ri)) {
+        return CPREG_FIELD64(env, ri);
+    } else {
+        return CPREG_FIELD32(env, ri);
+    }
+}
+
+void raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
+               uint64_t value)
+{
+    assert(ri->fieldoffset);
+    if (cpreg_field_is_64bit(ri)) {
+        CPREG_FIELD64(env, ri) = value;
+    } else {
+        CPREG_FIELD32(env, ri) = value;
+    }
+}
+
+const ARMCPRegInfo *get_arm_cp_reginfo(GHashTable *cpregs, uint32_t encoded_cp)
+{
+    return g_hash_table_lookup(cpregs, (gpointer)(uintptr_t)encoded_cp);
+}
+
+uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* Raw read of a coprocessor register (as needed for migration, etc). */
+    if (ri->type & ARM_CP_CONST) {
+        return ri->resetvalue;
+    } else if (ri->raw_readfn) {
+        return ri->raw_readfn(env, ri);
+    } else if (ri->readfn) {
+        return ri->readfn(env, ri);
+    } else {
+        return raw_read(env, ri);
+    }
+}
+
+static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t v)
+{
+    /*
+     * Raw write of a coprocessor register (as needed for migration, etc).
+     * Note that constant registers are treated as write-ignored; the
+     * caller should check for success by whether a readback gives the
+     * value written.
+     */
+    if (ri->type & ARM_CP_CONST) {
+        return;
+    } else if (ri->raw_writefn) {
+        ri->raw_writefn(env, ri, v);
+    } else if (ri->writefn) {
+        ri->writefn(env, ri, v);
+    } else {
+        raw_write(env, ri, v);
+    }
+}
+
+bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
+{
+    /* Write the coprocessor state from cpu->env to the (index,value) list. */
+    int i;
+    bool ok = true;
+
+    for (i = 0; i < cpu->cpreg_array_len; i++) {
+        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
+        const ARMCPRegInfo *ri;
+        uint64_t newval;
+
+        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
+        if (!ri) {
+            ok = false;
+            continue;
+        }
+        if (ri->type & ARM_CP_NO_RAW) {
+            continue;
+        }
+
+        newval = read_raw_cp_reg(&cpu->env, ri);
+        if (kvm_sync) {
+            /*
+             * Only sync if the previous list->cpustate sync succeeded.
+             * Rather than tracking the success/failure state for every
+             * item in the list, we just recheck "does the raw write we must
+             * have made in write_list_to_cpustate() read back OK" here.
+             */
+            uint64_t oldval = cpu->cpreg_values[i];
+
+            if (oldval == newval) {
+                continue;
+            }
+
+            write_raw_cp_reg(&cpu->env, ri, oldval);
+            if (read_raw_cp_reg(&cpu->env, ri) != oldval) {
+                continue;
+            }
+
+            write_raw_cp_reg(&cpu->env, ri, newval);
+        }
+        cpu->cpreg_values[i] = newval;
+    }
+    return ok;
+}
+
+bool write_list_to_cpustate(ARMCPU *cpu)
+{
+    int i;
+    bool ok = true;
+
+    for (i = 0; i < cpu->cpreg_array_len; i++) {
+        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
+        uint64_t v = cpu->cpreg_values[i];
+        const ARMCPRegInfo *ri;
+
+        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
+        if (!ri) {
+            ok = false;
+            continue;
+        }
+        if (ri->type & ARM_CP_NO_RAW) {
+            continue;
+        }
+        /*
+         * Write value and confirm it reads back as written
+         * (to catch read-only registers and partially read-only
+         * registers where the incoming migration value doesn't match)
+         */
+        write_raw_cp_reg(&cpu->env, ri, v);
+        if (read_raw_cp_reg(&cpu->env, ri) != v) {
+            ok = false;
+        }
+    }
+    return ok;
+}
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 506c057675..8361c57d4c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -35,65 +35,11 @@
 
 static void switch_mode(CPUARMState *env, int mode);
 
-static uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    assert(ri->fieldoffset);
-    if (cpreg_field_is_64bit(ri)) {
-        return CPREG_FIELD64(env, ri);
-    } else {
-        return CPREG_FIELD32(env, ri);
-    }
-}
-
-void raw_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
-{
-    assert(ri->fieldoffset);
-    if (cpreg_field_is_64bit(ri)) {
-        CPREG_FIELD64(env, ri) = value;
-    } else {
-        CPREG_FIELD32(env, ri) = value;
-    }
-}
-
 static void *raw_ptr(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     return (char *)env + ri->fieldoffset;
 }
 
-uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    /* Raw read of a coprocessor register (as needed for migration, etc). */
-    if (ri->type & ARM_CP_CONST) {
-        return ri->resetvalue;
-    } else if (ri->raw_readfn) {
-        return ri->raw_readfn(env, ri);
-    } else if (ri->readfn) {
-        return ri->readfn(env, ri);
-    } else {
-        return raw_read(env, ri);
-    }
-}
-
-static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
-                             uint64_t v)
-{
-    /*
-     * Raw write of a coprocessor register (as needed for migration, etc).
-     * Note that constant registers are treated as write-ignored; the
-     * caller should check for success by whether a readback gives the
-     * value written.
-     */
-    if (ri->type & ARM_CP_CONST) {
-        return;
-    } else if (ri->raw_writefn) {
-        ri->raw_writefn(env, ri, v);
-    } else if (ri->writefn) {
-        ri->writefn(env, ri, v);
-    } else {
-        raw_write(env, ri, v);
-    }
-}
-
 static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
 {
    /*
@@ -116,83 +62,6 @@ static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
     return true;
 }
 
-bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
-{
-    /* Write the coprocessor state from cpu->env to the (index,value) list. */
-    int i;
-    bool ok = true;
-
-    for (i = 0; i < cpu->cpreg_array_len; i++) {
-        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
-        const ARMCPRegInfo *ri;
-        uint64_t newval;
-
-        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
-        if (!ri) {
-            ok = false;
-            continue;
-        }
-        if (ri->type & ARM_CP_NO_RAW) {
-            continue;
-        }
-
-        newval = read_raw_cp_reg(&cpu->env, ri);
-        if (kvm_sync) {
-            /*
-             * Only sync if the previous list->cpustate sync succeeded.
-             * Rather than tracking the success/failure state for every
-             * item in the list, we just recheck "does the raw write we must
-             * have made in write_list_to_cpustate() read back OK" here.
-             */
-            uint64_t oldval = cpu->cpreg_values[i];
-
-            if (oldval == newval) {
-                continue;
-            }
-
-            write_raw_cp_reg(&cpu->env, ri, oldval);
-            if (read_raw_cp_reg(&cpu->env, ri) != oldval) {
-                continue;
-            }
-
-            write_raw_cp_reg(&cpu->env, ri, newval);
-        }
-        cpu->cpreg_values[i] = newval;
-    }
-    return ok;
-}
-
-bool write_list_to_cpustate(ARMCPU *cpu)
-{
-    int i;
-    bool ok = true;
-
-    for (i = 0; i < cpu->cpreg_array_len; i++) {
-        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
-        uint64_t v = cpu->cpreg_values[i];
-        const ARMCPRegInfo *ri;
-
-        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
-        if (!ri) {
-            ok = false;
-            continue;
-        }
-        if (ri->type & ARM_CP_NO_RAW) {
-            continue;
-        }
-        /*
-         * Write value and confirm it reads back as written
-         * (to catch read-only registers and partially read-only
-         * registers where the incoming migration value doesn't match)
-         */
-        write_raw_cp_reg(&cpu->env, ri, v);
-        if (read_raw_cp_reg(&cpu->env, ri) != v) {
-            ok = false;
-        }
-    }
-    return ok;
-}
-
 static void add_cpreg_to_list(gpointer key, gpointer opaque)
 {
     ARMCPU *cpu = opaque;
@@ -9048,11 +8917,6 @@ void modify_arm_cp_regs_with_len(ARMCPRegInfo *regs, size_t regs_len,
     }
 }
 
-const ARMCPRegInfo *get_arm_cp_reginfo(GHashTable *cpregs, uint32_t encoded_cp)
-{
-    return g_hash_table_lookup(cpregs, (gpointer)(uintptr_t)encoded_cp);
-}
-
 void arm_cp_write_ignore(CPUARMState *env, const ARMCPRegInfo *ri,
                          uint64_t value)
 {
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 68a87dff0a..a42970fab8 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,6 +1,7 @@
 arm_ss = ss.source_set()
 arm_ss.add(files(
   'cpu.c',
+  'cpustate-list.c',
   'gdbstub.c',
   'helper.c',
   'vfp_helper.c',
-- 
2.35.3


