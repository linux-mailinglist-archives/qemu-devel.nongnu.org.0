Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013394E4D7D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 08:40:46 +0100 (CET)
Received: from localhost ([::1]:36394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWvbp-0007LW-1i
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 03:40:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <naveen.n1@samsung.com>)
 id 1nWvRB-0001p2-5O
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 03:29:46 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:40483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <naveen.n1@samsung.com>)
 id 1nWvR4-0001P3-L6
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 03:29:43 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220323072930epoutp03f8570dffcf4ea7c04fc2495cb9e44486~e8focsBeS3017130171epoutp03v
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 07:29:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220323072930epoutp03f8570dffcf4ea7c04fc2495cb9e44486~e8focsBeS3017130171epoutp03v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1648020570;
 bh=d5wA7tHirQwjqnC+0nczi/XqxPVFnDSOcs4Jt4jgxMM=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Lq/GMnViKm/SP75pjvDtNjlrCf1sbBHMwlg2fb1LMYN7ErEZZcAcZPpbcoNvoZMUr
 ck9Hs4IG8R0jAFRDSSnl9W5lK+fsomY68bdJVwYFzSFiFz8OHpyY+CS7qAS2TAzqNB
 h1m3VlXrlPgUOKuPN2Jxao8dWMvgAk2RnmUy0GQc=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20220323072929epcas5p2f9f85fe63df96ea1eaa981d980e5a5d1~e8fnwW0HO0567905679epcas5p2H;
 Wed, 23 Mar 2022 07:29:29 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4KNg361875z4x9QD; Wed, 23 Mar
 2022 07:29:22 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 8B.C7.05590.15CCA326; Wed, 23 Mar 2022 16:29:21 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20220323065813epcas5p101001fccadaff5a723a46aa468a02b85~e8EU_H3sc2083520835epcas5p1l;
 Wed, 23 Mar 2022 06:58:13 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220323065813epsmtrp112f02dbaa5d5948003eeaaf548cd4e6d~e8EU9HDAd2981829818epsmtrp1H;
 Wed, 23 Mar 2022 06:58:13 +0000 (GMT)
X-AuditID: b6c32a4b-723ff700000015d6-70-623acc515193
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 30.F2.03370.505CA326; Wed, 23 Mar 2022 15:58:13 +0900 (KST)
Received: from test.sa.corp.samsungelectronics.net (unknown [107.108.56.58])
 by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220323065811epsmtip1470eb2ece5493750c7190485e7888ce2~e8ES1pY6t0170801708epsmtip1K;
 Wed, 23 Mar 2022 06:58:11 +0000 (GMT)
