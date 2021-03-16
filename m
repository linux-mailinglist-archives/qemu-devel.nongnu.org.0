Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AF633DD05
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:02:31 +0100 (CET)
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMExa-0001TV-88
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMEZ7-0001PJ-MX
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:37:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:35324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMEYz-0007cz-QF
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:37:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 68042AE89;
 Tue, 16 Mar 2021 18:37:04 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v8 01/44] target/arm: move translate modules to tcg/
Date: Tue, 16 Mar 2021 19:36:19 +0100
Message-Id: <20210316183702.10216-2-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316183702.10216-1-cfontana@suse.de>
References: <20210316183702.10216-1-cfontana@suse.de>
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

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/{ => tcg}/translate-a64.h      |  0
 target/arm/{ => tcg}/translate.h          |  0
 target/arm/{ => tcg}/a32-uncond.decode    |  0
 target/arm/{ => tcg}/a32.decode           |  0
 target/arm/{ => tcg}/m-nocp.decode        |  0
 target/arm/{ => tcg}/neon-dp.decode       |  0
 target/arm/{ => tcg}/neon-ls.decode       |  0
 target/arm/{ => tcg}/neon-shared.decode   |  0
 target/arm/{ => tcg}/sve.decode           |  0
 target/arm/{ => tcg}/t16.decode           |  0
 target/arm/{ => tcg}/t32.decode           |  0
 target/arm/{ => tcg}/vfp-uncond.decode    |  0
 target/arm/{ => tcg}/vfp.decode           |  0
 target/arm/{ => tcg}/translate-a64.c      |  0
 target/arm/{ => tcg}/translate-sve.c      |  0
 target/arm/{ => tcg}/translate.c          |  0
 target/arm/{ => tcg}/translate-neon.c.inc |  0
 target/arm/{ => tcg}/translate-vfp.c.inc  |  0
 target/arm/meson.build                    | 20 ++-----------------
 target/arm/tcg/meson.build                | 24 +++++++++++++++++++++++
 20 files changed, 26 insertions(+), 18 deletions(-)
 rename target/arm/{ => tcg}/translate-a64.h (100%)
 rename target/arm/{ => tcg}/translate.h (100%)
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{ => tcg}/m-nocp.decode (100%)
 rename target/arm/{ => tcg}/neon-dp.decode (100%)
 rename target/arm/{ => tcg}/neon-ls.decode (100%)
 rename target/arm/{ => tcg}/neon-shared.decode (100%)
 rename target/arm/{ => tcg}/sve.decode (100%)
 rename target/arm/{ => tcg}/t16.decode (100%)
 rename target/arm/{ => tcg}/t32.decode (100%)
 rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
 rename target/arm/{ => tcg}/vfp.decode (100%)
 rename target/arm/{ => tcg}/translate-a64.c (100%)
 rename target/arm/{ => tcg}/translate-sve.c (100%)
 rename target/arm/{ => tcg}/translate.c (100%)
 rename target/arm/{ => tcg}/translate-neon.c.inc (100%)
 rename target/arm/{ => tcg}/translate-vfp.c.inc (100%)
 create mode 100644 target/arm/tcg/meson.build

