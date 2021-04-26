Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D28036AF19
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 09:59:06 +0200 (CEST)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1law92-0001lS-Sf
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 03:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1law84-0001GP-AO
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 03:58:04 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:42086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1law7y-0002e3-E7
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 03:58:03 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210426075747epoutp02271066fa6707421ef5baeabc383ffa86~5WW1q14bC1200812008epoutp02w
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 07:57:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210426075747epoutp02271066fa6707421ef5baeabc383ffa86~5WW1q14bC1200812008epoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1619423867;
 bh=d7Fuv7TjQb1mSY3pkjEIOX2rZkIskFa7R4qUmnlYA48=;
 h=From:To:Cc:Subject:Date:References:From;
 b=onqlT0oZK3v3aRw6yCi3zx7NpnOcSXV41g6K+YlTsIZ9S5GaC4HIgzleMkMuTCcvs
 Er976HGv8DN2dSR28yhw6PJSkeO8x6iT65Xospf6Rygn3ahW9TSvlyVIDEfBTm4sOt
 p9nPmtKLPF6Du0U0S3YzL7q9ZvnR4N89NDXEHQh4=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210426075747epcas5p43c952e48102573944765689fb2e4cd14~5WW1QsAwV1845418454epcas5p4X;
 Mon, 26 Apr 2021 07:57:47 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 96.2C.09835.A7276806; Mon, 26 Apr 2021 16:57:46 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210426074741epcas5p1ac30fed5ef8c21a1b7e5685920ff6847~5WOBZ5CDf2694226942epcas5p1S;
 Mon, 26 Apr 2021 07:47:41 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210426074741epsmtrp26d91cfbf264b8f175c07384785535913~5WOBZJAoO1166611666epsmtrp2D;
 Mon, 26 Apr 2021 07:47:41 +0000 (GMT)