From: Naveen <naveen.n1@samsung.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4] hw/nvme:Adding Support for namespace management
Date: Wed, 23 Mar 2022 10:39:38 +0530
Message-Id: <1648012178-12549-1-git-send-email-naveen.n1@samsung.com>
X-Mailer: git-send-email 1.8.3.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmpm7gGaskgzUTLS1+T5/CavHx71lG
 i7dfH7BZXNl/ntFi/8FvrBaP73xmt1g6X9/iZOMeVotJh64xWiy5mGox75ayReOT3ewWs961
 s1kc793BYvF60n9WB36PH+fa2TzO7TjP7rFpVSebx5Nrm5k83u+7yubRt2UVYwBbVLZNRmpi
 SmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtDFSgpliTmlQKGA
 xOJiJX07m6L80pJUhYz84hJbpdSClJwCkwK94sTc4tK8dL281BIrQwMDI1OgwoTsjH0LzjEX
 HF7MWHF9ymemBsaNpV2MnBwSAiYSx7dtYu9i5OIQEtjNKHHtxTMWCOcTo8Tt3ilMEM5nRok1
 P98ywrR8a/0FldjFKLF0xWN2kISQQCOTxPlTYEVsAioS0/eeYAOxRQQkJX53nWYGaWAWOMAk
 Mf/NTbAGYQF3iS2bd4HZLAKqEr1/l7CC2LwCrhKfNl5kh9imIDHl4XuwZgmBj+wSu1f/YoVI
 uEjc2LiTGcIWlnh1fAtUg5TEy/42KLtY4kJvPwtEcwOjxKNvG1ggEvYSF/f8BfqBA+gkTYn1
 u/QhwrISU0+tYwKxmQX4JHp/P2GCiPNK7Jj3BKxcQkBZ4vxqbghTUuLc9GSICg+JM/tesUDC
 IVbi2pXb7BMYZWchzF/AyLiKUTK1oDg3PbXYtMA4L7UcHlPJ+bmbGMEpUct7B+OjBx/0DjEy
 cTAeYpTgYFYS4V38wTxJiDclsbIqtSg/vqg0J7X4EKMpMMgmMkuJJucDk3JeSbyhiaWBiZmZ
 mYmlsZmhkjjvqfQNiUIC6YklqdmpqQWpRTB9TBycUg1MhbbXtn0M3BvKxOzs18TtsHyS17e1
 nLKP3X2vnle998P8b1DY82/rVLPrV1cXb/zvysU89ahefoBc76LbT/hdDG9dk5nNzPHuwS1l
 VV5V1SM32SrSs3Zf0Xg4S+Hy5e7yFzdWRhfybvHZdKtm49205T9nmi54+HZa4ot1dd1qh1sd
 lnoZWVhaH/g/tWXRh7i/EX7td+SP5f6TuzdxsnR1XYhLXHEnk8TiRw6a7vEPV8xKfx8nsXC5
 22x2jbJ5Fro3lavWfQ39K6/4tnT3kg0q5+4/urXQ/ahz5uONO76lbDHO/lif3Xo49PVsXyfe
 Y28TFuQsu9PCP9tgtVzFF3vedm+jZ4dXa/Z+v8RTXXEiSImlOCPRUIu5qDgRAOp98YQSBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsWy7bCSnC7rUaskgy97tSx+T5/CavHx71lG
 i7dfH7BZXNl/ntFi/8FvrBaP73xmt1g6X9/iZOMeVotJh64xWiy5mGox75ayReOT3ewWs961
 s1kc793BYvF60n9WB36PH+fa2TzO7TjP7rFpVSebx5Nrm5k83u+7yubRt2UVYwBbFJdNSmpO
 Zllqkb5dAlfGvgXnmAsOL2asuD7lM1MD48bSLkZODgkBE4lvrb+Yuhi5OIQEdjBKLG/+ygiR
 kJTY8HcrE4QtLLHy33N2iKL/jBI7lz9lA0mwCahITN97AswWAWr43XWaGaSIWeASk0TnjG1g
 CWEBd4ktm3exg9gsAqoSvX+XsILYvAKuEp82XmSH2KAgMeXhe+YJjDwLGBlWMUqmFhTnpucW
 GxYY5aWW6xUn5haX5qXrJefnbmIEB6iW1g7GPas+6B1iZOJgPMQowcGsJMK7+IN5khBvSmJl
 VWpRfnxRaU5q8SFGaQ4WJXHeC10n44UE0hNLUrNTUwtSi2CyTBycUg1Mu59Xr6o8tunur5zH
 4lsMg6b8Lw7t+Rv08VvKi/12+7a/nyz8Ys8jsxVmLuzMF4M2hyZGZOo1/ZBSW9MW7GoXuaXO
 UV9rp5/GwdYUQVO/i8ty/aaEFEe8siwTcbVSYH6eXaS3urZerrwystW598snW1Euh73Tfa5r
 a2afnB7B9kfEzO2TU9CB+nTxdP37vvMNgjp/xq697bon4bTLpZupv1LmzI93XlCd5j+hX5mp
 0PL/7O/f3dbsuTD9wjlfp+Y0VekXvzP2nqubduVdTpq9k6xjZx9nyKRt03aE3i2tUWIuOd6U
 W303XPn+DNElzu8/udXICUdfl09s8ti684iU/4KrJxepO19e+NDvR5gSS3FGoqEWc1FxIgDN
 HPoGvwIAAA==
