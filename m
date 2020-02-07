Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2885015517B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 05:17:15 +0100 (CET)
Received: from localhost ([::1]:49802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izv4r-0003Ie-OO
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 23:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40992)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1izv43-0002my-9z
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 23:16:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1izv42-0001YG-5M
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 23:16:23 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2757 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1izv41-0001Df-QP; Thu, 06 Feb 2020 23:16:22 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0DD36944BA51A879F96E;
 Fri,  7 Feb 2020 12:16:14 +0800 (CST)
Received: from HGHY4C002233111.china.huawei.com (10.133.205.93) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Fri, 7 Feb 2020 12:16:04 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <viktor.prutyanov@phystech.edu>,
 <pbonzini@redhat.com>
Subject: [PATCH] contrib/elf2dmp: prevent uninitialized warning
Date: Fri, 7 Feb 2020 12:16:01 +0800
Message-ID: <20200207041601.89668-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
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
Cc: qemu-trivial@nongnu.org, Chen Qun <kuhn.chenqun@huawei.com>,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

Fix compilation warnings:
contrib/elf2dmp/main.c:66:17: warning: =E2=80=98KdpDataBlockEncoded=E2=80=
=99 may be used
 uninitialized in this function [-Wmaybe-uninitialized]
         block =3D __builtin_bswap64(block ^ kdbe) ^ kwa;
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
contrib/elf2dmp/main.c:78:24: note: =E2=80=98KdpDataBlockEncoded=E2=80=99=
 was declared here
     uint64_t kwn, kwa, KdpDataBlockEncoded;
                        ^~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
 contrib/elf2dmp/main.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index 9a2dbc2902..203b9e6d04 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -76,6 +76,7 @@ static KDDEBUGGER_DATA64 *get_kdbg(uint64_t KernBase, s=
truct pdb_reader *pdb,
     DBGKD_DEBUG_DATA_HEADER64 kdbg_hdr;
     bool decode =3D false;
     uint64_t kwn, kwa, KdpDataBlockEncoded;
+    uint64_t KiWaitNever, KiWaitAlways;
=20
     if (va_space_rw(vs,
                 KdDebuggerDataBlock + offsetof(KDDEBUGGER_DATA64, Header=
),
@@ -84,21 +85,19 @@ static KDDEBUGGER_DATA64 *get_kdbg(uint64_t KernBase,=
 struct pdb_reader *pdb,
         return NULL;
     }
=20
-    if (memcmp(&kdbg_hdr.OwnerTag, OwnerTag, sizeof(OwnerTag))) {
-        uint64_t KiWaitNever, KiWaitAlways;
-
-        decode =3D true;
+    if (!SYM_RESOLVE(KernBase, pdb, KiWaitNever) ||
+            !SYM_RESOLVE(KernBase, pdb, KiWaitAlways) ||
+            !SYM_RESOLVE(KernBase, pdb, KdpDataBlockEncoded)) {
+        return NULL;
+    }
=20
-        if (!SYM_RESOLVE(KernBase, pdb, KiWaitNever) ||
-                !SYM_RESOLVE(KernBase, pdb, KiWaitAlways) ||
-                !SYM_RESOLVE(KernBase, pdb, KdpDataBlockEncoded)) {
-            return NULL;
-        }
+    if (va_space_rw(vs, KiWaitNever, &kwn, sizeof(kwn), 0) ||
+            va_space_rw(vs, KiWaitAlways, &kwa, sizeof(kwa), 0)) {
+        return NULL;
+    }
=20
-        if (va_space_rw(vs, KiWaitNever, &kwn, sizeof(kwn), 0) ||
-                va_space_rw(vs, KiWaitAlways, &kwa, sizeof(kwa), 0)) {
-            return NULL;
-        }
+    if (memcmp(&kdbg_hdr.OwnerTag, OwnerTag, sizeof(OwnerTag))) {
+        decode =3D true;
=20
         printf("[KiWaitNever] =3D 0x%016"PRIx64"\n", kwn);
         printf("[KiWaitAlways] =3D 0x%016"PRIx64"\n", kwa);
--=20
2.23.0



