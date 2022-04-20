Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5133508482
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 11:09:30 +0200 (CEST)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh6L3-0003Vf-SQ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 05:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nh6Fo-0000jS-LU; Wed, 20 Apr 2022 05:04:06 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:51242 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nh6Fl-0001eB-Pq; Wed, 20 Apr 2022 05:04:03 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 681E3437E1;
 Wed, 20 Apr 2022 09:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1650445438; x=1652259839; bh=oEIwg/t6jcEJQ3VmD7U4uXuxt9llDvFarwr
 +dLCahes=; b=a5KKhQexDbZbI9ARQg/DrY1EYyp04Vvd6CbEbK80iesxXlOdfxu
 Bl+OBygnYB2iQpJjElt81OJD/Y8LWoA24ueJTz4rlIuSkvtw8oCHkg/lJqNWVdDF
 grpxJOGalSTJ8/N+RbmWTuVHSRAJ2Cno67CTrncYWFGt7Ck9t/hS7X2c=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zUIm6GqpXoIV; Wed, 20 Apr 2022 12:03:58 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id F089A45968;
 Wed, 20 Apr 2022 12:03:57 +0300 (MSK)
Received: from localhost.yadro.com (10.178.113.54) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 20
 Apr 2022 12:03:56 +0300
From: Dmitry Tikhov <d.tihov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 1/2] hw/nvme: refactor check of disabled dif
Date: Wed, 20 Apr 2022 12:03:35 +0300
Message-ID: <20220420090336.10124-2-d.tihov@yadro.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420090336.10124-1-d.tihov@yadro.com>
References: <20220420090336.10124-1-d.tihov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.178.113.54]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=d.tihov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kbusch@kernel.org, its@irrelevant.dk, ddtikhov@gmail.com,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move to a separate function code determining whether protection checking
in end-to-end data protection enabled namespace should be done.
Currently this code is used only in nvme_dif_prchk_crc16 and
nvme_dif_prchk_crc64 functions.

Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
---
 hw/nvme/dif.c        | 121 ++++++++++++++++++++++++++++---------------
 hw/nvme/dif.h        |   1 +
 hw/nvme/trace-events |   4 +-
 3 files changed, 83 insertions(+), 43 deletions(-)

diff --git a/hw/nvme/dif.c b/hw/nvme/dif.c
index 63c44c86ab..0f65687396 100644
--- a/hw/nvme/dif.c
+++ b/hw/nvme/dif.c
@@ -60,6 +60,75 @@ static uint64_t crc64_nvme(uint64_t crc, const unsigned char *buffer,
     return crc ^ (uint64_t)~0;
 }
 
