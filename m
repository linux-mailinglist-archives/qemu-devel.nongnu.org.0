Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312AD94D85
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 21:07:33 +0200 (CEST)
Received: from localhost ([::1]:56700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzn08-0006yz-6h
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 15:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32945)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hzmpp-0002aD-PW
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 14:56:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hzmpo-0002H8-Ov
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 14:56:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hzmpm-0002FZ-IO; Mon, 19 Aug 2019 14:56:50 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DA6D051EE1;
 Mon, 19 Aug 2019 18:56:49 +0000 (UTC)
Received: from localhost (ovpn-204-64.brq.redhat.com [10.40.204.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C7261F8;
 Mon, 19 Aug 2019 18:56:49 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 19 Aug 2019 20:56:01 +0200
Message-Id: <20190819185602.4267-16-mreitz@redhat.com>
In-Reply-To: <20190819185602.4267-1-mreitz@redhat.com>
References: <20190819185602.4267-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 19 Aug 2019 18:56:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 15/16] iotests: Add peek_file* functions
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
Reviewed-by: Eric Blake <eblake@redhat.com>
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


