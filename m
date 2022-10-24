Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A49460A564
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 14:23:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omwTU-0002A0-KH; Mon, 24 Oct 2022 08:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyingliang@huawei.com>)
 id 1omwRZ-0001G0-80
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 08:20:37 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyingliang@huawei.com>)
 id 1omwRV-0005Kz-IX
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 08:20:36 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MwvD90QZGzVhmf;
 Mon, 24 Oct 2022 20:15:37 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 20:20:21 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 20:20:20 +0800
To: <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-erofs@lists.ozlabs.org>,
 <ocfs2-devel@oss.oracle.com>, <linux-mtd@lists.infradead.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <somlo@cmu.edu>,
 <mst@redhat.com>, <jaegeuk@kernel.org>, <chao@kernel.org>,
 <hsiangkao@linux.alibaba.com>, <huangjianan@oppo.com>, <mark@fasheh.com>,
 <jlbec@evilplan.org>, <joseph.qi@linux.alibaba.com>,
 <akpm@linux-foundation.org>, <alexander.deucher@amd.com>,
 <luben.tuikov@amd.com>, <richard@nod.at>, <liushixin2@huawei.com>
Subject: [PATCH v2] kset: fix memory leak when kset_register() returns error
Date: Mon, 24 Oct 2022 20:19:10 +0800
Message-ID: <20221024121910.1169801-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=yangyingliang@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Yang Yingliang <yangyingliang@huawei.com>
From:  Yang Yingliang via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Inject fault while loading module, kset_register() may fail.
If it fails, the name allocated by kobject_set_name() which
is called before kset_register() is leaked, because refcount
of kobject is hold in kset_init().

As a kset may be embedded in a larger structure which needs
be freed in release() function or error path in callers, we
can not call kset_put() in kset_register(), or it will cause
double free, so just call kfree_const() to free the name and
set it to NULL.

With this fix, the callers don't need to care about the name
freeing and call an extra kset_put() if kset_register() fails.

Suggested-by: Luben Tuikov <luben.tuikov@amd.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v1 -> v2:
  Free name inside of kset_register() instead of calling kset_put()
  in drivers.
---
 lib/kobject.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/kobject.c b/lib/kobject.c
index a0b2dbfcfa23..3409a89c81e5 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -834,6 +834,9 @@ EXPORT_SYMBOL_GPL(kobj_sysfs_ops);
 /**
  * kset_register() - Initialize and add a kset.
  * @k: kset.
+ *
+ * NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
+ * which is called before kset_register() in caller need be freed.
  */
 int kset_register(struct kset *k)
 {
@@ -844,8 +847,11 @@ int kset_register(struct kset *k)
 
 	kset_init(k);
 	err = kobject_add_internal(&k->kobj);
-	if (err)
+	if (err) {
+		kfree_const(k->kobj.name);
+		k->kobj.name = NULL;
 		return err;
+	}
 	kobject_uevent(&k->kobj, KOBJ_ADD);
 	return 0;
 }
-- 
2.25.1


