Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FC3D78ED
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 16:42:46 +0200 (CEST)
Received: from localhost ([::1]:47076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKO29-0004ki-9x
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 10:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35997)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iKNns-0006hl-9g
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 10:28:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iKNnq-0008Rc-Au
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 10:28:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34972)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iKNnl-0008PV-JT; Tue, 15 Oct 2019 10:27:53 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CBB22307D978;
 Tue, 15 Oct 2019 14:27:52 +0000 (UTC)
Received: from localhost (ovpn-117-226.ams2.redhat.com [10.36.117.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BDB26012C;
 Tue, 15 Oct 2019 14:27:52 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 08/21] iotests: Add -o and --no-opts to _make_test_img
Date: Tue, 15 Oct 2019 16:27:16 +0200
Message-Id: <20191015142729.18123-9-mreitz@redhat.com>
In-Reply-To: <20191015142729.18123-1-mreitz@redhat.com>
References: <20191015142729.18123-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 15 Oct 2019 14:27:52 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Blindly overriding IMGOPTS is suboptimal as this discards user-specified
options.  Whatever options the test needs should simply be appended.

Some tests do this (with IMGOPTS=3D$(_optstr_add "$IMGOPTS" "...")), but
that is cumbersome.  It=E2=80=99s simpler to just give _make_test_img an =
-o
parameter with which tests can add options.

Some tests actually must override the user-specified options, though,
for example when creating an image in a different format than the test
$IMGFMT.  For such cases, --no-opts allows clearing the current option
list.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 tests/qemu-iotests/common.rc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 3e7adc4834..f3784077de 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -287,6 +287,7 @@ _make_test_img()
     local use_backing=3D0
     local backing_file=3D""
     local object_options=3D""
+    local opts_param=3Dfalse
     local misc_params=3D()
=20
     if [ -n "$TEST_IMG_FILE" ]; then
@@ -307,6 +308,10 @@ _make_test_img()
         if [ "$use_backing" =3D "1" -a -z "$backing_file" ]; then
             backing_file=3D$param
             continue
+        elif $opts_param; then
+            optstr=3D$(_optstr_add "$optstr" "$param")
+            opts_param=3Dfalse
+            continue
         fi
=20
         case "$param" in
@@ -314,6 +319,14 @@ _make_test_img()
                 use_backing=3D1
                 ;;
=20
+            -o)
+                opts_param=3Dtrue
+                ;;
+
+            --no-opts)
+                optstr=3D""
+                ;;
+
             *)
                 misc_params=3D("${misc_params[@]}" "$param")
                 ;;
--=20
2.21.0


