Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DB136205C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 14:59:07 +0200 (CEST)
Received: from localhost ([::1]:42598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXO3u-0004xS-Jt
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 08:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lXO2u-00049F-M3
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 08:58:04 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:11531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lXO2p-0002I3-RJ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 08:58:04 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210416125752epoutp01d873a9046e2066e1cee6dd336fca6417~2V-_-uuy22599725997epoutp01B
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:57:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210416125752epoutp01d873a9046e2066e1cee6dd336fca6417~2V-_-uuy22599725997epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618577872;
 bh=+YYmHF1Vjto0mzbi9qlffe858Q58ow5igVTuaNu/oso=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Ctczf7Dvyx963NnfMpAJUVsk7VvAeK/jib9yfaCVP3u8lk2/sEHLk05v1snoN7+z1
 5BUT3P618gSnULE7m+QINAQzKhvy9PhPNeB3Vq4eiFwkQzKinqcWg0hcxre7ZTZIMt
 woZKTlGr6HuV50MgTjbAM/B7I5J+Z/Q9T6NXWac4=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210416125751epcas5p2c544c3a68500bc7106e8c378f8d9dfeb~2V-_YhVxf2223722237epcas5p2a;
 Fri, 16 Apr 2021 12:57:51 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 32.27.15682.FC989706; Fri, 16 Apr 2021 21:57:51 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210416120324epcas5p354e2f196cc68680aba45341f385b59ed~2VQcTFWMx0591505915epcas5p35;
 Fri, 16 Apr 2021 12:03:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210416120324epsmtrp2da5f2ab389827713707350e6e8a3bb8a~2VQcSPdPy0190801908epsmtrp2l;
 Fri, 16 Apr 2021 12:03:24 +0000 (GMT)
X-AuditID: b6c32a49-8bfff70000013d42-e1-607989cf19cb
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D8.E5.33967.C0D79706; Fri, 16 Apr 2021 21:03:24 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.99.42.33]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210416120323epsmtip19e52d86b65ef90d6bdc6b2d729bcb88f~2VQa5-ZzJ3147131471epsmtip1Q;
 Fri, 16 Apr 2021 12:03:23 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] hw/block/nvme: fix lbaf formats initialization
Date: Fri, 16 Apr 2021 17:29:07 +0530
Message-Id: <20210416115907.30625-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsWy7bCmuu75zsoEg6v/BS1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsEroxnJxezF/ySqji57hJLA+MLwS5GDg4J
 AROJxZctuxi5OIQEdjNK/Lq+ig3C+cQocbV5FQuE841RYtWvX4wwHdPm2kDE9zJKfLywnxXC
 aWOS2HW0C8jh5GATMJKY/fYNI4gtIiAp8bvrNDOIzQyy49tcHZBBwgJOEv0fXUDCLAKqEheb
 HoO18grYSrz6cBesXEJAXmL1hgPMIPMlBI6xS/xtb2GBSLhIdPc1sUHYwhKvjm9hh7ClJD6/
 2wsUZweyqyUOF0G0djBKHLu8AarcXuLfs2lgvzALaEqs36UPEZaVmHpqHRPElXwSvb+fMEHE
 eSV2zIOx1SQW3PoOtUlGYuaf26wQtodE04JlYHEhgViJI+v3MU1glJ2FsGEBI+MqRsnUguLc
 9NRi0wLDvNRyveLE3OLSvHS95PzcTYzgdKDluYPx7oMPeocYmTgYDzFKcDArifAad1YkCPGm
 JFZWpRblxxeV5qQWH2KU5mBREufdYfAgXkggPbEkNTs1tSC1CCbLxMEp1cDUnXJWRXHa9dgX
 ehHXlS4u3ZKx+/28E9oNJfNPHbmjvPaWh33GmZ6tzzNk3vde/1FgevGumnqaHXNHfbmRs5xT
 UL1ouPrnV5mvy4R232pifnW7p+aZ6V/R58xKBx4eXqB+cKXPh4SfDoEBN+6+2Ttz2V9OQY3G
 yaWlU6W32TQ7LyxJuJ48+e6lhyqFR78YmbClnDgV5bspdUJRpBi7Q4CEd7PyipdlbB8400wO
 ux2Z+d5pb4G+7/90CX+eBlv3CQfadynVXektuG1xw/Pn3qOVwd61s4Kqtv9dfEf4bIlNpp3y
 1RBGDdUJYVrzzsj3vr5vWDH7QeDDM30vwpT3dK5MfNlhGnrQJeVc9dnEhKVKLMUZiYZazEXF
 iQBks9+kdgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphluLIzCtJLcpLzFFi42LZdlhJTpentjLBoOGvocXrnceZLa7sP89o
 sf/gN1aLSYeuMVosuZhqMe+WssWsd+1sFsd7d7BYvJ70n9WB0+PHuXY2j3M7zrN7bFrVyebx
 5NpmJo/3+66yefRtWcUYwBbFZZOSmpNZllqkb5fAlfHs5GL2gl9SFSfXXWJpYHwh2MXIwSEh
 YCIxba5NFyMXh5DAbkaJWYtamLoYOYHiMhK/Tk1lhrCFJVb+e84OUdTCJPFhzwlWkASbgJHE
 7LdvGEFsEQFJid9dp5lBipgFjjJKXG6fzAKyQVjASaL/owtIDYuAqsTFpsdgvbwCthKvPtyF
 WiAvsXrDAeYJjDwLGBlWMUqmFhTnpucWGxYY5qWW6xUn5haX5qXrJefnbmIEB5iW5g7G7as+
 6B1iZOJgPMQowcGsJMJr3FmRIMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU
 1ILUIpgsEwenVAPT/KJjl+8V3j/30OGzwpNPf1OePubv/lUctHst1/aFiyREc5KmfAlpZI05
 5VG67c9Pp5Br/MeuJJ9rO3Z2p6F1467HwR1Xcx5s/LyaJ//a9uyp+Xsy97VXRS9bUNgpuIDh
 enRV6fQVDYGMpd9v6Bt8E7arYTJdv1jMS+ZBp9Pv/Wm21+oK42x+/dr1vnP5Y+vGbLuvK0MO
 /7pyfoPzeaEcTjavqqonbTH173iWb3RluOg0KTVJuNyPSztQWb72dX3ixdRTLWGL3DdUPOie
 1irNZJTCmNX+Pf/avyQdt9tuf5773enda+u6QvRnwR0v5tlvDffsXKsqz2ETMNll1wxjP7Gq
 cvl5rM6SyzkkMxcpsRRnJBpqMRcVJwIAJEl0zJ8CAAA=
