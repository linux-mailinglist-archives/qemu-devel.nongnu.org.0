Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAB564040F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:06:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p12vY-0003hf-2t; Fri, 02 Dec 2022 05:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12vQ-0003ck-SU
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12vP-0002Pt-2R
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669975542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tdHiN5p5uQPdx6OgCFKzsLa3fGApduXbZwDhKr895Y8=;
 b=OHhkoIr2JbBwpAjXknJTmuIitNBH4W9qEmtLYlytOD4p3yoCtLFTP/jPUJZphIt8fPzBgW
 mraZ33RLqURba3B+ZVyhvbDhwKwTDYZVsUKm0KkLR6YIjEdy+53pmJF6vQ6eXW/12m/sRZ
 g6bhPBpWI3Q9Iwnz1CchdTY8Zs5KOLE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-Q9ZxBKqwPoGYTYlQioRErw-1; Fri, 02 Dec 2022 05:05:39 -0500
X-MC-Unique: Q9ZxBKqwPoGYTYlQioRErw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A40131C087B1;
 Fri,  2 Dec 2022 10:05:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D4DA1410DDA;
 Fri,  2 Dec 2022 10:05:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EF5B421E65C6; Fri,  2 Dec 2022 11:05:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 06/14] ui/spice: QXLInterface method set_mm_time() is now
 dead, drop
Date: Fri,  2 Dec 2022 11:05:04 +0100
Message-Id: <20221202100512.4161901-7-armbru@redhat.com>
In-Reply-To: <20221202100512.4161901-1-armbru@redhat.com>
References: <20221202100512.4161901-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

SPICE_NEEDS_SET_MM_TIME is now always off.  Bury the dead code.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/ui/qemu-spice.h |  2 --
 hw/display/qxl.c        | 19 -------------------
 ui/spice-display.c      | 10 ----------
 hw/display/trace-events |  1 -
 4 files changed, 32 deletions(-)

diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
index a7a1890b3f..b7d493742c 100644
--- a/include/ui/qemu-spice.h
+++ b/include/ui/qemu-spice.h
@@ -34,8 +34,6 @@ int qemu_spice_add_display_interface(QXLInstance *qxlin, QemuConsole *con);
 int qemu_spice_migrate_info(const char *hostname, int port, int tls_port,
                             const char *subject);
 
-#define SPICE_NEEDS_SET_MM_TIME 0
-
 #if SPICE_SERVER_VERSION >= 0x000f00 /* release 0.15.0 */
 #define SPICE_HAS_ATTACHED_WORKER 1
 #else
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 5b3cd33066..82eafdcc68 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -540,22 +540,6 @@ static void interface_set_compression_level(QXLInstance *sin, int level)
     qxl_rom_set_dirty(qxl);
 }
 
-#if SPICE_NEEDS_SET_MM_TIME
-static void interface_set_mm_time(QXLInstance *sin, uint32_t mm_time)
-{
-    PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
-
-    if (!qemu_spice_display_is_running(&qxl->ssd)) {
-        return;
-    }
-
-    trace_qxl_interface_set_mm_time(qxl->id, mm_time);
-    qxl->shadow_rom.mm_clock = cpu_to_le32(mm_time);
-    qxl->rom->mm_clock = cpu_to_le32(mm_time);
-    qxl_rom_set_dirty(qxl);
-}
-#endif
-
 static void interface_get_init_info(QXLInstance *sin, QXLDevInitInfo *info)
 {
     PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
@@ -1142,9 +1126,6 @@ static const QXLInterface qxl_interface = {
 #endif
 
     .set_compression_level   = interface_set_compression_level,
-#if SPICE_NEEDS_SET_MM_TIME
-    .set_mm_time             = interface_set_mm_time,
-#endif
     .get_init_info           = interface_get_init_info,
 
     /* the callbacks below are called from spice server thread context */
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 494168e7fe..0616a6982f 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -517,13 +517,6 @@ static void interface_set_compression_level(QXLInstance *sin, int level)
     /* nothing to do */
 }
 
-#if SPICE_NEEDS_SET_MM_TIME
-static void interface_set_mm_time(QXLInstance *sin, uint32_t mm_time)
-{
-    /* nothing to do */
-}
-#endif
-
 static void interface_get_init_info(QXLInstance *sin, QXLDevInitInfo *info)
 {
     SimpleSpiceDisplay *ssd = container_of(sin, SimpleSpiceDisplay, qxl);
@@ -715,9 +708,6 @@ static const QXLInterface dpy_interface = {
     .attache_worker          = interface_attach_worker,
 #endif
     .set_compression_level   = interface_set_compression_level,
-#if SPICE_NEEDS_SET_MM_TIME
-    .set_mm_time             = interface_set_mm_time,
-#endif
     .get_init_info           = interface_get_init_info,
 
     /* the callbacks below are called from spice server thread context */
diff --git a/hw/display/trace-events b/hw/display/trace-events
index 0c0ffcbe42..2336a0ca15 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -55,7 +55,6 @@ virtio_gpu_fence_ctrl(uint64_t fence, uint32_t type) "fence 0x%" PRIx64 ", type
 virtio_gpu_fence_resp(uint64_t fence) "fence 0x%" PRIx64
 
 # qxl.c
-disable qxl_interface_set_mm_time(int qid, uint32_t mm_time) "%d %d"
 disable qxl_io_write_vga(int qid, const char *mode, uint32_t addr, uint32_t val) "%d %s addr=%u val=%u"
 qxl_create_guest_primary(int qid, uint32_t width, uint32_t height, uint64_t mem, uint32_t format, uint32_t position) "%d %ux%u mem=0x%" PRIx64 " %u,%u"
 qxl_create_guest_primary_rest(int qid, int32_t stride, uint32_t type, uint32_t flags) "%d %d,%d,%d"
-- 
2.37.3