X-CMS-MailID: 20220323065813epcas5p101001fccadaff5a723a46aa468a02b85
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220323065813epcas5p101001fccadaff5a723a46aa468a02b85
References: <CGME20220323065813epcas5p101001fccadaff5a723a46aa468a02b85@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=naveen.n1@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, anuj.singh@samsung.com,
 jg123.choi@samsung.com, qemu-block@nongnu.org, k.jensen@samsung.com,
 Naveen Nagar <naveen.n1@samsung.com>, d.palani@samsung.com, mreitz@redhat.com,
 its@irrelevant.dk, anshul@samsung.com, stefanha@redhat.com, kbusch@kernel.org,
 javier.gonz@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Naveen Nagar <naveen.n1@samsung.com>

This patch supports namespace management : create and delete operations
This patch has been tested with the following command and size of image
file for unallocated namespaces is taken as 0GB. nvme_namespace_create
will look into the list of unallocated namespaces and it will initialize 
and return the nsid of the same. A new mandatory field has been added
called tnvmcap and we have ensured that the total capacity of namespace 
created does not exceed tnvmcap

-device nvme-subsys,id=subsys0,tnvmcap=8
-device nvme,serial=foo,id=nvme0,subsys=subsys0
-device nvme,serial=bar,id=nvme1,subsys=subsys0

-drive id=ns1,file=ns1.img,if=none
-device nvme-ns,drive=ns1,bus=nvme0,nsid=1,zoned=false,shared=true
-drive id=ns2,file=ns2.img,if=none
-device nvme-ns,drive=ns2,bus=nvme0,nsid=2,zoned=false,shared=true
-drive id=ns3,file=ns3.img,if=none
-device nvme-ns,drive=ns3,bus=nvme0,nsid=3,zoned=false,shared=true
-drive id=ns4,file=ns4.img,if=none
-device nvme-ns,drive=ns4,bus=nvme0,nsid=4,zoned=false,shared=true

Please review and suggest if any changes are required.

Signed-off-by: Naveen Nagar <naveen.n1@samsung.com>

Since v3:
-Lukasz Maniak found a bug related to unvmcap support and proposed
 solution is added

---
 hw/nvme/ctrl.c       | 257 ++++++++++++++++++++++++++++++++++++++++---
 hw/nvme/ns.c         |  80 +++++++++-----
 hw/nvme/nvme.h       |   7 +-
 hw/nvme/subsys.c     |   3 +
 include/block/nvme.h |  18 ++-
 5 files changed, 317 insertions(+), 48 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 03760ddeae..5c5b915dc6 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -222,6 +222,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_SET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_NS_MANAGEMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
     [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
     [NVME_ADM_CMD_FORMAT_NVM]       = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
 };
@@ -4715,11 +4716,19 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
     uint32_t nsid = le32_to_cpu(c->nsid);
+    NvmeIdNs *id_ns = NULL;
+    uint16_t ret;
 
     trace_pci_nvme_identify_ns(nsid);
 
-    if (!nvme_nsid_valid(n, nsid) || nsid == NVME_NSID_BROADCAST) {
+    if (!nvme_nsid_valid(n, nsid)) {
         return NVME_INVALID_NSID | NVME_DNR;
+    } else if (nsid == NVME_NSID_BROADCAST) {
+        id_ns = g_new0(NvmeIdNs, 1);
+        nvme_ns_identify_common(id_ns);
+        ret = nvme_c2h(n, (uint8_t *)id_ns, sizeof(NvmeIdNs), req);
+        g_free(id_ns);
+        return ret;
     }
 
     ns = nvme_ns(n, nsid);
@@ -5475,9 +5484,208 @@ static void nvme_select_iocs_ns(NvmeCtrl *n, NvmeNamespace *ns)
     }
 }
 
