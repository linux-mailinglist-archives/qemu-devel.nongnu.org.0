Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C686A78787
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 10:36:04 +0200 (CEST)
Received: from localhost ([::1]:50480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs18W-0007UW-2V
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 04:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48023)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jasowang@redhat.com>) id 1hs16T-0004Sc-7d
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 04:33:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1hs16Q-0003F8-SU
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 04:33:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43470)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1hs16Q-0003Ek-LR
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 04:33:54 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E1E7F308FC5F;
 Mon, 29 Jul 2019 08:33:53 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-203.pek2.redhat.com
 [10.72.12.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B5D410190AA;
 Mon, 29 Jul 2019 08:33:51 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Mon, 29 Jul 2019 16:33:43 +0800
Message-Id: <1564389226-4489-3-git-send-email-jasowang@redhat.com>
In-Reply-To: <1564389226-4489-1-git-send-email-jasowang@redhat.com>
References: <1564389226-4489-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 29 Jul 2019 08:33:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 2/5] qemu-bridge-helper: restrict interface name
 to IFNAMSIZ
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
Cc: Jason Wang <jasowang@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

The network interface name in Linux is defined to be of size
IFNAMSIZ(=3D16), including the terminating null('\0') byte.
The same is applied to interface names read from 'bridge.conf'
file to form ACL rules. If user supplied '--br=3Dbridge' name
is not restricted to the same length, it could lead to ACL bypass
issue. Restrict interface name to IFNAMSIZ, including null byte.

Reported-by: Riccardo Schirone <rschiron@redhat.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 qemu-bridge-helper.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/qemu-bridge-helper.c b/qemu-bridge-helper.c
index 95624bc..2058e10 100644
--- a/qemu-bridge-helper.c
+++ b/qemu-bridge-helper.c
@@ -119,6 +119,13 @@ static int parse_acl_file(const char *filename, ACLL=
ist *acl_list)
         }
         *argend =3D 0;
=20
+        if (!g_str_equal(cmd, "include") && strlen(arg) >=3D IFNAMSIZ) {
+            fprintf(stderr, "name `%s' too long: %zu\n", arg, strlen(arg=
));
+            fclose(f);
+            errno =3D EINVAL;
+            return -1;
+        }
+
         if (strcmp(cmd, "deny") =3D=3D 0) {
             acl_rule =3D g_malloc(sizeof(*acl_rule));
             if (strcmp(arg, "all") =3D=3D 0) {
@@ -269,6 +276,10 @@ int main(int argc, char **argv)
         usage();
         return EXIT_FAILURE;
     }
+    if (strlen(bridge) >=3D IFNAMSIZ) {
+        fprintf(stderr, "name `%s' too long: %zu\n", bridge, strlen(brid=
ge));
+        return EXIT_FAILURE;
+    }
=20
     /* parse default acl file */
     QSIMPLEQ_INIT(&acl_list);
--=20
2.5.0


