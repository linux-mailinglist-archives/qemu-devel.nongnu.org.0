Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753CD693EA4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:06:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRStL-0000lK-0V; Mon, 13 Feb 2023 02:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRStJ-0000ko-7l
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:04:45 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRStG-0000kR-KF
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:04:44 -0500
Received: by mail-wm1-x32a.google.com with SMTP id z13so8008929wmp.2
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VqE2ZOIm5Au9FYKFTyho0X2pkszAMeA9vGFnw1NKAis=;
 b=XMU6meUAlynnKkP5qFTMYOWQYOL0hR8vRcHqI+wcpVx0c/9dQ3ms/tdWrKIgBIk5wu
 1+B6To0xApn9LiwhbIRECFlMDhY17j5EEfV1WWgrOB0Rd1ItKhkVGvUeuhcGLE6ttFSQ
 61+01E2jjjeEyoU4tQp3JX3J5kThoUlcn1Wimhd+g2CHUOadFCNjfDTj/Jt9V68xMxav
 4QlYjMEsAYO0QguXpP8BdHb6/+NvMYB8mXmkct304zQeDyracqbtlgkFXT+nAb3OSAWh
 NuoDV+BPHpeOm5VDfzZvyQlkXbRzHZT/CAtS9kXN0xTM6TZEE7FG9HNZcq1odp6uAc4c
 3t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VqE2ZOIm5Au9FYKFTyho0X2pkszAMeA9vGFnw1NKAis=;
 b=JSIdtmZMf9VbJ6tghv6b8vYR9bVheHeDQIoU2UAG98R6BCeUgAt8xI15X20W/cK4RV
 cYmqPwRv6nCnZHWhk5Jn+UIPhHLN7DD/J5GOSvoGbNBlm9aaCg+WRFDE4A98Vk06jb3+
 DEhYWbui+DaHb+B8OmtBhrY1zc9ihXToA1oMbwZDouwtIgynkQYqVjVkXKzv+eAmH/ej
 QuITbHHxCNEt0WvEzLAPgAMfAAwQm21JFZ900QhS7lnlYGJ3jr1TVnh1WF3PYTUL0lW/
 2Ca0rK+1HL+xykv4wtBtGFurNPPxnX+xD1Jz8uPAZp59QrXdDD3nrDnqqjJu96Hu/RAn
 kfwQ==
X-Gm-Message-State: AO0yUKUyrBO0YV6B8ZqL5cj7sZI1XfQ2ekGpH163mKMRmuxt3oV2EIK7
 GvAslJS+pd+S8q1wxrwwsP7vxo2kIi1tlvc2
X-Google-Smtp-Source: AK7set/ON5ssgo8VrJaNMqkRkinMwcBdraGIjiIaTaEtZmbJ0KZ7SGskqEQ2C5whGdSPJ9LvSc5rPg==
X-Received: by 2002:a05:600c:16c8:b0:3e0:185:e935 with SMTP id
 l8-20020a05600c16c800b003e00185e935mr17894509wmn.36.1676271881222; 
 Sun, 12 Feb 2023 23:04:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c089600b003dc59081603sm12154689wmp.48.2023.02.12.23.04.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:04:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v2 3/9] hw/block: Replace dev->parent_bus by
 qdev_get_parent_bus(dev)
Date: Mon, 13 Feb 2023 08:04:17 +0100
Message-Id: <20230213070423.76428-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070423.76428-1-philmd@linaro.org>
References: <20230213070423.76428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

