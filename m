Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930988EF98
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 17:43:24 +0200 (CEST)
Received: from localhost ([::1]:43286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyHuN-0003ug-Ht
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 11:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hyHoV-0005Ib-6P
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 11:37:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hyHoR-0000VY-SB
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 11:37:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hyHoJ-0000SC-7r; Thu, 15 Aug 2019 11:37:07 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9010F30BEBED;
 Thu, 15 Aug 2019 15:37:06 +0000 (UTC)
Received: from localhost (ovpn-204-81.brq.redhat.com [10.40.204.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA116841DE;
 Thu, 15 Aug 2019 15:37:03 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 15 Aug 2019 17:36:37 +0200
Message-Id: <20190815153638.4600-7-mreitz@redhat.com>
In-Reply-To: <20190815153638.4600-1-mreitz@redhat.com>
References: <20190815153638.4600-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 15 Aug 2019 15:37:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 6/7] iotests: Disable 110 for
 vmdk.twoGbMaxExtentSparse
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The error message for the test case where we have a quorum node for
which no directory name can be generated is different: For
twoGbMaxExtentSparse, it complains that it cannot open the extent file.
For other (sub)formats, it just notes that it cannot determine the
backing file path.  Both are fine, but just disable twoGbMaxExtentSparse
for simplicity's sake.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/110 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/110 b/tests/qemu-iotests/110
index 2cdc7c8a72..2ef516baf1 100755
--- a/tests/qemu-iotests/110
+++ b/tests/qemu-iotests/110
@@ -40,7 +40,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 # Any format supporting backing files
 _supported_fmt qed qcow qcow2 vmdk
 _supported_proto file
-_unsupported_imgopts "subformat=3DmonolithicFlat" "subformat=3DtwoGbMaxE=
xtentFlat"
+_unsupported_imgopts "subformat=3DmonolithicFlat" "subformat=3DtwoGbMaxE=
xtentFlat" \
+                     "subformat=3DtwoGbMaxExtentSparse"
=20
 TEST_IMG_REL=3D$(basename "$TEST_IMG")
=20
--=20
2.21.0


