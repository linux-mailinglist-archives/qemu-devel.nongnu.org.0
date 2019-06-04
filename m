Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8B63478C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 15:03:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY96R-0002LK-6F
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 09:03:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hY93g-00012v-Jc
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 09:00:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hY93e-0001lv-KV
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 09:00:56 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:37019 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hY93a-0000b0-3m
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 09:00:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 5A9241A2109;
	Tue,  4 Jun 2019 14:59:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 1DBF41A1DC9;
	Tue,  4 Jun 2019 14:59:46 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue,  4 Jun 2019 14:59:01 +0200
Message-Id: <1559653142-31892-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559653142-31892-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1559653142-31892-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v8 2/3] linux-user: Add support for
 setsockopt() option SOL_ALG
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: arikalo@wavecomp.com, lvivier@redhat.com, ysu@wavecomp.com,
	amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yunqiang Su <ysu@wavecomp.com>

Add support for options SOL_ALG of the syscall setsockopt(). This
option is used in relation to Linux kernel Crypto API, and allows
a user to set additional information for the cipher operation via
syscall setsockopt(). The field "optname" must be one of the
following:

  - ALG_SET_KEY =E2=80=93 seting the key
  - ALG_SET_AEAD_AUTHSIZE =E2=80=93 set the authentication tag size

SOL_ALG is relatively newer setsockopt() option. Therefore, the
code that handles SOL_ALG is enclosed in "ifdef" so that the build
does not fail for older kernels that do not contain support for
SOL_ALG.

Signed-off-by: Yunqiang Su <ysu@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/syscall.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index dde6889..7e41d74 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1998,6 +1998,36 @@ static abi_long do_setsockopt(int sockfd, int leve=
l, int optname,
             goto unimplemented;
         }
         break;
+#ifdef SOL_ALG
+    case SOL_ALG:
+        switch (optname) {
+        case ALG_SET_KEY:
+        {
+            char *alg_key =3D g_malloc(optlen);
+
+            if (!alg_key) {
+                return -TARGET_ENOMEM;
+            }
+            if (copy_from_user(alg_key, optval_addr, optlen)) {
+                g_free(alg_key);
+                return -TARGET_EFAULT;
+            }
+            ret =3D get_errno(setsockopt(sockfd, level, optname,
+                                       alg_key, optlen));
+            g_free(alg_key);
+            break;
+        }
+        case ALG_SET_AEAD_AUTHSIZE:
+        {
+            ret =3D get_errno(setsockopt(sockfd, level, optname,
+                                       NULL, optlen));
+            break;
+        }
+        default:
+            goto unimplemented;
+        }
+        break;
+#endif
     case TARGET_SOL_SOCKET:
         switch (optname) {
         case TARGET_SO_RCVTIMEO:
--=20
2.7.4