DeviceState::parent_bus is an internal field and should be
accessed by the qdev_get_parent_bus() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/fdc.c         |  2 +-
 hw/block/swim.c        |  2 +-
 hw/ide/qdev.c          |  6 +++---
 hw/scsi/scsi-bus.c     | 18 +++++++++---------
 include/hw/scsi/scsi.h |  2 +-
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 64ae4a6899..31ad6f6ae0 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -466,7 +466,7 @@ static Property floppy_drive_properties[] = {
 static void floppy_drive_realize(DeviceState *qdev, Error **errp)
 {
     FloppyDrive *dev = FLOPPY_DRIVE(qdev);
-    FloppyBus *bus = FLOPPY_BUS(qdev->parent_bus);
+    FloppyBus *bus = FLOPPY_BUS(qdev_get_parent_bus(qdev));
     FDrive *drive;
     bool read_only;
     int ret;
diff --git a/hw/block/swim.c b/hw/block/swim.c
index 333da08ce0..64e30e9e80 100644
--- a/hw/block/swim.c
+++ b/hw/block/swim.c
@@ -157,7 +157,7 @@ static Property swim_drive_properties[] = {
 static void swim_drive_realize(DeviceState *qdev, Error **errp)
 {
     SWIMDrive *dev = SWIM_DRIVE(qdev);
-    SWIMBus *bus = SWIM_BUS(qdev->parent_bus);
+    SWIMBus *bus = SWIM_BUS(qdev_get_parent_bus(qdev));
     FDrive *drive;
     int ret;
 
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 6f6c7462f3..6ae2627a56 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -81,7 +81,7 @@ static char *idebus_get_fw_dev_path(DeviceState *dev)
     char path[30];
 
     snprintf(path, sizeof(path), "%s@%x", qdev_fw_name(dev),
-             ((IDEBus*)dev->parent_bus)->bus_id);
+             ((IDEBus*)qdev_get_parent_bus(dev))->bus_id);
 
     return g_strdup(path);
 }
@@ -90,7 +90,7 @@ static void ide_qdev_realize(DeviceState *qdev, Error **errp)
 {
     IDEDevice *dev = IDE_DEVICE(qdev);
     IDEDeviceClass *dc = IDE_DEVICE_GET_CLASS(dev);
-    IDEBus *bus = DO_UPCAST(IDEBus, qbus, qdev->parent_bus);
+    IDEBus *bus = DO_UPCAST(IDEBus, qbus, qdev_get_parent_bus(qdev));
 
     if (dev->unit == -1) {
         dev->unit = bus->master ? 1 : 0;
@@ -164,7 +164,7 @@ typedef struct IDEDrive {
 
 static void ide_dev_initfn(IDEDevice *dev, IDEDriveKind kind, Error **errp)
 {
-    IDEBus *bus = DO_UPCAST(IDEBus, qbus, dev->qdev.parent_bus);
+    IDEBus *bus = DO_UPCAST(IDEBus, qbus, qdev_get_parent_bus(DEVICE(dev)));
     IDEState *s = bus->ifs + dev->unit;
     int ret;
 
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index ceceafb2cd..7b2a82b335 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -104,7 +104,7 @@ static void scsi_device_unrealize(SCSIDevice *s)
 int scsi_bus_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
                        size_t buf_len, void *hba_private)
 {
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, dev->qdev.parent_bus);
+    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(dev)));
     int rc;
 
     assert(cmd->len == 0);
@@ -250,7 +250,7 @@ static bool scsi_bus_check_address(BusState *qbus, DeviceState *qdev, Error **er
 static void scsi_qdev_realize(DeviceState *qdev, Error **errp)
 {
     SCSIDevice *dev = SCSI_DEVICE(qdev);
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, dev->qdev.parent_bus);
+    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(dev)));
     bool is_free;
     Error *local_err = NULL;
 
@@ -705,7 +705,7 @@ SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops, SCSIDevice *d,
 SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
                           uint8_t *buf, size_t buf_len, void *hba_private)
 {
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, d->qdev.parent_bus);
+    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(d)));
     const SCSIReqOps *ops;
     SCSIDeviceClass *sc = SCSI_DEVICE_GET_CLASS(d);
     SCSIRequest *req;
@@ -1353,7 +1353,7 @@ int scsi_req_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
 
 void scsi_device_report_change(SCSIDevice *dev, SCSISense sense)
 {
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, dev->qdev.parent_bus);
+    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(dev)));
 
     scsi_device_set_ua(dev, sense);
     if (bus->info->change) {
@@ -1372,7 +1372,7 @@ void scsi_req_unref(SCSIRequest *req)
 {
     assert(req->refcount > 0);
     if (--req->refcount == 0) {
-        BusState *qbus = req->dev->qdev.parent_bus;
+        BusState *qbus = qdev_get_parent_bus(DEVICE(req->dev));
         SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, qbus);
 
         if (bus->info->free_request && req->hba_private) {
@@ -1444,7 +1444,7 @@ void scsi_req_print(SCSIRequest *req)
     int i;
 
     fprintf(fp, "[%s id=%d] %s",
-            req->dev->qdev.parent_bus->name,
+            qdev_get_parent_bus(DEVICE(req->dev))->name,
             req->dev->id,
             scsi_command_name(req->cmd.buf[0]));
     for (i = 1; i < req->cmd.len; i++) {
@@ -1671,7 +1671,7 @@ void scsi_device_purge_requests(SCSIDevice *sdev, SCSISense sense)
 static char *scsibus_get_dev_path(DeviceState *dev)
 {
     SCSIDevice *d = SCSI_DEVICE(dev);
-    DeviceState *hba = dev->parent_bus->parent;
+    DeviceState *hba = qdev_get_parent_bus(dev)->parent;
     char *id;
     char *path;
 
@@ -1698,7 +1698,7 @@ static int put_scsi_requests(QEMUFile *f, void *pv, size_t size,
                              const VMStateField *field, JSONWriter *vmdesc)
 {
     SCSIDevice *s = pv;
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, s->qdev.parent_bus);
+    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(s)));
     SCSIRequest *req;
 
     QTAILQ_FOREACH(req, &s->requests, next) {
@@ -1726,7 +1726,7 @@ static int get_scsi_requests(QEMUFile *f, void *pv, size_t size,
                              const VMStateField *field)
 {
     SCSIDevice *s = pv;
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, s->qdev.parent_bus);
+    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(s)));
     int8_t sbyte;
 
     while ((sbyte = qemu_get_sbyte(f)) > 0) {
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 6ea4b64fe7..843dde8851 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -177,7 +177,7 @@ static inline void scsi_bus_init(SCSIBus *bus, size_t bus_size,
 
 static inline SCSIBus *scsi_bus_from_device(SCSIDevice *d)
 {
-    return DO_UPCAST(SCSIBus, qbus, d->qdev.parent_bus);
+    return DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(d)));
 }
 
 SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
-- 
2.38.1


