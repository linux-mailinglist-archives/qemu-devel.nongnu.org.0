Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4168C3B2D15
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:57:16 +0200 (CEST)
Received: from localhost ([::1]:53998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwN2p-0007SY-4l
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMoy-0000WS-GO
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:42:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMov-0001Hk-Pk
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:42:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WB51l16ZFueZ1BfkdXRpdWS9y+r9iZDq7y7U9eocncg=;
 b=GRWQiXAvKayKhwoI0OEXfICT8DI7kw5etO36IqnrpA/MdBZZGG+QLzvGXI6kuGjrBcNgeG
 J3q21GhyAXoWrulK78KTettusoZe0xARIxoIfubZcMsUAMGBGORbWR/DFB3STR2yvJUVey
 FZgCBEi03rhjcaEDobel+oiWhIBLOi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-iqMkjY5BPV2BHrmSzkAsUA-1; Thu, 24 Jun 2021 06:42:52 -0400
X-MC-Unique: iqMkjY5BPV2BHrmSzkAsUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62D881934100;
 Thu, 24 Jun 2021 10:42:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB3ED26E41;
 Thu, 24 Jun 2021 10:42:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BBAC61803558; Thu, 24 Jun 2021 12:38:38 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 34/34] monitor/tcg: move tcg hmp commands to accel/tcg,
 register them dynamically
Date: Thu, 24 Jun 2021 12:38:36 +0200
Message-Id: <20210624103836.2382472-35-kraxel@redhat.com>
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One more little step towards modular tcg ...

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 accel/tcg/hmp.c       | 29 +++++++++++++++++++++++++++++
 monitor/misc.c        | 18 ------------------
 accel/tcg/meson.build |  1 +
 hmp-commands-info.hx  |  2 --
 4 files changed, 30 insertions(+), 20 deletions(-)
 create mode 100644 accel/tcg/hmp.c

diff --git a/accel/tcg/hmp.c b/accel/tcg/hmp.c
new file mode 100644
index 000000000000..a6e72fdb3ed6
--- /dev/null
+++ b/accel/tcg/hmp.c
@@ -0,0 +1,29 @@
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "exec/exec-all.h"
+#include "monitor/monitor.h"
+#include "sysemu/tcg.h"
+
+static void hmp_info_jit(Monitor *mon, const QDict *qdict)
+{
+    if (!tcg_enabled()) {
+        error_report("JIT information is only available with accel=tcg");
+        return;
+    }
+
+    dump_exec_info();
+    dump_drift_info();
+}
+
+static void hmp_info_opcount(Monitor *mon, const QDict *qdict)
+{
+    dump_opcount_info();
+}
+
+static void hmp_tcg_register(void)
+{
+    monitor_register_hmp("jit", true, hmp_info_jit);
+    monitor_register_hmp("opcount", true, hmp_info_opcount);
+}
+
+type_init(hmp_tcg_register);
diff --git a/monitor/misc.c b/monitor/misc.c
index ad476c6e51ea..b28874d6dc59 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -320,24 +320,6 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
     }
 }
 
-#ifdef CONFIG_TCG
-static void hmp_info_jit(Monitor *mon, const QDict *qdict)
-{
-    if (!tcg_enabled()) {
-        error_report("JIT information is only available with accel=tcg");
-        return;
-    }
-
-    dump_exec_info();
-    dump_drift_info();
-}
-
-static void hmp_info_opcount(Monitor *mon, const QDict *qdict)
-{
-    dump_opcount_info();
-}
-#endif
-
 static void hmp_info_sync_profile(Monitor *mon, const QDict *qdict)
 {
     int64_t max = qdict_get_try_int(qdict, "max", 10);
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 0ae9180282e3..137a1a44cc0a 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -15,6 +15,7 @@ specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'cputlb.c',
+  'hmp.c',
 ))
 
 tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index ce42aef47acb..27206ac049df 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -274,7 +274,6 @@ ERST
         .args_type  = "",
         .params     = "",
         .help       = "show dynamic compiler info",
-        .cmd        = hmp_info_jit,
     },
 #endif
 
@@ -289,7 +288,6 @@ ERST
         .args_type  = "",
         .params     = "",
         .help       = "show dynamic compiler opcode counters",
-        .cmd        = hmp_info_opcount,
     },
 #endif
 
-- 
2.31.1


