Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49609358BA9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 19:47:23 +0200 (CEST)
Received: from localhost ([::1]:58162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUYkT-0002tQ-RR
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 13:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1lUXbm-0002KJ-TA
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:34:21 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:48214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1lUXbY-0002Uf-4q
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:34:16 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210408163351epoutp024c972e0fc69f998479d8f131a28923af~z7yR4s9Gb0755307553epoutp02i
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 16:33:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210408163351epoutp024c972e0fc69f998479d8f131a28923af~z7yR4s9Gb0755307553epoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617899631;
 bh=gV4GqoRH/lZ8IPgrFXe/JAiDv3IM8XFl9r7QoQ4RYW4=;
 h=From:To:Cc:Subject:Date:References:From;
 b=b+vOU1FCyWtTS/Kn4Bo7oepjFT93jrzV4vK6Trm8WicolLs/uGJjIFHQKQUYNrkAp
 h2rtwWPNUudgakKUverCGeH1N1pj8/r4SIhGpqm7yTYeKqdUSono7rM3TlBoQF2Dcm
 rCXzSD0OR6CxSXR4I0+z0ASSOGdM0tntDZbX5bRs=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210408163350epcas5p3dff27306c936a581ce605b8f27a5ba46~z7yQ7mFdA3190431904epcas5p3-;
 Thu,  8 Apr 2021 16:33:50 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 36.32.15682.D603F606; Fri,  9 Apr 2021 01:33:49 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210408162750epcas5p1f093ab42779ab250fbcb672a41455a30~z7tCGD-pI1869018690epcas5p1C;
 Thu,  8 Apr 2021 16:27:50 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210408162750epsmtrp1918e328fc34005e877c42e1fb98a225e~z7tCFPYSh3214032140epsmtrp16;
 Thu,  8 Apr 2021 16:27:50 +0000 (GMT)
X-AuditID: b6c32a49-8d5ff70000013d42-b2-606f306d9393
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 CD.63.33967.60F2F606; Fri,  9 Apr 2021 01:27:50 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210408162749epsmtip19f1a3bf77df5e21044a104537a8abea8~z7tAy44sp1404214042epsmtip10;
 Thu,  8 Apr 2021 16:27:49 +0000 (GMT)
From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: map prp fix if prp2 contains non-zero offset
Date: Thu,  8 Apr 2021 21:53:13 +0530
Message-Id: <20210408162313.22749-1-p.kalghatgi@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRmVeSWpSXmKPExsWy7bCmum6uQX6Cwfll5hZX9p9ntNh/8Bur
 xaRD1xgtllxMtZh3S9ni+s9H7Baz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8anbWeZCtYIVZx5/465gbGbp4uRk0NC
 wERi1fNZjCC2kMBuRollpxUh7E+MEvMWxXUxcgHZ3xgljv8+yQrTcPjjW6iGvYwSm1vyIYo6
 mSS+bHnG1sXIwcEmYCTxvdUWpEZEQFLid9dpZpAaZoGNjBJLd7UxgSSEBXwkdh45xQZiswio
 SmyZ2MQMYvMK2Ei8/NjHDLFMXmL1hgNgzRICx9glLmxbBpVwkTh/YjsbhC0s8er4FnYIW0ri
 ZX8bO0RDM6PEvi9XWCCcCYwSU+a/Y4Kospe4uOcvE8ipzAKaEut36UOEZSWmnloHVsIswCfR
 +/sJVDmvxI55MLaqxOMLB6EWS0vMXvkJKu4hMXHTF2ZIsMRKzP6yj3ECo+wshA0LGBlXMUqm
 FhTnpqcWmxYY5qWW6xUn5haX5qXrJefnbmIEJwUtzx2Mdx980DvEyMTBeIhRgoNZSYR3R292
 ghBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeHQYP4oUE0hNLUrNTUwtSi2CyTBycUg1M8WtWZ6zT
 ndETrNw1W3tJ+NcY1qmOdv++ud3acerZ53kydV/lJM4/nntx297cRgODFwH/N+ZdOv0tqPOR
 6W7fyJnzW0ytSx7yOfQ1HBMLVthonFjx+HTeCv7TDBGZrIedF/9s2S3ycxLfsoVCMWfvyF1/
 rfn8xXvDmq0L4+Q8npl2Nu0/8j9YJWpr399GHv6g/ktWnP2mFTO9RNI9JjU9lJ6bzXGSY9fN
 h4K6N049Fu3jT92YxaT49qC+brFwydsMm68/P7OwuwalCGrw270vns131SQmbLdr1gzHzWni
 hxRE9d2vhORI8XyU06yY9k/hT8+dWVZ8tv4Xtwnxm8SckH8uxW/+9pEK68qNUoVKLMUZiYZa
 zEXFiQD9LI8DeQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphluLIzCtJLcpLzFFi42LZdlhJTpdNPz/B4ME7aYsr+88zWuw/+I3V
 YtKha4wWSy6mWsy7pWxx/ecjdotZ79rZLI737mCxeD3pP6sDp8ePc+1sHud2nGf32LSqk83j
 ybXNTB7v911l8+jbsooxgC2KyyYlNSezLLVI3y6BK+PTtrNMBWuEKs68f8fcwNjN08XIySEh
 YCJx+ONbxi5GLg4hgd2MEud3TmeHSEhL7Ht4nQXCFpZY+e85WFxIoJ1JYs3Z8C5GDg42ASOJ
 7622IGERAUmJ312nmUHmMIPMedLwGqxXWMBHYueRU2wgNouAqsSWiU3MIDavgI3Ey499zBDz
 5SVWbzjAPIGRZwEjwypGydSC4tz03GLDAsO81HK94sTc4tK8dL3k/NxNjOAA09Lcwbh91Qe9
 Q4xMHIyHGCU4mJVEeHf0ZicI8aYkVlalFuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1OzW1
 ILUIJsvEwSnVwNQZMFE6PUd7XrfI6aN+lnyhIa4nLkm2OQkukP2Wrj1njnOc8D7Hj8ZBSzzu
 tW+xqFndwLhnatp5v0+zGG6t2KSWxmJTNnOrY+r7+88ehrbGSl0xFbvVuKEpRZ8p6k/jn815
 1yrDWTc5X3lk+i0tUeXer8qlBu9vzpyZYZZ0difXsoci5xOfOk65M5uZTajx8RnjxYcC187b
 0bZ7malzim3FAdVNvoF2nMcuTW+cYrtb099BMFdU6FipaXcrf0lo44/3BpL/JpuxMl5onrZy
 uvysiKw7rvf+ZObemHH6VtKn3VdXf5e+Jez4MDGyvcmoI9Bb6Wxpzt7F0Q7Mt/ZqevWtv9Fr
 Hnpw3YKn5y2v6CixFGckGmoxFxUnAgCXPXlLnwIAAA==
X-CMS-MailID: 20210408162750epcas5p1f093ab42779ab250fbcb672a41455a30
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210408162750epcas5p1f093ab42779ab250fbcb672a41455a30
References: <CGME20210408162750epcas5p1f093ab42779ab250fbcb672a41455a30@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.25;
 envelope-from=p.kalghatgi@samsung.com; helo=mailout2.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 08 Apr 2021 13:45:46 -0400
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
 hw/block/nvme.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d439e44..efb7368 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -577,7 +577,12 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
             uint32_t nents, prp_trans;
             int i = 0;
 
-            nents = (len + n->page_size - 1) >> n->page_bits;
+            /*
+             *   The first PRP list entry, pointed by PRP2 can contain
+             *   offsets. Hence, we need calculate the no of entries in
+             *   prp2 based on the offset it has.
+             */
+            nents = (n->page_size - (prp2 % n->page_size)) >> 3;
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


