Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753BB7B022
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 19:33:57 +0200 (CEST)
Received: from localhost ([::1]:35036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsW0a-000716-Ld
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 13:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33739)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hsVsj-0007Yc-EH
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 13:25:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hsVsi-0002sY-HN
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 13:25:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42456)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hsVsg-0002r8-ES; Tue, 30 Jul 2019 13:25:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BEDF630B1AD1;
 Tue, 30 Jul 2019 17:25:45 +0000 (UTC)
Received: from localhost (ovpn-116-164.ams2.redhat.com [10.36.116.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 182145D9C5;
 Tue, 30 Jul 2019 17:25:44 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 30 Jul 2019 19:25:07 +0200
Message-Id: <20190730172508.19911-13-mreitz@redhat.com>
In-Reply-To: <20190730172508.19911-1-mreitz@redhat.com>
References: <20190730172508.19911-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 30 Jul 2019 17:25:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.2 12/13] iotests: Add peek_file* functions
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/common.rc | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 5502c3da2f..78decfd5d5 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -53,6 +53,26 @@ poke_file()
     printf "$3" | dd "of=3D$1" bs=3D1 "seek=3D$2" conv=3Dnotrunc &>/dev/=
null
 }
=20
+# peek_file_le 'test.img' 512 2 =3D> 65534
+peek_file_le()
+{
+    # Wrap in echo $() to strip spaces
+    echo $(od -j"$2" -N"$3" --endian=3Dlittle -An -vtu"$3" "$1")
+}
+
+# peek_file_be 'test.img' 512 2 =3D> 65279
+peek_file_be()
+{
+    # Wrap in echo $() to strip spaces
+    echo $(od -j"$2" -N"$3" --endian=3Dbig -An -vtu"$3" "$1")
+}
+
+# peek_file_raw 'test.img' 512 2 =3D> '\xff\xfe'
+peek_file_raw()
+{
+    dd if=3D"$1" bs=3D1 skip=3D"$2" count=3D"$3" status=3Dnone
+}
+
=20
 if ! . ./common.config
     then
--=20
2.21.0


