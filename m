Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D618107593
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 17:16:33 +0100 (CET)
Received: from localhost ([::1]:52666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iYBbk-0003gn-Er
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 11:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iYBRA-0000SX-WE
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:05:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iYBR9-0002vb-Fy
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:05:36 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47893
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iYBR9-0002u1-BT
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:05:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574438735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XrtsKI6UtYWJu+YSlWZgfDftptplBLsPijshH5RaEuE=;
 b=XgaymrD3Z64h8BEmso8fL8O9+tH3KZJ4QQoTcLbvIbtcBsRZKRgzeefE7DuyZgDkFu+yfi
 wdvyul3AjHixgz++DZYSazur3n2fmDCYYE66G5cKXEQsp8V30vMflSKOmOuxhBpjIk/HGg
 nl7yd5MKkL4YFYX31bSczMTCYnmWcuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-RjzgS99zNYytX2rf00FBcA-1; Fri, 22 Nov 2019 11:05:31 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54D5ADB20;
 Fri, 22 Nov 2019 16:05:30 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-252.ams2.redhat.com
 [10.36.117.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC6B110372C3;
 Fri, 22 Nov 2019 16:05:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 5/8] iotests: Add qemu_io_log()
Date: Fri, 22 Nov 2019 17:05:08 +0100
Message-Id: <20191122160511.8377-6-kwolf@redhat.com>
In-Reply-To: <20191122160511.8377-1-kwolf@redhat.com>
References: <20191122160511.8377-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: RjzgS99zNYytX2rf00FBcA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a function that runs qemu-io and logs the output with the
appropriate filters applied.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/qemu-iotests/iotests.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index df0708923d..fc78852ae5 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -162,6 +162,11 @@ def qemu_io(*args):
         sys.stderr.write('qemu-io received signal %i: %s\n' % (-exitcode, =
' '.join(args)))
     return subp.communicate()[0]
=20
+def qemu_io_log(*args):
+    result =3D qemu_io(*args)
+    log(result, filters=3D[filter_testfiles, filter_qemu_io])
+    return result
+
 def qemu_io_silent(*args):
     '''Run qemu-io and return the exit code, suppressing stdout'''
     args =3D qemu_io_args + list(args)
--=20
2.20.1


