Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA86945C088
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:06:38 +0100 (CET)
Received: from localhost ([::1]:54628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpryv-00076R-Iq
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:06:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpruc-0004n6-DN
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:02:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mprua-0005hW-8e
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:02:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637758926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=662Eu7PXYmrPma8O6CiucOkvcPEwV+AucS/VeDAUISY=;
 b=c3we7US6z7Ag073a0wO1Isjxgz+3abG5QYNLcS3dCmapS8wYvttcMk5QRpEtUwq2ZllsG5
 DPTP7HbOcDRSqcxCzeQxwuq3nR7rk1wD262lVR4W2KMbhYmDDaOGoSeD1iCucc519TqdNU
 pKw4X/9XosYo4DwpdbOuqRtlu+kpETo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-oemrcvCYOUOesrmuouoTyQ-1; Wed, 24 Nov 2021 08:01:59 -0500
X-MC-Unique: oemrcvCYOUOesrmuouoTyQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 611C2107B263;
 Wed, 24 Nov 2021 13:01:58 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7507B79454;
 Wed, 24 Nov 2021 13:01:56 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/18] spice: Update QXLInterface for spice >= 0.15.0
Date: Wed, 24 Nov 2021 13:01:34 +0000
Message-Id: <20211124130150.268230-3-berrange@redhat.com>
In-Reply-To: <20211124130150.268230-1-berrange@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

spice updated the spelling (and arguments) of "attache_worker" in
0.15.0. Update QEMU to match, preventing -Wdeprecated-declarations
compilations from reporting build errors.

See also:
https://gitlab.freedesktop.org/spice/spice/-/commit/974692bda1e77af92b71ed43b022439448492cb9

Signed-off-by: John Snow <jsnow@redhat.com>
---
 hw/display/qxl.c        | 14 +++++++++++++-
 include/ui/qemu-spice.h |  6 ++++++
 ui/spice-display.c      | 11 +++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

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
2.33.1


