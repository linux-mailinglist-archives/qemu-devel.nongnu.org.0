Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FE83A24C9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:52:39 +0200 (CEST)
Received: from localhost ([::1]:42342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEYQ-0000WR-RU
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESm-0008H0-D7
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESj-0005XI-1y
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623307603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZLS+m7xAvvk2uRB++FAfryJbzXnCIDe39YBz1qMJyo=;
 b=Y3bGqemaViahPuo5jnF3WgoKTQJ3zINfudLISFSq9WgHm0hvFvt5IdR3WWefVhFiYw+PFR
 VrHIUkydxVAHuO4k4e5YnqKfRU/19ZZzrIBy+VfHqiZNOAU+g0UKWUMUP8prCaKFtgkKXM
 fhWoIeG9u5CIMRmPC3/q9wkGtAJ+zyY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-bDrHtwWsMli3P7SyxUK32A-1; Thu, 10 Jun 2021 02:46:39 -0400
X-MC-Unique: bDrHtwWsMli3P7SyxUK32A-1
Received: by mail-wm1-f71.google.com with SMTP id
 f22-20020a1c6a160000b029018f49a7efb7so3478960wmc.1
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AZLS+m7xAvvk2uRB++FAfryJbzXnCIDe39YBz1qMJyo=;
 b=gCa6Mbv2zwK+893IGDWgVFse7iRxVhKAPxIUt/WhGP23CLKyuD8DQgNZnKESPX/Oxx
 lVZZsZ/80zNBNbpP3guAknLqQu/dZJxZvraN+Yx8H7lBSJTE7J8qy4fSGa3QX8e/YVLH
 k+qCK3KeQakGPEzFPCkJtp7284XFW0LdWfO8sv9GpAz4RpPCj3TPsToEpqMFoUkI3BJj
 nQ95QrVMjES6ENWr0mFINtPCzyp8AvRJzOGKGHEDwZMXU8Tpemk8pzVijiMlwuIh6Iyg
 DjCnRIHp4hKdX58LHB6yrmhXPk1zQHS4lnMEdjh667dpehfJTShBk7sj+IRi4n3rLU5s
 mYVw==
X-Gm-Message-State: AOAM533Zr8X0Ia0/Jw56TtyI65FkVBacoizSqrCvILy101fLFPE6Yiva
 /EZBwsGBCCmQsrlcErMTiK4iSjmLeYbW11YI1wbXYzS5JXHrmRcni9O25YVehuSoD/js4yfCcKg
 HdWV6nvUl277CFSrb0oOTRAoc4qMWDnTsjuvDJhqli+doUWPXQtM1xP/eg6wljs49
X-Received: by 2002:adf:a503:: with SMTP id i3mr3580176wrb.334.1623307597756; 
 Wed, 09 Jun 2021 23:46:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrIqFQOvX5o7dmyskcowDqb/EBdaqma7cMNQ0C9Rxm1XrQ3nNutiBK+ALvwB6QEnsTHuHpUQ==
X-Received: by 2002:adf:a503:: with SMTP id i3mr3580152wrb.334.1623307597545; 
 Wed, 09 Jun 2021 23:46:37 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id c7sm2565760wrc.42.2021.06.09.23.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 23:46:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] target/i386/sev: Restrict SEV to system emulation
Date: Thu, 10 Jun 2021 08:45:54 +0200
Message-Id: <20210610064556.1421620-10-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610064556.1421620-1-philmd@redhat.com>
References: <20210610064556.1421620-1-philmd@redhat.com>
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
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


