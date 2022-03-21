Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E024E2EDF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 18:11:21 +0100 (CET)
Received: from localhost ([::1]:32882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLYu-0002Ye-0X
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 13:11:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLRc-0001o5-38
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:03:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLRZ-00058e-Bi
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:03:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647882224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0upps8tY1cLHXMGTy+y9F6CYKBwWu5MFTDgXAhLihq8=;
 b=ZT0/LwVo2jnQs5DMdbj7fKY2hXSYrUKAphoYEjF2GhyJYFyjUqL4Z82ukvNdc4ggz77bt5
 eaCPTsC0B8/hpaQlNMa1wKF0N/+3mO4lUhbJzmuTgKJV4RiOkGXA0CdmZs12z88tyAY0al
 7t6N6aq8jlcf6QgQnu8BOiXTMzfoqSA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-v5GTyKIaPR2y5cQPibnbGg-1; Mon, 21 Mar 2022 13:03:41 -0400
X-MC-Unique: v5GTyKIaPR2y5cQPibnbGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1968D1C0B042;
 Mon, 21 Mar 2022 17:03:40 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFBCE40D2821;
 Mon, 21 Mar 2022 17:03:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/8] hw/sd/sdhci: Honor failed DMA transactions
Date: Mon, 21 Mar 2022 18:03:18 +0100
Message-Id: <20220321170320.282496-7-thuth@redhat.com>
In-Reply-To: <20220321170320.282496-1-thuth@redhat.com>
References: <20220321170320.282496-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

DMA transactions might fail. The DMA API returns a MemTxResult,
indicating such failures. Do not ignore it. On failure, raise
the ADMA error flag and eventually triggering an IRQ (see spec
chapter 1.13.5: "ADMA2 States").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211215205656.488940-2-philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/sd/sdhci.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index e0bbc90344..fe2f21f0c3 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -742,6 +742,7 @@ static void sdhci_do_adma(SDHCIState *s)
     unsigned int begin, length;
     const uint16_t block_size = s->blksize & BLOCK_SIZE_MASK;
     ADMADescr dscr = {};
+    MemTxResult res;
     int i;
 
     if (s->trnmod & SDHC_TRNS_BLK_CNT_EN && !s->blkcnt) {
@@ -790,10 +791,13 @@ static void sdhci_do_adma(SDHCIState *s)
                         s->data_count = block_size;
                         length -= block_size - begin;
                     }
-                    dma_memory_write(s->dma_as, dscr.addr,
-                                     &s->fifo_buffer[begin],
-                                     s->data_count - begin,
-                                     MEMTXATTRS_UNSPECIFIED);
+                    res = dma_memory_write(s->dma_as, dscr.addr,
+                                           &s->fifo_buffer[begin],
+                                           s->data_count - begin,
+                                           MEMTXATTRS_UNSPECIFIED);
+                    if (res != MEMTX_OK) {
+                        break;
+                    }
                     dscr.addr += s->data_count - begin;
                     if (s->data_count == block_size) {
                         s->data_count = 0;
@@ -816,10 +820,13 @@ static void sdhci_do_adma(SDHCIState *s)
                         s->data_count = block_size;
                         length -= block_size - begin;
                     }
-                    dma_memory_read(s->dma_as, dscr.addr,
-                                    &s->fifo_buffer[begin],
-                                    s->data_count - begin,
-                                    MEMTXATTRS_UNSPECIFIED);
+                    res = dma_memory_read(s->dma_as, dscr.addr,
+                                          &s->fifo_buffer[begin],
+                                          s->data_count - begin,
+                                          MEMTXATTRS_UNSPECIFIED);
+                    if (res != MEMTX_OK) {
+                        break;
+                    }
                     dscr.addr += s->data_count - begin;
                     if (s->data_count == block_size) {
                         sdbus_write_data(&s->sdbus, s->fifo_buffer, block_size);
@@ -833,7 +840,16 @@ static void sdhci_do_adma(SDHCIState *s)
                     }
                 }
             }
-            s->admasysaddr += dscr.incr;
+            if (res != MEMTX_OK) {
+                if (s->errintstsen & SDHC_EISEN_ADMAERR) {
+                    trace_sdhci_error("Set ADMA error flag");
+                    s->errintsts |= SDHC_EIS_ADMAERR;
+                    s->norintsts |= SDHC_NIS_ERR;
+                }
+                sdhci_update_irq(s);
+            } else {
+                s->admasysaddr += dscr.incr;
+            }
             break;
         case SDHC_ADMA_ATTR_ACT_LINK:   /* link to next descriptor table */
             s->admasysaddr = dscr.addr;
-- 
2.27.0