+static int nvme_blk_truncate(BlockBackend *blk, size_t len, Error **errp)
+{
+    int ret;
+    uint64_t perm, shared_perm;
+
+    blk_get_perm(blk, &perm, &shared_perm);
+
+    ret = blk_set_perm(blk, perm | BLK_PERM_RESIZE, shared_perm, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = blk_truncate(blk, len, false, PREALLOC_MODE_OFF, 0, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = blk_set_perm(blk, perm, shared_perm, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    return 0;
+}
+
+static uint32_t nvme_allocate_nsid(NvmeCtrl *n)
+{
+    uint32_t nsid = 0;
+    for (int i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+        if (nvme_ns(n, i) || nvme_subsys_ns(n->subsys, i)) {
+            continue;
+        }
+
+        nsid = i;
+        return nsid;
+    }
+    return nsid;
+}
+
+static uint16_t nvme_namespace_create(NvmeCtrl *n, NvmeRequest *req)
+{
+    uint32_t ret;
+    NvmeIdNs id_ns_host;
+    NvmeSubsystem *subsys = n->subsys;
+    Error *err = NULL;
+    uint8_t flbas_host;
+    uint64_t ns_size;
+    int lba_index;
+    NvmeNamespace *ns;
+    NvmeCtrl *ctrl;
+    NvmeIdNs *id_ns;
+
+    ret = nvme_h2c(n, (uint8_t *)&id_ns_host, sizeof(id_ns_host), req);
+    if (ret) {
+        return ret;
+    }
+
+    if (id_ns_host.ncap < id_ns_host.nsze) {
+        return NVME_THIN_PROVISION_NO_SUPP | NVME_DNR;
+    } else if (id_ns_host.ncap > id_ns_host.nsze) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (!id_ns_host.nsze) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (QSLIST_EMPTY(&subsys->unallocated_namespaces)) {
+        return NVME_NS_ID_UNAVAILABLE;
+    }
+
+    ns = QSLIST_FIRST(&subsys->unallocated_namespaces);
+    id_ns = &ns->id_ns;
+    flbas_host = (id_ns_host.flbas) & (0xF);
+
+    if (flbas_host > id_ns->nlbaf) {
+        return NVME_INVALID_FORMAT | NVME_DNR;
+    }
+
+    ret = nvme_ns_setup(ns, &err);
+    if (ret) {
+        return ret;
+    }
+
+    id_ns->flbas = id_ns_host.flbas;
+    id_ns->dps = id_ns_host.dps;
+    id_ns->nmic = id_ns_host.nmic;
+
+    lba_index = NVME_ID_NS_FLBAS_INDEX(id_ns->flbas);
+    ns_size = id_ns_host.nsze * ((1 << id_ns->lbaf[lba_index].ds) +
+                (id_ns->lbaf[lba_index].ms));
+    id_ns->nvmcap = ns_size;
+
+    if (ns_size > n->id_ctrl.unvmcap) {
+        return NVME_NS_INSUFF_CAP;
+    }
+
+    ret = nvme_blk_truncate(ns->blkconf.blk, id_ns->nvmcap, &err);
+    if (ret) {
+        return ret;
+    }
+
+    ns->size = blk_getlength(ns->blkconf.blk);
+    nvme_ns_init_format(ns);
+
+    ns->params.nsid = nvme_allocate_nsid(n);
+    if (!ns->params.nsid) {
+        return NVME_NS_ID_UNAVAILABLE;
+    }
+    subsys->namespaces[ns->params.nsid] = ns;
+
+    for (int cntlid = 0; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid++) {
+        ctrl = nvme_subsys_ctrl(n->subsys, cntlid);
+        if (ctrl) {
+            ctrl->id_ctrl.unvmcap -= le64_to_cpu(ns->size);
+        }
+    }
+
+    stl_le_p(&req->cqe.result, ns->params.nsid);
+    QSLIST_REMOVE_HEAD(&subsys->unallocated_namespaces, entry);
+    return NVME_SUCCESS;
+}
+
+static void nvme_namespace_delete(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid)
+{
+    NvmeCtrl *ctrl;
+    NvmeSubsystem *subsys = n->subsys;
+    int ret;
+
+    subsys->namespaces[nsid] = NULL;
+    QSLIST_INSERT_HEAD(&subsys->unallocated_namespaces, ns, entry);
+
+    for (int cntlid = 0; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid++) {
+        ctrl = nvme_subsys_ctrl(n->subsys, cntlid);
+        if (ctrl) {
+            ctrl->id_ctrl.unvmcap += le64_to_cpu(ns->size);
+            if (nvme_ns(ctrl, nsid)) {
+                nvme_detach_ns(ctrl, ns, nsid);
+            }
+            nvme_ns_attr_changed_aer(ctrl, nsid);
+        }
+    }
+
+    ret = nvme_blk_truncate(ns->blkconf.blk, 0, NULL); 
+    assert(!ret);
+}
+
+static uint16_t nvme_ns_management(NvmeCtrl *n, NvmeRequest *req)
+{
+    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
+    uint8_t sel = dw10 & 0x7;
+    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint8_t  csi = le32_to_cpu(req->cmd.cdw11) >> 24;
+    NvmeNamespace *ns;
+
+    if (!n->subsys) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    switch (sel) {
+    case NVME_NS_MANAGEMENT_CREATE:
+        if (nsid) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+        if (csi == NVME_CSI_NVM) {
+            return nvme_namespace_create(n, req);
+        }
+        break;
+    case NVME_NS_MANAGEMENT_DELETE:
+        if (nsid != NVME_NSID_BROADCAST && !nvme_nsid_valid(n, nsid)) {
+            return NVME_INVALID_NSID | NVME_DNR;
+        }
+        if (nsid == NVME_NSID_BROADCAST) {
+            uint32_t i;
+
+            for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+                ns = nvme_subsys_ns(n->subsys, i);
+                if (!ns) {
+                    continue;
+                }
+                nvme_namespace_delete(n, ns, i);
+            }
+            return NVME_SUCCESS;
+        } else {
+            ns = nvme_subsys_ns(n->subsys, nsid);
+            if (!ns) {
+                return NVME_INVALID_FIELD | NVME_DNR;
+            }
+            nvme_namespace_delete(n, ns, nsid);
+            return NVME_SUCCESS;
+        }
+
+    default:
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+    return NVME_INVALID_FIELD | NVME_DNR;
+}
+
 static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns;
+    NvmeIdNs *id_ns;
     NvmeCtrl *ctrl;
     uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
@@ -5508,6 +5716,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
         return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
     }
 
+    id_ns = &ns->id_ns;
     *nr_ids = MIN(*nr_ids, NVME_CONTROLLER_LIST_SIZE - 1);
     for (i = 0; i < *nr_ids; i++) {
         ctrl = nvme_subsys_ctrl(n->subsys, ids[i]);
@@ -5521,7 +5730,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
                 return NVME_NS_ALREADY_ATTACHED | NVME_DNR;
             }
 
-            if (ns->attached && !ns->params.shared) {
+            if (ns->attached && !(id_ns->nmic & NVME_NMIC_NS_SHARED)) {
                 return NVME_NS_PRIVATE | NVME_DNR;
             }
 
@@ -5534,27 +5743,14 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             if (!nvme_ns(ctrl, nsid)) {
                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
             }
-
-            ctrl->namespaces[nsid] = NULL;
-            ns->attached--;
-
-            nvme_update_dmrsl(ctrl);
-
-            break;
-
-        default:
-            return NVME_INVALID_FIELD | NVME_DNR;
+            nvme_detach_ns(ctrl, ns, nsid);
         }
 
         /*
          * Add namespace id to the changed namespace id list for event clearing
          * via Get Log Page command.
          */
-        if (!test_and_set_bit(nsid, ctrl->changed_nsids)) {
-            nvme_enqueue_event(ctrl, NVME_AER_TYPE_NOTICE,
-                               NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
-                               NVME_LOG_CHANGED_NSLIST);
-        }
+        nvme_ns_attr_changed_aer(ctrl, nsid);
     }
 
     return NVME_SUCCESS;
@@ -5807,6 +6003,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_get_feature(n, req);
     case NVME_ADM_CMD_ASYNC_EV_REQ:
         return nvme_aer(n, req);
+    case NVME_ADM_CMD_NS_MANAGEMENT:
+        return nvme_ns_management(n, req);
     case NVME_ADM_CMD_NS_ATTACHMENT:
         return nvme_ns_attachment(n, req);
     case NVME_ADM_CMD_FORMAT_NVM:
@@ -6707,6 +6905,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NvmeIdCtrl *id = &n->id_ctrl;
     uint8_t *pci_conf = pci_dev->config;
     uint64_t cap = ldq_le_p(&n->bar.cap);
+    int i;
 
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
@@ -6784,6 +6983,14 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     if (n->subsys) {
         id->cmic |= NVME_CMIC_MULTI_CTRL;
+        id->tnvmcap = n->subsys->params.tnvmcap * GiB;
+        id->unvmcap = n->subsys->params.tnvmcap * GiB;
+
+        for (i = 0 ; i < ARRAY_SIZE(n->subsys->namespaces); i++) {
+            if (n->subsys->namespaces[i]) {
+                id->unvmcap -= le64_to_cpu(n->subsys->namespaces[i]->size);
+            }
+        }
     }
 
     NVME_CAP_SET_MQES(cap, 0x7ff);
@@ -6831,6 +7038,22 @@ void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
                             BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
 }
 
