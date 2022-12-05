Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1316642636
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 10:57:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p28Aa-00014l-Po; Mon, 05 Dec 2022 04:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28AY-00013V-PV
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:53:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28AH-0006Tw-SQ
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670234013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwMT4Bso8g+QZEocTdEaOsjlcxvk1sa133j9SQ/bU+8=;
 b=iaxYstRWYuQUUxDESAoB4VX7sffFMhc3LM/q6uocRaC0fUuGtH6TlL+H/BJTJwQMB/ke6K
 Shs6BsO8LhSiqKg999FhfBjkdN8gCEdwrSUsNARau6lbPqNUeSChk7cRulWEE8u5BCSMrp
 uCVMBTrpYqZY8b3Fe6WtZap8h5lEGms=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-Hb6V3QcrONa-b0idYxANAw-1; Mon, 05 Dec 2022 04:53:30 -0500
X-MC-Unique: Hb6V3QcrONa-b0idYxANAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FDE13C0E206;
 Mon,  5 Dec 2022 09:53:28 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AF7F2166B29;
 Mon,  5 Dec 2022 09:53:21 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <huth@tuxfamily.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 virtio-fs@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, qemu-block@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Keith Busch <kbusch@kernel.org>, David Hildenbrand <david@redhat.com>,
 qemu-trivial@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 06/51] hw/display/qxl: Pass requested buffer size to
 qxl_phys2virt()
Date: Mon,  5 Dec 2022 10:51:43 +0100
Message-Id: <20221205095228.1314-7-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Currently qxl_phys2virt() doesn't check for buffer overrun.
In order to do so in the next commit, pass the buffer size
as argument.

For QXLCursor in qxl_render_cursor() -> qxl_cursor() we
verify the size of the chunked data ahead, checking we can
access 'sizeof(QXLCursor) + chunk->data_size' bytes.
Since in the SPICE_CURSOR_TYPE_MONO case the cursor is
assumed to fit in one chunk, no change are required.
In SPICE_CURSOR_TYPE_ALPHA the ahead read is handled in
qxl_unpack_chunks().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20221128202741.4945-4-philmd@linaro.org>
---
 hw/display/qxl.h        |  4 +++-
 hw/display/qxl-logger.c | 11 ++++++++---
 hw/display/qxl-render.c | 20 ++++++++++++++++----
 hw/display/qxl.c        | 14 +++++++++-----
 4 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index 78b3a6c9ba..bf03138ab4 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -153,6 +153,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
  * @qxl: QXL device
  * @phys: physical offset of buffer within the VRAM
  * @group_id: memory slot group
+ * @size: size of the buffer
  *
  * Returns a host pointer to a buffer placed at offset @phys within the
  * active slot @group_id of the PCI VGA RAM memory region associated with
@@ -166,7 +167,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
  * the incoming ram_addr_t.
  *
  */
-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);
+void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id,
+                    size_t size);
 void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
     G_GNUC_PRINTF(2, 3);
 
diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
index 1bcf803db6..35c38f6252 100644
--- a/hw/display/qxl-logger.c
+++ b/hw/display/qxl-logger.c
@@ -106,7 +106,7 @@ static int qxl_log_image(PCIQXLDevice *qxl, QXLPHYSICAL addr, int group_id)
     QXLImage *image;
     QXLImageDescriptor *desc;
 
-    image = qxl_phys2virt(qxl, addr, group_id);
+    image = qxl_phys2virt(qxl, addr, group_id, sizeof(QXLImage));
     if (!image) {
         return 1;
     }
@@ -214,7 +214,8 @@ int qxl_log_cmd_cursor(PCIQXLDevice *qxl, QXLCursorCmd *cmd, int group_id)
                 cmd->u.set.position.y,
                 cmd->u.set.visible ? "yes" : "no",
                 cmd->u.set.shape);
-        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, group_id);
+        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, group_id,
+                               sizeof(QXLCursor));
         if (!cursor) {
             return 1;
         }
