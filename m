Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24C739766A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:20:33 +0200 (CEST)
Received: from localhost ([::1]:38412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6C0-0000fz-OE
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lo60u-000077-W5
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:09:05 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:10762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lo60r-0007q2-FI
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:09:04 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210601150857epoutp023500e6359ec0df2d6beb0ad85cc5c2d9~Efdkewlzs2851428514epoutp02k
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 15:08:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210601150857epoutp023500e6359ec0df2d6beb0ad85cc5c2d9~Efdkewlzs2851428514epoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1622560137;
 bh=jOROvIXIAW7O2sGS9d6/py61Vvseh4/cuF7f/4C086Y=;
 h=From:To:Cc:Subject:Date:References:From;
 b=YqVmcQEhlgK/6mlm59bUqa5sppjxI+v85dXx5y82kWd7rliBbITFdD5W9fMSOI8zJ
 LYGwH18kJjkdkB0why3ytC1aWCOy/TOpRrKB9hOh2ZN+1WWgEsWdlfnAmYhlWC76HH
 Jny+Nt6duRscZIiNZvr191G/c3wEcWLPY1GOPgTQ=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210601150856epcas5p2ae630d9441ffaba3f61f2374c64ced09~EfdkGzi561652016520epcas5p2c;
 Tue,  1 Jun 2021 15:08:56 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C6.9C.09835.88D46B06; Wed,  2 Jun 2021 00:08:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20210601150640epcas5p298805b3669ca8b586d92da31d4742ab0~EfblllCpC0426204262epcas5p2n;
 Tue,  1 Jun 2021 15:06:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210601150640epsmtrp13ac2220de5838f1091fe018a5612b9b7~EfbliHN_i1279312793epsmtrp1M;
 Tue,  1 Jun 2021 15:06:40 +0000 (GMT)
X-AuditID: b6c32a4b-7c9ff7000000266b-08-60b64d88bf58
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4B.F6.08637.00D46B06; Wed,  2 Jun 2021 00:06:40 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210601150639epsmtip2639742a670d43c207b018efb21ca062d~EfbkKbfyP2419524195epsmtip2c;
 Tue,  1 Jun 2021 15:06:39 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/nvme: fix endianess conversion and add controller
 list
Date: Tue,  1 Jun 2021 20:32:25 +0530
Message-Id: <20210601150226.5558-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsWy7bCmhm6H77YEgyUnNC1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsEroyHXxexFVxQrNh1Tq6BcYlUFyMnh4SA
 iUTPo3bGLkYuDiGB3YwS124fYYZwPjFKzOu7ywRSJSTwjVHixU9lmI4ls58yQ8T3MkrcfGAC
 0dDJJPGu5TorSIJNwEhi9ts3jCC2iICkxO+u02ANzCArvs3VAbGFBYIlbiyCGMQioCqxaMoJ
 sGW8AjYSk1YdY4JYJi+xesMBsIskBA6xS8ydsYuli5EDyHGR6H8TD1EjLPHq+BZ2CFtK4mV/
 G5DNDmRXSxwugujsYJQ4dnkDG0SJvcS/Z9MYQaYwC2hKrN+lDxGWlZh6ah0TxJV8Er2/n0Bd
 wCuxYx6MrSax4NZ3qE0yEjP/3GaFsD0kLj2+wQIJkliJuW/a2CYwys5C2LCAkXEVo2RqQXFu
 emqxaYFxXmq5XnFibnFpXrpecn7uJkZwMtDy3sH46MEHvUOMTByMhxglOJiVRHjd87YmCPGm
 JFZWpRblxxeV5qQWH2KU5mBREudd8XBygpBAemJJanZqakFqEUyWiYNTqoEpZvqVb7oSHFeL
 n+6aaX1y3d1JczteZa8uOui9sPPlpl1fLtpvdkrU+zLvk+2bi/+css7ann/6Ru+449u6xs1J
 C5N8wiYnHmRQqtkx5XbBbP1vM+OlNrl4Pfv+IvRR4DSPDR4/o3duYm56ESO927XKRIj585np
 j9I+X/+xIVcuiG2i79Y47+MPu2NnxlRX8b7JYn+g6ij4erv6Muv+N/Wya4Ws92Ssv7GDc2Hg
 /DXLe0/VXFJgv+NZzf750o5rFxujmOPlVmx5t8Nqe+1s7hePxe/3WziosWtp/Hm7eT9X8xKL
 Z0FfrV9eOTF9yWRjp/tTHk688OV+05SDFdN+zO7qfyHyas/7nvIHZd9fFj4LERVTYinOSDTU
 Yi4qTgQA4uBWHHUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42LZdlhJXpfBd1uCwe9bhhavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8bDr4vYCi4oVuw6J9fAuESqi5GTQ0LA
 RGLJ7KfMXYxcHEICuxkldrzZwwKRkJH4dWoqM4QtLLHy33N2iKJ2Jold//+zgyTYBIwkZr99
 wwhiiwhISvzuOg02iVngKKPE5fbJYJOEBQIlpu5oZgWxWQRUJRZNOcEEYvMK2EhMWnWMCWKD
 vMTqDQeYJzDyLGBkWMUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERxiWpo7GLev+qB3
 iJGJg/EQowQHs5IIr3ve1gQh3pTEyqrUovz4otKc1OJDjNIcLErivBe6TsYLCaQnlqRmp6YW
 pBbBZJk4OKUamIJ8Xp2efaT5pHxN5BlRnwYVXyfBJ3fdMgvl0k5kMFjyPn/R9fRvfuepn2ds
 S5am6ZRo+UkW8s5YrlyxqeNV6GzrOcu28B7lrDhQ6est19F80fPclL4NHPrSl2WP3NypvvVR
 /BSViV8vbpnNcP9TkkuaZljl/GuZ5erlekoH70xpiPofaW1veCRO9vDPe5c+Plj+8l/SHF6T
 zg/Rr86ppxQ6tN69b+b0s92uaOKWjpe7jigm1+1q/hDysmNBfH1pHNs8ts6EJWVPgsI33N79
 cEfwm+eNMzTqZk3gYnG4L6cpK2yywO/fj72yMizMbJNnlgnyuxwsmNz0ML1xY/mPL4tfhUuV
 8jVvXuiYP9dMW4mlOCPRUIu5qDgRAHiFPTCgAgAA
X-CMS-MailID: 20210601150640epcas5p298805b3669ca8b586d92da31d4742ab0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210601150640epcas5p298805b3669ca8b586d92da31d4742ab0
References: <CGME20210601150640epcas5p298805b3669ca8b586d92da31d4742ab0@epcas5p2.samsung.com>
Received-SPF: pass client-ip=203.254.224.25;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout2.samsung.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>

-v2:
 Fix the review comments from Klaus and squashed 2nd commit into
 1st commit

---
 hw/nvme/ctrl.c       | 26 ++++++++++++++++----------
 hw/nvme/trace-events |  2 +-
 include/block/nvme.h |  1 +
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 2e7498a73e..813a72c655 100644
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
@@ -4261,15 +4263,17 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
     NvmeCtrl *ctrl;
     int cntlid, nr_ids = 0;
 
-    trace_pci_nvme_identify_ns_attached_list(min_id);
+    trace_pci_nvme_identify_ctrl_list(c->cns, min_id);
 
-    if (c->nsid == NVME_NSID_BROADCAST) {
-        return NVME_INVALID_FIELD | NVME_DNR;
-    }
+    if (attached) {
+        if (nsid == NVME_NSID_BROADCAST) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
 
-    ns = nvme_subsys_ns(n->subsys, c->nsid);
-    if (!ns) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        ns = nvme_subsys_ns(n->subsys, nsid);
+        if (!ns) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
     }
 
     for (cntlid = min_id; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid++) {
@@ -4278,7 +4282,7 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
             continue;
         }
 
-        if (!nvme_ns(ctrl, c->nsid)) {
+        if (attached && !nvme_ns(ctrl, nsid)) {
             continue;
         }
 
@@ -4493,7 +4497,9 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
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


