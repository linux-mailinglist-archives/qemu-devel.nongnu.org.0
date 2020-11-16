Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1952B5037
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:52:11 +0100 (CET)
Received: from localhost ([::1]:40918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejbm-0007o0-HH
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejHj-0003UV-B7
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:31:27 -0500
Received: from mx2.suse.de ([195.135.220.15]:34662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejHa-0006BI-RP
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:31:26 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9774B062;
 Mon, 16 Nov 2020 18:31:15 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/3] scsi: make io_timeout configurable
Date: Mon, 16 Nov 2020 19:31:13 +0100
Message-Id: <20201116183114.55703-3-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201116183114.55703-1-hare@suse.de>
References: <20201116183114.55703-1-hare@suse.de>
Received-SPF: pass client-ip=195.135.220.15; envelope-from=hare@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 12:53:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current code sets an infinite timeout on SG_IO requests,
causing the guest to stall if the host experiences a frame
loss.
This patch adds an 'io_timeout' parameter for SCSIDevice to
make the SG_IO timeout configurable, and also shortens the
default timeout to 30 seconds to avoid infinite stalls.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 hw/scsi/scsi-disk.c    |  6 ++++--
 hw/scsi/scsi-generic.c | 17 +++++++++++------
 include/hw/scsi/scsi.h |  4 +++-
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index e859534eaf..2959526b52 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2604,7 +2604,7 @@ static int get_device_type(SCSIDiskState *s)
     cmd[4] = sizeof(buf);
 
     ret = scsi_SG_IO_FROM_DEV(s->qdev.conf.blk, cmd, sizeof(cmd),
-                              buf, sizeof(buf));
+                              buf, sizeof(buf), s->qdev.io_timeout);
     if (ret < 0) {
         return -1;
     }
