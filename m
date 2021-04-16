Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB64D361E97
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 13:26:36 +0200 (CEST)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXMcN-0008NX-8f
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 07:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lXMbN-0007os-5h
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 07:25:33 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:25730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lXMbE-0005xG-Ks
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 07:25:32 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210416112518epoutp01068403c0621f5841fd84a6ed06a42382~2UvKtK0Sh2551825518epoutp01d
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 11:25:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210416112518epoutp01068403c0621f5841fd84a6ed06a42382~2UvKtK0Sh2551825518epoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618572318;
 bh=4Foc4Iu0kCaztJz5z+4RMBEKlmNpYPDs9njJv8rUg7Q=;
 h=From:To:Cc:Subject:Date:References:From;
 b=jxeG0z19+SIi4wLV6i8hjAU9mdlrtu5QJ8rSwAL1jVWWkLNW40BC1A2Bl1ocpryKZ
 MG43zIKwEBnEqBsPSmqmm0ADhpg5eVaA4lL7edhNVjL3BlglvRKnXv97GY7ZRupJik
 wrHhool5SzICsXpFLVbaB0THV8wt/hO+n1DPoVp4=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20210416112517epcas5p1e2a1bd1c9b0d440c6e467b67698bdf5a~2UvKStx4u1160011600epcas5p1X;
 Fri, 16 Apr 2021 11:25:17 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A7.77.41008.D1479706; Fri, 16 Apr 2021 20:25:17 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210416112501epcas5p4f219cdc71e64928681153f702a5ed2b1~2Uu7df-_n0382303823epcas5p44;
 Fri, 16 Apr 2021 11:25:01 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210416112501epsmtrp23f5c76fb58d09cb1dc30cb868e59e794~2Uu7cujXD1288012880epsmtrp2h;
 Fri, 16 Apr 2021 11:25:01 +0000 (GMT)
X-AuditID: b6c32a4b-661ff7000001a030-c3-6079741dae74
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 47.53.08745.D0479706; Fri, 16 Apr 2021 20:25:01 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.99.42.33]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210416112500epsmtip24b1545e7483a222a8300c9a4a0192ce3~2Uu6EgpYm0798507985epsmtip2M;
 Fri, 16 Apr 2021 11:25:00 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/block/nvme: fix lbaf formats initialization
