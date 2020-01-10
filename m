Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB455136975
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 10:20:19 +0100 (CET)
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipqSo-0003Zl-Mo
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 04:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33435)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ipqR5-00029P-Kl
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:18:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ipqR4-0004uE-J9
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:18:31 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:58486 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ipqR4-0004dX-8F; Fri, 10 Jan 2020 04:18:30 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1AE58F276BC218B7B793;
 Fri, 10 Jan 2020 17:18:26 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Fri, 10 Jan 2020 17:18:16 +0800
From: <pannengyuan@huawei.com>
To: <pbonzini@redhat.com>, <mdroth@linux.vnet.ibm.com>
Subject: [PATCH v2 2/2] qga/main: Don't mismatch g_strsplit/g_free in
 split_list()
Date: Fri, 10 Jan 2020 17:17:10 +0800
Message-ID: <20200110091710.53424-3-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200110091710.53424-1-pannengyuan@huawei.com>
References: <20200110091710.53424-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

fix a mismatch between g_strsplit and g_free

Reported-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
Changes v2 to v1:
- fix a mismatch in qga/main.c
---
 qga/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/main.c b/qga/main.c
index c35c2a2120..a72ae074f4 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -933,7 +933,7 @@ static GList *split_list(const gchar *str, const gcha=
r *delim)
     for (i =3D 0; strv[i]; i++) {
         list =3D g_list_prepend(list, strv[i]);
     }
-    g_free(strv);
+    g_strfreev(strv);
=20
     return list;
 }
--=20
2.21.0.windows.1



