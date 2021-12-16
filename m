Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165DA47722A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:49:39 +0100 (CET)
Received: from localhost ([::1]:47960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqCY-0000bi-3n
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:49:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxq00-0001pr-JE
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxpzy-0004aW-OI
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639658196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DJOlGMJ8joo1eoi16SCW57KA4jcS7ihdPt8j7gpCvZc=;
 b=EobEXaJkXII75oPQXBQaU36JJKz3QWC3d3iiu6I6lCI9LxN+10cQHEWv3gi3LNzSvOsoGe
 pj8bTZY4JpTo78x1A9NgvsBkaOkTfA2jLWGprcNxaXLmMxeziv5tuHInjuEDwxwxKKa+2q
 1e28DLcjVibJA5yfYOvcPz295sfhmTQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-_X1kbXp4P_OwyrLj1Q9V_Q-1; Thu, 16 Dec 2021 07:36:34 -0500
X-MC-Unique: _X1kbXp4P_OwyrLj1Q9V_Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so13753611wme.6
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 04:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DJOlGMJ8joo1eoi16SCW57KA4jcS7ihdPt8j7gpCvZc=;
 b=zraBCfXDAobMF/vS4JOTtKVYXI8egeZiIk2sVZDplbYnst0Eu51a/e2swCvclA/4i9
 8ccmUjChVSZs9sMi+Yl9mhhkePyD/E/qhPp3MPy+Msr6BwG/VnBaAJWSbunmicnUUr2X
 YGaY91TLjRYJrNRuPIKyNkdXfbctRwkH7CuWebCQ/KZP5J7PcNrvs62fVzIHI1guLXpX
 F5df8UJmahU23wdI2+mFKGljrNw+4MSICVHYH/1Wk9XzjvMUUL2fnEp/zWhloKW6NEMJ
 cVipsQqTU8hCGdSqUVOx/qUfKxaMFenFuZXCGfYL+X4i6NhGIKffs+FvLyuoxZxJ8Z8T
 1CBA==
X-Gm-Message-State: AOAM5324blyISjnsRyFAq9LncGI8PZjQUP1MbV/f9RIfGZNZwaq7kTM5
 11vXICJUPNwUjqamSAcpcuwipChO2YQwvoslrftXTiLYLuQJ4GronMkYOnazuVXSvl6VPPFI8qD
 7C+AYJgsbJq10Dy/7X/RuTtB7NJfQBqonIYZ8+wP4njPQS/Cjr4G+epD8I3HjnROn
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr8540376wrt.419.1639658192568; 
 Thu, 16 Dec 2021 04:36:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSDBKDeGjUklSDVRLHz0YFdo5VUaWto4832aGBcJ9AaQgYEpZE9dVFYOq/UcG9o9tMFyASeg==
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr8540342wrt.419.1639658192274; 
 Thu, 16 Dec 2021 04:36:32 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m9sm4764559wmq.1.2021.12.16.04.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 04:36:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] dma: Let dma_buf_write() take MemTxAttrs argument
Date: Thu, 16 Dec 2021 13:35:55 +0100
Message-Id: <20211216123558.799425-6-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
dma_buf_write().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h  | 2 +-
 hw/ide/ahci.c         | 6 ++++--
 hw/nvme/ctrl.c        | 3 ++-
 hw/scsi/megasas.c     | 2 +-
 hw/scsi/scsi-bus.c    | 2 +-
 softmmu/dma-helpers.c | 5 ++---
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 2721bf296a8..c5f45f6c594 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -304,7 +304,7 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
                           QEMUSGList *sg, uint64_t offset, uint32_t align,
                           BlockCompletionFunc *cb, void *opaque);
 uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg);
-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg);
+uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
                     QEMUSGList *sg, enum BlockAcctType type);
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 8e77ddb660f..079d2977f23 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1381,8 +1381,10 @@ static void ahci_pio_transfer(const IDEDMA *dma)
                             has_sglist ? "" : "o");
 
     if (has_sglist && size) {
+        const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+
         if (is_write) {
-            dma_buf_write(s->data_ptr, size, &s->sg);
+            dma_buf_write(s->data_ptr, size, &s->sg, attrs);
         } else {
             dma_buf_read(s->data_ptr, size, &s->sg);
         }
@@ -1479,7 +1481,7 @@ static int ahci_dma_rw_buf(const IDEDMA *dma, bool is_write)
     if (is_write) {
         dma_buf_read(p, l, &s->sg);
     } else {
-        dma_buf_write(p, l, &s->sg);
+        dma_buf_write(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
     }
 
     /* free sglist, update byte count */
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5f573c417b3..e1a531d5d6c 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1146,10 +1146,11 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
     assert(sg->flags & NVME_SG_ALLOC);
 
     if (sg->flags & NVME_SG_DMA) {
+        const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
         uint64_t residual;
 
         if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
-            residual = dma_buf_write(ptr, len, &sg->qsg);
+            residual = dma_buf_write(ptr, len, &sg->qsg, attrs);
         } else {
             residual = dma_buf_read(ptr, len, &sg->qsg);
         }
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 733ca8e9865..4ec104b7820 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1464,7 +1464,7 @@ static int megasas_dcmd_set_properties(MegasasState *s, MegasasCmd *cmd)
                                             dcmd_size);
         return MFI_STAT_INVALID_PARAMETER;
     }
-    dma_buf_write(&info, dcmd_size, &cmd->qsg);
+    dma_buf_write(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     trace_megasas_dcmd_unsupported(cmd->index, cmd->iov_size);
     return MFI_STAT_OK;
 }
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 77325d8cc7a..64a506a3975 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1423,7 +1423,7 @@ void scsi_req_data(SCSIRequest *req, int len)
     if (req->cmd.mode == SCSI_XFER_FROM_DEV) {
         req->resid = dma_buf_read(buf, len, req->sg);
     } else {
-        req->resid = dma_buf_write(buf, len, req->sg);
+        req->resid = dma_buf_write(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
     }
     scsi_req_continue(req);
 }
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index fa81d2b386c..2f1a241b81a 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -322,10 +322,9 @@ uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
                       MEMTXATTRS_UNSPECIFIED);
 }
 
-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
+uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE,
-                      MEMTXATTRS_UNSPECIFIED);
+    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE, attrs);
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.33.1


