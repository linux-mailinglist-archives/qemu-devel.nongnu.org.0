Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905B742BBA6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:31:46 +0200 (CEST)
Received: from localhost ([::1]:49302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maabx-0006QN-Ir
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEs-0002Pp-MF
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:54 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:41954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEn-0005qt-CN
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:54 -0400
Received: by mail-ed1-x52a.google.com with SMTP id a25so7235736edx.8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TjeSfvmFO8v2dqdmZaziYRhTFXrTQLh+6339eRCAhmY=;
 b=ZtOdIBzjzq4CuEXiLqJ/9ikytv19HNGYld5Zei1Sk1ut9n2xa1nAw87rBJhaCL+XVZ
 5gQCylGgPvxNknzzTkPTPwWicnSlcS/Ome91T24sUlPUyQoQghHZOonL0fom0ANkHcNU
 OdHHrjUrmXMVQidV830Fn2OkNqPWICtNYXR2++WSsoTCrYI1S0W9zgYV8lgRuXeWSiUC
 Y4TBWA5kIcRnJoYKywQ+ZQNE8o0D4wifvm/n6LFPyoNqsQtFK2ZOnvUkmIMoiFsEA5fK
 UCod2vCCy1MCkwpYqp1es7ypuUTn6ENHt24VMIYJNpj7XENTcO2q4cBLGO8Cw+gnvrli
 /hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TjeSfvmFO8v2dqdmZaziYRhTFXrTQLh+6339eRCAhmY=;
 b=JkCqwPEfZ2J/NT8MsMMbQ1KpdDlvFHhhLg2aKrD+p42SxrKgXl0UHG4Ba3BRAdV6IL
 YEh6aTy6wCPX66SE94+M0yuH3kmtN81lv+3ogqy2wo2QWcr7IaLdL1CBdV5yFSDMqdDA
 tlL6rnFEaSupNo9H8MyXtfAqhLb8N/On8yJ0QWtK/nJG0T79gBJ74givV5cvveeMyG1r
 spL5l7FonRfq14F/i8CTTzvY88wcT5UTalhzM+OWJYH70fPWYjGHzMUZ0igmWEpKgQVx
 qNWvUQRQbNHl7E7V+mUT62dZo+PlyHJ+/IkJH6mm1+U4T8QzMtMb0O7FMnh29GTLCECb
 8Hgg==
X-Gm-Message-State: AOAM531GqGA/WQpyRTAXMgHZ1xwKby4vpprd6dKr0AjpkHsQF7p5y7FB
 /xwTVzyzu3qHSZ00Sc7/Rw3DGTuLfvs=
X-Google-Smtp-Source: ABdhPJxJh5yQOvYXyqdmAvysI6Cr84GpnXYaMVOcPp9VlWInVP15908Hwu16k2UFmrXlHvLN8ujefA==
X-Received: by 2002:a17:906:646:: with SMTP id
 t6mr16356265ejb.197.1634116067846; 
 Wed, 13 Oct 2021 02:07:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/40] target/i386/sev: Move qmp_query_sev() & hmp_info_sev()
 to sev.c
Date: Wed, 13 Oct 2021 11:07:14 +0200
Message-Id: <20211013090728.309365-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Move qmp_query_sev() & hmp_info_sev()() from monitor.c to sev.c
and make sev_get_info() static. We don't need the stub anymore,
remove it. Add a stub for hmp_info_sev().

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-22-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/monitor.c         | 35 --------------------------------
 target/i386/sev-sysemu-stub.c | 10 ++++++++-
 target/i386/sev.c             | 38 +++++++++++++++++++++++++++++++++--
 target/i386/sev.h             |  2 --
 4 files changed, 45 insertions(+), 40 deletions(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index bd24d0d473..680d282591 100644
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
index 8d97d7c7e1..68518fd3f9 100644
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
index ec874b3df8..19504796fb 100644
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
diff --git a/target/i386/sev.h b/target/i386/sev.h
index 9ee1429395..83e82aa42c 100644
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
-- 
2.31.1



