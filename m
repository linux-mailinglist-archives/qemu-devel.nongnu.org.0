Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99AE3A7618
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 06:48:20 +0200 (CEST)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt0zr-0003Yr-So
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 00:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lt0yc-0002XL-Ex
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:47:02 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:60086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lt0ya-0004gc-6d
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:47:02 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210615044655epoutp01c20354b3e5a41deef6ae9b014cad3cac~IqAdQR5WS0329103291epoutp01r
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 04:46:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210615044655epoutp01c20354b3e5a41deef6ae9b014cad3cac~IqAdQR5WS0329103291epoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1623732415;
 bh=r8MhUiqlGxT/oQk4UxWoCgzqcKWMkpVwjQkm1cwu83g=;
 h=From:To:Cc:Subject:Date:References:From;
 b=WkKhwmtWyGNk7hotNqb1isfXl56ZX6fbB7TMWPHnKOppD8I4YbhY2jreVz5b8ZDxd
 8FUcBMCOaedBvyMF2FZCWHuyWvAsvBZc7ethWD+snQzPrW6IvMHGwGs8XhBH2au69e
 2q7O+7nvbpkXXxrhwW2Swmz/Yc9a3BW0JyhMuSQU=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210615044654epcas5p22b3052d65414b9837183af16123ac78d~IqAc8a0nA2137721377epcas5p2u;
 Tue, 15 Jun 2021 04:46:54 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 17.60.09835.EB038C06; Tue, 15 Jun 2021 13:46:54 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20210614163337epcas5p2b9518d7f78fc59bc61361bab99f40f70~IgANAtihA1797717977epcas5p2A;
 Mon, 14 Jun 2021 16:33:37 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210614163337epsmtrp10f56882f85fe4f3f49fbe28590e4971b~IgAM_Z1sk2093220932epsmtrp1V;
 Mon, 14 Jun 2021 16:33:37 +0000 (GMT)
X-AuditID: b6c32a4b-7c9ff7000000266b-e3-60c830bee178
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 89.43.08163.0E487C06; Tue, 15 Jun 2021 01:33:36 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210614163335epsmtip2adba47946be5d64ccf5a8d62bc27801a~IgALmZw0z2875828758epsmtip2W;
 Mon, 14 Jun 2021 16:33:35 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] hw/nvme: fix endianess conversion and add controller
 list
Date: Mon, 14 Jun 2021 21:59:26 +0530
Message-Id: <20210614162927.10515-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7bCmpu4+gxMJBqt3Klm83nmc2eLK/vOM
 FvsPfmO1mHToGqPFkoupFvNuKVvMetfOZnG8dweLxetJ/1kdOD1+nGtn8zi34zy7x6ZVnWwe
 T65tZvJ4v+8qm0ffllWMAWxRXDYpqTmZZalF+nYJXBlfflxmKjirXNF35h5zA+Nz6S5GTg4J
 AROJmU9ns3UxcnEICexmlGi5dJENJCEk8IlRYtMTX4jEZ0aJ/V0X2WE67s5YxQSR2MUo0bZr
 CZTTySRxq/UOK0gVm4CRxOy3bxhBbBEBSYnfXaeZQWxmkB3f5uqA2MICwRJPt58Gq2ERUJWY
 9nEiC4jNK2Ar8X7DL0aIbfISqzccYAZZICFwjF1i0bKPrBAJF4k77f0sELawxKvjW6DOk5J4
 2d8GZLMD2dUSh4sgWjsYJY5d3sAGUWIv8e/ZNKD5HED3aEqs36UPEZaVmHpqHRPEmXwSvb+f
 MEHEeSV2zIOx1SQW3PoOtUlGYuaf21DXeEh09axhh4RcrMTbNX2sExhlZyFsWMDIuIpRMrWg
 ODc9tdi0wDgvtVyvODG3uDQvXS85P3cTIzglaHnvYHz04IPeIUYmDsZDjBIczEoivIfrjycI
 8aYkVlalFuXHF5XmpBYfYpTmYFES513KfihBSCA9sSQ1OzW1ILUIJsvEwSnVwPSg8sID/Vrd
 bXLFUe7/vtU/WnDmybaIB02CR0NWMTPHTlIMZxU4VyRS/ff2+ucTT/+8ZPR7U2mR0RI7WRsD
 v/w31anVl2aohX/Zam5vafH8dO+6h5Oc6n9YlDJv33H2asstO7ZPQY+MFizYtLzZN99q+8YP
 WsLfP3mk7VN25/+ycXOOr47sMbXby2wCgjuMd/f+fn1LWMPxpLvn1cDSfRv3RIhHugeKpdoW
 5Xr4W0jxK27ULkme5ffdoECAX0i9t0QiRPKH6ddZBhNsxCe2z7lrzruHS787/Mv/57W989y8
 Loho5O50q/a4qJyeUrZT791N602Ojol7ny6MuHLqrVa7fjrHppbXvRI/zdnFlFiKMxINtZiL
 ihMBUoGH23gDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LZdlhJXvdBy/EEgycHrCxe7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErowvPy4zFZxVrug7c4+5gfG5dBcjJ4eE
 gInE3RmrmLoYuTiEBHYwSrx/fogJIiEj8evUVGYIW1hi5b/n7BBF7UwSCzc+YgNJsAkYScx+
 +4YRxBYRkJT43XWaGaSIWeAoo8Tl9sksIAlhgUCJV887wSaxCKhKTPs4ESzOK2Ar8X7DL0aI
 DfISqzccYJ7AyLOAkWEVo2RqQXFuem6xYYFRXmq5XnFibnFpXrpecn7uJkZwkGlp7WDcs+qD
 3iFGJg7GQ4wSHMxKIryH648nCPGmJFZWpRblxxeV5qQWH2KU5mBREue90HUyXkggPbEkNTs1
 tSC1CCbLxMEp1cBk7eWUV3uwqjN6/VVd0X9+ClNuO7Q3R8+KyGtjiTq/Zv7lPynp03smJH5Z
 qDZx8jTG1f+zbl88/Uqopnnq3FWnJkfwe9y/8/bPuqONFgknagQ47+28vu3EQr7z6qmqhlv+
 HJ4ySbtOZ940hYfdW4zcW2zjHDO0n08JvDQz9NT6FcWl2lKnel7bW7G/4Pg5f/bG+tKL3bWh
 cleeK728/2jlE/5dnfsa7rhb2bVnXOs0nqHFduep6cn9yyNSl5lez3P+1ey73GJCf3TrhMzz
 C19J//74bGN9G/cqzeZ9uVpxjZzb9Or59u+/xPN04doJr42uS5Y9y2vPOsz2POt1dc852V7l
 WUvabxZ0v4+Ul9TarsRSnJFoqMVcVJwIAN0E/jChAgAA
