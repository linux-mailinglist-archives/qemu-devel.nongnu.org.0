Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE7E5EFED6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 22:46:20 +0200 (CEST)
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe0QF-00060R-9G
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 16:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=1271248072=kbusch@meta.com>)
 id 1odzmx-0002pq-FJ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 16:05:47 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:19868
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=1271248072=kbusch@meta.com>)
 id 1odzmv-0005SZ-VU
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 16:05:43 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 28TJIahw012015
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 13:05:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=s2048-2021-q4;
 bh=AoyPjajIpyVidAzljD0XY/jKYrambGL1LiJyA48EaKo=;
 b=fAgipyfXhA5JnXgmU/lynv9UAAzXV37Di8cw8H6hxmmCULzz3gf8bhxgaVE27RzeL1TX
 2XaVMZnkyoD2ihl8j2YrB+L2zNWTzKT7fBVjs9wIgotzymmZmiCC2q9owF9ugywHMw+g
 aThIthapExAsONzj18r2qfYK5KpMB1fb79ejEJAoMUMy/Ykat5FF5GJuaTrBv8phwQ3P
 IhfIKF4nNoA+AxfMtG9h6V0Yvi0ZjfJXwv3mUDI99AUkgBr5BQTUTYsAhJrFaHkjjsU/
 XSRN/384polgxvP4rZ+NEa7YYEyMPWYTRsOgvdo4hq61EE/39ZvhcQeqjgzh1cKjG8ZJ rQ== 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net (PPS) with ESMTPS id 3jvxq2yy4q-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 13:05:40 -0700
Received: from twshared8247.08.ash8.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:21d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 13:05:36 -0700
Received: by devbig007.nao1.facebook.com (Postfix, from userid 544533)
 id 40BDC930500A; Thu, 29 Sep 2022 13:05:24 -0700 (PDT)
From: Keith Busch <kbusch@meta.com>
To: <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, Maxim Levitsky
 <mlevitsk@redhat.com>, <kvm@vger.kernel.org>,
 Keith Busch <kbusch@kernel.org>
Subject: [PATCHv3 1/2] block: move bdrv_qiov_is_aligned to file-posix
Date: Thu, 29 Sep 2022 13:05:22 -0700
Message-ID: <20220929200523.3218710-2-kbusch@meta.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220929200523.3218710-1-kbusch@meta.com>
References: <20220929200523.3218710-1-kbusch@meta.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: 7pozOixM55XP5alTwwLYmuYnHAKFitWS
X-Proofpoint-ORIG-GUID: 7pozOixM55XP5alTwwLYmuYnHAKFitWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_11,2022-09-29_03,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=1271248072=kbusch@meta.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Sep 2022 16:42:15 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Busch <kbusch@kernel.org>

There is only user of bdrv_qiov_is_aligned(), so move the alignment
function to there and make it static.

Signed-off-by: Keith Busch <kbusch@kernel.org>
---
 block/file-posix.c       | 21 +++++++++++++++++++++
 block/io.c               | 21 ---------------------
 include/block/block-io.h |  1 -
 3 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 48cd096624..e3f3de2780 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2061,6 +2061,27 @@ static int coroutine_fn raw_thread_pool_submit(Blo=
ckDriverState *bs,
     return thread_pool_submit_co(pool, func, arg);
 }
=20
+/*
+ * Check if all memory in this vector is sector aligned.
+ */
+static bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qio=
v)
+{
+    int i;
+    size_t alignment =3D bdrv_min_mem_align(bs);
+    IO_CODE();
+
+    for (i =3D 0; i < qiov->niov; i++) {
+        if ((uintptr_t) qiov->iov[i].iov_base % alignment) {
+            return false;
+        }
+        if (qiov->iov[i].iov_len % alignment) {
+            return false;
+        }
+    }
+
+    return true;
+}
+
 static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset=
,
                                    uint64_t bytes, QEMUIOVector *qiov, i=
nt type)
 {
diff --git a/block/io.c b/block/io.c
index 0a8cbefe86..96edc7f7cb 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3236,27 +3236,6 @@ void *qemu_try_blockalign0(BlockDriverState *bs, s=
ize_t size)
     return mem;
 }
=20
-/*
- * Check if all memory in this vector is sector aligned.
- */
-bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
-{
-    int i;
-    size_t alignment =3D bdrv_min_mem_align(bs);
-    IO_CODE();
-
-    for (i =3D 0; i < qiov->niov; i++) {
-        if ((uintptr_t) qiov->iov[i].iov_base % alignment) {
-            return false;
-        }
-        if (qiov->iov[i].iov_len % alignment) {
-            return false;
-        }
-    }
-
-    return true;
-}
-
 void bdrv_io_plug(BlockDriverState *bs)
 {
     BdrvChild *child;
diff --git a/include/block/block-io.h b/include/block/block-io.h
index fd25ffa9be..492f95fc05 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -150,7 +150,6 @@ void *qemu_blockalign(BlockDriverState *bs, size_t si=
ze);
 void *qemu_blockalign0(BlockDriverState *bs, size_t size);
 void *qemu_try_blockalign(BlockDriverState *bs, size_t size);
 void *qemu_try_blockalign0(BlockDriverState *bs, size_t size);
-bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov);
=20
 void bdrv_enable_copy_on_read(BlockDriverState *bs);
 void bdrv_disable_copy_on_read(BlockDriverState *bs);
--=20
2.30.2