@@ -2765,7 +2765,7 @@ static BlockAIOCB *scsi_block_do_sgio(SCSIBlockReq *req,
     /* The rest is as in scsi-generic.c.  */
     io_header->mx_sb_len = sizeof(r->req.sense);
     io_header->sbp = r->req.sense;
-    io_header->timeout = UINT_MAX;
+    io_header->timeout = s->qdev.io_timeout * 1000;
     io_header->usr_ptr = r;
     io_header->flags |= SG_FLAG_DIRECT_IO;
 
@@ -3083,6 +3083,8 @@ static Property scsi_block_properties[] = {
                        DEFAULT_MAX_IO_SIZE),
     DEFINE_PROP_INT32("scsi_version", SCSIDiskState, qdev.default_scsi_version,
                       -1),
+    DEFINE_PROP_UINT32("io_timeout", SCSIDiskState, qdev.io_timeout,
+                       DEFAULT_IO_TIMEOUT),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 2cb23ca891..e07924b3d7 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -114,6 +114,8 @@ static int execute_command(BlockBackend *blk,
                            SCSIGenericReq *r, int direction,
                            BlockCompletionFunc *complete)
 {
+    SCSIDevice *s = r->req.dev;
+
     r->io_header.interface_id = 'S';
     r->io_header.dxfer_direction = direction;
     r->io_header.dxferp = r->buf;
@@ -122,7 +124,7 @@ static int execute_command(BlockBackend *blk,
     r->io_header.cmd_len = r->req.cmd.len;
     r->io_header.mx_sb_len = sizeof(r->req.sense);
     r->io_header.sbp = r->req.sense;
-    r->io_header.timeout = MAX_UINT;
+    r->io_header.timeout = s->io_timeout * 1000;
     r->io_header.usr_ptr = r;
     r->io_header.flags |= SG_FLAG_DIRECT_IO;
 
@@ -505,7 +507,7 @@ static int read_naa_id(const uint8_t *p, uint64_t *p_wwn)
 }
 
 int scsi_SG_IO_FROM_DEV(BlockBackend *blk, uint8_t *cmd, uint8_t cmd_size,
-                        uint8_t *buf, uint8_t buf_size)
+                        uint8_t *buf, uint8_t buf_size, uint32_t timeout)
 {
     sg_io_hdr_t io_header;
     uint8_t sensebuf[8];
@@ -520,7 +522,7 @@ int scsi_SG_IO_FROM_DEV(BlockBackend *blk, uint8_t *cmd, uint8_t cmd_size,
     io_header.cmd_len = cmd_size;
     io_header.mx_sb_len = sizeof(sensebuf);
     io_header.sbp = sensebuf;
-    io_header.timeout = 6000; /* XXX */
+    io_header.timeout = timeout * 1000;
 
     ret = blk_ioctl(blk, SG_IO, &io_header);
     if (ret < 0 || io_header.driver_status || io_header.host_status) {
@@ -550,7 +552,7 @@ static void scsi_generic_set_vpd_bl_emulation(SCSIDevice *s)
     cmd[4] = sizeof(buf);
 
     ret = scsi_SG_IO_FROM_DEV(s->conf.blk, cmd, sizeof(cmd),
-                              buf, sizeof(buf));
+                              buf, sizeof(buf), s->io_timeout);
     if (ret < 0) {
         /*
          * Do not assume anything if we can't retrieve the
@@ -586,7 +588,7 @@ static void scsi_generic_read_device_identification(SCSIDevice *s)
     cmd[4] = sizeof(buf);
 
     ret = scsi_SG_IO_FROM_DEV(s->conf.blk, cmd, sizeof(cmd),
-                              buf, sizeof(buf));
+                              buf, sizeof(buf), s->io_timeout);
     if (ret < 0) {
         return;
     }
@@ -637,7 +639,7 @@ static int get_stream_blocksize(BlockBackend *blk)
     cmd[0] = MODE_SENSE;
     cmd[4] = sizeof(buf);
 
-    ret = scsi_SG_IO_FROM_DEV(blk, cmd, sizeof(cmd), buf, sizeof(buf));
+    ret = scsi_SG_IO_FROM_DEV(blk, cmd, sizeof(cmd), buf, sizeof(buf), 6);
     if (ret < 0) {
         return -1;
     }
@@ -727,6 +729,7 @@ static void scsi_generic_realize(SCSIDevice *s, Error **errp)
 
     /* Only used by scsi-block, but initialize it nevertheless to be clean.  */
     s->default_scsi_version = -1;
+    s->io_timeout = DEFAULT_IO_TIMEOUT;
     scsi_generic_read_device_inquiry(s);
 }
 
@@ -750,6 +753,8 @@ static SCSIRequest *scsi_new_request(SCSIDevice *d, uint32_t tag, uint32_t lun,
 static Property scsi_generic_properties[] = {
     DEFINE_PROP_DRIVE("drive", SCSIDevice, conf.blk),
     DEFINE_PROP_BOOL("share-rw", SCSIDevice, conf.share_rw, false),
+    DEFINE_PROP_UINT32("io_timeout", SCSIDevice, io_timeout,
+                       DEFAULT_IO_TIMEOUT),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 7a55cdbd74..21a6249743 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -18,6 +18,7 @@ typedef struct SCSIReqOps SCSIReqOps;
 
 #define SCSI_SENSE_BUF_SIZE_OLD 96
 #define SCSI_SENSE_BUF_SIZE 252
+#define DEFAULT_IO_TIMEOUT 30
 
 struct SCSIRequest {
     SCSIBus           *bus;
@@ -84,6 +85,7 @@ struct SCSIDevice
     uint64_t port_wwn;
     int scsi_version;
     int default_scsi_version;
+    uint32_t io_timeout;
     bool needs_vpd_bl_emulation;
     bool hba_supports_iothread;
 };
@@ -188,7 +190,7 @@ void scsi_device_unit_attention_reported(SCSIDevice *dev);
 void scsi_generic_read_device_inquiry(SCSIDevice *dev);
 int scsi_device_get_sense(SCSIDevice *dev, uint8_t *buf, int len, bool fixed);
 int scsi_SG_IO_FROM_DEV(BlockBackend *blk, uint8_t *cmd, uint8_t cmd_size,
-                        uint8_t *buf, uint8_t buf_size);
+                        uint8_t *buf, uint8_t buf_size, uint32_t timeout);
 SCSIDevice *scsi_device_find(SCSIBus *bus, int channel, int target, int lun);
 
 /* scsi-generic.c. */
-- 
2.16.4


