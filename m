Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30523276E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 00:12:34 +0200 (CEST)
Received: from localhost ([::1]:34778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0uJN-0007bz-Vo
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 18:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0uED-0007i2-4u; Wed, 29 Jul 2020 18:07:13 -0400
Received: from charlie.dont.surf ([128.199.63.193]:34750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0uE9-00005S-Sx; Wed, 29 Jul 2020 18:07:12 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 73821BFCD9;
 Wed, 29 Jul 2020 22:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1596060406;
 bh=qTyhklrZu762Q/Is/xOIluIjK97MW6jku9v2Mt0zX/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RwsAA6SNyRMV/o99xKq7rXffI7DBHPfcLUQDc8vR0kld3JnELcfph/rwGsQXKk9if
 UOyxOh6T04N/+17KP7snPRsH3oikXkgAIxI+LthsWKT3n1EH5Jfix1JFIGl+sxzxu2
 IMgocN9HeS/0xWzlrqk63S/7gWA+69ms6zYoFoKb9xASkwxAEek96wG6x2zEd/SI69
 anw65M/9qhjqz0HcmEpTA5NWJrlC3YYpWVH4c3mkHGWs6F5cVHNIq8JIKdR1X6PcRW
 4OokKiuOZ/qyCM3BY5NZe7HOXCKlVORDaXsPvqzi78PcQo4cc/wtM7Oi9NNA083qk8
 ig4b9k1GBbyWA==
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/16] hw/block/nvme: verify validity of prp lists in the
 cmb
Date: Thu, 30 Jul 2020 00:06:31 +0200
Message-Id: <20200729220638.344477-10-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729220638.344477-1-its@irrelevant.dk>
References: <20200729220638.344477-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 14:23:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Before this patch the device already supported PRP lists in the CMB, but
it did not check for the validity of it nor announced the support in the
Identify Controller data structure LISTS field.

If some of the PRPs in a PRP list are in the CMB, then ALL entries must
be there. This patch makes sure that requirement is verified as well as
properly announcing support for PRP lists in the CMB.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 198a26890e0c..45e4060d52d9 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -273,6 +273,7 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
     trans_len = MIN(len, trans_len);
     int num_prps = (len >> n->page_bits) + 1;
     uint16_t status;
+    bool prp_list_in_cmb = false;
 
     trace_pci_nvme_map_prp(trans_len, len, prp1, prp2, num_prps);
 
@@ -299,11 +300,16 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
             status = NVME_INVALID_FIELD | NVME_DNR;
             goto unmap;
         }
+
         if (len > n->page_size) {
             uint64_t prp_list[n->max_prp_ents];
             uint32_t nents, prp_trans;
             int i = 0;
 
+            if (nvme_addr_is_cmb(n, prp2)) {
+                prp_list_in_cmb = true;
+            }
+
             nents = (len + n->page_size - 1) >> n->page_bits;
             prp_trans = MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
             nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
@@ -317,6 +323,11 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
                         goto unmap;
                     }
 
+                    if (prp_list_in_cmb != nvme_addr_is_cmb(n, prp_ent)) {
+                        status = NVME_INVALID_USE_OF_CMB | NVME_DNR;
+                        goto unmap;
+                    }
+
                     i = 0;
                     nents = (len + n->page_size - 1) >> n->page_bits;
                     prp_trans = MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
@@ -336,6 +347,7 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
                 if (status) {
                     goto unmap;
                 }
+
                 len -= trans_len;
                 i++;
             }
@@ -2153,7 +2165,7 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
     NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
     NVME_CMBSZ_SET_CQS(n->bar.cmbsz, 0);
-    NVME_CMBSZ_SET_LISTS(n->bar.cmbsz, 0);
+    NVME_CMBSZ_SET_LISTS(n->bar.cmbsz, 1);
     NVME_CMBSZ_SET_RDS(n->bar.cmbsz, 1);
     NVME_CMBSZ_SET_WDS(n->bar.cmbsz, 1);
     NVME_CMBSZ_SET_SZU(n->bar.cmbsz, 2); /* MBs */
-- 
2.27.0


