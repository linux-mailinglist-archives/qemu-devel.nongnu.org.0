Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D800170DBE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 02:17:09 +0100 (CET)
Received: from localhost ([::1]:52434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j77nY-0004t3-Mj
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 20:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48841)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j77l6-0002PH-VF
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 20:14:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j77l5-0006FL-UT
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 20:14:36 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3251 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j77l3-00065Q-AO; Wed, 26 Feb 2020 20:14:33 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 33615D38C180B85EAE82;
 Thu, 27 Feb 2020 09:14:30 +0800 (CST)
Received: from localhost.localdomain (10.175.104.216) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Thu, 27 Feb 2020 09:14:20 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <kwolf@redhat.com>, <mreitz@redhat.com>
Subject: [PATCH v2 2/2] qemu-img: free memory before re-assign
Date: Thu, 27 Feb 2020 09:29:50 +0800
Message-ID: <20200227012950.12256-3-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200227012950.12256-1-pannengyuan@huawei.com>
References: <20200227012950.12256-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
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
Cc: euler.robot@huawei.com, Pan Nengyuan <pannengyuan@huawei.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

collect_image_check() is called twice in img_check(), the filename/format will be alloced without free the original memory.
It is not a big deal since the process will exit anyway, but seems like a clean code and it will remove the warning spotted by asan.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
v2->v1:
- Instead of freeing part of props in collect_image_check(), do discard the old check object and allocate a new one in the caller to make more sense.(suggested by Max Reitz)
---
 qemu-img.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/qemu-img.c b/qemu-img.c
index 804630a368..a824b8576a 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -817,6 +817,8 @@ static int img_check(int argc, char **argv)
                     check->corruptions_fixed);
         }
 
+        qapi_free_ImageCheck(check);
+        check = g_new0(ImageCheck, 1);
         ret = collect_image_check(bs, check, filename, fmt, 0);
 
         check->leaks_fixed          = leaks_fixed;
-- 
2.18.2


