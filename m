Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E080E3626C5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 19:29:51 +0200 (CEST)
Received: from localhost ([::1]:49954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSHu-000169-VN
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 13:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lXRLT-0004tT-7f
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:29:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:46470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lXRLK-0001bC-Rv
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:29:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76810B312;
 Fri, 16 Apr 2021 16:28:55 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v14 64/80] target/arm: restrict rebuild_hflags_a64 to
 TARGET_AARCH64
Date: Fri, 16 Apr 2021 18:28:08 +0200
Message-Id: <20210416162824.25131-65-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210416162824.25131-1-cfontana@suse.de>
References: <20210416162824.25131-1-cfontana@suse.de>
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

this work is in preparation of making sve_zcr_len_for_el AARCH64-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/helper-a64.h |  2 ++
 target/arm/helper.h     |  1 -
 target/arm/tcg/helper.c | 12 ++++++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index c139fa81f9..342f55d577 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -119,3 +119,5 @@ DEF_HELPER_FLAGS_2(st2g_stub, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_2(ldgm, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_3(stgm, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_3(stzgm_tags, TCG_CALL_NO_WG, void, env, i64, i64)
+
+DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index ff8148ddc6..37dd9797a1 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -94,7 +94,6 @@ DEF_HELPER_FLAGS_1(rebuild_hflags_m32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_m32, TCG_CALL_NO_RWG, void, env, int)
 DEF_HELPER_FLAGS_1(rebuild_hflags_a32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
-DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
 
 DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, tl, i32, i32, i32)
 
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 8a0d59cbad..eb0fd394da 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -988,6 +988,8 @@ static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
+#ifdef TARGET_AARCH64
+
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
@@ -1108,6 +1110,14 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
+#else
+
+QEMU_ERROR("this should have been optimized away!")
+uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
+                            ARMMMUIdx mmu_idx);
+
+#endif /* TARGET_AARCH64 */
+
 static uint32_t rebuild_hflags_internal(CPUARMState *env)
 {
     int el = arm_current_el(env);
@@ -1168,6 +1178,7 @@ void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
     env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
 }
 
+#ifdef TARGET_AARCH64
 void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
 {
     int fp_el = fp_exception_el(env, el);
@@ -1175,6 +1186,7 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
 
     env->hflags = rebuild_hflags_a64(env, el, fp_el, mmu_idx);
 }
+#endif /* TARGET_AARCH64 */
 
 static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
 {
-- 
2.26.2


