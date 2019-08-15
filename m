Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDB38F0B6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 18:37:31 +0200 (CEST)
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyIkk-0002yy-EN
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 12:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47153)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hyIik-0001N7-Pd
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:35:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hyIih-00028e-9j
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:35:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45622)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hyIih-00028N-4B
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:35:23 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6B1FA30821A8;
 Thu, 15 Aug 2019 16:35:22 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-19.ams2.redhat.com
 [10.36.117.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E28CA60F8C;
 Thu, 15 Aug 2019 16:35:20 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Aug 2019 17:34:36 +0100
Message-Id: <20190815163504.18937-6-dgilbert@redhat.com>
In-Reply-To: <20190815163504.18937-1-dgilbert@redhat.com>
References: <20190815163504.18937-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 15 Aug 2019 16:35:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 05/33] migration/postcopy: break the loop when
 there is no more page to discard
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
Cc: quintela@redhat.com, yury-kotov@yandex-team.ru,
 richardw.yang@linux.intel.com, marcandre.lureau@redhat.com,
 ivanren@tencent.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

When one is equal or bigger then end, it means there is no page to
discard. Just break the loop in this case instead of processing it.

No functional change, just refactor it a little.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190627020822.15485-3-richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 68bc11c9e7..8a97dadec4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2864,23 +2864,23 @@ static int postcopy_send_discard_bm_ram(Migration=
State *ms,
=20
     for (current =3D 0; current < end; ) {
         unsigned long one =3D find_next_bit(unsentmap, end, current);
+        unsigned long zero, discard_length;
=20
-        if (one < end) {
-            unsigned long zero =3D find_next_zero_bit(unsentmap, end, on=
e + 1);
-            unsigned long discard_length;
+        if (one >=3D end) {
+            break;
+        }
=20
-            if (zero >=3D end) {
-                discard_length =3D end - one;
-            } else {
-                discard_length =3D zero - one;
-            }
-            if (discard_length) {
-                postcopy_discard_send_range(ms, pds, one, discard_length=
);
-            }
-            current =3D one + discard_length;
+        zero =3D find_next_zero_bit(unsentmap, end, one + 1);
+
+        if (zero >=3D end) {
+            discard_length =3D end - one;
         } else {
-            current =3D one;
+            discard_length =3D zero - one;
+        }
+        if (discard_length) {
+            postcopy_discard_send_range(ms, pds, one, discard_length);
         }
+        current =3D one + discard_length;
     }
=20
     return 0;
--=20
2.21.0


