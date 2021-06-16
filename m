Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BA63AA5BD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:56:24 +0200 (CEST)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcaF-0000h7-Vz
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOq-0002Fe-Em
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOn-0000xh-3r
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZLS+m7xAvvk2uRB++FAfryJbzXnCIDe39YBz1qMJyo=;
 b=gPA5mrl9Zmcxny2cvnuIHzkcN9D6Ps61IHukGMf+TVYQkbfPW9us/4uGyLFnJh2vM6soeD
 NgbZ9z74a0aQxLuiGVj0M78HKmxPNRJ8iTNh5AKYuZ9Jym+cqwCojs3ThCqcnP2uP+qgRr
 ODY8eLLO4EJoObB7C2huWIJ3r6ywzIk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-UM5eMkHPOy2-Lyol2akw4Q-1; Wed, 16 Jun 2021 16:44:31 -0400
X-MC-Unique: UM5eMkHPOy2-Lyol2akw4Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso1856507wrh.12
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AZLS+m7xAvvk2uRB++FAfryJbzXnCIDe39YBz1qMJyo=;
 b=q70q7Zwc7SvktpYGYk2iKkNtu3P4sLbOlP6GHGosiygYTiHDpltgcozUoEo7wPt81O
 LTuvVRb+mKjReevMftR5aZLwm+IpvP1Ty8NT3SsKEC21hJXzTzcPqRwo921a1JO+wEhh
 +f/4eXaoVpGOJ070TQhfwQt4hYRqrq2sV5jXtRbswBUFQae/za/V6kaY/nD/bptoI5ml
 1UjPmB699jevBgm8PGNjWoG/vmCXfnnAEErGMmJuar0hh8fYPSmlwJLxn8NVrWhwnPy4
 Un1UN2UMZBlBe1/WES1aTkfiERrMG3+ZUJ2u00l4VUKAm/6aaBjEVP5F/yFcuBBIE9zN
 5BbQ==
X-Gm-Message-State: AOAM533vunVqNjC7OeC/WTDsLIQTku6shXhmVO+CCbAUWNSpOa5DkQ5b
 4K1C3+qtjrdU2hWqNb6GDbNcKav2Iqv7ASCZEpUJbjjcajghnYlh5oB51g2o7tU3jzWpnKlW1YE
 9qiXCaSy+g3kz24g3GQL7+42yfTf3bZVf2iw5Wxk9Z+vJW1Qsllz9gRoPIKwPs+VZ
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr1122350wrn.127.1623876270434; 
 Wed, 16 Jun 2021 13:44:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv1QtrHVuIiKQIVbYKn8PlR0K7pmHNt/rPvhHLLZNkTjXErbA7lySXCe0JCJniz1FHFkjHAg==
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr1122314wrn.127.1623876270220; 
 Wed, 16 Jun 2021 13:44:30 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f12sm3804968wru.81.2021.06.16.13.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:44:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/23] target/i386/sev: Restrict SEV to system emulation
Date: Wed, 16 Jun 2021 22:43:15 +0200
Message-Id: <20210616204328.2611406-11-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
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


