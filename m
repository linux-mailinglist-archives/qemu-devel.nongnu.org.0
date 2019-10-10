Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBFED2DF0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 17:40:49 +0200 (CEST)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIaYZ-0004i7-NT
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 11:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32797)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iIaKP-0006o6-1N
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:26:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iIaKO-0004jb-1K
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:26:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35112)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iIaKL-0004iR-A0; Thu, 10 Oct 2019 11:26:05 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8AF103164683;
 Thu, 10 Oct 2019 15:26:04 +0000 (UTC)
Received: from localhost (unknown [10.36.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 069C2194B6;
 Thu, 10 Oct 2019 15:26:03 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 21/23] iotests/240: Create socket in $SOCK_DIR
Date: Thu, 10 Oct 2019 17:24:55 +0200
Message-Id: <20191010152457.17713-22-mreitz@redhat.com>
In-Reply-To: <20191010152457.17713-1-mreitz@redhat.com>
References: <20191010152457.17713-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 10 Oct 2019 15:26:04 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/240 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/240 b/tests/qemu-iotests/240
index f73bc07d80..8b4337b58d 100755
--- a/tests/qemu-iotests/240
+++ b/tests/qemu-iotests/240
@@ -29,7 +29,7 @@ status=3D1	# failure is the default!
=20
 _cleanup()
 {
-    rm -f "$TEST_DIR/nbd"
+    rm -f "$SOCK_DIR/nbd"
 }
 trap "_cleanup; exit \$status" 0 1 2 3 15
=20
@@ -135,7 +135,7 @@ echo
 run_qemu <<EOF
 { "execute": "qmp_capabilities" }
 { "execute": "blockdev-add", "arguments": {"driver": "null-co", "read-ze=
roes": true, "node-name": "hd0", "read-only": true}}
-{ "execute": "nbd-server-start", "arguments": {"addr":{"type":"unix","da=
ta":{"path":"$TEST_DIR/nbd"}}}}
+{ "execute": "nbd-server-start", "arguments": {"addr":{"type":"unix","da=
ta":{"path":"$SOCK_DIR/nbd"}}}}
 { "execute": "nbd-server-add", "arguments": {"device":"hd0"}}
 { "execute": "object-add", "arguments": {"qom-type": "iothread", "id": "=
iothread0"}}
 { "execute": "device_add", "arguments": {"id": "scsi0", "driver": "${vir=
tio_scsi}", "iothread": "iothread0"}}
--=20
2.21.0


