Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7C9406DDA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:01:31 +0200 (CEST)
Received: from localhost ([::1]:59960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOi1y-0007Rg-Q2
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.raghav@samsung.com>)
 id 1mOhrO-0001oJ-Lt
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:50:36 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.raghav@samsung.com>)
 id 1mOhrM-0003cU-AE
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:50:34 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210910145022euoutp0273a6a3d57a1bea2d9c9ccf8dd46db2d9~jfXLSswwM1815718157euoutp02a
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 14:50:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210910145022euoutp0273a6a3d57a1bea2d9c9ccf8dd46db2d9~jfXLSswwM1815718157euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1631285422;
 bh=1YBNOeJLtG2ARgixR4HrKOmLNCJ7foyRTbwJvNqs2lc=;
 h=To:CC:From:Subject:Date:References:From;
 b=h9uJVJ9yIUAcFSdmU1O6aLs6gPEkawjVo5lkomg4xXw+dj6ChB06AAEkM9Gcy+E9+
 K2FkmyAZoWLXu50T2YIAFW02AtX+meeiIeGDsefBeV3Z17jp+yEpAUeCOwCnqaTyBC
 3K9C352qdZtD71w0dgV8igPNRX/65h2OLuQO2qjU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210910145021eucas1p2b6f90cb585b0bae76049439cea033a53~jfXK6ZjT91676116761eucas1p2Z;
 Fri, 10 Sep 2021 14:50:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C8.2E.45756.DA07B316; Fri, 10
 Sep 2021 15:50:21 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210910145020eucas1p223f51e73b525fc3c592f994416b57167~jfXJ70tW71670916709eucas1p2Q;
 Fri, 10 Sep 2021 14:50:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210910145020eusmtrp19f9afb617dbfe584e39542e86fa766b8~jfXJ7NAWB2254822548eusmtrp1H;
 Fri, 10 Sep 2021 14:50:20 +0000 (GMT)
X-AuditID: cbfec7f2-7d5ff7000002b2bc-36-613b70adbd8f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 17.DA.31287.CA07B316; Fri, 10
 Sep 2021 15:50:20 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210910145020eusmtip23e610cacd17ff25755385185263e1267~jfXJyPY6c2127621276eusmtip2n;
 Fri, 10 Sep 2021 14:50:20 +0000 (GMT)
