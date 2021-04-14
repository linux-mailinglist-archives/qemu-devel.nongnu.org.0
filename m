Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D663F35F3F9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 14:39:18 +0200 (CEST)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWenU-0004GF-B1
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 08:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWdgz-00079f-JO
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:28:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:45924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWdgs-0005pD-Ij
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:28:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5521B167;
 Wed, 14 Apr 2021 11:27:21 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v13 62/80] target/arm: cpu-sve: make cpu_sve_finalize_features
 return bool
Date: Wed, 14 Apr 2021 13:26:32 +0200
Message-Id: <20210414112650.18003-63-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210414112650.18003-1-cfontana@suse.de>
References: <20210414112650.18003-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

return false on error, true on success.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu-sve.h |  2 +-
 target/arm/cpu-sve.c | 17 +++++++++--------
 target/arm/cpu.c     |  3 +--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
index ece36d2a0c..6ab74b1d8f 100644
--- a/target/arm/cpu-sve.h
+++ b/target/arm/cpu-sve.h
@@ -26,7 +26,7 @@
 #include "cpu.h"
 
 /* called by arm_cpu_finalize_features in realizefn */
-void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
+bool cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
 
 /* add the CPU SVE properties */
 void cpu_sve_add_props(Object *obj);
diff --git a/target/arm/cpu-sve.c b/target/arm/cpu-sve.c
index 5190e4a639..24bffbba8b 100644
--- a/target/arm/cpu-sve.c
+++ b/target/arm/cpu-sve.c
@@ -49,7 +49,7 @@ static bool apply_max_vq(unsigned long *sve_vq_map, unsigned long *sve_vq_init,
     return true;
 }
 
-void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
+bool cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
 {
     /*
      * If any vector lengths are explicitly enabled with sve<N> properties,
@@ -86,7 +86,7 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
                               "length, sve-max-vq=%d (%d bits)\n",
                               max_vq * 128, cpu->sve_max_vq,
                               cpu->sve_max_vq * 128);
-            return;
+            return false;
         }
         if (kvm_enabled()) {
             kvm_sve_enable_lens(cpu->sve_vq_map, cpu->sve_vq_init, max_vq,
@@ -98,7 +98,7 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
         /* No explicit bits enabled, and no implicit bits from sve-max-vq. */
         if (!cpu_isar_feature(aa64_sve, cpu)) {
             /* SVE is disabled and so are all vector lengths.  Good. */
-            return;
+            return true;
         }
         if (kvm_enabled()) {
             max_vq = kvm_sve_disable_lens(cpu->sve_vq_map, cpu->sve_vq_init,
@@ -108,7 +108,7 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
                                           errp);
         }
         if (!max_vq) {
-            return;
+            return false;
         }
         max_vq = find_last_bit(cpu->sve_vq_map, max_vq) + 1;
     }
@@ -122,7 +122,7 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
         max_vq = cpu->sve_max_vq;
         if (!apply_max_vq(cpu->sve_vq_map, cpu->sve_vq_init, max_vq,
                           errp)) {
-            return;
+            return false;
         }
     }
     /*
@@ -136,11 +136,11 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
     if (kvm_enabled()) {
         if (!kvm_sve_validate_lens(cpu->sve_vq_map, max_vq, kvm_supported,
                                    errp, cpu->sve_max_vq)) {
-            return;
+            return false;
         }
     } else if (tcg_enabled()) {
         if (!tcg_sve_validate_lens(cpu->sve_vq_map, max_vq, errp)) {
-            return;
+            return false;
         }
     }
 
@@ -153,11 +153,12 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
         error_append_hint(errp, "SVE must be enabled to enable vector "
                           "lengths.\n");
         error_append_hint(errp, "Add sve=on to the CPU property list.\n");
-        return;
+        return false;
     }
 
     /* From now on sve_max_vq is the actual maximum supported length. */
     cpu->sve_max_vq = max_vq;
+    return true;
 }
 
 static void get_prop_max_vq(Object *obj, Visitor *v, const char *name,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index be5d857e65..d192dd1ba4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -821,8 +821,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 
 #ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        cpu_sve_finalize_features(cpu, &local_err);
-        if (local_err != NULL) {
+        if (!cpu_sve_finalize_features(cpu, &local_err)) {
             error_propagate(errp, local_err);
             return;
         }
-- 
2.26.2


