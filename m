Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D201B606DCF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 04:33:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olhqW-0006BC-FV
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 22:33:16 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olhgf-0004Sa-2E
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 22:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyingliang@huawei.com>)
 id 1olhgS-0004OV-Sh
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 22:22:52 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyingliang@huawei.com>)
 id 1olhgQ-0003R6-T3
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 22:22:52 -0400
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mtp5w3XNvz1P7D4;
 Fri, 21 Oct 2022 10:17:56 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 10:22:42 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:22:41 +0800
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
Subject: [PATCH 06/11] firmware: qemu_fw_cfg: fix possible memory leak in
 fw_cfg_build_symlink()
Date: Fri, 21 Oct 2022 10:20:57 +0800
Message-ID: <20221021022102.2231464-7-yangyingliang@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=yangyingliang@huawei.com; helo=szxga08-in.huawei.com
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

Inject fault while loading module, kset_register() may fail, if
it fails, but the refcount of kobject is not decreased to 0, the
name allocated in kobject_set_name() is leaked. To fix this by
calling kset_put(), so that name can be freed in callback function
kobject_cleanup() and 'subdir' is freed in kset_release().

unreferenced object 0xffff88810ad69050 (size 8):
  comm "swapper/0", pid 1, jiffies 4294677178 (age 38.812s)
  hex dump (first 8 bytes):
    65 74 63 00 81 88 ff ff                          etc.....
  backtrace:
    [<00000000a80c7bf1>] __kmalloc_node_track_caller+0x44/0x1b0
    [<000000003f0167c7>] kstrdup+0x3a/0x70
    [<0000000049336709>] kstrdup_const+0x41/0x60
    [<00000000175616e4>] kvasprintf_const+0xf5/0x180
    [<000000004bcc30f7>] kobject_set_name_vargs+0x56/0x150
    [<000000004b0251bd>] kobject_set_name+0xab/0xe0
    [<00000000700151fb>] fw_cfg_sysfs_probe+0xa5b/0x1320

Fixes: 246c46ebaeae ("firmware: create directory hierarchy for sysfs fw_cfg entries")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/firmware/qemu_fw_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index a69399a6b7c0..d036e69cabbb 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -544,7 +544,7 @@ static int fw_cfg_build_symlink(struct kset *dir,
 			}
 			ret = kset_register(subdir);
 			if (ret) {
-				kfree(subdir);
+				kset_put(subdir);
 				break;
 			}
 
-- 
2.25.1


