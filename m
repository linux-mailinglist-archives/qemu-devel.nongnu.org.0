Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9DC444429
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:01:18 +0100 (CET)
Received: from localhost ([::1]:33020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHlN-0004ty-Ht
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miHap-0005kk-72
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miHal-0003wl-DB
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:50:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635951018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tfDeEjPBzTT8VjFFUgkimliv3yxY+DtmSlEp56qSZgc=;
 b=gn/IUkL0opl5H6h1Ybtpem3tNrxIPdvLPtBmcv0XxrIiMV5+u6FfGmf7nqxw74BQJ+zX7z
 5vLfbAehQod1HyTbReADU/kGhzR+693IELQThQA8q6CjoyLqvg7gPXYeJ+x9hxRxw6JnYs
 sJ/z0zvPJIYGKV/yUTCcVr8cPnzUwyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-Y7C-C0X4NkSXcsfAtLX2ng-1; Wed, 03 Nov 2021 10:50:03 -0400
X-MC-Unique: Y7C-C0X4NkSXcsfAtLX2ng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1693180A5C4;
 Wed,  3 Nov 2021 14:50:02 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 053B7196E6;
 Wed,  3 Nov 2021 14:49:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] spice: Update QXLInterface for spice >= 0.15.0
Date: Wed,  3 Nov 2021 10:48:39 -0400
Message-Id: <20211103144844.1285634-2-jsnow@redhat.com>
In-Reply-To: <20211103144844.1285634-1-jsnow@redhat.com>
References: <20211103144844.1285634-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spice updated the spelling (and arguments) of "attache_worker" in
0.15.0. Update QEMU to match, preventing -Wdeprecated-declarations
compilations from reporting build errors.

See also:
https://gitlab.freedesktop.org/spice/spice/-/commit/974692bda1e77af92b71ed43b022439448492cb9

Signed-off-by: John Snow <jsnow@redhat.com>
---
 include/ui/qemu-spice.h |  6 ++++++
 hw/display/qxl.c        | 14 +++++++++++++-
 ui/spice-display.c      | 11 +++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
index 71ecd6cfd1..21fe195e18 100644
--- a/include/ui/qemu-spice.h
+++ b/include/ui/qemu-spice.h
@@ -40,6 +40,12 @@ int qemu_spice_migrate_info(const char *hostname, int port, int tls_port,
 #define SPICE_NEEDS_SET_MM_TIME 0
 #endif
 
+#if defined(SPICE_SERVER_VERSION) && (SPICE_SERVER_VERSION >= 0x000f00)
+#define SPICE_HAS_ATTACHED_WORKER 1
+#else
+#define SPICE_HAS_ATTACHED_WORKER 0
+#endif
+
 #else  /* CONFIG_SPICE */
 
 #include "qemu/error-report.h"
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 29c80b4289..1da6703e44 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -517,13 +517,20 @@ static int qxl_track_command(PCIQXLDevice *qxl, struct QXLCommandExt *ext)
 
 /* spice display interface callbacks */
 
-static void interface_attach_worker(QXLInstance *sin, QXLWorker *qxl_worker)
+static void interface_attached_worker(QXLInstance *sin)
 {
     PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
 
     trace_qxl_interface_attach_worker(qxl->id);
 }
 
+#if !(SPICE_HAS_ATTACHED_WORKER)
+static void interface_attach_worker(QXLInstance *sin, QXLWorker *qxl_worker)
+{
+    interface_attached_worker(sin);
+}
+#endif
+
 static void interface_set_compression_level(QXLInstance *sin, int level)
 {
     PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
@@ -1131,7 +1138,12 @@ static const QXLInterface qxl_interface = {
     .base.major_version      = SPICE_INTERFACE_QXL_MAJOR,
     .base.minor_version      = SPICE_INTERFACE_QXL_MINOR,
 
+#if SPICE_HAS_ATTACHED_WORKER
+    .attached_worker         = interface_attached_worker,
+#else
     .attache_worker          = interface_attach_worker,
+#endif
+
     .set_compression_level   = interface_set_compression_level,
 #if SPICE_NEEDS_SET_MM_TIME
     .set_mm_time             = interface_set_mm_time,
diff --git a/ui/spice-display.c b/ui/spice-display.c
index f59c69882d..1a60cebb7d 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -500,10 +500,17 @@ void qemu_spice_display_refresh(SimpleSpiceDisplay *ssd)
 
 /* spice display interface callbacks */
 
+#if SPICE_HAS_ATTACHED_WORKER
+static void interface_attached_worker(QXLInstance *sin)
+{
+    /* nothing to do */
+}
+#else
 static void interface_attach_worker(QXLInstance *sin, QXLWorker *qxl_worker)
 {
     /* nothing to do */
 }
+#endif
 
 static void interface_set_compression_level(QXLInstance *sin, int level)
 {
@@ -702,7 +709,11 @@ static const QXLInterface dpy_interface = {
     .base.major_version      = SPICE_INTERFACE_QXL_MAJOR,
     .base.minor_version      = SPICE_INTERFACE_QXL_MINOR,
 
+#if SPICE_HAS_ATTACHED_WORKER
+    .attached_worker         = interface_attached_worker,
+#else
     .attache_worker          = interface_attach_worker,
+#endif
     .set_compression_level   = interface_set_compression_level,
 #if SPICE_NEEDS_SET_MM_TIME
     .set_mm_time             = interface_set_mm_time,
-- 
2.31.1


