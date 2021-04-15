Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF2A360F3E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:46:11 +0200 (CEST)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX4C2-0007YM-6J
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lX4AA-0006eT-KO
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:44:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lX4A8-0000qq-Ne
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:44:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618501452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lUJkZHfNvVwMCQnMzBTOjujBdET0k2QrPQHLoX2cUOA=;
 b=aA8fn5OvgDdQx4Ynbvs7isCfse2yqhZTXFYJNr/tl2F5Z3KfZrG00LOtvbWZeWkk4/Tt6K
 mRvaV9wQON2Nby/wLfSqNpawARuOGmUrH/BbTMBTGlEA26/ddgvTTidsJnxoMrO1VY0LQb
 74bFBnAtiQQ3GPnFSLN8ZMZezMGEifE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-zqaMfz8_M6q0LLOJLbjb6A-1; Thu, 15 Apr 2021 11:44:10 -0400
X-MC-Unique: zqaMfz8_M6q0LLOJLbjb6A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7373B1006C80;
 Thu, 15 Apr 2021 15:44:09 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5873E2AC84;
 Thu, 15 Apr 2021 15:44:03 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v3] i386: Make 'hv-reenlightenment' require explicit
 'tsc-frequency' setting
Date: Thu, 15 Apr 2021 17:44:02 +0200
Message-Id: <20210415154402.28376-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Edmondson <dme@dme.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 561dbb41b1d7 "i386: Make migration fail when Hyper-V reenlightenment
was enabled but 'user_tsc_khz' is unset" forbade migrations with when guest
has opted for reenlightenment notifications but 'tsc-frequency' wasn't set
explicitly on the command line. This works but the migration fails late and
this may come as an unpleasant surprise. To make things more explicit,
add a migration blocker when 'hv-reenlightenment' was enabled but
'tsc-frequency' is unset. Make the change affect 6.0+ machine types only to
preserve previously-valid configurations.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
Changes since v2:
- Use migrate_add_blocker() [Eduardo]

Note: In case this patch gets queued for 6.1 an adjustment is needed:

   { TYPE_X86_CPU, "x-hv-reenlightenment-requires-tscfreq", "off"}

needs to go to not-yet-existing 'pc_compat_6_0'.
---
 docs/hyperv.txt   |  1 +
 hw/i386/pc.c      |  1 +
 target/i386/cpu.c | 34 ++++++++++++++++++++++++++++++++--
 target/i386/cpu.h |  1 +
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index e53c581f4586..d20b5c58c847 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -165,6 +165,7 @@ emulate TSC accesses after migration so 'tsc-frequency=' CPU option also has to
 be specified to make migration succeed. The destination host has to either have
 the same TSC frequency or support TSC scaling CPU feature.
 
+Requires: tsc-frequency (for migration)
 Recommended: hv-frequencies
 
 3.16. hv-evmcs
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8a84b25a031e..47b79e949ad7 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -98,6 +98,7 @@
 
 GlobalProperty pc_compat_5_2[] = {
     { "ICH9-LPC", "x-smi-cpu-hotunplug", "off" },
+    { TYPE_X86_CPU, "x-hv-reenlightenment-requires-tscfreq", "off"},
 };
 const size_t pc_compat_5_2_len = G_N_ELEMENTS(pc_compat_5_2);
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b3e9467f177..f74239acd12b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -56,6 +56,7 @@
 #include "sysemu/tcg.h"
 #include "hw/qdev-properties.h"
 #include "hw/i386/topology.h"
+#include "migration/blocker.h"
 #ifndef CONFIG_USER_ONLY
 #include "exec/address-spaces.h"
 #include "hw/i386/apic_internal.h"
@@ -6647,10 +6648,33 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
     }
 }
 
-static void x86_cpu_hyperv_realize(X86CPU *cpu)
+static Error *hv_reenlightenment_mig_blocker;
+
+static void x86_cpu_hyperv_realize(X86CPU *cpu, Error **errp)
 {
+    CPUX86State *env = &cpu->env;
+    Error *local_err = NULL;
     size_t len;
 
+    /*
+     * Reenlightenment requires explicit 'tsc-frequency' setting for successful
+     * migration (see hyperv_reenlightenment_post_load()). As 'hv-passthrough'
+     * mode is not migratable, we can loosen the restriction.
+     */
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_REENLIGHTENMENT) &&
+        !cpu->hyperv_passthrough && !env->user_tsc_khz &&
+        cpu->hyperv_reenlightenment_requires_tscfreq) {
+
+        error_setg(&hv_reenlightenment_mig_blocker,
+                   "'hv-reenlightenment' requires 'tsc-frequency' to be set");
+
+        migrate_add_blocker(hv_reenlightenment_mig_blocker, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+
     /* Hyper-V vendor id */
     if (!cpu->hyperv_vendor) {
         memcpy(cpu->hyperv_vendor_id, "Microsoft Hv", 12);
@@ -6846,7 +6870,11 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     /* Process Hyper-V enlightenments */
-    x86_cpu_hyperv_realize(cpu);
+    x86_cpu_hyperv_realize(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
@@ -7374,6 +7402,8 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_INT32("x-hv-max-vps", X86CPU, hv_max_vps, -1),
     DEFINE_PROP_BOOL("x-hv-synic-kvm-only", X86CPU, hyperv_synic_kvm_only,
                      false),
+    DEFINE_PROP_BOOL("x-hv-reenlightenment-requires-tscfreq", X86CPU,
+                     hyperv_reenlightenment_requires_tscfreq, true),
     DEFINE_PROP_BOOL("x-intel-pt-auto-level", X86CPU, intel_pt_auto_level,
                      true),
     DEFINE_PROP_END_OF_LIST()
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 570f916878f9..0196a300f018 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1677,6 +1677,7 @@ struct X86CPU {
     uint32_t hyperv_spinlock_attempts;
     char *hyperv_vendor;
     bool hyperv_synic_kvm_only;
+    bool hyperv_reenlightenment_requires_tscfreq;
     uint64_t hyperv_features;
     bool hyperv_passthrough;
     OnOffAuto hyperv_no_nonarch_cs;
-- 
2.30.2


