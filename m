Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800263780CB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:03:35 +0200 (CEST)
Received: from localhost ([::1]:48290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2lC-0001uN-Ic
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjie88@huawei.com>)
 id 1lg2hV-0005NI-RI
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:59:45 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:2606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjie88@huawei.com>)
 id 1lg2hT-0008G7-3o
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:59:45 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FdxKh0W4GzCr7P
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 17:56:56 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Mon, 10 May 2021
 17:59:27 +0800
From: Jie Wang <wangjie88@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] util: fix fd leak in qemu_write_pidfile()
Date: Mon, 10 May 2021 17:57:08 +0800
Message-ID: <20210510095708.950474-1-wangjie88@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=wangjie88@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
index 36820fec16..30bf39bf4f 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -131,6 +131,7 @@ bool qemu_write_pidfile(const char *path, Error **errp)
             error_setg_errno(errp, errno, "Cannot open pid file");
             return false;
         }
+	unlink(path);
 
         if (fstat(fd, &b) < 0) {
             error_setg_errno(errp, errno, "Cannot stat file");
-- 
2.23.0


