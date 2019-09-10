Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91345AE701
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 11:31:23 +0200 (CEST)
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7cUc-0007wc-Eo
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 05:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1i7c8R-0004fb-3x
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:08:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1i7c8P-00022e-Vh
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:08:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38224)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1i7c8P-00021n-Q4
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:08:25 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 60979300183D;
 Tue, 10 Sep 2019 09:08:24 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-150.ams2.redhat.com
 [10.36.117.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1934100194E;
 Tue, 10 Sep 2019 09:08:22 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 11:08:21 +0200
Message-Id: <20190910090821.28327-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 10 Sep 2019 09:08:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] elf-ops.h: fix int overflow in load_elf()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes a possible integer overflow when we calculate
the total size of ELF segments loaded.

Reported-by: Coverity (CID 1405299)
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
Now we are limited to INT_MAX, should load_elf() returns ssize_t
to support bigger ELFs?
---
 include/hw/elf_ops.h | 6 ++++++
 hw/core/loader.c     | 1 +
 2 files changed, 7 insertions(+)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 1496d7e753..46dd3bf413 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -485,6 +485,12 @@ static int glue(load_elf, SZ)(const char *name, int =
fd,
                 }
             }
=20
+            if (mem_size > INT_MAX - total_size) {
+                error_report("ELF total segments size is too big to load=
 "
+                             "max is %d)", INT_MAX);
+                goto fail;
+            }
+
             /* address_offset is hack for kernel images that are
                linked at the wrong physical address.  */
             if (translate_fn) {
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 32f7cc7c33..feda52fa88 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -44,6 +44,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "disas/disas.h"
--=20
2.21.0


