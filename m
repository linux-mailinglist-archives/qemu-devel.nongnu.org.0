Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16122F34BF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 17:39:32 +0100 (CET)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSkok-0004Ti-FT
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 11:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42345)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iSkmc-0002bk-TT
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:37:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iSkmb-0005Ub-PY
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:37:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36964
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iSkmb-0005U6-MQ
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573144637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dRBzfBQxUAhYJYoXEx7iWdmwjUTQb38o9BmlDFqgLQ=;
 b=OjZWw8WVflzRWVXoj6y/tW86jrxF+b9nTtwc3h/cNWVZirf8VAJA8bJFCd0RweT5TTMqL0
 EKr/5RnYUN+gAaUyM852THP4sNqjRq7i1Z4JQxboXGiZGBr8atmUuhbDwe8y92FjZ5Pqbr
 2MKxIGgAJN2PBuaRlHF6epXUrXRKSQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-83cRNAtWPO-evYCTBeNbgQ-1; Thu, 07 Nov 2019 11:37:15 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A9BE1005500;
 Thu,  7 Nov 2019 16:37:14 +0000 (UTC)
Received: from localhost (ovpn-117-149.ams2.redhat.com [10.36.117.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED8D3608B2;
 Thu,  7 Nov 2019 16:37:13 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 02/22] iotests/qcow2.py: Add dump-header-exts
Date: Thu,  7 Nov 2019 17:36:48 +0100
Message-Id: <20191107163708.833192-3-mreitz@redhat.com>
In-Reply-To: <20191107163708.833192-1-mreitz@redhat.com>
References: <20191107163708.833192-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 83cRNAtWPO-evYCTBeNbgQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

This is useful for tests that want to whitelist fields from dump-header
(with grep) but still print all header extensions.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
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
2.23.0


