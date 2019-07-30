Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05FC79D4E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 02:29:18 +0200 (CEST)
Received: from localhost ([::1]:57170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsG0z-0006G5-Gi
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 20:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58013)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <piaojun@huawei.com>) id 1hsFzo-0005mZ-Hp
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 20:28:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <piaojun@huawei.com>) id 1hsFzn-0002Rb-Gc
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 20:28:04 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2245 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <piaojun@huawei.com>) id 1hsFzm-0002Nu-El
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 20:28:03 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 99CC23CCB98E78BC1612;
 Tue, 30 Jul 2019 08:27:57 +0800 (CST)
Received: from [10.177.253.249] (10.177.253.249) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Tue, 30 Jul 2019
 08:27:50 +0800
To: <virtio-fs@redhat.com>, <qemu-devel@nongnu.org>
From: piaojun <piaojun@huawei.com>
Message-ID: <5D3F8F04.3030404@huawei.com>
Date: Tue, 30 Jul 2019 08:27:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.253.249]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-devel] [PATCH] virtiofsd: fix compile error if 'F_OFD_GETLK'
 not defined
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
Cc: piaojun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use F_GETLK for fcntl when F_OFD_GETLK not defined.

Signed-off-by: Jun Piao <piaojun@huawei.com>
---
 contrib/virtiofsd/passthrough_ll.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passthrough_ll.c
index 9ae1381..757785b 100644
--- a/contrib/virtiofsd/passthrough_ll.c
+++ b/contrib/virtiofsd/passthrough_ll.c
@@ -1619,7 +1619,11 @@ static void lo_getlk(fuse_req_t req, fuse_ino_t ino,
 		return;
 	}

+#ifdef F_OFD_GETLK
 	ret = fcntl(plock->fd, F_OFD_GETLK, lock);
+#else
+	ret = fcntl(plock->fd, F_GETLK, lock);
+#endif
 	if (ret == -1)
 		saverr = errno;
 	pthread_mutex_unlock(&inode->plock_mutex);
@@ -1668,7 +1672,12 @@ static void lo_setlk(fuse_req_t req, fuse_ino_t ino,

 	/* TODO: Is it alright to modify flock? */
 	lock->l_pid = 0;
+
+#ifdef F_OFD_GETLK
 	ret = fcntl(plock->fd, F_OFD_SETLK, lock);
+#else
+	ret = fcntl(plock->fd, F_SETLK, lock);
+#endif
 	if (ret == -1) {
 		saverr = errno;
 	}
-- 

