Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3CF2B7C48
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 12:20:39 +0100 (CET)
Received: from localhost ([::1]:38910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfLVu-0001yw-Qj
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 06:20:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kfLU0-000076-3Y; Wed, 18 Nov 2020 06:18:40 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:35644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kfLTv-0002xV-4K; Wed, 18 Nov 2020 06:18:39 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AIBELG8114374;
 Wed, 18 Nov 2020 11:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=E7vxjF6WrMAp3BHX6RDS7wb6ILV+54/MikaOkQrWRvQ=;
 b=fs551iGZ1FKamv52J4Q9kZqPHDcblYbZKrFQz/LB8bM7pG8Tpp4LvDViIAzQUDcYnBhH
 PzE7CqIgvwRxga9CB0WLssZxlj5qiiHjaCpUwwpDkklBaElbkW0XIZyCRgF2IwkjJ4D7
 sM0lhGjbotlFRKL8c/tkAb2Y8boA31NMxa2zdVTJWFspCFlbCmP9QCl26rlP0iJYvSy3
 /pUG1JHXQGvZaU8X51FQsGDQKJ7Wq7L7hbkeqry2Fzf1LFQ4DptVzKQYLsod+XePeZ8T
 Vz6r4mIlGMASfv/dQX+8VfzrLpDYqJN4GtHT4+9n0aOBfSg4dn3mlVw8HgDXevAvkVFI 4g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 34t4raynvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Nov 2020 11:18:25 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AIBFdWb110882;
 Wed, 18 Nov 2020 11:18:25 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 34uspun9k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 11:18:25 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AIBINsj003388;
 Wed, 18 Nov 2020 11:18:24 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Nov 2020 03:18:23 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 2b2a99bd;
 Wed, 18 Nov 2020 11:18:19 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] hw/block: blk_check_size_and_read_all should report
 backend name
Date: Wed, 18 Nov 2020 11:18:15 +0000
Message-Id: <20201118111819.4588-2-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118111819.4588-1-david.edmondson@oracle.com>
References: <20201118111819.4588-1-david.edmondson@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9808
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 mlxscore=0 bulkscore=0 suspectscore=1 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011180079
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9808
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=1 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011180079
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 06:18:29
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

If there are problems examining or reading data from the block
backend, the error messages should include an appropriate identifier
to assist in diagnoses.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/block/block.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/block/block.c b/hw/block/block.c
index 1e34573da7..5fa0f352e3 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -20,9 +20,6 @@
  * BDRV_REQUEST_MAX_BYTES.
  * On success, return true.
  * On failure, store an error through @errp and return false.
- * Note that the error messages do not identify the block backend.
- * TODO Since callers don't either, this can result in confusing
- * errors.
  * This function not intended for actual block devices, which read on
  * demand.  It's for things like memory devices that (ab)use a block
  * backend to provide persistence.
@@ -32,17 +29,19 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
 {
     int64_t blk_len;
     int ret;
+    const char *name = blk_name(blk);
 
     blk_len = blk_getlength(blk);
     if (blk_len < 0) {
         error_setg_errno(errp, -blk_len,
-                         "can't get size of block backend");
+                         "can't get size of block backend '%s'",
+                         name);
         return false;
     }
     if (blk_len != size) {
         error_setg(errp, "device requires %" HWADDR_PRIu " bytes, "
-                   "block backend provides %" PRIu64 " bytes",
-                   size, blk_len);
+                   "block backend '%s' provides %" PRIu64 " bytes",
+                   size, name, blk_len);
         return false;
     }
 
@@ -55,7 +54,8 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
     assert(size <= BDRV_REQUEST_MAX_BYTES);
     ret = blk_pread(blk, 0, buf, size);
     if (ret < 0) {
-        error_setg_errno(errp, -ret, "can't read block backend");
+        error_setg_errno(errp, -ret, "can't read block backend '%s'",
+                         name);
         return false;
     }
     return true;
-- 
2.29.2


