Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58EF2E0B4F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 15:03:36 +0100 (CET)
Received: from localhost ([::1]:48370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kriGF-0001Bz-Th
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 09:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBU-0001iQ-SG; Tue, 22 Dec 2020 03:38:20 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBR-0002cZ-Uu; Tue, 22 Dec 2020 03:38:20 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D0V7y4qPJz7JYV;
 Tue, 22 Dec 2020 16:37:18 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Tue, 22 Dec 2020
 16:37:54 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <jasowang@redhat.com>
Subject: [PATCH 8/9] net: Remove initialization of static ints
Date: Tue, 22 Dec 2020 16:23:39 +0800
Message-ID: <20201222082340.67405-9-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
In-Reply-To: <20201222082340.67405-1-zhanghan64@huawei.com>
References: <20201222082340.67405-1-zhanghan64@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhanghan64@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Dec 2020 08:55:40 -0500
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 hang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not initialise statics to 0 or NULL

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 net/tap-solaris.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index d5af4efd60..0b4f709abc 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -63,10 +63,10 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
     /* FIXME leaks like a sieve on error paths */
     /* FIXME suspicious: many errors are reported, then ignored */
     int tap_fd, if_fd, ppa = -1;
-    static int ip_fd = 0;
+    static int ip_fd;
     char *ptr;
 
-    static int arp_fd = 0;
+    static int arp_fd;
     int ip_muxid, arp_muxid;
     struct strioctl  strioc_if, strioc_ppa;
     int link_type = I_PLINK;
-- 
2.29.1.59.gf9b6481aed


