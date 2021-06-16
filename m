Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2620D3AA5C4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:57:37 +0200 (CEST)
Received: from localhost ([::1]:38866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcbQ-0003FY-6M
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPI-0003Gr-3d
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPF-0001Fn-MR
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ijj3oNp2VS3kgk+CrwqOtjV8Sk3tYYaTdyhsxAOEaz8=;
 b=CV9ZtxYgFUNXrJdDnqw5Qcsj0yYtCOFBO5YuDTtiVdekJULjGdeuYGuUR6NYhLxYSRRGo3
 +WSezqWT/K5nkIDyORvaXGMwdCgwgnlLBQDSUYOtvPtL3BjMK7hfLzpqjHNd4LRc++Hrmb
 7P6ueTHIwgKxN1prWnvkai2uOHwQ0q8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-TbAqhnLuMLuWD3FhadMT3Q-1; Wed, 16 Jun 2021 16:44:59 -0400
X-MC-Unique: TbAqhnLuMLuWD3FhadMT3Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 r23-20020a05600c2f17b02901d166ff8239so346569wmn.8
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ijj3oNp2VS3kgk+CrwqOtjV8Sk3tYYaTdyhsxAOEaz8=;
 b=PoCFgxYc6CeHyDdLpOAubKGUhziTrd5gmHF+Bcy/Xs226yRh3yOACqthMpXS35v5P8
 KZn9LrjDYhh2HNejk10QO3GuJ4eKopDaJ2434pLgueeC9C4wksojfXx9TkrlvRlim4dJ
 Kw3EA4BMer6AyHZn6YoH1g8DdaRjJQ4Am5yTfExux+aIB+Q8I1hKdFZwJF2RgTsnpb49
 XrsWbywh9YV42oOL3icVHF0ff+u3JxybuSMxYMUI2IHy8kOyrkA5zxxJQ9TCyseOvvn+
 lorp+nwCzKqWAYYbGYdmA4NkLjIjXwQ9VaQqPUHeLxUbTOxvX5Us4pnJpt5bCg1dL0fV
 ja0g==
X-Gm-Message-State: AOAM530YuH4/bI5tqRi16X70Oi3XixV6E8ukrBh0jCwsncNbKNxGlzUI
 IT+kz0teU/byVZKcMNmgfAuMHV8WKpGGYAzsV6JJOTEYSjDG7+xfXHiuZsJ9zFCptcDcp9rqoJU
 xuJ3d0rcvKzrctd57owxtq/ZVNazrEw/Daigd0V1Z52fKuDCrNOc/4/casKtq1TQJ
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr1204756wrw.310.1623876298124; 
 Wed, 16 Jun 2021 13:44:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5+X+8fHj1VhpPJYK+cZ3JWp58yIDid/zhKB9G0SHcAxyJVhhQM2jWI39yuYLUvzA6Gv/VFw==
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr1204724wrw.310.1623876297901; 
 Wed, 16 Jun 2021 13:44:57 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z10sm2835758wmb.26.2021.06.16.13.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:44:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/23] target/i386/sev: Move qmp_query_sev() &
 hmp_info_sev() to sev.c
Date: Wed, 16 Jun 2021 22:43:20 +0200
Message-Id: <20210616204328.2611406-16-philmd@redhat.com>
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

Move qmp_query_sev() & hmp_info_sev()() from monitor.c to sev.c
and make sev_get_info() static. We don't need the stub anymore,
remove it. Add a stub for hmp_info_sev().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Note: what is left in sev_i386.h eventually belong to "sysemu/sev.h"
      meaning we could remove this local header.
---
 target/i386/sev_i386.h        |  2 --
 target/i386/monitor.c         | 37 ---------------------------------
 target/i386/sev-sysemu-stub.c | 10 ++++++++-
 target/i386/sev.c             | 39 +++++++++++++++++++++++++++++++++--
 4 files changed, 46 insertions(+), 42 deletions(-)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 615cebea1a8..1ddb8df9c99 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -15,7 +15,6 @@
 #define QEMU_SEV_I386_H
 
 #include "sysemu/sev.h"
-#include "qapi/qapi-types-misc-target.h"
 
 #define SEV_POLICY_NODBG        0x1
 #define SEV_POLICY_NOKS         0x2
@@ -25,7 +24,6 @@
 #define SEV_POLICY_SEV          0x20
 
 extern bool sev_es_enabled(void);
-extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
 
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index d2289d1fb47..af3501095e5 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -28,11 +28,8 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 #include "qapi/qmp/qdict.h"
-#include "qapi/qmp/qerror.h"
 #include "sysemu/kvm.h"
-#include "sysemu/sev.h"
 #include "qapi/error.h"
-#include "sev_i386.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
 #include "hw/i386/pc.h"
@@ -675,37 +672,3 @@ void hmp_info_io_apic(Monitor *mon, const QDict *qdict)
     monitor_printf(mon, "This command is obsolete and will be "
                    "removed soon. Please use 'info pic' instead.\n");
 }
-
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
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index f5e7536f987..7a35f0432b2 100644
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
 #include "sev_i386.h"
 
-SevInfo *sev_get_info(void)
+SevInfo *qmp_query_sev(Error **errp)
 {
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
@@ -59,3 +62,8 @@ SevAttestationReport *qmp_query_sev_attestation_report(const char *mnonce, Error
     error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
+
+void hmp_info_sev(Monitor *mon, const QDict *qdict)
+{
+    monitor_printf(mon, "SEV is not available in this QEMU\n");
+}
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 4ddd24f6bdd..faa3a4015c4 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -27,10 +27,12 @@
 #include "sev_i386.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
+#include "sysemu/sev.h"
 #include "trace.h"
 #include "migration/blocker.h"
 #include "qom/object.h"
 #include "monitor/monitor.h"
+#include "monitor/hmp.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qmp/qerror.h"
 #include "exec/confidential-guest-support.h"
@@ -375,8 +377,7 @@ sev_get_reduced_phys_bits(void)
     return sev_guest ? sev_guest->reduced_phys_bits : 0;
 }
 
-SevInfo *
-sev_get_info(void)
+static SevInfo *sev_get_info(void)
 {
     SevInfo *info;
 
@@ -395,6 +396,40 @@ sev_get_info(void)
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


