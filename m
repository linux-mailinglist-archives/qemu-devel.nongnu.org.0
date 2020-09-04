Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1E025DB5F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 16:21:59 +0200 (CEST)
Received: from localhost ([::1]:59320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kECbG-0004Sk-Dj
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 10:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kECa0-0002RK-LB; Fri, 04 Sep 2020 10:20:40 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kECZy-0002ia-UN; Fri, 04 Sep 2020 10:20:40 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 01C49BFA7A;
 Fri,  4 Sep 2020 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1599229233;
 bh=x5rI1HWixO9M3U5Sx5ljE1KG3wqn4Or/3ScwW+wMAzc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eh7ZDZbiwq8glXSnUVwUhnWjtI6V+OjLIMxHs9v0j3en+gDx5kPi1q3VhLsnHpnER
 p3pXEO+aeKQKkijRSq6w0THFuZDRZYynjDyjYahvIKCvrPrrKhplXfvuu9SbdHpb2t
 EJHm/dLdNfyIMRI8lFAZ1HyabGdqL8cD2aGNZ12RowWDOB4eSIFP5+3UpEOKaO0vsP
 WkdTObRy7mv/G7KTrjszHtsXv+b8IQFHxT33eDpyvHvxHyRGJvwr+GWJgJRDWKG4Xh
 jvjS9J4jS9bJvzxOQ77IU8a0obiCRnJeQZAHleljbSRUOWYrj3x28P4ZJaGBH/nkUP
 qt3485TbdM5Rw==
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/17] hw/block/nvme: add a lba to bytes helper
Date: Fri,  4 Sep 2020 16:19:44 +0200
Message-Id: <20200904141956.576630-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904141956.576630-1-its@irrelevant.dk>
References: <20200904141956.576630-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 10:20:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add the nvme_l2b helper and use it for converting NLB and SLBA to byte
counts and offsets.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 12 ++++--------
 hw/block/nvme.h |  6 ++++++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 88b4e6288bea..08f824dd807d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -644,12 +644,10 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
-    const uint8_t lba_index = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
-    const uint8_t data_shift = ns->id_ns.lbaf[lba_index].ds;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb  = le16_to_cpu(rw->nlb) + 1;
-    uint64_t offset = slba << data_shift;
-    uint32_t count = nlb << data_shift;
+    uint64_t offset = nvme_l2b(ns, slba);
+    uint32_t count = nvme_l2b(ns, nlb);
     uint16_t status;
 
     trace_pci_nvme_write_zeroes(nvme_cid(req), slba, nlb);
@@ -674,10 +672,8 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
     uint32_t nlb  = le32_to_cpu(rw->nlb) + 1;
     uint64_t slba = le64_to_cpu(rw->slba);
 
-    uint8_t lba_index  = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
-    uint8_t data_shift = ns->id_ns.lbaf[lba_index].ds;
-    uint64_t data_size = (uint64_t)nlb << data_shift;
-    uint64_t data_offset = slba << data_shift;
+    uint64_t data_size = nvme_l2b(ns, nlb);
+    uint64_t data_offset = nvme_l2b(ns, slba);
     int is_write = rw->opcode == NVME_CMD_WRITE ? 1 : 0;
     enum BlockAcctType acct = is_write ? BLOCK_ACCT_WRITE : BLOCK_ACCT_READ;
     uint16_t status;
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 52ba794f2e9a..1675c1e0755c 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -77,6 +77,12 @@ static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
     return nvme_ns_lbaf(ns)->ds;
 }
 
+/* convert an LBA to the equivalent in bytes */
+static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
+{
+    return lba << nvme_ns_lbads(ns);
+}
+
 #define TYPE_NVME "nvme"
 #define NVME(obj) \
         OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
-- 
2.28.0


