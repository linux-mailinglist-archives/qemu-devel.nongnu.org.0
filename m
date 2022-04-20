Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B48F508481
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 11:09:29 +0200 (CEST)
Received: from localhost ([::1]:56782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh6L2-0003Tj-09
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 05:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nh6Fo-0000jR-Lz; Wed, 20 Apr 2022 05:04:06 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:51260 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nh6Fm-0001eE-Ft; Wed, 20 Apr 2022 05:04:04 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id BBBEB45968;
 Wed, 20 Apr 2022 09:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1650445439; x=1652259840; bh=R8YQcsiORkAxKQC8mN3WQNntuJEXmRFPZ5k
 /sD78hew=; b=p1GK/3OCESJtnM/TqUUUtnRQs8dcb+ahHGd7tG/ML6SpNs9tTcq
 08RTcCsf5nkfI0n5WwuUdY7xXrQ9FS6ehVS+39i8JlS7fqbP73gUaS24lRqiJXl7
 uLTaap/ho4uyi5ScqLzDbz8iWhlHQnc9JYfHu0pq25806o1hfFc816GA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-8Zizt8tskT; Wed, 20 Apr 2022 12:03:59 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C46AE45969;
 Wed, 20 Apr 2022 12:03:58 +0300 (MSK)
Received: from localhost.yadro.com (10.178.113.54) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 20
 Apr 2022 12:03:57 +0300
From: Dmitry Tikhov <d.tihov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 2/2] hw/nvme: fix copy cmd for pi enabled namespaces
Date: Wed, 20 Apr 2022 12:03:36 +0300
Message-ID: <20220420090336.10124-3-d.tihov@yadro.com>
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

Current implementation have two problems:
First in the read part of copy command. Because there is no metadata
mangling before nvme_dif_check invocation, reftag error is thrown for
blocks of namespace that have not been previously written to.
Second in the write part. Reftag in the protection information section
of the source metadata should not be copied as is to the destination.
Source range start lba and destination range start lba could differ so
recalculation of reftag is always needed.

Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
---
 hw/nvme/ctrl.c |  5 ++++
 hw/nvme/dif.c  | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/nvme/dif.h  |  2 ++
 3 files changed, 72 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 74540a03d5..cb493f4506 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2787,6 +2787,10 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
         size_t mlen = nvme_m2b(ns, nlb);
         uint8_t *mbounce = iocb->bounce + nvme_l2b(ns, nlb);
 
+        status = nvme_dif_mangle_mdata(ns, mbounce, mlen, reftag);
+        if (status) {
+            goto invalid;
+        }
         status = nvme_dif_check(ns, iocb->bounce, len, mbounce, mlen, prinfor,
                                 slba, apptag, appmask, &reftag);
         if (status) {
@@ -2805,6 +2809,7 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
             nvme_dif_pract_generate_dif(ns, iocb->bounce, len, mbounce, mlen,
                                         apptag, &iocb->reftag);
         } else {
+            nvme_dif_restore_reftag(ns, mbounce, mlen, iocb->reftag);
             status = nvme_dif_check(ns, iocb->bounce, len, mbounce, mlen,
                                     prinfow, iocb->slba, apptag, appmask,
                                     &iocb->reftag);
diff --git a/hw/nvme/dif.c b/hw/nvme/dif.c
index 0f65687396..f29c5893e2 100644
--- a/hw/nvme/dif.c
+++ b/hw/nvme/dif.c
@@ -385,6 +385,71 @@ uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
     return NVME_SUCCESS;
 }
 
+static void nvme_dif_restore_reftag_crc16(NvmeNamespace *ns, uint8_t *mbuf,
+                                          size_t mlen, uint64_t reftag,
+                                          int16_t pil)
+{
+    uint8_t *mbufp, *end = mbuf + mlen;
+
+    for (mbufp = mbuf; mbufp < end; mbufp += ns->lbaf.ms) {
+        NvmeDifTuple *dif = (NvmeDifTuple *)(mbufp + pil);
+
+        if (!nvme_dif_is_disabled_crc16(ns, dif)) {
+            dif->g16.reftag = cpu_to_be32(reftag++);
+        }
+
+    }
+
+    return;
+}
+
+static void nvme_dif_restore_reftag_crc64(NvmeNamespace *ns, uint8_t *mbuf,
+                                          size_t mlen, uint64_t reftag,
+                                          int16_t pil)
+{
+    uint8_t *mbufp, *end = mbuf + mlen;
+
+    for (mbufp = mbuf; mbufp < end; mbufp += ns->lbaf.ms) {
+        NvmeDifTuple *dif = (NvmeDifTuple *)(mbufp + pil);
+
+        if (!nvme_dif_is_disabled_crc64(ns, dif)) {
+            dif->g64.sr[0] = reftag >> 40;
+            dif->g64.sr[1] = reftag >> 32;
+            dif->g64.sr[2] = reftag >> 24;
+            dif->g64.sr[3] = reftag >> 16;
+            dif->g64.sr[4] = reftag >> 8;
+            dif->g64.sr[5] = reftag;
+
+            reftag++;
+        }
+
+    }
+
+    return;
+}
+
+void nvme_dif_restore_reftag(NvmeNamespace *ns, uint8_t *mbuf,
+                             size_t mlen, uint64_t reftag)
+{
+    int16_t pil = 0;
+
+    if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
+        pil = ns->lbaf.ms - nvme_pi_tuple_size(ns);
+    }
+
+    switch (ns->pif) {
+    case NVME_PI_GUARD_16:
+        nvme_dif_restore_reftag_crc16(ns, mbuf, mlen, reftag, pil);
+        return;
+    case NVME_PI_GUARD_64:
+        nvme_dif_restore_reftag_crc64(ns, mbuf, mlen, reftag, pil);
+        return;
+    default:
+        abort();
+    }
+
+}
+
 uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
                                uint64_t slba)
 {
diff --git a/hw/nvme/dif.h b/hw/nvme/dif.h
index fe1e5828d7..3203837658 100644
--- a/hw/nvme/dif.h
+++ b/hw/nvme/dif.h
@@ -186,6 +186,8 @@ uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
                         uint8_t *mbuf, size_t mlen, uint8_t prinfo,
                         uint64_t slba, uint16_t apptag,
                         uint16_t appmask, uint64_t *reftag);
+void nvme_dif_restore_reftag(NvmeNamespace *ns, uint8_t *mbuf,
+                             size_t mlen, uint64_t reftag);
 bool nvme_dif_is_disabled(NvmeNamespace *ns, NvmeDifTuple *dif);
 uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req);
 
-- 
2.35.1


