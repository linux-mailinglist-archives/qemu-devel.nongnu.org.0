Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91064325EAE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:13:17 +0100 (CET)
Received: from localhost ([::1]:45028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYFQ-0000Hh-Hi
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:13:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7y-0001j8-Ps
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:35 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7v-00043m-O3
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:34 -0500
Received: by mail-wr1-x42c.google.com with SMTP id w11so7649063wrr.10
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BMASOml+kxNutO8/WiL39JF9IgvMS60IQP441O4IM/U=;
 b=iPIz0Wu4j1NMyX0yLSOJ8JLL0aY94pIho5rBq5m3xp6Ljxy4twWvxed4c6eual1KAe
 p5nmyN6fFapggvrUn5y6kS5t9+WuRs7Bn/GRwzVD+JRCwyDGpcqHPnDlPABSK/DKtU8a
 CjNOSDBSgTIX7sQAVexS+isOJgm0kd+RyddCCcEkZAT5R0ZGzjhBODzaOa2+g3qrUuOS
 BZ2gNsks3j5v8ad+V9FBo+Q0aqrKnf9NFtaXLUe7pQ41s3k7147aftIBZkawXNH4LaM6
 AwVgxmMQMlNHonuM2CGQxBq7/zWPTdwsswpaYDdK7mi3s9IDrOUF0IzIAS412i1On8/C
 luRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BMASOml+kxNutO8/WiL39JF9IgvMS60IQP441O4IM/U=;
 b=iqWGQ10hlfOU6TVQLiGgqtOMhvKxVc9MTrIchxVaNZyxxIA5sPhFGvnUUzhiZp8FBN
 0xwWujHt59q3CGHDHx2DXq/SqACV53/iifeZNCzXjP6Q82aiolSYg+oe0u5qIa5PclqN
 NSCoh+nfTNOUEzLsqGFVUwZ+bv4KT0MMo4mSzix3Zy8hAAH5mKXieK5HNZQ8MGtjfvkN
 LnpxgKPj9feWasL6GS4FEycFr0Bn1aVK0jMZ9U145HQ1G6+cAHTLHWznxZclrbOYfoFm
 6F9F5NUif5QEaLe4aWIBHcpviOjNmNKU5552LSFmcSgW6LHT/MKb95e9ShRrF5UqYe4V
 rHcQ==
X-Gm-Message-State: AOAM531r22jj38X7U2rgfS0uRoZylb5p2JqA7G4z8VaKZWb4VP7etYHC
 z6WyOdHf6B+sfcoGyR1fy9mmg/yYx/E=
X-Google-Smtp-Source: ABdhPJyeIg9h+N5rf9wdGQ6OanMhsGko8OtPfQYMv27cvccXWmZYDBP8bicyip/etc9Ucs9aNPb0nQ==
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr1844685wrs.86.1614326730498;
 Fri, 26 Feb 2021 00:05:30 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/29] scsi: make io_timeout configurable
Date: Fri, 26 Feb 2021 09:05:01 +0100
Message-Id: <20210226080526.651705-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hannes Reinecke <hare@suse.de>

The current code sets an infinite timeout on SG_IO requests,
causing the guest to stall if the host experiences a frame
loss.
This patch adds an 'io_timeout' parameter for SCSIDevice to
make the SG_IO timeout configurable, and also shortens the
default timeout to 30 seconds to avoid infinite stalls.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Message-Id: <20201116183114.55703-3-hare@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c    |  6 ++++--
 hw/scsi/scsi-generic.c | 17 +++++++++++------
 include/hw/scsi/scsi.h |  4 +++-
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index ed52fcd49f..c4016d1cfc 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2624,7 +2624,7 @@ static int get_device_type(SCSIDiskState *s)
     cmd[4] = sizeof(buf);
 
     ret = scsi_SG_IO_FROM_DEV(s->qdev.conf.blk, cmd, sizeof(cmd),
-                              buf, sizeof(buf));
+                              buf, sizeof(buf), s->qdev.io_timeout);
     if (ret < 0) {
         return -1;
     }
