Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B467B41FC1D
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:12:18 +0200 (CEST)
Received: from localhost ([::1]:39938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWeoL-0003Ta-RA
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeX0-0001ow-TB
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWq-0000oH-1r
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZLS+m7xAvvk2uRB++FAfryJbzXnCIDe39YBz1qMJyo=;
 b=cAJsT9hPxKeAPOiS3lTpLkXmCWqN/L7g21neJdhTZYR3flL8ZYkm7Ao01JTNuM0pU6506T
 DSgw6vsSOGzMXhH+NXUd5jRFjYwpKU+EGZIRvrtKeRwl6jbhGf7TCY+zDev5KWPTzgzZTk
 zNTmPTfjSgj2aIJziMEdTDWyWzV3maw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-Bf7x9KI8PFSy-dEkmrji5Q-1; Sat, 02 Oct 2021 08:54:10 -0400
X-MC-Unique: Bf7x9KI8PFSy-dEkmrji5Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so6075745wmc.2
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AZLS+m7xAvvk2uRB++FAfryJbzXnCIDe39YBz1qMJyo=;
 b=1Tqjd4aFol6gAtPaaq+VNpHP4LitK65zU4XiQZCsI/qT143yhqN1GROjFfxBaepNln
 O9nCERR33OyVrn/BAKgFrve/oSeen50geo5Z/M+0p8dRBl7998nncS3hYa2HUeqZvbO8
 CtzQ6AOyLiKkQDbqPcpUmY3e95Xn77DMxZ1MaoLUFxb0meTD4aR3KeGj3Pc6qsxk8ZuS
 wa3ejM31eG07IjGRTbm/fYQ44ahH8mzPj1znZ9VqvUrHXRmgF/tx/FHDPDdVp7ljwDs5
 1mgph9uqCelcsxGDCqOcTWIOiMbmNHoGEAnV7RjaXgsEgQ3yV6gm2O9btZPwJowKRBk4
 lW4Q==
X-Gm-Message-State: AOAM533ErQ/qe99fBIxjcRG1c0aEEXjs7IkCO/9CXZo+mSQZrq72Q/Bw
 y0egiRm/MVYqQpD/OvWIByOAA463cr/wuSokO+xAdTNfGGwAeguKt2nTcbp5nuj59kCwTtSLOuJ
 nf7TZ1bsU0fXaOoxk8sOxjddMNxj8m6k+GOpatrTbphwkrn5BUJUj5BDJKaYeR7CA
X-Received: by 2002:adf:b185:: with SMTP id q5mr1100026wra.213.1633179249029; 
 Sat, 02 Oct 2021 05:54:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhvlat8mS6Fsi/9Q+MqqxK+CL6/DlRnFXF7c3AjMW/EsZmLOxs5oU2baglAlxjjo/FnbXepw==
X-Received: by 2002:adf:b185:: with SMTP id q5mr1100005wra.213.1633179248822; 
 Sat, 02 Oct 2021 05:54:08 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 z8sm9814721wrm.63.2021.10.02.05.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:54:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/22] target/i386/sev: Restrict SEV to system emulation
Date: Sat,  2 Oct 2021 14:53:06 +0200
Message-Id: <20211002125317.3418648-12-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SEV is irrelevant on user emulation, so restrict it to sysemu.
Some stubs are still required because used in cpu.c by
x86_register_cpudef_types(), so move the sysemu specific stubs
to sev-sysemu-stub.c instead. This will allow us to simplify
monitor.c (which is not available in user emulation) in the
next commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev-stub.c        | 43 -------------------------
 target/i386/sev-sysemu-stub.c | 60 +++++++++++++++++++++++++++++++++++
 target/i386/meson.build       |  4 ++-
 3 files changed, 63 insertions(+), 44 deletions(-)
 create mode 100644 target/i386/sev-sysemu-stub.c

diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 4668365fd3e..8eae5d2fa8d 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -15,11 +15,6 @@
 #include "qapi/error.h"
 #include "sev_i386.h"
 
-SevInfo *sev_get_info(void)
-{
-    return NULL;
-}
-
 bool sev_enabled(void)
 {
     return false;
@@ -35,45 +30,7 @@ uint32_t sev_get_reduced_phys_bits(void)
     return 0;
 }
 
-char *sev_get_launch_measurement(void)
-{
-    return NULL;
-}
-
-SevCapability *sev_get_capabilities(Error **errp)
-{
-    error_setg(errp, "SEV is not available in this QEMU");
-    return NULL;
-}
-
-int sev_inject_launch_secret(const char *hdr, const char *secret,
-                             uint64_t gpa, Error **errp)
-{
-    return 1;
-}
-
-int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
-{
-    g_assert_not_reached();
-}
-
 bool sev_es_enabled(void)
 {
     return false;
 }
-
-void sev_es_set_reset_vector(CPUState *cpu)
-{
-}
-
-int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
-{
-    g_assert_not_reached();
-}
-
-SevAttestationReport *
-sev_get_attestation_report(const char *mnonce, Error **errp)
-{
-    error_setg(errp, "SEV is not available in this QEMU");
-    return NULL;
-}
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
new file mode 100644
index 00000000000..d556b4f091f
--- /dev/null
+++ b/target/i386/sev-sysemu-stub.c
@@ -0,0 +1,60 @@
+/*
+ * QEMU SEV system stub
+ *
+ * Copyright Advanced Micro Devices 2018
+ *
+ * Authors:
+ *      Brijesh Singh <brijesh.singh@amd.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-commands-misc-target.h"
+#include "qapi/error.h"
+#include "sev_i386.h"
+
+SevInfo *sev_get_info(void)
+{
+    return NULL;
+}
+
+char *sev_get_launch_measurement(void)
+{
+    return NULL;
+}
+
+SevCapability *sev_get_capabilities(Error **errp)
+{
+    error_setg(errp, "SEV is not available in this QEMU");
+    return NULL;
+}
+
+int sev_inject_launch_secret(const char *hdr, const char *secret,
+                             uint64_t gpa, Error **errp)
+{
+    return 1;
+}
+
+int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
+{
+    g_assert_not_reached();
+}
+
+void sev_es_set_reset_vector(CPUState *cpu)
+{
+}
+
+int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
+{
+    g_assert_not_reached();
+}
+
+SevAttestationReport *sev_get_attestation_report(const char *mnonce,
+                                                 Error **errp)
+{
+    error_setg(errp, "SEV is not available in this QEMU");
+    return NULL;
+}
diff --git a/target/i386/meson.build b/target/i386/meson.build
index dac19ec00d4..a4f45c3ec1d 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -6,7 +6,7 @@
   'xsave_helper.c',
   'cpu-dump.c',
 ))
-i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c', 'sev.c'), if_false: files('sev-stub.c'))
+i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'), if_false: files('sev-stub.c'))
 
 # x86 cpu type
 i386_ss.add(when: 'CONFIG_KVM', if_true: files('host-cpu.c'))
@@ -20,6 +20,8 @@
   'monitor.c',
   'cpu-sysemu.c',
 ))
+i386_softmmu_ss.add(when: 'CONFIG_SEV', if_true: files('sev.c'), if_false: files('sev-sysemu-stub.c'))
+
 i386_user_ss = ss.source_set()
 
 subdir('kvm')
-- 
2.31.1


