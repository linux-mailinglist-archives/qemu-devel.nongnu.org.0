Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59890638F14
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 18:32:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oycY2-000525-2s; Fri, 25 Nov 2022 12:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oycXz-0004zS-Ke
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:31:31 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oycXv-0004bv-IC
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:31:30 -0500
Received: by mail-wr1-x42e.google.com with SMTP id i12so7850019wrb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 09:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b0IH76EKIQ1ruWEmDG0NlyHxpybLvAmwKT4oazPX1RE=;
 b=zYIywXdfp+50h2wkHdcH/v24KiGgrNy+QHDIzR436WMAv0OHOIa1vvEjtTbsJJL4ld
 tzuW2LjLFjGmjEeTXQ2vDT/6YK/oXeZsAeekA++o5yhvuABkO1yAyx+1PemT46574+7X
 KiOYBTZLcXgjlOZlwsUx6KFD/LlbFerkQLT6Fs4NNRPtrIZdEgzWX+6kYgvYaEMPgeXl
 SOB9ucaCQY2jzx/8AKP+Udxtc6gSlZMGa7ZaMjSSkjGKQWYDqRSauiCjCSnloThLhRPn
 uMdSfPah7WLY9G+JbStLEPTOYmj7bTxvhB2YGUzvuhdWO4Gkp+HIBRTDFbUtMUni6xQ1
 NBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b0IH76EKIQ1ruWEmDG0NlyHxpybLvAmwKT4oazPX1RE=;
 b=JUSrmqGK89yZoivXhn133gQAWEHRjOOcDR8UcZ3s5kT1idhkrxZj8sz1Mr+vqJMyD+
 iJKJEkAqHXjH6q8t5qMwD7ewYRku6ey9m51pLmAujtIDxweLL2p0rWPtMrQsNn6CgFpb
 p+uAYZnqe8D9dDN8JXTz879BGlj+Xq0qbiSwo9sQYlwFbRyzLvFFshNN9qdxOXav/rHP
 OtoW3IC2FaZjZGAYZOmr8FNAUFw+ikHAsSMBwSUyUd4YuD9qJeQsUpiukg49pBFydmle
 xh2y57bEF9GqIDnaAJqwRXxKwcrhEbvPgIOJlNb9GE7+nIgajCB/GgpM/F03XOguYwyI
 kkNg==
X-Gm-Message-State: ANoB5pk+9TxQMhg6SXcZvtdwfMuQvkMTZ6Or4jwSFOrC3Jj38Fi6ZA3d
 2Coq2RifFF03PxvLvWT+/YwOKfW/4JDV2Q==
X-Google-Smtp-Source: AA0mqf7Y/wFhCLxfz//l585J0VjKMUknz8wtURzzmOzqjXArjeQQ3mijkmWMgm7xlh1o09ZAxXh84A==
X-Received: by 2002:a05:6000:104c:b0:23a:5a31:29eb with SMTP id
 c12-20020a056000104c00b0023a5a3129ebmr17478120wrx.679.1669397485636; 
 Fri, 25 Nov 2022 09:31:25 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a056000000c00b00241cfa9333fsm4472919wrx.5.2022.11.25.09.31.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Nov 2022 09:31:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-7.2 3/4] hw/display/qxl: Pass requested buffer size to
 qxl_phys2virt()
Date: Fri, 25 Nov 2022 18:31:18 +0100
Message-Id: <20221125173119.46665-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125154030.42108-1-philmd@linaro.org>
References: <20221125154030.42108-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Currently qxl_phys2virt() doesn't check for buffer overrun.
In order to do so in the next commit, pass the buffer size
as argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: Please double-check qxl_render_update_area_unlocked()
---
 hw/display/qxl-logger.c | 11 ++++++++---
 hw/display/qxl-render.c | 11 +++++++----
 hw/display/qxl.c        | 14 +++++++++-----
 hw/display/qxl.h        |  4 +++-
 4 files changed, 27 insertions(+), 13 deletions(-)

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
index ca217004bf..1b0a50c1aa 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -107,7 +107,8 @@ static void qxl_render_update_area_unlocked(PCIQXLDevice *qxl)
         qxl->guest_primary.resized = 0;
         qxl->guest_primary.data = qxl_phys2virt(qxl,
                                                 qxl->guest_primary.surface.mem,
-                                                MEMSLOT_GROUP_GUEST);
+                                                MEMSLOT_GROUP_GUEST,
+                                                sizeof(uint32_t) * width * height);
         if (!qxl->guest_primary.data) {
             goto end;
         }
@@ -228,7 +229,7 @@ static void qxl_unpack_chunks(void *dest, size_t size, PCIQXLDevice *qxl,
         if (offset == size) {
             return;
         }
-        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id);
+        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id, bytes);
         if (!chunk) {
             return;
         }
@@ -295,7 +296,8 @@ fail:
 /* called from spice server thread context only */
 int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
 {
-    QXLCursorCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
+    QXLCursorCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id,
+                                      sizeof(QXLCursorCmd));
     QXLCursor *cursor;
     QEMUCursor *c;
 
@@ -314,7 +316,8 @@ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
     }
     switch (cmd->type) {
     case QXL_CURSOR_SET:
-        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id);
+        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
+                               sizeof(QXLCursor));
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
 
-- 
2.38.1


