Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22C2477241
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:54:20 +0100 (CET)
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqH5-0007j6-Rj
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:54:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxq02-0001yc-Lg
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxq00-0004av-N7
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639658200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v53goszAsL62V3p7LnUQ0hKDZEGdftzFNTJ8i7no6x0=;
 b=GcRflY68irixqq5TULNMUhMXVC8m2tsCDYnlugl0hkWiGPqIBFeULKGjtBxnFvv4WV7q0M
 ikadF4QAaGa1mZr0T6RI2Y0k5xgSLbxvTWZ5P5/XJ/UkqV4OU61a/nNCUuhMiruv0CI3fs
 cX9BHmoLRvQtwPDXmvV3/dC92K0j5jM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-Bh-N23YHMvm1W0AP1g0qoA-1; Thu, 16 Dec 2021 07:36:39 -0500
X-MC-Unique: Bh-N23YHMvm1W0AP1g0qoA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v190-20020a1cacc7000000b003456d598510so1200647wme.6
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 04:36:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v53goszAsL62V3p7LnUQ0hKDZEGdftzFNTJ8i7no6x0=;
 b=22Y9TNGA6Vsc9wA+qU29GWRMsJBl5OgH7e7qE6GoDSd3Imbs5CEL6WpJHmKpLOHFo1
 +DGGu1GucZ/FQBTNDWMs+3yNxGPk3NXGXo0zOrVb4VSsnas9NKnKgnBViLQ8sqc0bNRS
 4JPSMeoMzUSIPriZgg/b8BMYWMoJVFTZ77zIn6F7Ya+oSX2eRDC2i+x+pPse4+V8Ung4
 pl8pPeO+Lm+T/dAqz9yGqwDu1ksVBmMq8pKPbA+Whg7pw1j35//cS9Csv10kQ+5SsQnT
 W1cOfZFw3h+/4y3nT9UyDpKzZMqotchHS/ueLbdx9XyvVY2EAVtWzztpS3/YvEmOOk4N
 IrIg==
X-Gm-Message-State: AOAM533NKCsoHOzgxuJTkkpA0rmTdrnJAEevcpyOLjotnv2AGhC4CtN3
 ECXti1iff74Wj9wCRkBo398AdY+/i0e8oxgnVvJ3mE1nmtKuqTWn/p0BkHkNpRVFcSQJXrfwOow
 aCJmxM7cCZ9v2hq3uuNbxSUplxYAQOABuuLG7RKHmidCCcmj6PFnt8eTUkuwMdDdb
X-Received: by 2002:a5d:5303:: with SMTP id e3mr8859202wrv.73.1639658197493;
 Thu, 16 Dec 2021 04:36:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2WQsB2H5PLENDqTRo21FxXtRjmI9pvqpn4Fm9puCWkL96vuusrEd3xRMAaGw6IQqp811y9w==
X-Received: by 2002:a5d:5303:: with SMTP id e3mr8859166wrv.73.1639658197199;
 Thu, 16 Dec 2021 04:36:37 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o25sm4510312wms.17.2021.12.16.04.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 04:36:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] dma: Let dma_buf_read() take MemTxAttrs argument
Date: Thu, 16 Dec 2021 13:35:56 +0100
Message-Id: <20211216123558.799425-7-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216123558.799425-1-philmd@redhat.com>
References: <20211216123558.799425-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling
dma_buf_read().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h  |  2 +-
 hw/ide/ahci.c         |  4 ++--
 hw/nvme/ctrl.c        |  2 +-
 hw/scsi/megasas.c     | 24 ++++++++++++------------
 hw/scsi/scsi-bus.c    |  2 +-
 softmmu/dma-helpers.c |  5 ++---
 6 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index c5f45f6c594..cdf379fecad 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -303,7 +303,7 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
 BlockAIOCB *dma_blk_write(BlockBackend *blk,
                           QEMUSGList *sg, uint64_t offset, uint32_t align,
                           BlockCompletionFunc *cb, void *opaque);
-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg);
+uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
 uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 079d2977f23..205dfdc6622 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1386,7 +1386,7 @@ static void ahci_pio_transfer(const IDEDMA *dma)
         if (is_write) {
             dma_buf_write(s->data_ptr, size, &s->sg, attrs);
         } else {
-            dma_buf_read(s->data_ptr, size, &s->sg);
+            dma_buf_read(s->data_ptr, size, &s->sg, attrs);
         }
     }
 
