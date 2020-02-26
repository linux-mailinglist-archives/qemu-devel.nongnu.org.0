Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FC516F9F2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 09:49:31 +0100 (CET)
Received: from localhost ([::1]:40016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6sNm-000281-Sa
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 03:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44455)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6sM3-0000OX-Fa
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 03:47:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6sM2-0007Ka-GI
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 03:47:43 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:58666 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6sM2-00075r-44; Wed, 26 Feb 2020 03:47:42 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7AAE71286B2955C92B63;
 Wed, 26 Feb 2020 16:47:37 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Wed, 26 Feb 2020
 16:47:31 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 02/13] block/iscsi:Remove redundant statement in
 iscsi_open()
Date: Wed, 26 Feb 2020 16:46:36 +0800
Message-ID: <20200226084647.20636-3-kuhn.chenqun@huawei.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 zhang.zhanghailiang@huawei.com, Chen Qun <kuhn.chenqun@huawei.com>,
 Peter Lieven <pl@kamp.de>, Max Reitz <mreitz@redhat.com>, Ronnie
 Sahlberg <ronniesahlberg@gmail.com>, Euler Robot <euler.robot@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
  block/iscsi.c:1920:9: warning: Value stored to 'flags' is never read
        flags &=3D ~BDRV_O_RDWR;
        ^        ~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Lieven <pl@kamp.de>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
---
 block/iscsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 682abd8e09..ed88479ede 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -1917,7 +1917,6 @@ static int iscsi_open(BlockDriverState *bs, QDict *=
options, int flags,
         if (ret < 0) {
             goto out;
         }
-        flags &=3D ~BDRV_O_RDWR;
     }
=20
     iscsi_readcapacity_sync(iscsilun, &local_err);
--=20
2.23.0



