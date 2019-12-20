Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834AE1272D7
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 02:37:02 +0100 (CET)
Received: from localhost ([::1]:49602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii7Dx-00018q-37
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 20:37:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34281)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ii7D4-0000kI-SM
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 20:36:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ii7D2-0006Qc-IT
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 20:36:05 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:33234 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ii7D1-00065a-TX
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 20:36:04 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 47918FF41C57773CA430;
 Fri, 20 Dec 2019 09:35:58 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 20 Dec 2019 09:35:47 +0800
From: <pannengyuan@huawei.com>
To: <pbonzini@redhat.com>, <marcandre.lureau@redhat.com>, <armbru@redhat.com>
Subject: [PATCH] util/module: fix a memory leak
Date: Fri, 20 Dec 2019 09:34:10 +0800
Message-ID: <1576805650-16380-1-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Pan Nengyuan <pannengyuan@huawei.com>, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

spotted by ASAN

Fixes: 81d8ccb1bea4fb9eaaf4c8e30bd4021180a9a39f
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
 util/module.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/util/module.c b/util/module.c
index e9fe3e5..8c5315a 100644
--- a/util/module.c
+++ b/util/module.c
@@ -214,6 +214,7 @@ bool module_load_one(const char *prefix, const char *lib_name)
 
     if (!success) {
         g_hash_table_remove(loaded_modules, module_name);
+        g_free(module_name);
     }
 
     for (i = 0; i < n_dirs; i++) {
-- 
2.7.2.windows.1



