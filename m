Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C9DC4183
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 22:02:29 +0200 (CEST)
Received: from localhost ([::1]:47634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFOLs-0007d0-95
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 16:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO7N-0004Jq-Hq
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:47:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO7M-0007cw-I0
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:47:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59596)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO7J-0007bP-UG; Tue, 01 Oct 2019 15:47:26 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 33ED218C428F;
 Tue,  1 Oct 2019 19:47:25 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2528614C1;
 Tue,  1 Oct 2019 19:47:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 03/67] iotests.py: Add unsupported_imgopts
Date: Tue,  1 Oct 2019 21:46:11 +0200
Message-Id: <20191001194715.2796-4-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 01 Oct 2019 19:47:25 +0000 (UTC)
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
 tests/qemu-iotests/iotests.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index cdcb62c4ac..b5ea424de4 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -998,7 +998,8 @@ def execute_setup_common(supported_fmts=3D[],
                          supported_cache_modes=3D[],
                          unsupported_fmts=3D[],
                          supported_protocols=3D[],
-                         unsupported_protocols=3D[]):
+                         unsupported_protocols=3D[],
+                         unsupported_imgopts=3D[]):
     """
     Perform necessary setup for either script-style or unittest-style te=
sts.
     """
@@ -1016,6 +1017,10 @@ def execute_setup_common(supported_fmts=3D[],
     verify_platform(supported=3Dsupported_platforms)
     verify_cache_mode(supported_cache_modes)
=20
+    for opt in imgopts:
+        if any(unsupported in opt for unsupported in unsupported_imgopts=
):
+            notrun('not suitable for this option: %s' % opt)
+
     debug =3D '-d' in sys.argv
     if debug:
         sys.argv.remove('-d')
--=20
2.21.0