+void nvme_detach_ns(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid)
+{
+    n->namespaces[nsid] = NULL;
+    ns->attached--;
+    nvme_update_dmrsl(n);
+}
+
+void nvme_ns_attr_changed_aer(NvmeCtrl *n, uint32_t nsid)
+{
+    if (!test_and_set_bit(nsid, n->changed_nsids)) {
+        nvme_enqueue_event(n, NVME_AER_TYPE_NOTICE,
+                           NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
+                           NVME_LOG_CHANGED_NSLIST);
+    }
+}
+
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n = NVME(pci_dev);
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 324f53ea0c..8b48e97cc4 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -54,6 +54,30 @@ void nvme_ns_init_format(NvmeNamespace *ns)
     id_ns->npda = id_ns->npdg = npdg - 1;
 }
 
+void nvme_ns_identify_common(NvmeIdNs *id_ns)
+{
+    id_ns->dlfeat = 0x1;
+
+    /* support DULBE and I/O optimization fields */
+    id_ns->nsfeat |= (0x4 | 0x10);
+    id_ns->mc = NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
+    id_ns->dpc = 0x1f;
+
+    static const NvmeLBAF lbaf[16] = {
+        [0] = { .ds =  9           },
+        [1] = { .ds =  9, .ms =  8 },
+        [2] = { .ds =  9, .ms = 16 },
+        [3] = { .ds =  9, .ms = 64 },
+        [4] = { .ds = 12           },
+        [5] = { .ds = 12, .ms =  8 },
+        [6] = { .ds = 12, .ms = 16 },
+        [7] = { .ds = 12, .ms = 64 },
+    };
+
+    memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
+    id_ns->nlbaf = 7;
+}
+
 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
     static uint64_t ns_count;
