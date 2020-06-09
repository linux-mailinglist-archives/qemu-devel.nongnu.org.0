Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A181F3EFD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 17:15:36 +0200 (CEST)
Received: from localhost ([::1]:47318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jifyR-00067e-7Z
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 11:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yili@winhong.com>)
 id 1jifxS-0005hz-Kg; Tue, 09 Jun 2020 11:14:34 -0400
Received: from regular1.263xmail.com ([211.150.70.205]:38276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yili@winhong.com>)
 id 1jifxO-0002VJ-JM; Tue, 09 Jun 2020 11:14:33 -0400
Received: from localhost (unknown [192.168.167.209])
 by regular1.263xmail.com (Postfix) with ESMTP id 32D7556A;
 Tue,  9 Jun 2020 23:14:15 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from localhost.localdomain (unknown [14.18.236.69])
 by smtp.263.net (postfix) whith ESMTP id
 P4798T139788605179648S1591715648790469_; 
 Tue, 09 Jun 2020 23:14:14 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <df1445036e9d6cfd9b13638a2d4cbeaa>
X-RL-SENDER: yili@winhong.com
X-SENDER: yili@winhong.com
X-LOGIN-NAME: yili@winhong.com
X-FST-TO: dillaman@redhat.com
X-SENDER-IP: 14.18.236.69
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: Yi Li <yili@winhong.com>
To: dillaman@redhat.com
Subject: [PATCH v2] rbd: Use RBD fast-diff for querying actual allocation
Date: Tue,  9 Jun 2020 23:13:50 +0800
Message-Id: <20200609151350.3681640-1-yili@winhong.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <CAJfdMYCS7SJ66K2F7a9qyKyP9f1Tmbe9N7qvshNe6jAZZtpWBg@mail.gmail.com>
References: <CAJfdMYCS7SJ66K2F7a9qyKyP9f1Tmbe9N7qvshNe6jAZZtpWBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.150.70.205; envelope-from=yili@winhong.com;
 helo=regular1.263xmail.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 11:14:20
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, yilikernel@gmail.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, yili@winhong.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since Ceph version Infernalis (9.2.0) the new fast-diff mechanism
of RBD allows for querying actual rbd image usage.

Prior to this version there was no easy and fast way to query how
much allocation a RBD image had inside a Ceph cluster.

To use the fast-diff feature it needs to be enabled per RBD image
and is only supported by Ceph cluster running version Infernalis
(9.2.0) or newer.

The fast-diff feature disabled or fast-diff map is marked as invalid,
qemu-img will report an allocation identical to the image capacity.

'qemu-img info rbd:cepharm/liyi-rbd' might output for example:

  image: json:{"driver": "raw", "file": {"pool": "cepharm",
  "image": "liyi-rbd", "driver": "rbd"}}
  file format: raw
  virtual size: 20 GiB (21474836480 bytes)
  disk size: 0 B
  cluster_size: 4194304

Newly created rbds will have the fast-diff feature enabled.

Signed-off-by: Yi Li <yili@winhong.com>
---
 block/rbd.c | 103 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/block/rbd.c b/block/rbd.c
index 617553b022..c1e68ff7e9 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1107,6 +1107,108 @@ static int64_t qemu_rbd_getlength(BlockDriverState *bs)
     return info.size;
 }
 
+#if LIBRBD_VERSION_CODE > 265
+static int disk_usage_callback(uint64_t offset, size_t len, int exists,
+                               void *arg)
+{
+  uint64_t *used_size = (uint64_t *)(arg);
+  if (exists) {
+    (*used_size) += len;
+  }
+  return 0;
+}
+
+static int qemu_rbd_getflags(rbd_image_t image, uint64_t *flags)
+{
+    int r;
+
+    r = rbd_get_flags(image, flags);
+    if (r < 0) {
+        return r;
+    }
+    return 0;
+}
+
+static bool qemu_rbd_use_fastdiff(uint64_t features, uint64_t flags)
+{
+    return (((features & RBD_FEATURE_FAST_DIFF) != 0ULL) &&
+            ((flags & RBD_FLAG_FAST_DIFF_INVALID) == 0ULL));
+}
+
+static int qemu_rbd_set_allocation(rbd_image_t image,
+                                   rbd_image_info_t *info,
+                                   uint64_t *used_size)
+{
+    int r;
+    /*
+     * RBD image fast-diff feature enabled
+     * Querying for actual allocation.
+     */
+    r = rbd_diff_iterate2(image, NULL, 0, info->size, 0, 1,
+                          &disk_usage_callback,
+                          used_size);
+    if (r < 0) {
+        return r;
+    }
+    return 0;
+}
+
+#else
+static int qemu_rbd_getflags(rbd_image_t image G_GNUC_UNUSED, uint64_t *flags)
+{
+    *flags = 0;
+    return 0;
+}
+
+static bool qemu_rbd_use_fastdiff(uint64_t features G_GNUC_UNUSED,
+                                  uint64_t feature_flags G_GNUC_UNUSED)
+{
+    return false;
+}
+
+static int qemu_rbd_set_allocation(rbd_image_t image G_GNUC_UNUSED,
+                                   rbd_image_info_t *info _GNUC_UNUSED,
+                                   uint64_t *used_size _GNUC_UNUSED)
+{
+    return 0;
+}
+#endif
+
+static int64_t qemu_rbd_allocated_file_size(BlockDriverState *bs)
+{
+    BDRVRBDState *s = bs->opaque;
+    rbd_image_info_t info;
+    int r;
+    uint64_t used_size = 0;
+    uint64_t features = 0;
+    uint64_t flags = 0;
+
+    r = rbd_stat(s->image, &info, sizeof(info));
+    if (r < 0) {
+        return r;
+    }
+
+    r = rbd_get_features(s->image, &features);
+    if (r < 0) {
+        return r;
+    }
+
+    r = qemu_rbd_getflags(s->image, &flags);
+    if (r < 0) {
+        return r;
+    }
+
+    if (qemu_rbd_use_fastdiff(features, flags)) {
+        r = qemu_rbd_set_allocation(s->image, &info, &used_size);
+        if (r < 0) {
+            return r;
+        }
+    } else {
+        used_size = info.size;
+    }
+    return used_size;
+}
+
 static int coroutine_fn qemu_rbd_co_truncate(BlockDriverState *bs,
                                              int64_t offset,
                                              bool exact,
@@ -1316,6 +1418,7 @@ static BlockDriver bdrv_rbd = {
     .bdrv_get_info          = qemu_rbd_getinfo,
     .create_opts            = &qemu_rbd_create_opts,
     .bdrv_getlength         = qemu_rbd_getlength,
+    .bdrv_get_allocated_file_size = qemu_rbd_allocated_file_size,
     .bdrv_co_truncate       = qemu_rbd_co_truncate,
     .protocol_name          = "rbd",
 
-- 
2.25.3




