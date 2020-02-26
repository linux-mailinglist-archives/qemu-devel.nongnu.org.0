Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5148D16FA00
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 09:51:41 +0100 (CET)
Received: from localhost ([::1]:40062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6sPs-00066t-B8
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 03:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44626)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6sM6-0000Pc-Uf
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 03:47:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6sM5-0007Yn-UF
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 03:47:46 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3169 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6sM5-0007Nu-Gs; Wed, 26 Feb 2020 03:47:45 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 92B7FCBC3D819B6B070B;
 Wed, 26 Feb 2020 16:47:42 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Wed, 26 Feb 2020
 16:47:36 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 10/13] migration/vmstate: Remove redundant statement in
 vmstate_save_state_v()
Date: Wed, 26 Feb 2020 16:46:44 +0800
Message-ID: <20200226084647.20636-11-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200226084647.20636-1-kuhn.chenqun@huawei.com>
References: <20200226084647.20636-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, Juan
 Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

The "ret" has been assigned in all branches. It didn't need to be
 assigned separately.

Clang static code analyzer show warning:
  migration/vmstate.c:365:17: warning: Value stored to 'ret' is never rea=
d
                ret =3D 0;
                ^     ~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
---
 migration/vmstate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/vmstate.c b/migration/vmstate.c
index 7dd8ef66c6..bafa890384 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -362,7 +362,6 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDe=
scription *vmsd,
             }
             for (i =3D 0; i < n_elems; i++) {
                 void *curr_elem =3D first_elem + size * i;
-                ret =3D 0;
=20
                 vmsd_desc_field_start(vmsd, vmdesc_loop, field, i, n_ele=
ms);
                 old_offset =3D qemu_ftell_fast(f);
--=20
2.23.0



