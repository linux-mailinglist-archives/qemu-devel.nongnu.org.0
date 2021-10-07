Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A95425841
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:44:46 +0200 (CEST)
Received: from localhost ([::1]:48348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWVh-0000Qe-I5
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6o-0006CI-Aq
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:19:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6l-00067x-Jt
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eCfS+Asf+f1waC4AVoz1E9eLdrSZudUp689oYCk0mwY=;
 b=CYr9t9tfaR2ShWMKeI5RQ7BLDXxTvEW7aUN9jU1LPnvq40YGTxIGxLgPzL+tutw4erdbs8
 n5ttsKv+ObtkGJTjf4OlBypGI/HvsS/fi4kmyKP9D2t1rpIuSxGAMl61Ekg/chGfUoG3UU
 fgIu7gptH8M0+LOKKnPvcBinqdwhubU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-iZ4HWzO-OGuP-u54_96OoQ-1; Thu, 07 Oct 2021 12:18:57 -0400
X-MC-Unique: iZ4HWzO-OGuP-u54_96OoQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 o2-20020a5d4a82000000b00160c6b7622aso5039409wrq.12
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eCfS+Asf+f1waC4AVoz1E9eLdrSZudUp689oYCk0mwY=;
 b=YBRuT197eqmKNpRxCK/OvBEvs8iRExIOpP/uZOgpUFHv1OH9KyK8c51/4Kg9iO4LAD
 6WItHeX8cGt9bs//G1aJvkOgTT7DbW7oba7oyNO0h/sqDvQlzkJBuyBchGINH6TVGeiN
 LFkxTJqa5tmPwlvDv6XMPOyyW6WkVGUc3yFbqd8iaBUrIgC7c7yyEkkqyEIeR2bRT7Kc
 XPrEofa718nqhMGbsHl2uEDWte0hT5chBW6leMGXthfU5lTGtMTP5BcJiieiz7/EnuIc
 FaAZm8AMDQTE/UtdzP4hdeU6jk/LfOMOrsBWnFp5hTJk+6YGwL4EIHEU9lrILxiuwlaZ
 KLyg==
X-Gm-Message-State: AOAM530hYsBbk/MyjW9HYxArs3+NJczpjIygfM8+opc83gDABqn+u/5H
 SJ1Aj5VRTk8FZ/eX1ns4nnp2rVnc88dybbgCTMSsAwzaq66sdXOQyWJDkLNIU01p5bYIUs1bn8v
 QTQiJJsKvC8DTwiDfnJDIsRbJne9iU/QnTWusH6DTkWAfjzjb8sj9xTwc0vr+wbdY
X-Received: by 2002:a7b:c351:: with SMTP id l17mr5734566wmj.120.1633623534099; 
 Thu, 07 Oct 2021 09:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMiBCCsPqIpoUFMotzmt5Xfmuwzj1LGT3FXGJkJ2kFOsOJzE9yp1pWqRATIf7s0cH57Uvvhg==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr5734533wmj.120.1633623533832; 
 Thu, 07 Oct 2021 09:18:53 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o6sm130018wri.49.2021.10.07.09.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:18:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/23] target/i386/sev: Move qmp_query_sev() &
 hmp_info_sev() to sev.c
Date: Thu,  7 Oct 2021 18:17:14 +0200
Message-Id: <20211007161716.453984-22-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qmp_query_sev() & hmp_info_sev()() from monitor.c to sev.c
and make sev_get_info() static. We don't need the stub anymore,
remove it. Add a stub for hmp_info_sev().

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev.h             |  2 --
 target/i386/monitor.c         | 35 --------------------------------
 target/i386/sev-sysemu-stub.c | 10 ++++++++-
 target/i386/sev.c             | 38 +++++++++++++++++++++++++++++++++--
 4 files changed, 45 insertions(+), 40 deletions(-)

diff --git a/target/i386/sev.h b/target/i386/sev.h
index dda350779f9..3fba1884a0d 100644
--- a/target/i386/sev.h
+++ b/target/i386/sev.h
@@ -19,7 +19,6 @@
 #endif
 
 #include "exec/confidential-guest-support.h"
-#include "qapi/qapi-types-misc-target.h"
 
 #define SEV_POLICY_NODBG        0x1
 #define SEV_POLICY_NOKS         0x2
@@ -47,7 +46,6 @@ bool sev_es_enabled(void);
 #define sev_es_enabled() 0
 #endif
 
-extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
 extern bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp);
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index bd24d0d4737..680d282591c 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -31,7 +31,6 @@
 #include "qapi/qmp/qerror.h"
 #include "sysemu/kvm.h"
 #include "qapi/error.h"
-#include "sev.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
 #include "hw/i386/pc.h"
@@ -676,40 +675,6 @@ void hmp_info_io_apic(Monitor *mon, const QDict *qdict)
                    "removed soon. Please use 'info pic' instead.\n");
 }
 
-SevInfo *qmp_query_sev(Error **errp)
-{
-    SevInfo *info;
-
-    info = sev_get_info();
-    if (!info) {
-        error_setg(errp, "SEV feature is not available");
-        return NULL;
-    }
-
-    return info;
-}
-
-void hmp_info_sev(Monitor *mon, const QDict *qdict)
-{
-    SevInfo *info = sev_get_info();
-
-    if (info && info->enabled) {
-        monitor_printf(mon, "handle: %d\n", info->handle);
-        monitor_printf(mon, "state: %s\n", SevState_str(info->state));
-        monitor_printf(mon, "build: %d\n", info->build_id);
-        monitor_printf(mon, "api version: %d.%d\n",
-                       info->api_major, info->api_minor);
-        monitor_printf(mon, "debug: %s\n",
-                       info->policy & SEV_POLICY_NODBG ? "off" : "on");
-        monitor_printf(mon, "key-sharing: %s\n",
-                       info->policy & SEV_POLICY_NOKS ? "off" : "on");
-    } else {
-        monitor_printf(mon, "SEV is not enabled\n");
-    }
-
-    qapi_free_SevInfo(info);
-}
-
 SGXInfo *qmp_query_sgx(Error **errp)
 {
     return sgx_get_info(errp);
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index 8d97d7c7e14..68518fd3f9d 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -12,13 +12,16 @@
  */
 
 #include "qemu/osdep.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/error.h"
 #include "sev.h"
 
-SevInfo *sev_get_info(void)
+SevInfo *qmp_query_sev(Error **errp)
 {
+    error_setg(errp, "SEV is not available in this QEMU");
     return NULL;
 }
 
@@ -60,3 +63,8 @@ SevAttestationReport *qmp_query_sev_attestation_report(const char *mnonce,
     error_setg(errp, "SEV is not available in this QEMU");
     return NULL;
 }
+
+void hmp_info_sev(Monitor *mon, const QDict *qdict)
+{
+    monitor_printf(mon, "SEV is not available in this QEMU\n");
+}
diff --git a/target/i386/sev.c b/target/i386/sev.c
index ec874b3df82..19504796fb7 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -32,6 +32,7 @@
 #include "migration/blocker.h"
 #include "qom/object.h"
 #include "monitor/monitor.h"
+#include "monitor/hmp.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qmp/qerror.h"
 #include "exec/confidential-guest-support.h"
@@ -402,8 +403,7 @@ sev_get_reduced_phys_bits(void)
     return sev_guest ? sev_guest->reduced_phys_bits : 0;
 }
 
-SevInfo *
-sev_get_info(void)
+static SevInfo *sev_get_info(void)
 {
     SevInfo *info;
 
@@ -422,6 +422,40 @@ sev_get_info(void)
     return info;
 }
 
+SevInfo *qmp_query_sev(Error **errp)
+{
+    SevInfo *info;
+
+    info = sev_get_info();
+    if (!info) {
+        error_setg(errp, "SEV feature is not available");
+        return NULL;
+    }
+
+    return info;
+}
+
+void hmp_info_sev(Monitor *mon, const QDict *qdict)
+{
+    SevInfo *info = sev_get_info();
+
+    if (info && info->enabled) {
+        monitor_printf(mon, "handle: %d\n", info->handle);
+        monitor_printf(mon, "state: %s\n", SevState_str(info->state));
+        monitor_printf(mon, "build: %d\n", info->build_id);
+        monitor_printf(mon, "api version: %d.%d\n",
+                       info->api_major, info->api_minor);
+        monitor_printf(mon, "debug: %s\n",
+                       info->policy & SEV_POLICY_NODBG ? "off" : "on");
+        monitor_printf(mon, "key-sharing: %s\n",
+                       info->policy & SEV_POLICY_NOKS ? "off" : "on");
+    } else {
+        monitor_printf(mon, "SEV is not enabled\n");
+    }
+
+    qapi_free_SevInfo(info);
+}
+
 static int
 sev_get_pdh_info(int fd, guchar **pdh, size_t *pdh_len, guchar **cert_chain,
                  size_t *cert_chain_len, Error **errp)
-- 
2.31.1


