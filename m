Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6362B131422
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 15:54:01 +0100 (CET)
Received: from localhost ([::1]:52940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioTlX-0002Ox-Po
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 09:53:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43484)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ioTar-0006A4-0q
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ioTap-00009d-R4
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27730
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ioTap-00008u-N1
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578321775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5fV0o92wv3EQ/Iwazcvp/NxjEvMeO/Tonk+nyxiGGRc=;
 b=h/N3SMOsS4ntPCkCkh/IO1GfJ8Unv9OOkT4Nhas1gDVh8IFLWlY9aQvlhayTGygafnOfTU
 lCjOOTVcTxDn5kHUVFC+QA98PhldaDokUvM77pwrFgdWDWfyQqzsRCe4iKu1eqTHiQ1h1I
 bATYEBdbdgBog3ybbMYLJ+rkuDvpfZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-2xJ6fo-HOjqEL_z47pfVjA-1; Mon, 06 Jan 2020 09:42:52 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01C5618B9F54;
 Mon,  6 Jan 2020 14:42:51 +0000 (UTC)
Received: from localhost (ovpn-117-91.ams2.redhat.com [10.36.117.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8087687ECB;
 Mon,  6 Jan 2020 14:42:50 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/34] iotests: Add _filter_json_filename
Date: Mon,  6 Jan 2020 15:41:43 +0100
Message-Id: <20200106144206.698920-12-mreitz@redhat.com>
In-Reply-To: <20200106144206.698920-1-mreitz@redhat.com>
References: <20200106144206.698920-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 2xJ6fo-HOjqEL_z47pfVjA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-id: 20191107163708.833192-5-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/common.filter | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.f=
ilter
index 5367deea39..116cc8a840 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -232,5 +232,29 @@ _filter_qmp_empty_return()
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
2.24.1