X-AuditID: b6c32a4b-7dfff7000000266b-07-6086727a9cf6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 A1.F7.08163.D1076806; Mon, 26 Apr 2021 16:47:41 +0900 (KST)
Received: from test-zns.sa.corp.samsungelectronics.net (unknown
 [107.110.206.5]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210426074740epsmtip11bc1a6b86ba043043da54c6af36b902f~5WOAET0bI2617826178epsmtip1i;
 Mon, 26 Apr 2021 07:47:40 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: fix csi field for cns 0x00 and 0x11
Date: Mon, 26 Apr 2021 13:16:50 +0530
Message-Id: <20210426074650.24245-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.30.0-rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEKsWRmVeSWpSXmKPExsWy7bCmpm5VUVuCwadT1havdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8bEhy/YCto5K9ZducDWwNjB3sXIwSEh
 YCKx5ZBEFyMXh5DAbkaJU98us3QxcgI5nxgl5h6OhbA/M0pcnaILYoPU37pzjBkivotR4swK
 a4jmViaJqVe7mEASbAJGErPfvmEEsUUEJCV+d50Ga2AG2fBtrg6ILSzgLDFj/gN2EJtFQFXi
 5M53YPW8ArYSHTduskIsU5ZY+PAgK0RcUOLkzCcsEHPkJZq3zmYGWSwh8Ihd4vbGV0wQDS4S
 G44tZIawhSVeHd/CDmFLSXx+t5eti5EdyK6WOFwE0drBKHHs8gY2iBJ7iX/PpjGCAoVZQFNi
 /S59iLCsxNRT65gg1vJJ9P5+ArWJV2LHPBhbTWLBre9Qm2QkZv65DXW+h8Tjz//ZIGEVK3F6
 6THmCYzys5B8MwvJN7MQNi9gZF7FKJlaUJybnlpsWmCcl1quV5yYW1yal66XnJ+7iRGcbLS8
 dzA+evBB7xAjEwfjIUYJDmYlEV62Xa0JQrwpiZVVqUX58UWlOanFhxilOViUxHkFnasThATS
 E0tSs1NTC1KLYLJMHJxSDUycrtt902dm7vHqP3nbk7GGVVw/5/W94vhb/3zWTW9YNY9bs7Sd
 lXv9Tuagui0iz9YsZHie+XN1Zu0a7x2Sq9uDdZ+ufr+gJbP+6QymG8E3b1qxJLM43mOa+ejx
 Cgu2COaulK2Jom9+6fn/5k6VrPokaLlRWybJjWumjVNgm0yde6bJpdkzFk+p25oXHpRkljHf
 z+Hqjg9PNnydvHKRxmO/iE7hm+HsMgw9hlPu2SlWbp9Xc2mDw8uSZceYJyUvVNn38/ByA/d5
 zGc/bxHzWKFydWWGZIddQ+ynqteJj9b1le/eyipVdm15378vT78t1Lv0vyNgg7zwuoqFDg+u
 VldPOn4mWfw4y9Hut5Ms3tsosRRnJBpqMRcVJwIAV59ekKUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHLMWRmVeSWpSXmKPExsWy7bCSnK5sQVuCwYmtihavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8bEhy/YCto5K9ZducDWwNjB3sXIySEh
 YCJx684x5i5GLg4hgR2MEjO/X2WCSMhI/Do1lRnCFpZY+e85O0RRM5PE6XetrCAJNgEjidlv
 3zCC2CICkhK/u06DTWIWOMoocbl9MgtIQljAWWLG/Adg61gEVCVO7nwH1sArYCvRceMmK8QG
 ZYmFDw+yQsQFJU7OfALWyywgL9G8dTbzBEa+WUhSs5CkFjAyrWKUTC0ozk3PLTYsMMpLLdcr
 TswtLs1L10vOz93ECA5iLa0djHtWfdA7xMjEwXiIUYKDWUmEl21Xa4IQb0piZVVqUX58UWlO
 avEhRmkOFiVx3gtdJ+OFBNITS1KzU1MLUotgskwcnFINTPryMt8L72z6J7P25qv714L//OXi
 iOUOMaso2v08OchpuqN8ctEVM+3eOSFri1cyllqZRDAd6/525XMry/MLpy0eBrLwJbNn7kgv
 WXtBTGo7u3CHdr21oetD5ZNqz0TOOyowq+wrSuh/rtNmmW1k16vL0iWoqHzhSazMCz0TIZ3c
 zfd4VS4Iv30b7X0662n129e3xWU91zZvfXXB1/pMf6gFv69QWnnMYbMJfu4h3bMD38vMnbbb
 nFfwQsraVNW9XPxizkkFMXHTFMXTF3ad63CU6r/qec/rdBpXzYKft2OO6a1a/bXhlcvPr5vL
 DkzrPfhDbYk/b9xUNs3OX4vuJ3X4uzEu0xYokQsuVlBiKc5INNRiLipOBAD6OHTq0QIAAA==
X-CMS-MailID: 20210426074741epcas5p1ac30fed5ef8c21a1b7e5685920ff6847
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210426074741epcas5p1ac30fed5ef8c21a1b7e5685920ff6847
References: <CGME20210426074741epcas5p1ac30fed5ef8c21a1b7e5685920ff6847@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.25;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout2.samsung.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

As per the TP 4056d Namespace types CNS 0x00 and CNS 0x11
CSI field shouldn't use but it is being used for these two
Identify command CNS values, fix that.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/nvme/ctrl.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 2e7498a73e..1657b1d04a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4244,11 +4244,16 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
         }
     }
 
-    if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
-        return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
+    if (active && nvme_csi_has_nvm_support(ns)) {
+        goto out;
+    } else if (!active && ns->csi == NVME_CSI_NVM) {
+        goto out;
+    } else {
+        return NVME_INVALID_CMD_SET | NVME_DNR;
     }
 
-    return NVME_INVALID_CMD_SET | NVME_DNR;
+out:
+    return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
 }
 
 static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
-- 
2.17.1


