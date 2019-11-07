Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788E6F34C1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 17:39:37 +0100 (CET)
Received: from localhost ([::1]:45312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSkoq-0004dK-1R
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 11:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42446)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iSkmi-0002jU-B0
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:37:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iSkmh-0005YW-Dy
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:37:24 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57912
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iSkmh-0005YK-Ao
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573144643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GflrBmHuMhFCbCT6XA3C3QM1L9ORYTTmxDtnlUeQe/k=;
 b=Y2h7YY07HkxyWBi1RS/zg3HZgfh8ziF5/Ma6uRqd52PpLxH7ihsd7gIVPAMxEemiuZfUBg
 lzLFYsLbeognF7WJ8wy5vAD/b1nmpu0tKIA7L23AP0PD9qHMioyn0L4b3uno9P4pdLsnv8
 JP2+B2FJv5RVQBVa+Yra7hWzlTLUNRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-n-LghznRP8ewlkuF_jDDWA-1; Thu, 07 Nov 2019 11:37:19 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE958107ACC3;
 Thu,  7 Nov 2019 16:37:18 +0000 (UTC)
Received: from localhost (ovpn-117-149.ams2.redhat.com [10.36.117.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C4CC5C298;
 Thu,  7 Nov 2019 16:37:18 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 04/22] iotests: Add _filter_json_filename
Date: Thu,  7 Nov 2019 17:36:50 +0100
Message-Id: <20191107163708.833192-5-mreitz@redhat.com>
In-Reply-To: <20191107163708.833192-1-mreitz@redhat.com>
References: <20191107163708.833192-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: n-LghznRP8ewlkuF_jDDWA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 tests/qemu-iotests/common.filter | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.f=
ilter
index f870e00e44..8a0169f19a 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -230,5 +230,29 @@ _filter_qmp_empty_return()
     grep -v '{"return": {}}'
 }
=20
+_filter_json_filename()
+{
+    $PYTHON -c 'import sys
+result, *fnames =3D sys.stdin.read().split("json:{")
+depth =3D 0
+for fname in fnames:
+    depth +=3D 1 # For the opening brace in the split separator
+    for chr_i, chr in enumerate(fname):
+        if chr =3D=3D "{":
+            depth +=3D 1
+        elif chr =3D=3D "}":
+            depth -=3D 1
+            if depth =3D=3D 0:
+                break
+
+    # json:{} filenames may be nested; filter out everything from
+    # inside the outermost one
+    if depth =3D=3D 0:
+        chr_i +=3D 1 # First character past the filename
+        result +=3D "json:{ /* filtered */ }" + fname[chr_i:]
+
+sys.stdout.write(result)'
+}
+
 # make sure this script returns success
 true
--=20
2.23.0