Date: Fri, 16 Apr 2021 16:52:06 +0530
Message-Id: <20210416112206.29045-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7bCmhq5sSWWCQescI4vXO48zW1zZf57R
 Yv/Bb6wWkw5dY7RYcjHVYt4tZYtZ79rZLI737mCxeD3pP6sDp8ePc+1sHud2nGf32LSqk83j
 ybXNTB7v911l8+jbsooxgC2KyyYlNSezLLVI3y6BK6PhxS2WgktSFc/3PWdpYNwv2MXIySEh
 YCLxfcZyxi5GLg4hgd2MEvP73rBCOJ8YJS7v3MwG4XxmlGhbepANpmXbw+3sEIldjBI7Hx5i
 hnDamCRmf25jAaliEzCSmP32DSOILSIgKfG76zQziM0MsuTbXB0QW1jASWLf98WsIDaLgKpE
 w6sXYPW8ArYSUw7/YYfYJi+xesMBsAUSAsfYJTZ9XgBUxAHkuEgc+GUEUSMs8er4Fqh6KYnP
 7/YCXcoOZFdLHC6C6OxglDh2eQPUA/YS/55NA5vCLKApsX6XPkRYVmLqqXVMEFfySfT+fsIE
 EeeV2DEPxlaTWHDrO9QmGYmZf26zQtgeEjM6PoJ9KCQQK9Gw7CfzBEbZWQgbFjAyrmKUTC0o
 zk1PLTYtMM5LLdcrTswtLs1L10vOz93ECE4JWt47GB89+KB3iJGJg/EQowQHs5IIr3FnRYIQ
 b0piZVVqUX58UWlOavEhRmkOFiVx3h0GD+KFBNITS1KzU1MLUotgskwcnFINTPExBWemhyoW
 +3RFf7Dvqtiy9uilxBf7zoUpy5YWPo1eMW3JQf/4R78cdt9njOd3mq6h8IGh5a9O4spDm+Jv
 Jdj2z7ZVMzlfLD+ncbWVTs8u0VNT/+7SZ7g7v0uvfrHTo103di1//jRhY7DbxMdNMRcP6H+4
 JZjxy3P+Q9umouDlPLf8/ziuPBFQUWlZyRD+KGOL5bt96dxNHWU/9DeY7G+/c553bs+0L9MO
 HU7sKmRJer5xp2ij+jeP1WumZXzUuyjKq35mYiDPWc1mub/MS04f0F/E/qlIvjQmcPfOaud5
 JmoPDJTYCxcqr3qszxBo+ej4xJJ9y7aqKdZ+tWLyP9bT2xG0mYPpo86i9XwBu5VYijMSDbWY
 i4oTAd9kFDt4AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LZdlhJXpe3pDLBoPOtocXrnceZLa7sP89o
 sf/gN1aLSYeuMVosuZhqMe+WssWsd+1sFsd7d7BYvJ70n9WB0+PHuXY2j3M7zrN7bFrVyebx
 5NpmJo/3+66yefRtWcUYwBbFZZOSmpNZllqkb5fAldHw4hZLwSWpiuf7nrM0MO4X7GLk5JAQ
 MJHY9nA7excjF4eQwA5GiVcz/7FCJGQkfp2aygxhC0us/PccqqiFSaL3yFw2kASbgJHE7Ldv
 GEFsEQFJid9dp5lBipgFjjJKXG6fzAKSEBZwktj3fTHYVBYBVYmGVy/AGngFbCWmHP7DDrFB
 XmL1hgPMExh5FjAyrGKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECA4yLa0djHtWfdA7
 xMjEwXiIUYKDWUmE17izIkGINyWxsiq1KD++qDQntfgQozQHi5I474Wuk/FCAumJJanZqakF
 qUUwWSYOTqkGJpW9X6Q8xS5q3Pq6zuf4xaYOv4A1i47HcgVIaWly3nl15MSJshn2E8/wFp58
 9iVcavqN14n8kpy6FY9z028nrjqj/vWj67T1LXm+s2eFiR9S0fuwruUxR/a1D+/8/ExmXNSY
 fOuqqGJlfP6srGlvjFp8dF+dN+F7J2h8oOlU6L5JYUGrv24PtF3B3SK/uuv6niKr8okHGncX
 Ttyrs2nzzp8LX3jM6fNon/pPNOr/pP89OgZbrjYErjo5kSF/e5LYg7biq2rpp1YETlAr/uAq
 affG6s/7bZZaocv3Oai90WlePT1z/dm2xSki+2b0mkyw1QiJ42T+/+7kamkr9cTEUzPOtNyv
 8ptySGqa944bBq+VWIozEg21mIuKEwFsG2wJoQIAAA==
X-CMS-MailID: 20210416112501epcas5p4f219cdc71e64928681153f702a5ed2b1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210416112501epcas5p4f219cdc71e64928681153f702a5ed2b1
References: <CGME20210416112501epcas5p4f219cdc71e64928681153f702a5ed2b1@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

-v2: Addressing review comments (Klaus)
 Change the current "pi" and "ms" constraint check such that it
 will throw the error if ms < 8 and if namespace protection info,
 location and metadata settings are set.
 Splitting this from compare fix patch series.

 hw/block/nvme-ns.c | 59 ++++++++++++++++++++--------------------------
 1 file changed, 26 insertions(+), 33 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7bb618f182..160873a8d4 100644
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
+    if (ns->params.mset) {
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
@@ -395,10 +385,13 @@ static int nvme_ns_check_constraints(NvmeCtrl *n, NvmeNamespace *ns,
         return -1;
     }
 
-    if (ns->params.pi && ns->params.ms < 8) {
-        error_setg(errp, "at least 8 bytes of metadata required to enable "
-                   "protection information");
-        return -1;
+    if (ns->params.ms < 8) {
+        if (ns->params.pi || ns->params.pil || ns->params.mset) {
+            error_setg(errp, "at least 8 bytes of metadata required to enable "
+                    "protection information, protection information location and "
+                    "metadata settings");
+            return -1;
+        }
     }
 
     if (ns->params.nsid > NVME_MAX_NAMESPACES) {
-- 
2.17.1


