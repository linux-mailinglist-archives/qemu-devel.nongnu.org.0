Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306C46DF4EF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 14:20:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZRG-0002Hu-95; Wed, 12 Apr 2023 08:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pmZR4-0001jP-Ha; Wed, 12 Apr 2023 08:18:50 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pmZR2-0001Cr-05; Wed, 12 Apr 2023 08:18:49 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 579BD2195D;
 Wed, 12 Apr 2023 12:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681301926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwILoklTtJTkoVOKb6pFl3hhYYvbvDadcuYthJgrHoQ=;
 b=zo+l2swvGQEPH2FRiwVcphIrzYzIZcc3VmLkvJnVfBQY3imphF+DR3ni3SU/lEqjHyFmk2
 1wQnbJDbMH6/0grqdEZDJ7DVr4TVBx+zC9cSDq/o9NQ9XLIpYAgWpLhmtXS1Y93ZKX5dF5
 ggXKeIX+xIleJxJy59UNchApfPQygRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681301926;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwILoklTtJTkoVOKb6pFl3hhYYvbvDadcuYthJgrHoQ=;
 b=kjV6bRIjot6UChRRkokLWA40GS7A2XAMpRr/n5wbr0/tFANFFDk8PZMyT/aeVeA1DICQGh
 kPV+u0J3852oJZBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4629F132C7;
 Wed, 12 Apr 2023 12:18:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AI59A6OhNmSMUgAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 12:18:43 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v10 03/11] target/arm: Extract TCG -cpu max code into a
 function
Date: Wed, 12 Apr 2023 09:18:21 -0300
Message-Id: <20230412121829.14452-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230412121829.14452-1-farosas@suse.de>
References: <20230412121829.14452-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

Introduce aarch64_max_tcg_initfn that contains the TCG-only part of
-cpu max configuration. We'll need that to be able to restrict this
code to a TCG-only config in the next patches.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu64.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0dd041cfb..4537aec141 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1178,27 +1178,17 @@ static void aarch64_host_initfn(Object *obj)
 #endif
 }
 
-/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
- * otherwise, a CPU with as many features enabled as our emulation supports.
- * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
+/*
+ * -cpu max: a CPU with as many features enabled as our emulation supports.
+ * The version of '-cpu max' for qemu-system-arm is defined in cpu_tcg.c;
  * this only needs to handle 64 bits.
  */
-static void aarch64_max_initfn(Object *obj)
+static void aarch64_max_tcg_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint64_t t;
     uint32_t u;
 
-    if (kvm_enabled() || hvf_enabled()) {
-        /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
-        aarch64_host_initfn(obj);
-        return;
-    }
-
-    /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
-
-    aarch64_a57_initfn(obj);
-
     /*
      * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
      * one and try to apply errata workarounds or use impdef features we
@@ -1367,6 +1357,20 @@ static void aarch64_max_initfn(Object *obj)
     qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
 }
 
+static void aarch64_max_initfn(Object *obj)
+{
+    if (kvm_enabled() || hvf_enabled()) {
+        /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
+        aarch64_host_initfn(obj);
+        return;
+    }
+
+    /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
+
+    aarch64_a57_initfn(obj);
+    aarch64_max_tcg_initfn(obj);
+}
+
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
-- 
2.35.3


