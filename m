Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3624A7F07
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 11:14:58 +0200 (CEST)
Received: from localhost ([::1]:54878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5RNR-0005wr-3z
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 05:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40671)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1i5RKH-0003wW-3X
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:11:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1i5RKF-0004mr-As
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:11:40 -0400
Received: from relay.sw.ru ([185.231.240.75]:47472)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1i5RKE-0004kv-Ug; Wed, 04 Sep 2019 05:11:39 -0400
Received: from [172.16.25.136] (helo=dhcp-172-16-25-136.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1i5RKB-000708-Q0; Wed, 04 Sep 2019 12:11:35 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed,  4 Sep 2019 12:11:21 +0300
Message-Id: <1567588284-975381-4-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1567588284-975381-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1567588284-975381-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v8 3/6] iotests: Add casenotrun report to bash
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com,
 andrey.shinkevich@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new function _casenotrun() is to be invoked if a test case cannot
be run for some reason. The user will be notified by a message passed
to the function. It is the caller's responsibility to make skipped a
particular test.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 tests/qemu-iotests/common.rc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index e4f8fcc..00a16ee 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -455,6 +455,15 @@ _notrun()
     exit
 }
 
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
-- 
1.8.3.1


