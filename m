Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432EA152781
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 09:19:48 +0100 (CET)
Received: from localhost ([::1]:42680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izFuT-0005A5-Ph
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 03:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40267)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuzenghui@huawei.com>) id 1izFsr-0004JJ-29
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 03:18:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuzenghui@huawei.com>) id 1izFso-0001GU-UN
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 03:18:04 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:49488 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yuzenghui@huawei.com>)
 id 1izFso-00008Z-Go
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 03:18:02 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A9FAA1D3A8B16BED7293;
 Wed,  5 Feb 2020 16:17:44 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.173.222.27) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Wed, 5 Feb 2020 16:17:36 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <pbonzini@redhat.com>, <richard.henderson@linaro.org>, <tony.nguyen@bt.com>
Subject: [PATCH] memory: Use QEMU_ALWAYS_INLINE to silence compile-time warning
Date: Wed, 5 Feb 2020 16:17:03 +0800
Message-ID: <20200205081703.631-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our robot reported the following compile-time warning while compiling
Qemu with -fno-inline cflags:

In function 'load_memop',
    inlined from 'load_helper' at /qemu/accel/tcg/cputlb.c:1578:20,
    inlined from 'full_ldub_mmu' at /qemu/accel/tcg/cputlb.c:1624:12:
/qemu/accel/tcg/cputlb.c:1502:9: error: call to 'qemu_build_not_reached' =
declared with attribute error: code path is reachable
         qemu_build_not_reached();
         ^~~~~~~~~~~~~~~~~~~~~~~~
    [...]

It looks like a false-positive because only (MO_UB ^ MO_BSWAP) will
hit the default case in load_memop() while need_swap (size > 1) has
already ensured that MO_UB is not involved.

Apply QEMU_ALWAYS_INLINE on memop_size() to make sure it will always
be inlined while we're using the compile-time assert, so that the
compilers won't get confused.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---

Not sure if it's the right fix, but seems works fine to me :)

 include/exec/memop.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 529d07b02d..5403f960e0 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -110,7 +110,7 @@ typedef enum MemOp {
 } MemOp;
=20
 /* MemOp to size in bytes.  */
-static inline unsigned memop_size(MemOp op)
+static inline unsigned QEMU_ALWAYS_INLINE memop_size(MemOp op)
 {
     return 1 << (op & MO_SIZE);
 }
--=20
2.19.1