Received: from [192.168.8.130] (106.210.248.112) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 10 Sep 2021 15:50:19 +0100
To: <kbusch@kernel.org>, <its@irrelevant.dk>
From: Pankaj Raghav <p.raghav@samsung.com>
Subject: [PATCH] hw/nvme: Return error for fused operations
Message-ID: <c9186dd4-01bd-b143-8708-41b03caadde7@samsung.com>
Date: Fri, 10 Sep 2021 16:50:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [106.210.248.112]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjlt3s3r4uN21T8yDBYWSg20zRW1tAyWBTkHz5IVnprl2nqtE2z
 giTLbK4H5dJoVlsUpFPzkTRb9HCFr9UcUstWKMuJIBpZZhk+ct4e/nfO953zcc6PH4EJTrNX
 EFnKAlqlpHKEHC7+sGO6d31Dfiy1wTG8VvysfYotrrA6kVj/+RxH3HmxDY/Dpfa2Xh9pi6mc
 I/U4H7ASsTTuVjmdk3WUVkVIMriZjp+DKH+cfaxO8wKdQl24FvkSQEaDqcnoo0VcQkDWIKht
 HsEZMomg+vUXjCHfENSdq2X/tVhqRznM4h4Cl8PM+qca1VUjhjxGUDrStXCZIPzJcJi7sd4L
 sQX31K0dXsghw6Ck3Md704+MBcNHI8uLeaQE3l67uBgPJ0Ng5uoF5MUB5D6Y7bawGc1y6L7u
 wZmLodBoifCOMTIQXB4Di8GrwDx+A2Mir4aX5ps+DD4JPa2uxcRAPifgQ9/nxZBAJoCxbxej
 8YPRztY/+pVg013481o6BB0mivE2LhQ8b2Qz3li49CqH0cSDpXEGZ8Z86B9fzsThQ8XDaxgz
 5oGmTHAZrdEv6aL/30W/pIt+SRcjwk0okC5U5ypodaSSLhKpqVx1oVIhOpSX24IWvoltrvNr
 G7o5OiGyIhaBrAgITOjP62raTAl4cur4CVqVl64qzKHVVhRE4MJAnqm6Pl1AKqgCOpum82nV
 3y2L8F1xiiVxQ32Du0PB02R4yn4dH5k3/kjgytoG7OZmvbJ/b/p02nAr641j6MrX4Hlbijwg
 qkTo3JT3/uSZWDlw9mhwc7PWXvK9Klo05Owzd2+brXo6Yb2TNNbi7+EfHCTP2rJbdWOOZ0RU
 sLHDKY+/Kw934I6EvUUppfHaebYUtDt/hshSpVkpvLqaCLc1NIt/NUqEy5M3HZMZY/qKKXGG
 +6jrSHrMo0NWdniqQLv/8RbHwG5/YWnidgMvOkxcEbAtLkgyIVkH9k9Dy4LEhg11PZWRY+8q
 Ew8n8a1PysnJxiSTIjXZYqZdt9vHPEWmrQc0G9urK++vWSubLs7MFuLqTCoyDFOpqd9PB6y+
 lQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsVy+t/xe7prCqwTDZ7tULXYf/Abq8WkQ9cY
 LWa9a2ezON67g8WBxePcjvPsHptWdbJ5PLm2mSmAOUrPpii/tCRVISO/uMRWKdrQwkjP0NJC
 z8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv48KP+4wFb1krVnccZmxgPMHSxcjJISFgIrFr
 5Su2LkYuDiGBpYwSncdOMUMkZCQ+XfnIDmELS/y51gVV9JFR4tbpS8wQzm5Gib0Nv1i7GDk4
 RAR0JP7N0QUxmYGmfpvnDGKyCWhJNHaCjREWsJaYf2cBE4jNK2AncXV6L9gNLAKqEn+m9DCC
 2KICkRJNJ7ayQdQISpyc+YQFYqKmxPpd+iBhZgFxiVtP5jNB2PIS29/OgbpYWeLI9rlQF9dK
 fP77jHECo/AsJJNmIUyahWTSLCSTFjCyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMqm3H
 fm7ewTjv1Ue9Q4xMHIyHGCU4mJVEeE9ssEwU4k1JrKxKLcqPLyrNSS0+xGgK9NlEZinR5Hxg
 XOeVxBuaGZgamphZGphamhkrifNunbsmXkggPbEkNTs1tSC1CKaPiYNTqoGJ0WyO+ivv2fsC
 dXPiVxvPjE6Z7PqLaXlE0837P8SfXF2vV/Fg+9u3mcUXo82+CdQzfAq1tk70zHxeoc0qd+eA
 YMP1RwGWqzKY8oNPX1tZseBTxv7ImxN+1pye5GZyw5yLizVsiWZQvkrknUiffbefucXo6d+/
 8MzLT/e0abDiQtXYpU//3Mw0cDOyrzuZnmi9eZbh6knz1q/lrxRPevpq2Y4cwVqR6m/bk6T2
 mx3X7/p+ZML6TsMyvbZcmy89F0/3t1wv8uNg0OuuU5hcVCrYfND6UE5P+hV9pg9KSRvt5kj6
 7fD7YfviQlvX4znTbAxTv+vur+ewVHm8kjfLPlw6tHDrqQ0m0wpe7XsdZqLEUpyRaKjFXFSc
 CAA1QQLVMwMAAA==
X-CMS-MailID: 20210910145020eucas1p223f51e73b525fc3c592f994416b57167
X-Msg-Generator: CA
X-RootMTR: 20210910145020eucas1p223f51e73b525fc3c592f994416b57167
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210910145020eucas1p223f51e73b525fc3c592f994416b57167
References: <CGME20210910145020eucas1p223f51e73b525fc3c592f994416b57167@eucas1p2.samsung.com>
Received-SPF: pass client-ip=210.118.77.12; envelope-from=p.raghav@samsung.com;
 helo=mailout2.w1.samsung.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Sep 2021 10:59:29 -0400
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, FUSED operations are not supported by QEMU. As per the 1.4 SPEC,
controller should abort the command that requested a fused operation with 
an INVALID FIELD error code if they are not supported.


Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 hw/nvme/ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index dc0e7b0030..d15a80a054 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3893,6 +3893,10 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return ns->status;
     }
 
+    if (NVME_CMD_FLAGS_FUSE(req->cmd.flags)) {
+        return NVME_INVALID_FIELD;
+    }
+
     req->ns = ns;
 
     switch (req->cmd.opcode) {
-- 
2.25.1

