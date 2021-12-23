Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD76647E33C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:30:03 +0100 (CET)
Received: from localhost ([::1]:41212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0NEQ-00082z-Hu
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:30:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MkA-0001hj-He
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:58:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mk6-0000ui-E5
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjVcgLU0BnvWgwNGKBTyX6uz4VKITDXHkj90FQKH/Ds=;
 b=b0qoaVkz3L7YKfi58A+6Ch8J0A3IP0bkvEjogTiDDADsd6Fnk8SouZnb6Zdqhz5w3CCBm0
 mHPy1cul/SnAbjjR1gtds5HyEcw/MxlyXDm5TuTJKHxhx91FiwnlzTT/W18Vc5FyHQzO5+
 T/SKACQopDASr11PaCK26kUtfFhi6DU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-mgIrceFyMTqqpW4gbpsRmQ-1; Thu, 23 Dec 2021 06:58:40 -0500
X-MC-Unique: mgIrceFyMTqqpW4gbpsRmQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 s23-20020adf9797000000b001a24674f0f7so1222346wrb.9
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gjVcgLU0BnvWgwNGKBTyX6uz4VKITDXHkj90FQKH/Ds=;
 b=QYkzGzVc6FYSAF+19DhblfgpjDDdqfgl3bMRmnkfqkMNjMJ3b4LdE2cP4HHMrA6gXT
 sz/3F24IRAftAVPMCF7VcJVWtvnI19gBS1V2apvlumsQoOMOG7iQuY3YQqvYIjF2iXcg
 /K7lU/nm+4CWB5aAt3QHvKPAML/AUVgNM81i1FDEJYVCu0tTrzKcSoALMxjPLiiqLAnd
 bA4ABw+OOiH+0czD4wA0lpbePu72DwK+Zuf7wdw+zLXOK57QvQWat0dFO/zH1R5fIJaX
 95spgS677CZYXN0gc39e0xnnNJXFNBuS6TDLYX56vZMMVL8pkw6YpGC9L9LbJVNbQPxP
 Fkrg==
X-Gm-Message-State: AOAM533estM73HMGG2/zeJmCSGiWoEm6V/5YOTbbVzohdUzfW5it2buH
 FJffrWsMDpFZa9CCqCBxz8GAeO2ont7MSXkv9QxGAP5mIJuTrOqxv6XDC30Vj9m4qhe/XYRBXlA
 9AcUReyY59Bv2PIP6B9kNYUhllSN1rzLyOUDEAbhVQWiPThfCnxPdvtwUUCYto8EG
X-Received: by 2002:a5d:6989:: with SMTP id g9mr1503534wru.12.1640260718958;
 Thu, 23 Dec 2021 03:58:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBFwsZIXFfAblixbF8BoDE4+EiE/hnMHk6jR/7GpOkCKFeYGbesya6UFj3EsKgkD884hiAXA==
X-Received: by 2002:a5d:6989:: with SMTP id g9mr1503479wru.12.1640260718678;
 Thu, 23 Dec 2021 03:58:38 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id bd8sm4281783wmb.44.2021.12.23.03.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:58:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/23] dma: Let dma_buf_write() take MemTxAttrs argument
Date: Thu, 23 Dec 2021 12:55:42 +0100
Message-Id: <20211223115554.3155328-12-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
References: <20211223115554.3155328-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling
dma_buf_write().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
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
index 0d5b836013d..e3dd74a9c4f 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -303,7 +303,7 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
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
index dc28302f96d..da1c88167ee 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1465,7 +1465,7 @@ static int megasas_dcmd_set_properties(MegasasState *s, MegasasCmd *cmd)
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