diff --git a/target/arm/translate-a64.h b/target/arm/tcg/translate-a64.h
similarity index 100%
rename from target/arm/translate-a64.h
rename to target/arm/tcg/translate-a64.h
diff --git a/target/arm/translate.h b/target/arm/tcg/translate.h
similarity index 100%
rename from target/arm/translate.h
rename to target/arm/tcg/translate.h
diff --git a/target/arm/a32-uncond.decode b/target/arm/tcg/a32-uncond.decode
similarity index 100%
rename from target/arm/a32-uncond.decode
rename to target/arm/tcg/a32-uncond.decode
diff --git a/target/arm/a32.decode b/target/arm/tcg/a32.decode
similarity index 100%
rename from target/arm/a32.decode
rename to target/arm/tcg/a32.decode
diff --git a/target/arm/m-nocp.decode b/target/arm/tcg/m-nocp.decode
similarity index 100%
rename from target/arm/m-nocp.decode
rename to target/arm/tcg/m-nocp.decode
diff --git a/target/arm/neon-dp.decode b/target/arm/tcg/neon-dp.decode
similarity index 100%
rename from target/arm/neon-dp.decode
rename to target/arm/tcg/neon-dp.decode
diff --git a/target/arm/neon-ls.decode b/target/arm/tcg/neon-ls.decode
similarity index 100%
rename from target/arm/neon-ls.decode
rename to target/arm/tcg/neon-ls.decode
diff --git a/target/arm/neon-shared.decode b/target/arm/tcg/neon-shared.decode
similarity index 100%
rename from target/arm/neon-shared.decode
rename to target/arm/tcg/neon-shared.decode
diff --git a/target/arm/sve.decode b/target/arm/tcg/sve.decode
similarity index 100%
rename from target/arm/sve.decode
rename to target/arm/tcg/sve.decode
diff --git a/target/arm/t16.decode b/target/arm/tcg/t16.decode
similarity index 100%
rename from target/arm/t16.decode
rename to target/arm/tcg/t16.decode
diff --git a/target/arm/t32.decode b/target/arm/tcg/t32.decode
similarity index 100%
rename from target/arm/t32.decode
rename to target/arm/tcg/t32.decode
diff --git a/target/arm/vfp-uncond.decode b/target/arm/tcg/vfp-uncond.decode
similarity index 100%
rename from target/arm/vfp-uncond.decode
rename to target/arm/tcg/vfp-uncond.decode
diff --git a/target/arm/vfp.decode b/target/arm/tcg/vfp.decode
similarity index 100%
rename from target/arm/vfp.decode
rename to target/arm/tcg/vfp.decode
diff --git a/target/arm/translate-a64.c b/target/arm/tcg/translate-a64.c
similarity index 100%
rename from target/arm/translate-a64.c
rename to target/arm/tcg/translate-a64.c
diff --git a/target/arm/translate-sve.c b/target/arm/tcg/translate-sve.c
similarity index 100%
rename from target/arm/translate-sve.c
rename to target/arm/tcg/translate-sve.c
diff --git a/target/arm/translate.c b/target/arm/tcg/translate.c
similarity index 100%
rename from target/arm/translate.c
rename to target/arm/tcg/translate.c
diff --git a/target/arm/translate-neon.c.inc b/target/arm/tcg/translate-neon.c.inc
similarity index 100%
rename from target/arm/translate-neon.c.inc
rename to target/arm/tcg/translate-neon.c.inc
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/tcg/translate-vfp.c.inc
similarity index 100%
rename from target/arm/translate-vfp.c.inc
rename to target/arm/tcg/translate-vfp.c.inc
diff --git a/target/arm/meson.build b/target/arm/meson.build
index a96af5ee1b..229ec7fa11 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,19 +1,4 @@
-gen = [
-  decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
-  decodetree.process('neon-shared.decode', extra_args: '--static-decode=disas_neon_shared'),
-  decodetree.process('neon-dp.decode', extra_args: '--static-decode=disas_neon_dp'),
-  decodetree.process('neon-ls.decode', extra_args: '--static-decode=disas_neon_ls'),
-  decodetree.process('vfp.decode', extra_args: '--static-decode=disas_vfp'),
-  decodetree.process('vfp-uncond.decode', extra_args: '--static-decode=disas_vfp_uncond'),
-  decodetree.process('m-nocp.decode', extra_args: '--static-decode=disas_m_nocp'),
-  decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
-  decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
-  decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
-  decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
-]
-
 arm_ss = ss.source_set()
-arm_ss.add(gen)
 arm_ss.add(files(
   'cpu.c',
   'crypto_helper.c',
@@ -25,7 +10,6 @@ arm_ss.add(files(
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
-  'translate.c',
   'vec_helper.c',
   'vfp_helper.c',
   'cpu_tcg.c',
@@ -41,8 +25,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'mte_helper.c',
   'pauth_helper.c',
   'sve_helper.c',
-  'translate-a64.c',
-  'translate-sve.c',
 ))
 
 arm_softmmu_ss = ss.source_set()
@@ -55,6 +37,8 @@ arm_softmmu_ss.add(files(
 ))
 arm_user_ss = ss.source_set()
 
+subdir('tcg')
+
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
 target_user_arch += {'arm': arm_user_ss}
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
new file mode 100644
index 0000000000..5a7c9b95d8
--- /dev/null
+++ b/target/arm/tcg/meson.build
@@ -0,0 +1,24 @@
+gen = [
+  decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
+  decodetree.process('neon-shared.decode', extra_args: '--static-decode=disas_neon_shared'),
+  decodetree.process('neon-dp.decode', extra_args: '--static-decode=disas_neon_dp'),
+  decodetree.process('neon-ls.decode', extra_args: '--static-decode=disas_neon_ls'),
+  decodetree.process('vfp.decode', extra_args: '--static-decode=disas_vfp'),
+  decodetree.process('vfp-uncond.decode', extra_args: '--static-decode=disas_vfp_uncond'),
+  decodetree.process('m-nocp.decode', extra_args: '--static-decode=disas_m_nocp'),
+  decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
+  decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
+  decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
+  decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
+]
+
+arm_ss.add(gen)
+
+arm_ss.add(files(
+  'translate.c',
+))
+
+arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'translate-a64.c',
+  'translate-sve.c',
+))
-- 
2.26.2


