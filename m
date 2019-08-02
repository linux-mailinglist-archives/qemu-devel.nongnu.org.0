Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F067EF79
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 10:39:22 +0200 (CEST)
Received: from localhost ([::1]:60982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htT5t-00013Q-Mr
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 04:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43900)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <piaojun@huawei.com>) id 1htT5I-0000dY-Lw
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 04:38:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <piaojun@huawei.com>) id 1htT5H-00081P-OY
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 04:38:44 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:50528 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <piaojun@huawei.com>) id 1htT5H-0007zU-EI
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 04:38:43 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 9E9AA1BC24276AE9E52F;
 Fri,  2 Aug 2019 16:38:37 +0800 (CST)
Received: from [10.177.253.249] (10.177.253.249) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Fri, 2 Aug 2019
 16:38:33 +0800
To: <virtio-fs@redhat.com>, <qemu-devel@nongnu.org>
From: piaojun <piaojun@huawei.com>
Message-ID: <5D43F688.8000607@huawei.com>
Date: Fri, 2 Aug 2019 16:38:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.253.249]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-devel] [PATCH v2] virtiofsd: fix compile error if
 'F_OFD_GETLK' not defined
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
Cc: dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use F_GETLK for fcntl when F_OFD_GETLK not defined, such as kernel 3.10.

Signed-off-by: Jun Piao <piaojun@huawei.com>
---
v2:
- Use F_OFD_SETLK to replace F_OFD_GETLK in #ifdef.

---
 contrib/virtiofsd/passthrough_ll.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passthrough_ll.c
index a81c01d..c69f2f3 100644
--- a/contrib/virtiofsd/passthrough_ll.c
+++ b/contrib/virtiofsd/passthrough_ll.c
@@ -1780,7 +1780,11 @@ static void lo_getlk(fuse_req_t req, fuse_ino_t ino,
 		goto out;
 	}

+#ifdef F_OFD_GETLK
 	ret = fcntl(plock->fd, F_OFD_GETLK, lock);
+#else
+	ret = fcntl(plock->fd, F_GETLK, lock);
+#endif
 	if (ret == -1)
 		saverr = errno;

@@ -1831,7 +1835,11 @@ static void lo_setlk(fuse_req_t req, fuse_ino_t ino,

 	/* TODO: Is it alright to modify flock? */
 	lock->l_pid = 0;
+#ifdef F_OFD_SETLK
 	ret = fcntl(plock->fd, F_OFD_SETLK, lock);
+#else
+	ret = fcntl(plock->fd, F_GETLK, lock);
+#endif
 	if (ret == -1) {
 		saverr = errno;
 	}
-- 