+static bool nvme_dif_is_disabled_crc16(NvmeNamespace *ns, NvmeDifTuple *dif)
+{
+    switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+    case NVME_ID_NS_DPS_TYPE_3:
+        if (be32_to_cpu(dif->g16.reftag) != 0xffffffff) {
+            break;
+        }
+
+        /* fallthrough */
+    case NVME_ID_NS_DPS_TYPE_1:
+    case NVME_ID_NS_DPS_TYPE_2:
+        if (be16_to_cpu(dif->g16.apptag) != 0xffff) {
+            break;
+        }
+
+        trace_pci_nvme_dif_is_disabled_crc16(be16_to_cpu(dif->g16.apptag),
+                                             be32_to_cpu(dif->g16.reftag));
+
+        return true;
+    }
+
+    return false;
+}
+
+static bool nvme_dif_is_disabled_crc64(NvmeNamespace *ns, NvmeDifTuple *dif)
+{
+    uint64_t r = 0;
+
+    r |= (uint64_t)dif->g64.sr[0] << 40;
+    r |= (uint64_t)dif->g64.sr[1] << 32;
+    r |= (uint64_t)dif->g64.sr[2] << 24;
+    r |= (uint64_t)dif->g64.sr[3] << 16;
+    r |= (uint64_t)dif->g64.sr[4] << 8;
+    r |= (uint64_t)dif->g64.sr[5];
+
+    switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+    case NVME_ID_NS_DPS_TYPE_3:
+        if (r != 0xffffffffffff) {
+            break;
+        }
+
+        /* fallthrough */
+    case NVME_ID_NS_DPS_TYPE_1:
+    case NVME_ID_NS_DPS_TYPE_2:
+        if (be16_to_cpu(dif->g64.apptag) != 0xffff) {
+            break;
+        }
+
+        trace_pci_nvme_dif_is_disabled_crc64(be16_to_cpu(dif->g16.apptag),
+                                             r);
+
+        return true;
+    }
+
+    return false;
+}
+
+bool nvme_dif_is_disabled(NvmeNamespace *ns, NvmeDifTuple *dif)
+{
+    switch (ns->pif) {
+    case NVME_PI_GUARD_16:
+        return nvme_dif_is_disabled_crc16(ns, dif);
+    case NVME_PI_GUARD_64:
+        return nvme_dif_is_disabled_crc64(ns, dif);
+    default:
+        abort();
+    }
+}
+
 static void nvme_dif_pract_generate_dif_crc16(NvmeNamespace *ns, uint8_t *buf,
                                               size_t len, uint8_t *mbuf,
                                               size_t mlen, uint16_t apptag,
@@ -155,22 +224,7 @@ static uint16_t nvme_dif_prchk_crc16(NvmeNamespace *ns, NvmeDifTuple *dif,
                                      uint8_t prinfo, uint16_t apptag,
                                      uint16_t appmask, uint64_t reftag)
 {
-    switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
-    case NVME_ID_NS_DPS_TYPE_3:
-        if (be32_to_cpu(dif->g16.reftag) != 0xffffffff) {
-            break;
-        }
-
-        /* fallthrough */
-    case NVME_ID_NS_DPS_TYPE_1:
-    case NVME_ID_NS_DPS_TYPE_2:
-        if (be16_to_cpu(dif->g16.apptag) != 0xffff) {
-            break;
-        }
-
-        trace_pci_nvme_dif_prchk_disabled_crc16(be16_to_cpu(dif->g16.apptag),
-                                                be32_to_cpu(dif->g16.reftag));
-
+    if (nvme_dif_is_disabled_crc16(ns, dif)) {
         return NVME_SUCCESS;
     }
 
@@ -214,31 +268,7 @@ static uint16_t nvme_dif_prchk_crc64(NvmeNamespace *ns, NvmeDifTuple *dif,
                                      uint8_t prinfo, uint16_t apptag,
                                      uint16_t appmask, uint64_t reftag)
 {
-    uint64_t r = 0;
-
-    r |= (uint64_t)dif->g64.sr[0] << 40;
-    r |= (uint64_t)dif->g64.sr[1] << 32;
-    r |= (uint64_t)dif->g64.sr[2] << 24;
-    r |= (uint64_t)dif->g64.sr[3] << 16;
-    r |= (uint64_t)dif->g64.sr[4] << 8;
-    r |= (uint64_t)dif->g64.sr[5];
-
-    switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
-    case NVME_ID_NS_DPS_TYPE_3:
-        if (r != 0xffffffffffff) {
-            break;
-        }
-
-        /* fallthrough */
-    case NVME_ID_NS_DPS_TYPE_1:
-    case NVME_ID_NS_DPS_TYPE_2:
-        if (be16_to_cpu(dif->g64.apptag) != 0xffff) {
-            break;
-        }
-
-        trace_pci_nvme_dif_prchk_disabled_crc64(be16_to_cpu(dif->g16.apptag),
-                                                r);
-
+    if (nvme_dif_is_disabled_crc64(ns, dif)) {
         return NVME_SUCCESS;
     }
 
@@ -266,6 +296,15 @@ static uint16_t nvme_dif_prchk_crc64(NvmeNamespace *ns, NvmeDifTuple *dif,
     }
 
     if (prinfo & NVME_PRINFO_PRCHK_REF) {
+        uint64_t r = 0;
+
+        r |= (uint64_t)dif->g64.sr[0] << 40;
+        r |= (uint64_t)dif->g64.sr[1] << 32;
+        r |= (uint64_t)dif->g64.sr[2] << 24;
+        r |= (uint64_t)dif->g64.sr[3] << 16;
+        r |= (uint64_t)dif->g64.sr[4] << 8;
+        r |= (uint64_t)dif->g64.sr[5];
+
         trace_pci_nvme_dif_prchk_reftag_crc64(r, reftag);
 
         if (r != reftag) {
diff --git a/hw/nvme/dif.h b/hw/nvme/dif.h
index f12e312250..fe1e5828d7 100644
--- a/hw/nvme/dif.h
+++ b/hw/nvme/dif.h
@@ -186,6 +186,7 @@ uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
                         uint8_t *mbuf, size_t mlen, uint8_t prinfo,
                         uint64_t slba, uint16_t apptag,
                         uint16_t appmask, uint64_t *reftag);
+bool nvme_dif_is_disabled(NvmeNamespace *ns, NvmeDifTuple *dif);
 uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req);
 
 #endif /* HW_NVME_DIF_H */
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index ff1b458969..c4e75b1f5d 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -23,8 +23,8 @@ pci_nvme_dif_rw_check_cb(uint16_t cid, uint8_t prinfo, uint16_t apptag, uint16_t
 pci_nvme_dif_pract_generate_dif_crc16(size_t len, size_t lba_size, size_t chksum_len, uint16_t apptag, uint32_t reftag) "len %zu lba_size %zu chksum_len %zu apptag 0x%"PRIx16" reftag 0x%"PRIx32""
 pci_nvme_dif_pract_generate_dif_crc64(size_t len, size_t lba_size, size_t chksum_len, uint16_t apptag, uint64_t reftag) "len %zu lba_size %zu chksum_len %zu apptag 0x%"PRIx16" reftag 0x%"PRIx64""
 pci_nvme_dif_check(uint8_t prinfo, uint16_t chksum_len) "prinfo 0x%"PRIx8" chksum_len %"PRIu16""
-pci_nvme_dif_prchk_disabled_crc16(uint16_t apptag, uint32_t reftag) "apptag 0x%"PRIx16" reftag 0x%"PRIx32""
-pci_nvme_dif_prchk_disabled_crc64(uint16_t apptag, uint64_t reftag) "apptag 0x%"PRIx16" reftag 0x%"PRIx64""
+pci_nvme_dif_is_disabled_crc16(uint16_t apptag, uint32_t reftag) "apptag 0x%"PRIx16" reftag 0x%"PRIx32""
+pci_nvme_dif_is_disabled_crc64(uint16_t apptag, uint64_t reftag) "apptag 0x%"PRIx16" reftag 0x%"PRIx64""
 pci_nvme_dif_prchk_guard_crc16(uint16_t guard, uint16_t crc) "guard 0x%"PRIx16" crc 0x%"PRIx16""
 pci_nvme_dif_prchk_guard_crc64(uint64_t guard, uint64_t crc) "guard 0x%"PRIx64" crc 0x%"PRIx64""
 pci_nvme_dif_prchk_apptag(uint16_t apptag, uint16_t elbat, uint16_t elbatm) "apptag 0x%"PRIx16" elbat 0x%"PRIx16" elbatm 0x%"PRIx16""
-- 
2.35.1


