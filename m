Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9557571691
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 12:50:37 +0200 (CEST)
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpsNQ-0007zb-JG
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 06:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42621)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1hpsN2-0006gB-1R
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:50:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1hpsN0-0002wk-Ol
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:50:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43664)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1hpsN0-0002wO-Im
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:50:10 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E02E1307D971;
 Tue, 23 Jul 2019 10:50:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.205.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C48519C6A;
 Tue, 23 Jul 2019 10:50:07 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Tue, 23 Jul 2019 16:17:53 +0530
Message-Id: <20190723104754.29324-3-ppandit@redhat.com>
In-Reply-To: <20190723104754.29324-1-ppandit@redhat.com>
References: <20190723104754.29324-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 23 Jul 2019 10:50:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 2/3] qemu-bridge-helper: move repeating code
 in parse_acl_file
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
Cc: Li Qiang <liq3ea@gmail.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Move repeating error handling sequence in parse_acl_file routine
to an 'err' label.

Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 qemu-bridge-helper.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

Reviewed v3:
  -> https://lists.nongnu.org/archive/html/qemu-devel/2019-07/msg00247.ht=
ml

diff --git a/qemu-bridge-helper.c b/qemu-bridge-helper.c
index e90c22f07d..91a02f9611 100644
--- a/qemu-bridge-helper.c
+++ b/qemu-bridge-helper.c
@@ -92,9 +92,7 @@ static int parse_acl_file(const char *filename, ACLList=
 *acl_list)
=20
         if (arg =3D=3D NULL) {
             fprintf(stderr, "Invalid config line:\n  %s\n", line);
-            fclose(f);
-            errno =3D EINVAL;
-            return -1;
+            goto err;
         }
=20
         *arg =3D 0;
@@ -111,9 +109,7 @@ static int parse_acl_file(const char *filename, ACLLi=
st *acl_list)
=20
         if (!g_str_equal(cmd, "include") && strlen(arg) >=3D IFNAMSIZ) {
             fprintf(stderr, "name `%s' too long: %zu\n", arg, strlen(arg=
));
-            fclose(f);
-            errno =3D EINVAL;
-            return -1;
+            goto err;
         }
=20
         if (strcmp(cmd, "deny") =3D=3D 0) {
@@ -139,15 +135,18 @@ static int parse_acl_file(const char *filename, ACL=
List *acl_list)
             parse_acl_file(arg, acl_list);
         } else {
             fprintf(stderr, "Unknown command `%s'\n", cmd);
-            fclose(f);
-            errno =3D EINVAL;
-            return -1;
+            goto err;
         }
     }
=20
     fclose(f);
-
     return 0;
+
+err:
+    fclose(f);
+    errno =3D EINVAL;
+    return -1;
+
 }
=20
 static bool has_vnet_hdr(int fd)
--=20
2.21.0


