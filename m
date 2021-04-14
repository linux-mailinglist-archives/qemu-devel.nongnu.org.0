Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7741435F3FD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 14:42:20 +0200 (CEST)
Received: from localhost ([::1]:40330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWeqZ-0006sw-Ia
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 08:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWdh4-0007CW-V1
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:28:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:45964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWdgu-0005qh-5k
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:28:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3F31B1C3;
 Wed, 14 Apr 2021 11:27:26 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v13 74/80] target/arm: cpu-pauth: change arm_cpu_pauth_finalize
 name and sig
Date: Wed, 14 Apr 2021 13:26:44 +0200
Message-Id: <20210414112650.18003-75-cfontana@suse.de>
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

make arm_cpu_pauth_finalize return a bool,
and make the name canonical for the module (cpu_pauth_finalize).

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/tcg/cpu-pauth.h | 2 +-
 target/arm/cpu.c           | 3 +--
 target/arm/tcg/cpu-pauth.c | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/cpu-pauth.h b/target/arm/tcg/cpu-pauth.h
index af127876fe..a0ef74dc77 100644
--- a/target/arm/tcg/cpu-pauth.h
+++ b/target/arm/tcg/cpu-pauth.h
@@ -26,7 +26,7 @@
 #include "cpu.h"
 
 /* called by arm_cpu_finalize_features in realizefn */
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+bool cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 
 /* add the CPU Pointer Authentication properties */
 void cpu_pauth_add_props(Object *obj);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 229ef989b4..b91c48cd2f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -837,8 +837,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
          * is in use, so the user will not be able to set them.
          */
         if (tcg_enabled()) {
-            arm_cpu_pauth_finalize(cpu, &local_err);
-            if (local_err != NULL) {
+            if (!cpu_pauth_finalize(cpu, &local_err)) {
                 error_propagate(errp, local_err);
                 return;
             }
diff --git a/target/arm/tcg/cpu-pauth.c b/target/arm/tcg/cpu-pauth.c
index 657c5dcbca..4f087923ac 100644
--- a/target/arm/tcg/cpu-pauth.c
+++ b/target/arm/tcg/cpu-pauth.c
@@ -25,7 +25,7 @@
 #include "tcg/cpu-pauth.h"
 #include "hw/qdev-properties.h"
 
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
+bool cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 {
     bool result = true;
     int arch_val = 0, impdef_val = 0;
-- 
2.26.2