@@ -2785,7 +2785,7 @@ static BlockAIOCB *scsi_block_do_sgio(SCSIBlockReq *req,
     /* The rest is as in scsi-generic.c.  */
     io_header->mx_sb_len = sizeof(r->req.sense);
     io_header->sbp = r->req.sense;
-    io_header->timeout = UINT_MAX;
+    io_header->timeout = s->qdev.io_timeout * 1000;
     io_header->usr_ptr = r;
     io_header->flags |= SG_FLAG_DIRECT_IO;
 
@@ -3103,6 +3103,8 @@ static Property scsi_block_properties[] = {
                        DEFAULT_MAX_IO_SIZE),
     DEFINE_PROP_INT32("scsi_version", SCSIDiskState, qdev.default_scsi_version,
                       -1),
+    DEFINE_PROP_UINT32("io_timeout", SCSIDiskState, qdev.io_timeout,
+                       DEFAULT_IO_TIMEOUT),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index ab220141f5..3dd3ccd097 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -115,6 +115,8 @@ static int execute_command(BlockBackend *blk,
                            SCSIGenericReq *r, int direction,
                            BlockCompletionFunc *complete)
 {
+    SCSIDevice *s = r->req.dev;
+
     r->io_header.interface_id = 'S';
     r->io_header.dxfer_direction = direction;
     r->io_header.dxferp = r->buf;
@@ -123,7 +125,7 @@ static int execute_command(BlockBackend *blk,
     r->io_header.cmd_len = r->req.cmd.len;
     r->io_header.mx_sb_len = sizeof(r->req.sense);
     r->io_header.sbp = r->req.sense;
-    r->io_header.timeout = MAX_UINT;
+    r->io_header.timeout = s->io_timeout * 1000;
     r->io_header.usr_ptr = r;
     r->io_header.flags |= SG_FLAG_DIRECT_IO;
 
@@ -506,7 +508,7 @@ static int read_naa_id(const uint8_t *p, uint64_t *p_wwn)
 }
 
 int scsi_SG_IO_FROM_DEV(BlockBackend *blk, uint8_t *cmd, uint8_t cmd_size,
-                        uint8_t *buf, uint8_t buf_size)
+                        uint8_t *buf, uint8_t buf_size, uint32_t timeout)
 {
     sg_io_hdr_t io_header;
     uint8_t sensebuf[8];
@@ -521,7 +523,7 @@ int scsi_SG_IO_FROM_DEV(BlockBackend *blk, uint8_t *cmd, uint8_t cmd_size,
     io_header.cmd_len = cmd_size;
     io_header.mx_sb_len = sizeof(sensebuf);
     io_header.sbp = sensebuf;
-    io_header.timeout = 6000; /* XXX */
+    io_header.timeout = timeout * 1000;
 
     ret = blk_ioctl(blk, SG_IO, &io_header);
     if (ret < 0 || io_header.driver_status || io_header.host_status) {
@@ -551,7 +553,7 @@ static void scsi_generic_set_vpd_bl_emulation(SCSIDevice *s)
     cmd[4] = sizeof(buf);
 
     ret = scsi_SG_IO_FROM_DEV(s->conf.blk, cmd, sizeof(cmd),
-                              buf, sizeof(buf));
+                              buf, sizeof(buf), s->io_timeout);
     if (ret < 0) {
         /*
          * Do not assume anything if we can't retrieve the
@@ -587,7 +589,7 @@ static void scsi_generic_read_device_identification(SCSIDevice *s)
     cmd[4] = sizeof(buf);
 
     ret = scsi_SG_IO_FROM_DEV(s->conf.blk, cmd, sizeof(cmd),
-                              buf, sizeof(buf));
+                              buf, sizeof(buf), s->io_timeout);
     if (ret < 0) {
         return;
     }
@@ -638,7 +640,7 @@ static int get_stream_blocksize(BlockBackend *blk)
     cmd[0] = MODE_SENSE;
     cmd[4] = sizeof(buf);
 
-    ret = scsi_SG_IO_FROM_DEV(blk, cmd, sizeof(cmd), buf, sizeof(buf));
+    ret = scsi_SG_IO_FROM_DEV(blk, cmd, sizeof(cmd), buf, sizeof(buf), 6);
     if (ret < 0) {
         return -1;
     }
@@ -728,6 +730,7 @@ static void scsi_generic_realize(SCSIDevice *s, Error **errp)
 
     /* Only used by scsi-block, but initialize it nevertheless to be clean.  */
     s->default_scsi_version = -1;
+    s->io_timeout = DEFAULT_IO_TIMEOUT;
     scsi_generic_read_device_inquiry(s);
 }
 
@@ -751,6 +754,8 @@ static SCSIRequest *scsi_new_request(SCSIDevice *d, uint32_t tag, uint32_t lun,
 static Property scsi_generic_properties[] = {
     DEFINE_PROP_DRIVE("drive", SCSIDevice, conf.blk),
     DEFINE_PROP_BOOL("share-rw", SCSIDevice, conf.share_rw, false),
+    DEFINE_PROP_UINT32("io_timeout", SCSIDevice, io_timeout,
+                       DEFAULT_IO_TIMEOUT),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 09fa5c9d2a..a8ef59c0f4 100644
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
 SCSIDevice *scsi_device_get(SCSIBus *bus, int channel, int target, int lun);
 
-- 
2.29.2