@@ -66,11 +90,6 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     ns->csi = NVME_CSI_NVM;
     ns->status = 0x0;
 
-    ns->id_ns.dlfeat = 0x1;
-
-    /* support DULBE and I/O optimization fields */
-    id_ns->nsfeat |= (0x4 | 0x10);
-
     if (ns->params.shared) {
         id_ns->nmic |= NVME_NMIC_NS_SHARED;
     }
@@ -90,35 +109,19 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     ds = 31 - clz32(ns->blkconf.logical_block_size);
     ms = ns->params.ms;
 
-    id_ns->mc = NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
-
     if (ms && ns->params.mset) {
         id_ns->flbas |= NVME_ID_NS_FLBAS_EXTENDED;
     }
 
-    id_ns->dpc = 0x1f;
     id_ns->dps = ns->params.pi;
     if (ns->params.pi && ns->params.pil) {
         id_ns->dps |= NVME_ID_NS_DPS_FIRST_EIGHT;
     }
 
     ns->pif = ns->params.pif;
-
-    static const NvmeLBAF lbaf[16] = {
-        [0] = { .ds =  9           },
-        [1] = { .ds =  9, .ms =  8 },
-        [2] = { .ds =  9, .ms = 16 },
-        [3] = { .ds =  9, .ms = 64 },
-        [4] = { .ds = 12           },
-        [5] = { .ds = 12, .ms =  8 },
-        [6] = { .ds = 12, .ms = 16 },
-        [7] = { .ds = 12, .ms = 64 },
-    };
-
+    nvme_ns_identify_common(id_ns);
     ns->nlbaf = 8;
 
