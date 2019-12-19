Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9B312684E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 18:39:40 +0100 (CET)
Received: from localhost ([::1]:45446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihzlz-0005Ie-8U
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 12:39:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45727)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ihzY6-0006e7-QP
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ihzY5-00079S-CO
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30511
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ihzY5-00077u-7P
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576776315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vw7oRuycYJOyTajnvrh56g2DEx0T4R/7mnlQWZ8eZg0=;
 b=PSyoMNXOZK2AUzuIy4wst6YHT3v2HJ8W229W4fr4yUJz8JU0JzOOozwr2QRQB72yNWaVzm
 D6HMFjchBRYMm4ASInS6Blu+X0PZ8YQ5AMR+CB7VVbpxV2FoW8cy+/OA/hQUonvx/lU7Qp
 Nd/V6oGZo4Ae6REC9c0QWOGo5mmXvCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-2LJmOuDsMKawxR5tmFilpQ-1; Thu, 19 Dec 2019 12:25:13 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E92C2800D41;
 Thu, 19 Dec 2019 17:25:12 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-53.ams2.redhat.com [10.36.117.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B28963B8A;
 Thu, 19 Dec 2019 17:25:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 16/30] iotests: Fix IMGOPTSSYNTAX for nbd
Date: Thu, 19 Dec 2019 18:24:27 +0100
Message-Id: <20191219172441.7289-17-kwolf@redhat.com>
In-Reply-To: <20191219172441.7289-1-kwolf@redhat.com>
References: <20191219172441.7289-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 2LJmOuDsMKawxR5tmFilpQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

There is no $SOCKDIR, only $SOCK_DIR.

Fixes: f3923a72f199b2c63747a7032db74730546f55c6
Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/common.rc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 6f0582c79a..555c453911 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -217,7 +217,8 @@ if [ "$IMGOPTSSYNTAX" =3D "true" ]; then
         TEST_IMG=3D"$DRIVER,file.filename=3D$TEST_DIR/t.$IMGFMT"
     elif [ "$IMGPROTO" =3D "nbd" ]; then
         TEST_IMG_FILE=3D$TEST_DIR/t.$IMGFMT
-        TEST_IMG=3D"$DRIVER,file.driver=3Dnbd,file.type=3Dunix,file.path=
=3D$SOCKDIR/nbd"
+        TEST_IMG=3D"$DRIVER,file.driver=3Dnbd,file.type=3Dunix"
+        TEST_IMG=3D"$TEST_IMG,file.path=3D$SOCK_DIR/nbd"
     elif [ "$IMGPROTO" =3D "ssh" ]; then
         TEST_IMG_FILE=3D$TEST_DIR/t.$IMGFMT
         TEST_IMG=3D"$DRIVER,file.driver=3Dssh,file.host=3D127.0.0.1,file.p=
ath=3D$TEST_IMG_FILE"
--=20
2.20.1


