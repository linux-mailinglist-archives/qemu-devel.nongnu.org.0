Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3309F379065
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 16:15:51 +0200 (CEST)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg6hE-0004tW-Gm
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 10:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjie88@huawei.com>)
 id 1lg6fv-0003hk-KK
 for qemu-devel@nongnu.org; Mon, 10 May 2021 10:14:23 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjie88@huawei.com>)
 id 1lg6ft-00028D-2c
 for qemu-devel@nongnu.org; Mon, 10 May 2021 10:14:23 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Ff2zR73Yjz1BHqh
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 22:11:31 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Mon, 10 May 2021
 22:14:01 +0800
From: Jie Wang <wangjie88@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2] util: fix fd leak in qemu_write_pidfile()
Date: Mon, 10 May 2021 22:11:48 +0800
Message-ID: <20210510141148.3138904-1-wangjie88@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=wangjie88@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: wangxinxin.wang@huawei.com, wangjie88@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

if execute qemu_open success, have no branch to free the fd,
so unlink it inadvance, let it free by process exit.

Signed-off-by: Jie Wang <wangjie88@huawei.com>
---
 util/oslib-posix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 36820fec16..fa881f2ee8 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -131,6 +131,7 @@ bool qemu_write_pidfile(const char *path, Error **errp)
             error_setg_errno(errp, errno, "Cannot open pid file");
             return false;
         }
+        unlink(path);
 
         if (fstat(fd, &b) < 0) {
             error_setg_errno(errp, errno, "Cannot stat file");
-- 
2.23.0


