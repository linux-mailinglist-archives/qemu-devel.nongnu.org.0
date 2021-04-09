Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E37B359681
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 09:37:43 +0200 (CEST)
Received: from localhost ([::1]:52454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUli2-0007oJ-7z
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 03:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1lUlh2-0007EP-8w
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 03:36:40 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:38684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1lUlgy-0003np-T6
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 03:36:40 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210409073627epoutp04b24e203c7876c18c6016e65e49d90843~0IGXAcBK80492904929epoutp04V
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 07:36:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210409073627epoutp04b24e203c7876c18c6016e65e49d90843~0IGXAcBK80492904929epoutp04V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617953787;
 bh=t6wNXFxE3qVcmM65xDarJfgSt/PKdMCO3O3lZU0y5Os=;
 h=From:To:Cc:Subject:Date:References:From;
 b=eHm6PmrmOUXAtbUpjWrxj1qXAEksskb18bMXz9tb9tmBpTwW5NpaV9wzg5t834aeX
 YqZDY6IpR/xG6gil1eQOck/j1bM9fEG+Cq7AxL20Kcg8wMP/0ln8sY9A+B6ATSggwn
 0bXVw6CrL3VwR4Oo3RWjzqFmtAhV9EphfQZhPOgI=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210409073626epcas5p2f1cbcbfee0fc59936b38f5c5a33e01d1~0IGWJk25Z1884718847epcas5p2l;
 Fri,  9 Apr 2021 07:36:26 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 BC.A3.39068.AF300706; Fri,  9 Apr 2021 16:36:26 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210409072736epcas5p4e40bbaec44791395e48537e37d7e379e~0H_oxcowl1327713277epcas5p4i;
 Fri,  9 Apr 2021 07:27:36 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210409072736epsmtrp18af132493d913bee3fc6549f8869d569~0H_owifiA2504025040epsmtrp1j;
 Fri,  9 Apr 2021 07:27:36 +0000 (GMT)
X-AuditID: b6c32a4a-60fff7000000989c-6c-607003fabaf4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 42.F3.33967.8E100706; Fri,  9 Apr 2021 16:27:36 +0900 (KST)
Received: from test-zns.sa.corp.samsungelectronics.net (unknown
 [107.110.206.5]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210409072735epsmtip174a9bd243f8eb8be4553f0faf665ae30~0H_ncNjgV1812618126epsmtip1H;
 Fri,  9 Apr 2021 07:27:35 +0000 (GMT)
From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/block/nvme: map prp fix if prp2 contains non-zero offset
Date: Fri,  9 Apr 2021 12:55:48 +0530
Message-Id: <20210409072548.31518-1-p.kalghatgi@samsung.com>
X-Mailer: git-send-email 2.30.0-rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7bCmuu4v5oIEgyn9khZX9p9ntNh/8Bur
 xaRD1xgtllxMtZh3S9ni+s9H7Baz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8bDSy+YCtYLV3zZuZSlgfEzTxcjJ4eE
 gInEol/t7F2MXBxCArsZJV7f7oNyPjFKLD2ylhnC+cYoMXfbMpYuRg6wlrs3FSDiexkl7v19
 yQwySkiglUni0U5ZkBo2ASOJ7622IGERAUmJ312nweYwC2wEGrqrjQmkRlggUGLzWUuQGhYB
 VYmf7/awgNi8AjYSrbvaGCGuU5ZY+PAgK0RcUOLkzCdgNcwC8hLNW2eDzZQQeMQuMbfrIDtE
 g4vE4ZOroGxhiVfHt0DZUhIv+9vYIRqaGSX2fbnCAuFMYJSYMv8dE0SVvcTFPX/BrmMW0JRY
 v0sfIiwrMfXUOiaIzXwSvb+fQJXzSuyYB2OrSjy+cJANwpaWmL3yE1TcQ+LWwbOMkACKleic
 uZZ1AqP8LCQPzULy0CyEzQsYmVcxSqYWFOempxabFhjlpZbrFSfmFpfmpesl5+duYgQnHS2v
 HYwPH3zQO8TIxMF4iFGCg1lJhLe5OT9BiDclsbIqtSg/vqg0J7X4EKM0B4uSOO8OgwfxQgLp
 iSWp2ampBalFMFkmDk6pBiaP5dELjlTNXS+RdObXeSn2rd0LXyROO8T46WGJmfr+5xeVnzId
 aHjybZO248TYsy7rJH4XfP4fwRbKLhGhZDAtZOHnNKEbH2uPHHHmfuuk0eC3IddQj3fBmbjo
 zevzWE/V3rGoPe890ztaZdbRfEmmxFiNpRsvyz3yqn93VONdhy5H1+cdbGsCPwskfHl5fUn1
 c8e/bAs+FzwyT//+aeL3wDJ1gYtejvYRu0wFbiUm2RbYfjcPPRG2jWWzsOXh48+016wI+VSa
 PfMu2+vtjaqH1Q7VeX/1iqxjNmMO0Iru08+9GefQ5PByIy/Tggdn9nFeE/qo0NBvvJCVa/e0
 rFmXHkQ4nDxsMTOzeUOXGrMSS3FGoqEWc1FxIgB2n4WUqQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDLMWRmVeSWpSXmKPExsWy7bCSnO4LxoIEg5VH9Cyu7D/PaLH/4DdW
 i0mHrjFaLLmYajHvlrLF9Z+P2C1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsEroyHl14wFawXrviycylLA+Nnni5GDg4J
 AROJuzcVuhi5OIQEdjNKdPbcZ+5i5ASKS0vse3idBcIWllj57zk7RFEzk8T79k4mkGY2ASOJ
 7622IDUiApISv7tOM4PUMIMMetLwGqxZWMBf4tDL64wgNouAqsTPd3vA4rwCNhKtu9oYIRYo
 Syx8eJAVIi4ocXLmE7AaZgF5ieats5knMPLNQpKahSS1gJFpFaNkakFxbnpusWGBYV5quV5x
 Ym5xaV66XnJ+7iZGcABrae5g3L7qg94hRiYOxkOMEhzMSiK8zc35CUK8KYmVValF+fFFpTmp
 xYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwBVXXc5Vd0riSpP1gdXbDw2VR5gFa
 JQ5M3Kdner/N6+de+VjztOHOoPQIybfpi6u5z3ey9EXlRAhKvpa5+83a1edg1WkDIY2lW7sq
 08t3He5XeDeBcTPHgmsphfkfTPgcusSWWVnvy40yua6ZMsmGn2tV6qqftd6SSSq7i3oWyUiU
 WHewC9+aEyUrvuU4w5RTB+c7XUnWmxX/2dBW7HWWdtuxvXNOVHpN+eyqxyLb84N197TzV2db
 BO0SXK6ft7flxq+E5F+N+WkNb0VfOzRO2nTwieBzzqjHVVu+/Z1776vVhV1rDO4bsf48vT9P
 t3yGssWqnNwDL+4r1/Ybl0c3+vimrxDU9ZvT7qsgKK3EUpyRaKjFXFScCABadHhEzwIAAA==
X-CMS-MailID: 20210409072736epcas5p4e40bbaec44791395e48537e37d7e379e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210409072736epcas5p4e40bbaec44791395e48537e37d7e379e
References: <CGME20210409072736epcas5p4e40bbaec44791395e48537e37d7e379e@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=p.kalghatgi@samsung.com; helo=mailout4.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, padmakar <p.kalghatgi@samsung.com>,
 qemu-block@nongnu.org, mreitz@redhat.com, its@irrelevant.dk,
 stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: padmakar <p.kalghatgi@samsung.com>

nvme_map_prp needs to calculate the number of list entries based on the
offset value. For the subsequent PRP2 list, need to ensure the number of
entries is within the MAX number of PRP entries for a page.

Signed-off-by: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
---
 -v2:
     removed extraneous spacing in the comments(Keith) 
	 used bitwise operator instead of the modulo operator(Keith)
	 
 hw/block/nvme.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d439e44..a4c4f9d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -577,7 +577,12 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
             uint32_t nents, prp_trans;
             int i = 0;
 
-            nents = (len + n->page_size - 1) >> n->page_bits;
+            /*
+             * The first PRP list entry, pointed by PRP2 can contain
+             * offsets. Hence, we need calculate the no of entries in
+             * prp2 based on the offset it has.
+             */
+            nents = (n->page_size - (prp2 & (n->page_size - 1))) >> 3;
             prp_trans = MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
             ret = nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
             if (ret) {
@@ -588,7 +593,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
             while (len != 0) {
                 uint64_t prp_ent = le64_to_cpu(prp_list[i]);
 
-                if (i == n->max_prp_ents - 1 && len > n->page_size) {
+                if (i == nents - 1 && len > n->page_size) {
                     if (unlikely(prp_ent & (n->page_size - 1))) {
                         trace_pci_nvme_err_invalid_prplist_ent(prp_ent);
                         status = NVME_INVALID_PRP_OFFSET | NVME_DNR;
@@ -597,7 +602,8 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
 
                     i = 0;
                     nents = (len + n->page_size - 1) >> n->page_bits;
-                    prp_trans = MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
+                    nents = MIN(nents, n->max_prp_ents);
+                    prp_trans = nents * sizeof(uint64_t);
                     ret = nvme_addr_read(n, prp_ent, (void *)prp_list,
                                          prp_trans);
                     if (ret) {
-- 
2.7.0.windows.1


