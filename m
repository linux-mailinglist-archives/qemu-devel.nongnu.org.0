Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34C013143F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 15:59:59 +0100 (CET)
Received: from localhost ([::1]:53036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioTrK-000386-A5
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 09:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ioTb4-0006Vx-CM
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:43:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ioTb3-0000MD-8u
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:43:10 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52263
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ioTb3-0000M1-5y
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578321788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wvs5BLjjC+phE0DkejwRiHX0/gXnCNReskLUf3qZM5M=;
 b=dptcUr9wfkzx/GOczAz873FfFd42fiRoqZb+d1gYCoEE7u+jfJMZ04NQ0LRLdggyZu8kj4
 fpU7NBhCM6Mc30aABb9Wz1pqjLOWev9tXxZojqxkDT9ZKA/Gb6ZHAPO2aDxaIHMNtGRJvZ
 uNE2aT35DMJIuSaji339EiqLSMtfJJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-kaXbUbqCM9OGae6pO8v_Fw-1; Mon, 06 Jan 2020 09:43:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EA508F2CEA;
 Mon,  6 Jan 2020 14:43:04 +0000 (UTC)
Received: from localhost (ovpn-117-91.ams2.redhat.com [10.36.117.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9833D1084201;
 Mon,  6 Jan 2020 14:43:03 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 16/34] iotests: Add -o and --no-opts to _make_test_img
Date: Mon,  6 Jan 2020 15:41:48 +0100
Message-Id: <20200106144206.698920-17-mreitz@redhat.com>
In-Reply-To: <20200106144206.698920-1-mreitz@redhat.com>
References: <20200106144206.698920-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: kaXbUbqCM9OGae6pO8v_Fw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

Blindly overriding IMGOPTS is suboptimal as this discards user-specified
options.  Whatever options the test needs should simply be appended.

Some tests do this (with IMGOPTS=3D$(_optstr_add "$IMGOPTS" "...")), but
that is cumbersome.  It=E2=80=99s simpler to just give _make_test_img an -o
parameter with which tests can add options.

Some tests actually must override the user-specified options, though,
for example when creating an image in a different format than the test
$IMGFMT.  For such cases, --no-opts allows clearing the current option
list.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-id: 20191107163708.833192-10-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/common.rc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index f01165a66e..7d704f9573 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -308,6 +308,7 @@ _make_test_img()
     local use_backing=3D0
     local backing_file=3D""
     local object_options=3D""
+    local opts_param=3Dfalse
     local misc_params=3D()
=20
     if [ -n "$TEST_IMG_FILE" ]; then
@@ -328,6 +329,10 @@ _make_test_img()
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
@@ -335,6 +340,14 @@ _make_test_img()
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
2.24.1


