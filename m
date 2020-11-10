Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1FB2ACFDA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 07:39:24 +0100 (CET)
Received: from localhost ([::1]:37578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcNJL-0001yr-FB
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 01:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaotian9@huawei.com>)
 id 1kcNHx-0001XD-5X
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:37:57 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaotian9@huawei.com>)
 id 1kcNHv-0002Gb-2p
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:37:56 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CVdTM0DMJzhjZv;
 Tue, 10 Nov 2020 14:37:43 +0800 (CST)
Received: from [10.174.178.136] (10.174.178.136) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 10 Nov 2020 14:37:41 +0800
Subject: [PATCH 2/2] virtiofsd: check whether lo_map_reserve returns NULL in
 main func
From: Haotian Li <lihaotian9@huawei.com>
To: <qemu-devel@nongnu.org>, <virtio-fs@redhat.com>
References: <4bfe8bbd-282f-f271-735d-8892791327e1@huawei.com>
Message-ID: <015a5bbb-2c78-2b58-8983-9d8d0d64059b@huawei.com>
Date: Tue, 10 Nov 2020 14:37:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <4bfe8bbd-282f-f271-735d-8892791327e1@huawei.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.136]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=lihaotian9@huawei.com; helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 01:17:02
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In main func, func lo_map_reserve is called without NULL check.
If reallocing new_elems fails in func lo_map_grow, the func
lo_map_reserve may return NULL. We should check whether
lo_map_reserve returns NULL before using it.

Signed-off-by: Haotian Li <lihaotian9@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
---
 tools/virtiofsd/passthrough_ll.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index ec1008bceb..0c279ff9fb 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3433,6 +3433,7 @@ int main(int argc, char *argv[])
         .proc_self_fd = -1,
     };
     struct lo_map_elem *root_elem;
+    struct lo_map_elem *reserve_elem;
     int ret = -1;

     /* Don't mask creation mode, kernel already did that */
@@ -3452,8 +3453,15 @@ int main(int argc, char *argv[])
      * [1] Root inode
      */
     lo_map_init(&lo.ino_map);
-    lo_map_reserve(&lo.ino_map, 0)->in_use = false;
+    reserve_elem = lo_map_reserve(&lo.ino_map, 0);
+    if (!reserve_elem) {
+        goto err_out1;
+    }
+    reserve_elem->in_use = false;
     root_elem = lo_map_reserve(&lo.ino_map, lo.root.fuse_ino);
+    if (!root_elem) {
+        goto err_out1;
+    }
     root_elem->inode = &lo.root;

     lo_map_init(&lo.dirp_map);
-- 

