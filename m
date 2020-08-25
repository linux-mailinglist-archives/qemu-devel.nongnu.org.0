Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECF42517A1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 13:32:01 +0200 (CEST)
Received: from localhost ([::1]:50886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAXBI-00025J-2s
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 07:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kAX5r-0000YW-Cw; Tue, 25 Aug 2020 07:26:24 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:40744 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kAX5o-0006hn-Jb; Tue, 25 Aug 2020 07:26:23 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1B66CBD3252C62C6A808;
 Tue, 25 Aug 2020 19:26:14 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Tue, 25 Aug 2020
 19:26:05 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 07/10] vfio/platform: Remove dead assignment in
 vfio_intp_interrupt()
Date: Tue, 25 Aug 2020 19:24:44 +0800
Message-ID: <20200825112447.126308-8-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 07:26:04
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: zhang.zhanghailiang@huawei.com, pannengyuan@huawei.com,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Euler Robot <euler.robot@huawei.com>,
 Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang static code analyzer show warning:
hw/vfio/platform.c:239:9: warning: Value stored to 'ret' is never read
        ret = event_notifier_test_and_clear(intp->interrupt);
        ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/vfio/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index ac2cefc9b1..869ed2c39d 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -236,7 +236,7 @@ static void vfio_intp_interrupt(VFIOINTp *intp)
         trace_vfio_intp_interrupt_set_pending(intp->pin);
         QSIMPLEQ_INSERT_TAIL(&vdev->pending_intp_queue,
                              intp, pqnext);
-        ret = event_notifier_test_and_clear(intp->interrupt);
+        event_notifier_test_and_clear(intp->interrupt);
         return;
     }
 
-- 
2.23.0


