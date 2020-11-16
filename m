Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF422B41A8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 11:46:53 +0100 (CET)
Received: from localhost ([::1]:50654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kec29-0004AX-0b
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 05:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kebzs-0002Qc-MT; Mon, 16 Nov 2020 05:44:34 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:42704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kebzp-0001F5-5a; Mon, 16 Nov 2020 05:44:32 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGAeAwK126605;
 Mon, 16 Nov 2020 10:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=eJwmRU5kFwrdMzXJxYRDPPGvwmbEIbAUidbEwMQXjsg=;
 b=g0GLCoHMUUT463eDlWNVnvN1H5m5WLBv3ASIpZ230XwhZohTrCYQnJ7ZPWaHTfaHb+b7
 z8mLXxrabdb+sNaod0a91YJPTFhEso47MWooRGqcRyMd+MiamMxzNkhuTEpMDZOKFYac
 yQ8vVzn+9Q7ClDf7nFAYAJPiaRhGvZNw6HR+rKKiA+q/dP0mdAytSQnJmvHetSzvpnak
 k5P9ppbZZs1x7k/+y+TBHi5v03Le/TCPLeDUl+rG1LF49ItvsQBEcWf+GMFD7zx3UWoY
 XSiQ5twN4ZvPzJzh/iVCoKMoXC71+uWuW3i5lBH7w8mB4u1RsPDuHpGd01jbikYUCSRK /g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 34t4ramj7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Nov 2020 10:44:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGAeSgo129269;
 Mon, 16 Nov 2020 10:42:23 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 34ts5uhngj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Nov 2020 10:42:23 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AGAgMwo025554;
 Mon, 16 Nov 2020 10:42:22 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 16 Nov 2020 02:42:22 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 1d9dce61;
 Mon, 16 Nov 2020 10:42:16 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/5] hw/block: Flash images can be smaller than the device
Date: Mon, 16 Nov 2020 10:42:13 +0000
Message-Id: <20201116104216.439650-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201116104216.439650-1-david.edmondson@oracle.com>
References: <20201116104216.439650-1-david.edmondson@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=1 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160062
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=1 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011160062
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 05:42:28
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When loading a flash image into a device, allow the image to be
smaller than the extent of the device.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/block/block.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/block/block.c b/hw/block/block.c
index 8b284e1f14..40262546bd 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -16,8 +16,8 @@
 
 /*
  * Read the entire contents of @blk into @buf.
- * @blk's contents must be @size bytes, and @size must be at most
- * BDRV_REQUEST_MAX_BYTES.
+ * @blk's contents must not be more than @size bytes, and must be at
+ * most BDRV_REQUEST_MAX_BYTES in length.
  * On success, return true.
  * On failure, store an error through @errp and return false.
  * This function not intended for actual block devices, which read on
@@ -38,10 +38,10 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
                          name);
         return false;
     }
-    if (blk_len != size) {
-        error_setg(errp, "device requires %" HWADDR_PRIu " bytes, "
-                   "block backend %s provides %" PRIu64 " bytes",
-                   size, name, blk_len);
+    if (blk_len > size) {
+        error_setg(errp, "block backend %s is too large for device "
+                   "(%" PRIu64 " > %" HWADDR_PRIu ")",
+                   name, blk_len, size);
         return false;
     }
 
@@ -51,8 +51,8 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
      * should probably rework the device to be more like an actual
      * block device and read only on demand.
      */
-    assert(size <= BDRV_REQUEST_MAX_BYTES);
-    ret = blk_pread(blk, 0, buf, size);
+    assert(blk_len <= BDRV_REQUEST_MAX_BYTES);
+    ret = blk_pread(blk, 0, buf, blk_len);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "can't read block backend %s",
                          name);
-- 
2.28.0


