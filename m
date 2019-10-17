Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CAFDB03B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 16:39:55 +0200 (CEST)
Received: from localhost ([::1]:49476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL6wU-0007Jy-Bi
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 10:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37200)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iL5ti-00030V-45
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iL5th-0003ld-1H
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49664)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iL5te-0003ke-Su; Thu, 17 Oct 2019 09:32:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1E37110DCCA3;
 Thu, 17 Oct 2019 13:32:54 +0000 (UTC)
Received: from localhost (ovpn-117-3.ams2.redhat.com [10.36.117.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3EBC5D9DC;
 Thu, 17 Oct 2019 13:32:53 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 23/23] iotests: Drop TEST_DIR filter from _filter_nbd
Date: Thu, 17 Oct 2019 15:31:55 +0200
Message-Id: <20191017133155.5327-24-mreitz@redhat.com>
In-Reply-To: <20191017133155.5327-1-mreitz@redhat.com>
References: <20191017133155.5327-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 17 Oct 2019 13:32:54 +0000 (UTC)
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sockets should be placed into $SOCK_DIR instead of $TEST_DIR, so remove
the $TEST_DIR filter from _filter_nbd.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/common.filter | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common=
.filter
index 0ee6042524..f870e00e44 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -221,7 +221,6 @@ _filter_nbd()
     # Filter out the TCP port number since this changes between runs.
     $SED -e '/nbd\/.*\.c:/d' \
         -e 's#127\.0\.0\.1:[0-9]*#127.0.0.1:PORT#g' \
-        -e "s#?socket=3D$TEST_DIR#?socket=3DTEST_DIR#g" \
         -e "s#?socket=3D$SOCK_DIR#?socket=3DSOCK_DIR#g" \
         -e 's#\(foo\|PORT/\?\|.sock\): Failed to .*$#\1#'
 }
--=20
2.21.0


