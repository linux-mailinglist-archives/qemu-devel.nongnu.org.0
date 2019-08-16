Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D9890B57
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 01:20:03 +0200 (CEST)
Received: from localhost ([::1]:33122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hylVq-0004V0-9V
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 19:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1hylPa-0006E6-AA
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hylPY-0005jP-Qj
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37234)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hylPW-0005f7-9A; Fri, 16 Aug 2019 19:13:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A7E3510BFB3F;
 Fri, 16 Aug 2019 23:13:28 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0029719C6A;
 Fri, 16 Aug 2019 23:13:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 19:12:49 -0400
Message-Id: <20190816231318.8650-8-jsnow@redhat.com>
In-Reply-To: <20190816231318.8650-1-jsnow@redhat.com>
References: <20190816231318.8650-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Fri, 16 Aug 2019 23:13:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 07/36] hbitmap: Fix merge when b is empty,
 and result is not an alias of a
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
Cc: peter.maydell@linaro.org, jsnow@redhat.com, qemu-stable@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nobody calls the function like this currently, but we neither prohibit
or cope with this behavior. I decided to make the function cope with it.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190709232550.10724-8-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 util/hbitmap.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/util/hbitmap.c b/util/hbitmap.c
index bcc0acdc6a0..83927f3c08a 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -785,8 +785,9 @@ bool hbitmap_can_merge(const HBitmap *a, const HBitma=
p *b)
 }
=20
 /**
- * Given HBitmaps A and B, let A :=3D A (BITOR) B.
- * Bitmap B will not be modified.
+ * Given HBitmaps A and B, let R :=3D A (BITOR) B.
+ * Bitmaps A and B will not be modified,
+ *     except when bitmap R is an alias of A or B.
  *
  * @return true if the merge was successful,
  *         false if it was not attempted.
@@ -801,7 +802,13 @@ bool hbitmap_merge(const HBitmap *a, const HBitmap *=
b, HBitmap *result)
     }
     assert(hbitmap_can_merge(b, result));
=20
-    if (hbitmap_count(b) =3D=3D 0) {
+    if ((!hbitmap_count(a) && result =3D=3D b) ||
+        (!hbitmap_count(b) && result =3D=3D a)) {
+        return true;
+    }
+
+    if (!hbitmap_count(a) && !hbitmap_count(b)) {
+        hbitmap_reset_all(result);
         return true;
     }
=20
--=20
2.21.0


