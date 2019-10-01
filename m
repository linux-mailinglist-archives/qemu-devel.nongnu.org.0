Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FC8C4181
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 22:02:00 +0200 (CEST)
Received: from localhost ([::1]:47632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFOLO-0007LT-Po
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 16:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO7K-0004F0-Ps
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:47:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO7J-0007bk-Rz
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:47:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61685)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO7H-0007a6-Ky; Tue, 01 Oct 2019 15:47:23 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DC6E418C8907;
 Tue,  1 Oct 2019 19:47:22 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76CC85D712;
 Tue,  1 Oct 2019 19:47:22 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 02/67] iotests.py: Add @skip_for_imgopts()
Date: Tue,  1 Oct 2019 21:46:10 +0200
Message-Id: <20191001194715.2796-3-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Tue, 01 Oct 2019 19:47:22 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index 7030900807..cdcb62c4ac 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -950,6 +950,19 @@ def skip_if_unsupported(required_formats=3D[], read_=
only=3DFalse):
         return func_wrapper
     return skip_test_decorator
=20
+def skip_for_imgopts(unsupported_opts=3D[]):
+    '''Skip Test Decorator
+       Skips the test if imgopts contains any of the given options'''
+    def skip_test_decorator(func):
+        def func_wrapper(test_case: QMPTestCase, *args, **kwargs):
+            for opt in imgopts:
+                if any(unsupported in opt for unsupported in unsupported=
_opts):
+                    test_case.case_skip('{}: Option {} is unsupported'.f=
ormat(
+                                        test_case, opt))
+            return func(test_case, *args, **kwargs)
+        return func_wrapper
+    return skip_test_decorator
+
 def execute_unittest(debug=3DFalse):
     """Executes unittests within the calling module."""
=20
--=20
2.21.0


