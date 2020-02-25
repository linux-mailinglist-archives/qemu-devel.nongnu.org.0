Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DEA16B799
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 03:14:13 +0100 (CET)
Received: from localhost ([::1]:47720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Pjg-0004Sp-SA
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 21:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38409)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgN-0006rR-Gr
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 21:10:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgL-00085A-RB
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 21:10:47 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3242 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6PgL-0007zQ-D6; Mon, 24 Feb 2020 21:10:45 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9018B2E2D7E06BA90EA8;
 Tue, 25 Feb 2020 10:10:42 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Feb 2020
 10:10:35 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 12/13] usb/hcd-ehci: Remove redundant statements
Date: Tue, 25 Feb 2020 10:09:36 +0800
Message-ID: <20200225020937.25028-13-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
In-Reply-To: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
References: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: peter.maydell@linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 zhang.zhanghailiang@huawei.com, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

The "again" assignment is meaningless before g_assert_not_reached.
In addition, the break statements no longer needs to be after
g_assert_not_reached.

Clang static code analyzer show warning:
hw/usb/hcd-ehci.c:2108:13: warning: Value stored to 'again' is never read
            again = -1;
            ^       ~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ehci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 56ab2f457f..29d49c2d7e 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1301,7 +1301,6 @@ static void ehci_execute_complete(EHCIQueue *q)
         /* should not be triggerable */
         fprintf(stderr, "USB invalid response %d\n", p->packet.status);
         g_assert_not_reached();
-        break;
     }
 
     /* TODO check 4.12 for splits */
@@ -2105,9 +2104,7 @@ static void ehci_advance_state(EHCIState *ehci, int async)
 
         default:
             fprintf(stderr, "Bad state!\n");
-            again = -1;
             g_assert_not_reached();
-            break;
         }
 
         if (again < 0 || itd_count > 16) {
-- 
2.23.0



