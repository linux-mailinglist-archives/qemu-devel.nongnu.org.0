Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B6A606DEB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 04:42:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olhzn-00069v-5q
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 22:42:51 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olhgZ-0004Rc-Fd
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 22:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyingliang@huawei.com>)
 id 1olhgS-0004OG-EV
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 22:22:52 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyingliang@huawei.com>)
 id 1olhgQ-0003RC-GW
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 22:22:52 -0400
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mtp7b16HRzpVdt;
 Fri, 21 Oct 2022 10:19:23 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 10:22:43 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:22:42 +0800
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
Subject: [PATCH 07/11] f2fs: fix possible memory leak in f2fs_init_sysfs()
Date: Fri, 21 Oct 2022 10:20:58 +0800
Message-ID: <20221021022102.2231464-8-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021022102.2231464-1-yangyingliang@huawei.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=yangyingliang@huawei.com; helo=szxga01-in.huawei.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Yang Yingliang <yangyingliang@huawei.com>
From:  Yang Yingliang via <qemu-devel@nongnu.org>

Inject fault while loading module, kset_register() may fail,
if it fails, but the refcount of kobject is not decreased to
0, the name allocated in kobject_set_name() is leaked. Fix
this by calling kset_put(), so that name can be freed in
callback function kobject_cleanup().

unreferenced object 0xffff888101b7cc80 (size 8):
  comm "modprobe", pid 252, jiffies 4294691378 (age 31.760s)
  hex dump (first 8 bytes):
    66 32 66 73 00 88 ff ff                          f2fs....
  backtrace:
    [<000000001db5b408>] __kmalloc_node_track_caller+0x44/0x1b0
    [<000000002783a073>] kstrdup+0x3a/0x70
    [<00000000ead2b281>] kstrdup_const+0x63/0x80
    [<000000003e5cf8f7>] kvasprintf_const+0x149/0x180
    [<00000000c4d949ff>] kobject_set_name_vargs+0x56/0x150
    [<0000000044611660>] kobject_set_name+0xab/0xe0

Fixes: bf9e697ecd42 ("f2fs: expose features to sysfs entry")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index df27afd71ef4..2ef7a48967be 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1250,8 +1250,10 @@ int __init f2fs_init_sysfs(void)
 	kobject_set_name(&f2fs_kset.kobj, "f2fs");
 	f2fs_kset.kobj.parent = fs_kobj;
 	ret = kset_register(&f2fs_kset);
-	if (ret)
+	if (ret) {
+		kset_put(&f2fs_kset);
 		return ret;
+	}
 
 	ret = kobject_init_and_add(&f2fs_feat, &f2fs_feat_ktype,
 				   NULL, "features");
-- 
2.25.1


