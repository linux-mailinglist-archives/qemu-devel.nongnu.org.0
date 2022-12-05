Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5673642A54
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2CN4-00018T-2E; Mon, 05 Dec 2022 09:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1p26Xs-0005nU-50
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 03:09:52 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1p26Xp-0007Sj-Kx
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 03:09:47 -0500
Received: from dggpemm500010.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NQblv4CTvzFqfQ;
 Mon,  5 Dec 2022 16:08:43 +0800 (CST)
Received: from huawei.com (10.174.185.41) by dggpemm500010.china.huawei.com
 (7.185.36.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 5 Dec
 2022 16:09:30 +0800
To: <qemu-devel@nongnu.org>, <jasowang@redhat.com>
CC: <wangzhigang17@huawei.com>, <linyilu@huawei.com>,
 <zhangliang5@huawei.com>, <yangming73@huawei.com>
Subject: [PATCH] net/net.c: Fix qemu crash when hot-pluging a vhost-net failed.
Date: Mon, 5 Dec 2022 16:08:59 +0800
Message-ID: <20221205080859.2216-1-yangming73@huawei.com>
X-Mailer: git-send-email 2.32.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.41]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500010.china.huawei.com (7.185.36.134)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=yangming73@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 05 Dec 2022 09:22:55 -0500
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
Reply-to:  Ming Yang <yangming73@huawei.com>
From:  Ming Yang via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hot-pluging a vhost-net may cause virtual machine crash in following steps:
1. Starting a vm without net devices.
2. Hot-pluging 70 memory devices.
3. Hot-pluging a vhost-net device.

The reason is : if hotplug a vhost-net failed, the nc cannot be found via function qemu_find_netdev, as
it has been cleaned up through function qemu_cleanup_net_client. Which leads to the result
that assert(nc) failed, then qemu crashed.

While, the root reason is that, in commit 46d4d36d0bf2 if not both has_vhostforce and vhostforce flags
are true, the errp would not be set. Then net_init_tap would not return a negative value, fallowed by founding nc
and assert nc.

In this patch, asserting nc is replaced with setting an error message.

Fixes: 46d4d36d0bf2("tap: setting error appropriately when calling net_init_tap_one()")
Signed-off-by: Ming Yang <yangming73@huawei.com>
Signed-off-by: Liang Zhang <zhangliang5@huawei.com>
---
 net/net.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/net/net.c b/net/net.c
index 840ad9dca5..1d1d7e54c4 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1103,7 +1103,16 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
 
     if (is_netdev) {
         nc = qemu_find_netdev(netdev->id);
-        assert(nc);
+        /*
+         * If the tap of hotpluged net device do not has both has_vhostforce flag and vhostforce flags,
+         * when error occurs, the error messags will be report but not set to errp. Thus net_client_init_fun
+         * will not return a negatave value. Therefore the value of nc might be NULL. To make qemu robust,
+         * it is better to judge if nc is NULL.
+         */
+        if (!nc) {
+            error_setg(errp, "Device '%s' could not be initialized", netdev->id);
+            return -1;
+        }
         nc->is_netdev = true;
     }
 
-- 
2.33.0