X-CMS-MailID: 20210614163337epcas5p2b9518d7f78fc59bc61361bab99f40f70
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210614163337epcas5p2b9518d7f78fc59bc61361bab99f40f70
References: <CGME20210614163337epcas5p2b9518d7f78fc59bc61361bab99f40f70@epcas5p2.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the controller identifiers list CNS 0x13, available list of ctrls
in NVM Subsystem that may or may not be attached to namespaces.

In Identify Ctrl List of the CNS 0x12 and 0x13 no endian conversion
for the nsid field.

These two CNS values shows affect when there exists a Subsystem.
Added condition if there is no Subsystem return invalid field in
command.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>

-v3:
 Added condition if there is no Subsystem return invalid field in
 command

-v2:
 Fix the review comments from Klaus and squashed 2nd commit into
 1st commit
---
 hw/nvme/ctrl.c       | 26 ++++++++++++++++++--------
 hw/nvme/trace-events |  2 +-
 include/block/nvme.h |  1 +
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 2e7498a73e..d513b022c4 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4251,9 +4251,11 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
     return NVME_INVALID_CMD_SET | NVME_DNR;
 }
 
-static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
+                                        bool attached)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
+    uint32_t nsid = le32_to_cpu(c->nsid);
     uint16_t min_id = le16_to_cpu(c->ctrlid);
     uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
     uint16_t *ids = &list[1];
@@ -4261,15 +4263,21 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
     NvmeCtrl *ctrl;
     int cntlid, nr_ids = 0;
 
-    trace_pci_nvme_identify_ns_attached_list(min_id);
+    trace_pci_nvme_identify_ctrl_list(c->cns, min_id);
 
-    if (c->nsid == NVME_NSID_BROADCAST) {
+    if (!n->subsys) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    ns = nvme_subsys_ns(n->subsys, c->nsid);
-    if (!ns) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+    if (attached) {
+        if (nsid == NVME_NSID_BROADCAST) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+        ns = nvme_subsys_ns(n->subsys, nsid);
+        if (!ns) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
     }
 
     for (cntlid = min_id; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid++) {
@@ -4278,7 +4286,7 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
             continue;
         }
 
-        if (!nvme_ns(ctrl, c->nsid)) {
+        if (attached && !nvme_ns(ctrl, nsid)) {
             continue;
         }
 
@@ -4493,7 +4501,9 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
     case NVME_ID_CNS_NS_PRESENT:
         return nvme_identify_ns(n, req, false);
     case NVME_ID_CNS_NS_ATTACHED_CTRL_LIST:
-        return nvme_identify_ns_attached_list(n, req);
+        return nvme_identify_ctrl_list(n, req, true);
+    case NVME_ID_CNS_CTRL_LIST:
+        return nvme_identify_ctrl_list(n, req, false);
     case NVME_ID_CNS_CS_NS:
         return nvme_identify_ns_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT:
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index ea33d0ccc3..4976eb9bec 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -55,7 +55,7 @@ pci_nvme_identify(uint16_t cid, uint8_t cns, uint16_t ctrlid, uint8_t csi) "cid
 pci_nvme_identify_ctrl(void) "identify controller"
 pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
-pci_nvme_identify_ns_attached_list(uint16_t cntid) "cntid=%"PRIu16""
+pci_nvme_identify_ctrl_list(uint8_t cns, uint16_t cntid) "cns 0x%"PRIx8" cntid %"PRIu16""
 pci_nvme_identify_ns_csi(uint32_t ns, uint8_t csi) "nsid=%"PRIu32", csi=0x%"PRIx8""
 pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=%"PRIu16", csi=0x%"PRIx8""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 0ff9ce17a9..188ab460df 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -980,6 +980,7 @@ enum NvmeIdCns {
     NVME_ID_CNS_NS_PRESENT_LIST       = 0x10,
     NVME_ID_CNS_NS_PRESENT            = 0x11,
     NVME_ID_CNS_NS_ATTACHED_CTRL_LIST = 0x12,
+    NVME_ID_CNS_CTRL_LIST             = 0x13,
     NVME_ID_CNS_CS_NS_PRESENT_LIST    = 0x1a,
     NVME_ID_CNS_CS_NS_PRESENT         = 0x1b,
     NVME_ID_CNS_IO_COMMAND_SET        = 0x1c,
-- 
2.17.1