@@ -236,6 +237,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring, QXLCommandExt *ext)
 {
     bool compat = ext->flags & QXL_COMMAND_FLAG_COMPAT;
     void *data;
+    size_t datasz;
     int ret;
 
     if (!qxl->cmdlog) {
@@ -249,15 +251,18 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring, QXLCommandExt *ext)
 
     switch (ext->cmd.type) {
     case QXL_CMD_DRAW:
+        datasz = compat ? sizeof(QXLCompatDrawable) : sizeof(QXLDrawable);
         break;
     case QXL_CMD_SURFACE:
+        datasz = sizeof(QXLSurfaceCmd);
         break;
     case QXL_CMD_CURSOR:
+        datasz = sizeof(QXLCursorCmd);
         break;
     default:
         goto out;
     }
-    data = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
+    data = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id, datasz);
     if (!data) {
         return 1;
     }
diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index ca217004bf..fcfd40c3ac 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -107,7 +107,9 @@ static void qxl_render_update_area_unlocked(PCIQXLDevice *qxl)
         qxl->guest_primary.resized = 0;
         qxl->guest_primary.data = qxl_phys2virt(qxl,
                                                 qxl->guest_primary.surface.mem,
-                                                MEMSLOT_GROUP_GUEST);
+                                                MEMSLOT_GROUP_GUEST,
+                                                qxl->guest_primary.abs_stride
+                                                * height);
         if (!qxl->guest_primary.data) {
             goto end;
         }
@@ -228,7 +230,8 @@ static void qxl_unpack_chunks(void *dest, size_t size, PCIQXLDevice *qxl,
         if (offset == size) {
             return;
         }
-        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id);
+        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id,
+                              sizeof(QXLDataChunk) + chunk->data_size);
         if (!chunk) {
             return;
         }
@@ -295,7 +298,8 @@ fail:
 /* called from spice server thread context only */
 int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
 {
-    QXLCursorCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
+    QXLCursorCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id,
+                                      sizeof(QXLCursorCmd));
     QXLCursor *cursor;
     QEMUCursor *c;
 
@@ -314,7 +318,15 @@ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
     }
     switch (cmd->type) {
     case QXL_CURSOR_SET:
-        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id);
+        /* First read the QXLCursor to get QXLDataChunk::data_size ... */
+        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
+                               sizeof(QXLCursor));
+        if (!cursor) {
+            return 1;
+        }
+        /* Then read including the chunked data following QXLCursor. */
+        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
+                               sizeof(QXLCursor) + cursor->chunk.data_size);
         if (!cursor) {
             return 1;
         }
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 5b10f697f1..231d733250 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -274,7 +274,8 @@ static void qxl_spice_monitors_config_async(PCIQXLDevice *qxl, int replay)
                                           QXL_IO_MONITORS_CONFIG_ASYNC));
     }
 
-    cfg = qxl_phys2virt(qxl, qxl->guest_monitors_config, MEMSLOT_GROUP_GUEST);
+    cfg = qxl_phys2virt(qxl, qxl->guest_monitors_config, MEMSLOT_GROUP_GUEST,
+                        sizeof(QXLMonitorsConfig));
     if (cfg != NULL && cfg->count == 1) {
         qxl->guest_primary.resized = 1;
         qxl->guest_head0_width  = cfg->heads[0].width;
@@ -459,7 +460,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, struct QXLCommandExt *ext)
     switch (le32_to_cpu(ext->cmd.type)) {
     case QXL_CMD_SURFACE:
     {
-        QXLSurfaceCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
+        QXLSurfaceCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id,
+                                           sizeof(QXLSurfaceCmd));
 
         if (!cmd) {
             return 1;
@@ -494,7 +496,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, struct QXLCommandExt *ext)
     }
     case QXL_CMD_CURSOR:
     {
-        QXLCursorCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
+        QXLCursorCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id,
+                                          sizeof(QXLCursorCmd));
 
         if (!cmd) {
             return 1;
@@ -1456,7 +1459,8 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
 }
 
 /* can be also called from spice server thread context */
-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id)
+void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
+                    size_t size)
 {
     uint64_t offset;
     uint32_t slot;
@@ -1964,7 +1968,7 @@ static void qxl_dirty_surfaces(PCIQXLDevice *qxl)
         }
 
         cmd = qxl_phys2virt(qxl, qxl->guest_surfaces.cmds[i],
-                            MEMSLOT_GROUP_GUEST);
+                            MEMSLOT_GROUP_GUEST, sizeof(QXLSurfaceCmd));
         assert(cmd);
         assert(cmd->type == QXL_SURFACE_CMD_CREATE);
         qxl_dirty_one_surface(qxl, cmd->u.surface_create.data,
-- 
2.38.1


