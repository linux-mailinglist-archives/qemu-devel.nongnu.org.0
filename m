Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14C544C48
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 21:38:57 +0200 (CEST)
Received: from localhost ([::1]:45022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbVYm-0001YR-E1
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 15:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34307)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbUgF-0005g3-Tf
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 14:42:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbUgF-00030V-2C
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 14:42:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50116)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbUbM-0000CA-Pm; Thu, 13 Jun 2019 14:37:32 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 13CB72F8BE3;
 Thu, 13 Jun 2019 18:37:30 +0000 (UTC)
Received: from localhost (unknown [10.40.205.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A108D1001B28;
 Thu, 13 Jun 2019 18:37:29 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 20:37:27 +0200
Message-Id: <20190613183727.28774-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 13 Jun 2019 18:37:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] iotests: Hide timestamps for skipped tests
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

Currently, the "thistime" variable is not reinitialized on every loop
iteration.  This leads to tests that do not yield a run time (because
they failed or were skipped) printing the run time of the previous test
that did.  Fix that by reinitializing "thistime" for every test.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/check | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 44ebf24080..f925606cc5 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -773,6 +773,7 @@ do
     printdiff=3Dfalse # show diff to reference output?
     status=3D""       # test result summary
     results=3D""      # test result details
+    thistime=3D""     # time the test took
=20
     if [ -n "$TESTS_REMAINING_LOG" ] ; then
         sed -e "s/$seq//" -e 's/  / /' -e 's/^ *//' $TESTS_REMAINING_LOG=
 > $TESTS_REMAINING_LOG.tmp
--=20
2.21.0


