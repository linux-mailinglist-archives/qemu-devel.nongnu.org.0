Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6F1D2999
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 14:37:23 +0200 (CEST)
Received: from localhost ([::1]:37382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIXh3-0001dY-9J
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 08:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iIWre-0007G4-Hv
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:44:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iIWrc-0008QH-AT
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:44:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iIWrV-0008NX-FW; Thu, 10 Oct 2019 07:44:05 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1427C81F13;
 Thu, 10 Oct 2019 11:44:04 +0000 (UTC)
Received: from localhost (unknown [10.36.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABB0B10013A1;
 Thu, 10 Oct 2019 11:44:03 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 28/36] iotests: Use stat -c %b in 125
Date: Thu, 10 Oct 2019 13:42:52 +0200
Message-Id: <20191010114300.7746-29-mreitz@redhat.com>
In-Reply-To: <20191010114300.7746-1-mreitz@redhat.com>
References: <20191010114300.7746-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 10 Oct 2019 11:44:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

125 should not use qemu-img to get the on-disk image size, because that
reports it in a human-readable format that is useless to us.  Just use
stat instead (like we do to get the image file length).

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190925183231.11196-4-mreitz@redhat.com
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/125 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/125 b/tests/qemu-iotests/125
index 0ef51f1e21..4e31aa4e5f 100755
--- a/tests/qemu-iotests/125
+++ b/tests/qemu-iotests/125
@@ -34,8 +34,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
=20
 get_image_size_on_host()
 {
-    $QEMU_IMG info -f "$IMGFMT" "$TEST_IMG" | grep "disk size" \
-        | sed -e 's/^[^0-9]*\([0-9]\+\).*$/\1/'
+    echo $(($(stat -c '%b * %B' "$TEST_IMG_FILE")))
 }
=20
 # get standard environment and filters
--=20
2.21.0


