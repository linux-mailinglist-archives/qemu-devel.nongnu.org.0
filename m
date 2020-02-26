Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5911B16F605
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 04:16:17 +0100 (CET)
Received: from localhost ([::1]:37484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6nBI-000701-6L
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 22:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j6nAI-0005st-2Z
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 22:15:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j6nAH-00056I-5s
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 22:15:14 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:39988 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j6nAD-0004iF-MS; Tue, 25 Feb 2020 22:15:09 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1F45053AC6E7DA7C46AF;
 Wed, 26 Feb 2020 11:15:05 +0800 (CST)
Received: from localhost.localdomain (10.175.104.216) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 26 Feb 2020 11:14:58 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <kwolf@redhat.com>, <mreitz@redhat.com>
Subject: [PATCH 2/2] qemu-img: free memory before re-assign
Date: Wed, 26 Feb 2020 11:30:37 +0800
Message-ID: <20200226033037.18253-3-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200226033037.18253-1-pannengyuan@huawei.com>
References: <20200226033037.18253-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
 qemu-img.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/qemu-img.c b/qemu-img.c
index 2b4562b9d9..bcbca6c9a2 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -638,6 +638,8 @@ static int collect_image_check(BlockDriverState *bs,
         return ret;
     }
 
+    g_free(check->filename);
+    g_free(check->format);
     check->filename                 = g_strdup(filename);
     check->format                   = g_strdup(bdrv_get_format_name(bs));
     check->check_errors             = result.check_errors;
-- 
2.18.2