-    memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
-
     for (i = 0; i < ns->nlbaf; i++) {
         NvmeLBAF *lbaf = &id_ns->lbaf[i];
         if (lbaf->ds == ds) {
@@ -145,9 +148,12 @@ lbaf_found:
     return 0;
 }
 
-static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
+static int nvme_ns_init_blk(NvmeNamespace *ns, NvmeSubsystem *subsys,
+                            Error **errp)
 {
     bool read_only;
+    NvmeCtrl *ctrl;
+    int i;
 
     if (!blkconf_blocksizes(&ns->blkconf, errp)) {
         return -1;
@@ -169,6 +175,21 @@ static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
+    if (subsys) {
+        for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
+            ctrl = nvme_subsys_ctrl(subsys, i);
+
+            if (ctrl) {
+                if (ctrl->id_ctrl.unvmcap < le64_to_cpu(ns->size)) {
+                    error_setg(errp, "blockdev size %ld exceeds subsystem's "
+                                     "unallocated capacity", ns->size);
+                } else {
+                    ctrl->id_ctrl.unvmcap -= le64_to_cpu(ns->size);
+                }
+            }
+        }
+    }
+
     return 0;
 }
 
@@ -487,10 +508,6 @@ int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    if (nvme_ns_init_blk(ns, errp)) {
-        return -1;
-    }
-
     if (nvme_ns_init(ns, errp)) {
         return -1;
     }
@@ -560,6 +577,15 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (nvme_ns_init_blk(ns, subsys, errp)) {
+        return;
+    }
+
+    if (!ns->size) {
+        QSLIST_INSERT_HEAD(&subsys->unallocated_namespaces, ns, entry);
+        return;
+    }
+
     if (nvme_ns_setup(ns, errp)) {
         return;
     }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 739c8b8f79..e6aae7d047 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -51,9 +51,11 @@ typedef struct NvmeSubsystem {
 
     NvmeCtrl      *ctrls[NVME_MAX_CONTROLLERS];
     NvmeNamespace *namespaces[NVME_MAX_NAMESPACES + 1];
+    QSLIST_HEAD(, NvmeNamespace) unallocated_namespaces;
 
     struct {
         char *nqn;
+        uint64_t tnvmcap;
     } params;
 } NvmeSubsystem;
 
@@ -144,7 +146,7 @@ typedef struct NvmeNamespace {
         uint32_t numzrwa;
     } zns;
 
-    QTAILQ_ENTRY(NvmeNamespace) entry;
+    QSLIST_ENTRY(NvmeNamespace) entry;
 
     NvmeIdNsZoned   *id_ns_zoned;
     NvmeZone        *zone_array;
@@ -273,6 +275,7 @@ int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
+void nvme_ns_identify_common(NvmeIdNs *id_ns);
 
 typedef struct NvmeAsyncEvent {
     QTAILQ_ENTRY(NvmeAsyncEvent) entry;
@@ -511,6 +514,8 @@ static inline uint16_t nvme_cid(NvmeRequest *req)
 }
 
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
+void nvme_detach_ns(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid);
+void nvme_ns_attr_changed_aer(NvmeCtrl *n, uint32_t nsid);
 uint16_t nvme_bounce_data(NvmeCtrl *n, void *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
 uint16_t nvme_bounce_mdata(NvmeCtrl *n, void *ptr, uint32_t len,
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index fb58d63950..4314ac6fa2 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -60,11 +60,14 @@ static void nvme_subsys_realize(DeviceState *dev, Error **errp)
 
     qbus_init(&subsys->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev, dev->id);
 
+    QSLIST_INIT(&subsys->unallocated_namespaces);
+
     nvme_subsys_setup(subsys);
 }
 
 static Property nvme_subsystem_props[] = {
     DEFINE_PROP_STRING("nqn", NvmeSubsystem, params.nqn),
+    DEFINE_PROP_SIZE("tnvmcap", NvmeSubsystem, params.tnvmcap, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 3737351cc8..0e1c79f53f 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -592,6 +592,7 @@ enum NvmeAdminCommands {
     NVME_ADM_CMD_SET_FEATURES   = 0x09,
     NVME_ADM_CMD_GET_FEATURES   = 0x0a,
     NVME_ADM_CMD_ASYNC_EV_REQ   = 0x0c,
+    NVME_ADM_CMD_NS_MANAGEMENT  = 0x0d,
     NVME_ADM_CMD_ACTIVATE_FW    = 0x10,
     NVME_ADM_CMD_DOWNLOAD_FW    = 0x11,
     NVME_ADM_CMD_NS_ATTACHMENT  = 0x15,
@@ -895,6 +896,9 @@ enum NvmeStatusCodes {
     NVME_FEAT_NOT_CHANGEABLE    = 0x010e,
     NVME_FEAT_NOT_NS_SPEC       = 0x010f,
     NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
+    NVME_NS_INSUFF_CAP          = 0x0115,
+    NVME_THIN_PROVISION_NO_SUPP = 0x011b,
+    NVME_NS_ID_UNAVAILABLE      = 0x0116,
     NVME_NS_ALREADY_ATTACHED    = 0x0118,
     NVME_NS_PRIVATE             = 0x0119,
     NVME_NS_NOT_ATTACHED        = 0x011a,
@@ -1072,8 +1076,10 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
     uint16_t    mtfa;
     uint32_t    hmpre;
     uint32_t    hmmin;
-    uint8_t     tnvmcap[16];
-    uint8_t     unvmcap[16];
+    uint64_t    tnvmcap;
+    uint64_t    tnvmcap_u;
+    uint64_t    unvmcap;
+    uint64_t    unvmcap_u;
     uint32_t    rpmbs;
     uint16_t    edstt;
     uint8_t     dsto;
@@ -1180,6 +1186,11 @@ enum NvmeNsAttachmentOperation {
     NVME_NS_ATTACHMENT_DETACH = 0x1,
 };
 
+enum NvmeNsManagementOperation {
+    NVME_NS_MANAGEMENT_CREATE = 0x0,
+    NVME_NS_MANAGEMENT_DELETE = 0x1,
+};
+
 #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
 #define NVME_CTRL_SQES_MAX(sqes) (((sqes) >> 4) & 0xf)
 #define NVME_CTRL_CQES_MIN(cqes) ((cqes) & 0xf)
@@ -1320,7 +1331,8 @@ typedef struct QEMU_PACKED NvmeIdNs {
     uint16_t    nabo;
     uint16_t    nabspf;
     uint16_t    noiob;
-    uint8_t     nvmcap[16];
+    uint64_t    nvmcap;
+    uint64_t    nvmcap_u;
     uint16_t    npwg;
     uint16_t    npwa;
     uint16_t    npdg;
-- 
2.17.1


