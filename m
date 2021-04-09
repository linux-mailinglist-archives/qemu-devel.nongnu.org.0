Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEB9359801
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 10:36:24 +0200 (CEST)
Received: from localhost ([::1]:56016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUmcq-000254-1X
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 04:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lUmac-0001UF-7s
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 04:34:06 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:46394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lUmaR-0006Fh-M9
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 04:34:01 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210409083340epoutp01acf9da8594ed1c1289f154eebb385353~0I4Ujt1NN1270912709epoutp01b
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 08:33:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210409083340epoutp01acf9da8594ed1c1289f154eebb385353~0I4Ujt1NN1270912709epoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617957220;
 bh=yl/5gbQRZsATGHY358C71D7hOmS2+TAML27xzKUgHbs=;
 h=From:To:Cc:Subject:Date:References:From;
 b=pQVjKHdCyTXyM3yI1D+LoC0kg4C8K9mPk2EexayLftK/aElAMGSQYDetjaN9f6BFi
 kPNjkUe+xlyzqkdsoYM8wnoD0MOtX6oAim0lcxOhGKEcyDo9octcRANnSlrfk2dUVA
 /IwjZI/EdNsrfZbNiu1t00YwTSu0FHwvPKsYhE9g=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210409083339epcas5p390610902d334aac6b09f42a2cdc61d21~0I4TZAi_t0655606556epcas5p3V;
 Fri,  9 Apr 2021 08:33:39 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F1.E8.41008.36110706; Fri,  9 Apr 2021 17:33:39 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210409074451epcas5p391e5b072e6245b8fe691d67bb42fb234~0INssJsgc1593015930epcas5p3P;
 Fri,  9 Apr 2021 07:44:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210409074451epsmtrp1f909da065faace77f76539f2d3ec427d~0INsq_4Zg0201102011epsmtrp1g;
 Fri,  9 Apr 2021 07:44:51 +0000 (GMT)
X-AuditID: b6c32a4b-661ff7000001a030-a4-60701163acdb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 14.F5.33967.3F500706; Fri,  9 Apr 2021 16:44:51 +0900 (KST)
Received: from test-zns.sa.corp.samsungelectronics.net (unknown
 [107.110.206.5]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210409074450epsmtip2ea9ecdf3f4ebb8b3f44c2a4579b67b51~0INrV1TsE1556515565epsmtip2e;
 Fri,  9 Apr 2021 07:44:50 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: slba equal to nsze is out of bounds if nlb
 is 1-based
Date: Fri,  9 Apr 2021 13:14:02 +0530
Message-Id: <20210409074402.7342-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.30.0-rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7bCmum6yYEGCwbl2BYvXO48zW1zZf57R
 Yv/Bb6wWkw5dY7RYcjHVYt4tZYtZ79rZLI737mCxeD3pP6sDp8ePc+1sHud2nGf32LSqk83j
 ybXNTB7v911l8+jbsooxgC2KyyYlNSezLLVI3y6BK+NH03TWglPsFTOefmNuYNzF2sXIySEh
 YCKx9+QZ9i5GLg4hgd2MEsuevmOFcD4xSvw9+QIq8w3I6bvMDtNy6MMRZojEXkaJX4fmMEE4
 rUwSCyddZgOpYhMwkpj99g0jiC0iICnxu+s0M4jNDLLk21wdEFtYIFzifv9tsDiLgKpE+59F
 LCA2r4CNxNbtX1kgtilLLHx4kBUiLihxcuYTFog58hLNW2eDXSEh8Ihd4uT2T0wQDS4S93ZO
 ZoOwhSVeHd8CdbaUxMv+NiCbHciuljhcBNHawShx7PIGqHJ7iX/PpgHdzAE0X1Ni/S59iLCs
 xNRT65gg1vJJ9P5+ArWJV2LHPBhbTWLBre9Qm2QkZv65DQ1fD4kPz84xg4wUEoiV2PJKdgKj
 /Cwkz8xC8swshMULGJlXMUqmFhTnpqcWmxYY56WW6xUn5haX5qXrJefnbmIEpxwt7x2Mjx58
 0DvEyMTBeIhRgoNZSYS3uTk/QYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvDoMH8UIC6Yklqdmp
 qQWpRTBZJg5OqQamJY4XzhoV2Xde9ZHbf36BKZtmqLh5l1e3du+220cn1eyy+xts8Czpz13P
 5XkJjyLsS4QfRDuzN3ec+vxs6TflGbYMwTEPnlxy96p/veJK34FXz0wa51z668y7n++b4S7j
 0FUnl6oFpYUdbVj0LWedx16TZde84n598jG9rNLjkvrqSNu1iXfT1/urKAmkeqk/XaAW7Ovl
 4f81sPWBo9IvtscOO+3ubWp9o9qyLzhN27LB1VpVa9fvjws9Z5/gfsdxTdnkTOOVq2IST12i
 yq7u3Go1Mfzpmf1Vv7oeJ2qwWVxKiuNcZdU8dfHErV4v2J23KZ3JuPok0yVDasmZpQaPDlSk
 TpYP4pcWfmhhmLBKiaU4I9FQi7moOBEA5g3OLagDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLLMWRmVeSWpSXmKPExsWy7bCSvO5n1oIEg7O7dCxe7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErowfTdNZC06xV8x4+o25gXEXaxcjJ4eE
 gInEoQ9HmLsYuTiEBHYzSix7tJ0NIiEj8evUVGYIW1hi5b/n7CC2kEAzk0T/YRMQm03ASGL2
 2zeMILaIgKTE767TYIOYBY4ySlxun8wCkhAWCJXYfuUs2FAWAVWJ9j+LwOK8AjYSW7d/ZYFY
 oCyx8OFBVoi4oMTJmU/A4swC8hLNW2czT2Dkm4UkNQtJagEj0ypGydSC4tz03GLDAsO81HK9
 4sTc4tK8dL3k/NxNjOAQ1tLcwbh91Qe9Q4xMHIyHGCU4mJVEeJub8xOEeFMSK6tSi/Lji0pz
 UosPMUpzsCiJ817oOhkvJJCeWJKanZpakFoEk2Xi4JRqYGqy+f9TqfiD6AWHH1v+mSdncO1N
 ahBhqzMO1DRgS5LiMl15I/WbnN01vU2zDLOl5W5b7pm988qkwK09hsslZC/t/5sTPU3g7bWQ
 af+0o46I/Jql5FSUsc30f9Gtf+Lv7CTthDfJCnznuazlktUT/+Zh1P/gh3fnx74u/vxgYb/D
 ojWyzimbdU58Tvl/js/746dPgoyBtdOPPlfx7tdquWHQn5Tf6fRlhY6EVlXqZ6byb8c2KL1q
 1//NGaA5QUu9MGXKWimvw8r/vtgtjNRJb627tKJy0swNU3ZYaL5IaHbj3l6cm1jceNhqyU4T
 lVOssSZfDp5NZ+Yz/NZlF+cYvoon127Wiuop6ZHGy95MV2Ipzkg01GIuKk4EAJZCE77QAgAA
X-CMS-MailID: 20210409074451epcas5p391e5b072e6245b8fe691d67bb42fb234
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210409074451epcas5p391e5b072e6245b8fe691d67bb42fb234
References: <CGME20210409074451epcas5p391e5b072e6245b8fe691d67bb42fb234@epcas5p3.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NSZE is the total size of the namespace in logical blocks. So the max
addressable logical block is NLB minus 1. So your starting logical
block is equal to NSZE it is a out of range.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 953ec64729..be9edb1158 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2527,7 +2527,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
             uint64_t slba = le64_to_cpu(range[i].slba);
             uint32_t nlb = le32_to_cpu(range[i].nlb);
 
-            if (nvme_check_bounds(ns, slba, nlb)) {
+            if (nvme_check_bounds(ns, slba, nlb) || slba == ns->id_ns.nsze) {
                 trace_pci_nvme_err_invalid_lba_range(slba, nlb,
                                                      ns->id_ns.nsze);
                 continue;
-- 
2.17.1


