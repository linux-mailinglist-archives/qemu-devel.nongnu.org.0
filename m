Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972C3B108C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 16:00:27 +0200 (CEST)
Received: from localhost ([::1]:34800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Pe5-00084c-Kf
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 10:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39350)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i8PQy-00032P-Qe
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:46:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i8PQx-0001X0-Nf
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:46:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57616)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i8PQv-0001VE-A5; Thu, 12 Sep 2019 09:46:49 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 955261918641;
 Thu, 12 Sep 2019 13:46:48 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-179.ams2.redhat.com
 [10.36.116.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8785E601B7;
 Thu, 12 Sep 2019 13:46:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 12 Sep 2019 15:45:58 +0200
Message-Id: <20190912134604.22019-17-kwolf@redhat.com>
In-Reply-To: <20190912134604.22019-1-kwolf@redhat.com>
References: <20190912134604.22019-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Thu, 12 Sep 2019 13:46:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 16/22] iotests: Add casenotrun report to bash
 tests
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

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

The new function _casenotrun() is to be invoked if a test case cannot
be run for some reason. The user will be notified by a message passed
to the function. It is the caller's responsibility to make skipped a
particular test.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/common.rc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 51c57dbfe0..e45cdfa66b 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -455,6 +455,15 @@ _notrun()
     exit
 }
=20
+# bail out, setting up .casenotrun file
+# The function _casenotrun() is used as a notifier. It is the
+# caller's responsibility to make skipped a particular test.
+#
+_casenotrun()
+{
+    echo "    [case not run] $*" >>"$OUTPUT_DIR/$seq.casenotrun"
+}
+
 # just plain bail out
 #
 _fail()
--=20
2.20.1