X-CMS-MailID: 20210416120324epcas5p354e2f196cc68680aba45341f385b59ed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210416120324epcas5p354e2f196cc68680aba45341f385b59ed
References: <CGME20210416120324epcas5p354e2f196cc68680aba45341f385b59ed@epcas5p3.samsung.com>
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

Currently LBAF formats are being intialized based on metadata
size if and only if nvme-ns "ms" parameter is non-zero value.
Since FormatNVM command being supported device parameter "ms"
may not be the criteria to initialize the supported LBAFs.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
-v3: Remove "mset" constraint  check if ms < 8, "mset" can be
 set even when ms < 8 and non-zero.

-v2: Addressing review comments (Klaus)
 Change the current "pi" and "ms" constraint check such that it
 will throw the error if ms < 8 and if namespace protection info,
 location and metadata settings are set.
 Splitting this from compare fix patch series.

 hw/block/nvme-ns.c | 58 ++++++++++++++++++++--------------------------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7bb618f182..594b0003cf 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -85,38 +85,28 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     ds = 31 - clz32(ns->blkconf.logical_block_size);
     ms = ns->params.ms;
 
-    if (ns->params.ms) {
-        id_ns->mc = 0x3;
+    id_ns->mc = 0x3;
 
-        if (ns->params.mset) {
-            id_ns->flbas |= 0x10;
-        }
+    if (ms && ns->params.mset) {
+        id_ns->flbas |= 0x10;
+    }
 
-        id_ns->dpc = 0x1f;
-        id_ns->dps = ((ns->params.pil & 0x1) << 3) | ns->params.pi;
-
-        NvmeLBAF lbaf[16] = {
-            [0] = { .ds =  9           },
-            [1] = { .ds =  9, .ms =  8 },
-            [2] = { .ds =  9, .ms = 16 },
-            [3] = { .ds =  9, .ms = 64 },
-            [4] = { .ds = 12           },
-            [5] = { .ds = 12, .ms =  8 },
-            [6] = { .ds = 12, .ms = 16 },
-            [7] = { .ds = 12, .ms = 64 },
-        };
-
-        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
-        id_ns->nlbaf = 7;
-    } else {
-        NvmeLBAF lbaf[16] = {
-            [0] = { .ds =  9 },
-            [1] = { .ds = 12 },
-        };
+    id_ns->dpc = 0x1f;
+    id_ns->dps = ((ns->params.pil & 0x1) << 3) | ns->params.pi;
 
-        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
-        id_ns->nlbaf = 1;
-    }
+    NvmeLBAF lbaf[16] = {
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
 
     for (i = 0; i <= id_ns->nlbaf; i++) {
         NvmeLBAF *lbaf = &id_ns->lbaf[i];
@@ -395,10 +385,12 @@ static int nvme_ns_check_constraints(NvmeCtrl *n, NvmeNamespace *ns,
         return -1;
     }
 
-    if (ns->params.pi && ns->params.ms < 8) {
-        error_setg(errp, "at least 8 bytes of metadata required to enable "
-                   "protection information");
-        return -1;
+    if (ns->params.ms < 8) {
+        if (ns->params.pi || ns->params.pil) {
+            error_setg(errp, "at least 8 bytes of metadata required to enable "
+                    "protection information, protection information location");
+            return -1;
+        }
     }
 
     if (ns->params.nsid > NVME_MAX_NAMESPACES) {
-- 
2.17.1


