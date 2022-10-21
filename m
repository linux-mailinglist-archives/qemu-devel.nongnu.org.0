Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19272606DC0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 04:28:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olhmF-0001oP-HE
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 22:28:53 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olhgk-0004TU-1s
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 22:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyingliang@huawei.com>)
 id 1olhgc-0004S4-Ff
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 22:23:02 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyingliang@huawei.com>)
 id 1olhgO-0003Qf-Uy
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 22:23:02 -0400
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mtp5s2PGmzmVHX;
 Fri, 21 Oct 2022 10:17:53 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 10:22:39 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:22:38 +0800
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
Subject: [PATCH 03/11] bus: fix possible memory leak in bus_register()
Date: Fri, 21 Oct 2022 10:20:54 +0800
Message-ID: <20221021022102.2231464-4-yangyingliang@huawei.com>
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
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Inject fault while loading module (e.g. edac_core.ko), kset_register()
may fail in bus_register(), if it fails, but the refcount of kobject is
not decreased to 0, the name allocated in kobject_set_name() is leaked.
To fix this by calling kset_put(), so that name can be freed in callback
function kobject_cleanup().

unreferenced object 0xffff888103bddb68 (size 8):
  comm "systemd-udevd", pid 341, jiffies 4294903262 (age 42.212s)
  hex dump (first 8 bytes):
    65 64 61 63 00 00 00 00                          edac....
  backtrace:
    [<000000009e31d566>] __kmalloc_track_caller+0x1ae/0x320
    [<00000000e4cfd8de>] kstrdup+0x3a/0x70
    [<000000003d0ec369>] kstrdup_const+0x68/0x80
    [<000000008e5c3b20>] kvasprintf_const+0x10b/0x190
    [<00000000b9a945aa>] kobject_set_name_vargs+0x56/0x150
    [<000000000df9278c>] kobject_set_name+0xab/0xe0
    [<00000000f51dc49f>] bus_register+0x132/0x350
    [<000000007d91c2e5>] subsys_register+0x23/0x220

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/base/bus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 7ca47e5b3c1f..301b5330f9d8 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -804,8 +804,10 @@ int bus_register(struct bus_type *bus)
 	priv->drivers_autoprobe = 1;
 
 	retval = kset_register(&priv->subsys);
-	if (retval)
+	if (retval) {
+		kset_put(&priv->subsys);
 		goto out;
+	}
 
 	retval = bus_create_file(bus, &bus_attr_uevent);
 	if (retval)
-- 
2.25.1


