Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB29513143B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 15:59:02 +0100 (CET)
Received: from localhost ([::1]:53024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioTqP-0001cb-Dq
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 09:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ioTal-00061D-KN
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ioTak-00005E-H6
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28777
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ioTak-00004r-Do
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578321769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZqqUZoUNfmSVcC5/0YumgBn+5w0ZWMiiC/7GW0nI5f8=;
 b=gf75nUCUNRGJ9FiIxEGfI2DlNsBPCXdwvqJnjIMqTfyHhKzrFl6J/IvYoC9LBkW5jHDaqH
 mBl0mDK0av/LS0kTMiokoDhxwa32FLaBFfjEzGHK/sb9XfMpjkez5kOVe/u3rbOmJt8Xcn
 0p8RoOijU+JtYmv5hKsrymxv1rW14TI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-zJt8-1SkPg-Z68Y1DAnzrQ-1; Mon, 06 Jan 2020 09:42:46 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 733528C1343;
 Mon,  6 Jan 2020 14:42:45 +0000 (UTC)
Received: from localhost (ovpn-117-91.ams2.redhat.com [10.36.117.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1186250A8F;
 Mon,  6 Jan 2020 14:42:44 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/34] iotests/qcow2.py: Add dump-header-exts
Date: Mon,  6 Jan 2020 15:41:41 +0100
Message-Id: <20200106144206.698920-10-mreitz@redhat.com>
In-Reply-To: <20200106144206.698920-1-mreitz@redhat.com>
References: <20200106144206.698920-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: zJt8-1SkPg-Z68Y1DAnzrQ-1
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

This is useful for tests that want to whitelist fields from dump-header
(with grep) but still print all header extensions.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-id: 20191107163708.833192-3-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/qcow2.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qemu-iotests/qcow2.py b/tests/qemu-iotests/qcow2.py
index b392972d1b..d813b4fc81 100755
--- a/tests/qemu-iotests/qcow2.py
+++ b/tests/qemu-iotests/qcow2.py
@@ -154,6 +154,10 @@ def cmd_dump_header(fd):
     h.dump()
     h.dump_extensions()
=20
+def cmd_dump_header_exts(fd):
+    h =3D QcowHeader(fd)
+    h.dump_extensions()
+
 def cmd_set_header(fd, name, value):
     try:
         value =3D int(value, 0)
@@ -230,6 +234,7 @@ def cmd_set_feature_bit(fd, group, bit):
=20
 cmds =3D [
     [ 'dump-header',          cmd_dump_header,          0, 'Dump image hea=
der and header extensions' ],
+    [ 'dump-header-exts',     cmd_dump_header_exts,     0, 'Dump image hea=
der extensions' ],
     [ 'set-header',           cmd_set_header,           2, 'Set a field in=
 the header'],
     [ 'add-header-ext',       cmd_add_header_ext,       2, 'Add a header e=
xtension' ],
     [ 'add-header-ext-stdio', cmd_add_header_ext_stdio, 1, 'Add a header e=
xtension, data from stdin' ],
--=20
2.24.1


