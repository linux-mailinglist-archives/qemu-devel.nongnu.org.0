Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66B2AB3F9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 10:22:07 +0200 (CEST)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i69VO-0005ty-QZ
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 04:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42637)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i6999-0004VL-A3
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 03:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i6996-0003mh-5X
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 03:59:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45414)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i6995-0003km-Ea; Fri, 06 Sep 2019 03:59:03 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0FE26806A2;
 Fri,  6 Sep 2019 07:59:02 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-162.ams2.redhat.com [10.36.117.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 631451001B00;
 Fri,  6 Sep 2019 07:59:00 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Sep 2019 09:57:50 +0200
Message-Id: <20190906075750.14791-29-david@redhat.com>
In-Reply-To: <20190906075750.14791-1-david@redhat.com>
References: <20190906075750.14791-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 06 Sep 2019 07:59:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 28/28] tests/tcg: target/s390x: Test MVO
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
Cc: Florian Weimer <fweimer@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's add the simple test based on the example from the PoP.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 tests/tcg/s390x/Makefile.target |  1 +
 tests/tcg/s390x/mvo.c           | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 tests/tcg/s390x/mvo.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.t=
arget
index 151dc075aa..6a3bfa8b29 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -6,3 +6,4 @@ TESTS+=3Dipm
 TESTS+=3Dexrl-trt
 TESTS+=3Dexrl-trtr
 TESTS+=3Dpack
+TESTS+=3Dmvo
diff --git a/tests/tcg/s390x/mvo.c b/tests/tcg/s390x/mvo.c
new file mode 100644
index 0000000000..5546fe2a97
--- /dev/null
+++ b/tests/tcg/s390x/mvo.c
@@ -0,0 +1,25 @@
+#include <stdint.h>
+#include <stdio.h>
+
+int main(void)
+{
+    uint8_t dest[6] =3D {0xff, 0x77, 0x88, 0x99, 0x0c, 0xff};
+    uint8_t src[5] =3D {0xee, 0x12, 0x34, 0x56, 0xee};
+    uint8_t expected[6] =3D {0xff, 0x01, 0x23, 0x45, 0x6c, 0xff};
+    int i;
+
+    asm volatile (
+        "    mvo 0(4,%[dest]),0(3,%[src])\n"
+        :
+        : [dest] "d" (dest + 1),
+          [src] "d" (src + 1)
+        : "memory");
+
+    for (i =3D 0; i < sizeof(expected); i++) {
+        if (dest[i] !=3D expected[i]) {
+            fprintf(stderr, "bad data\n");
+            return 1;
+        }
+    }
+    return 0;
+}
--=20
2.21.0