@@ -1479,7 +1479,7 @@ static int ahci_dma_rw_buf(const IDEDMA *dma, bool is_write)
     }
 
     if (is_write) {
-        dma_buf_read(p, l, &s->sg);
+        dma_buf_read(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
     } else {
         dma_buf_write(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
     }
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index e1a531d5d6c..462f79a1f60 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1152,7 +1152,7 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
         if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
             residual = dma_buf_write(ptr, len, &sg->qsg, attrs);
         } else {
-            residual = dma_buf_read(ptr, len, &sg->qsg);
+            residual = dma_buf_read(ptr, len, &sg->qsg, attrs);
         }
 
         if (unlikely(residual)) {
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 4ec104b7820..dfd48f1a873 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -847,7 +847,7 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
                                        MFI_INFO_PDMIX_SATA |
                                        MFI_INFO_PDMIX_LD);
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
@@ -877,7 +877,7 @@ static int megasas_mfc_get_defaults(MegasasState *s, MegasasCmd *cmd)
     info.disable_preboot_cli = 1;
     info.cluster_disable = 1;
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
@@ -898,7 +898,7 @@ static int megasas_dcmd_get_bios_info(MegasasState *s, MegasasCmd *cmd)
         info.expose_all_drives = 1;
     }
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
@@ -909,7 +909,7 @@ static int megasas_dcmd_get_fw_time(MegasasState *s, MegasasCmd *cmd)
 
     fw_time = cpu_to_le64(megasas_fw_time());
 
-    cmd->iov_size -= dma_buf_read(&fw_time, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&fw_time, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
@@ -936,7 +936,7 @@ static int megasas_event_info(MegasasState *s, MegasasCmd *cmd)
     info.shutdown_seq_num = cpu_to_le32(s->shutdown_event);
     info.boot_seq_num = cpu_to_le32(s->boot_event);
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
@@ -1005,7 +1005,7 @@ static int megasas_dcmd_pd_get_list(MegasasState *s, MegasasCmd *cmd)
     info.size = cpu_to_le32(offset);
     info.count = cpu_to_le32(num_pd_disks);
 
-    cmd->iov_size -= dma_buf_read(&info, offset, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, offset, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
@@ -1099,7 +1099,7 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
     info->connected_port_bitmap = 0x1;
     info->device_speed = 1;
     info->link_speed = 1;
-    resid = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg);
+    resid = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     g_free(cmd->iov_buf);
     cmd->iov_size = dcmd_size - resid;
     cmd->iov_buf = NULL;
@@ -1171,7 +1171,7 @@ static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
     info.ld_count = cpu_to_le32(num_ld_disks);
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg);
+    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     cmd->iov_size = dcmd_size - resid;
     return MFI_STAT_OK;
 }
@@ -1220,7 +1220,7 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
     info.size = dcmd_size;
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg);
+    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     cmd->iov_size = dcmd_size - resid;
     return MFI_STAT_OK;
 }
@@ -1270,7 +1270,7 @@ static int megasas_ld_get_info_submit(SCSIDevice *sdev, int lun,
     info->ld_config.span[0].num_blocks = info->size;
     info->ld_config.span[0].array_ref = cpu_to_le16(sdev_id);
 
-    resid = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg);
+    resid = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     g_free(cmd->iov_buf);
     cmd->iov_size = dcmd_size - resid;
     cmd->iov_buf = NULL;
@@ -1389,7 +1389,7 @@ static int megasas_dcmd_cfg_read(MegasasState *s, MegasasCmd *cmd)
         ld_offset += sizeof(struct mfi_ld_config);
     }
 
-    cmd->iov_size -= dma_buf_read(data, info->size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(data, info->size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
@@ -1419,7 +1419,7 @@ static int megasas_dcmd_get_properties(MegasasState *s, MegasasCmd *cmd)
     info.ecc_bucket_leak_rate = cpu_to_le16(1440);
     info.expose_encl_devices = 1;
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 64a506a3975..2b5e9dca311 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1421,7 +1421,7 @@ void scsi_req_data(SCSIRequest *req, int len)
 
     buf = scsi_req_get_buf(req);
     if (req->cmd.mode == SCSI_XFER_FROM_DEV) {
-        req->resid = dma_buf_read(buf, len, req->sg);
+        req->resid = dma_buf_read(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
     } else {
         req->resid = dma_buf_write(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
     }
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 2f1a241b81a..a391773c296 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -316,10 +316,9 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
     return resid;
 }
 
-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
+uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE,
-                      MEMTXATTRS_UNSPECIFIED);
+    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
 }
 
 uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
-- 
2.33.1


