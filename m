Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CE1191D82
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 00:26:55 +0100 (CET)
Received: from localhost ([::1]:56668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGswg-0000BF-Re
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 19:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51623)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jGssL-0008Di-WB
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 19:22:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jGssK-00024y-Uj
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 19:22:25 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:39976)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jGssK-00024j-Rj
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 19:22:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585092144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xv6o6f8b1Q4FefHhXsxFTjQdb4skVJt1N5hqGDVXzJE=;
 b=e1uVIVcXAr8Hf43bw93iUakph4DHFTwNS9rhEVWir2fVeWDQg5WQJs5eDfvf8mx2TK9xKT
 Eg6ZSSahYcoJ0m5TBsSe+tdyLmgjbLQVTUcoCghfeiceB+H0eaSdbEinX6pVFZTLxdNWua
 oZzWlh1nc9Cy9OCQTPOU5iQHtKVqYtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-TgjPqOwgP3OnvCK052rhtQ-1; Tue, 24 Mar 2020 19:22:21 -0400
X-MC-Unique: TgjPqOwgP3OnvCK052rhtQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C00A8C799B;
 Tue, 24 Mar 2020 23:22:02 +0000 (UTC)
Received: from probe.redhat.com (ovpn-112-191.rdu2.redhat.com [10.10.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98C605DA7C;
 Tue, 24 Mar 2020 23:22:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 12/14] iotest 258: use script_main
Date: Tue, 24 Mar 2020 19:21:01 -0400
Message-Id: <20200324232103.4195-13-jsnow@redhat.com>
In-Reply-To: <20200324232103.4195-1-jsnow@redhat.com>
References: <20200324232103.4195-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 philmd@redhat.com, armbru@redhat.com, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since this one is nicely factored to use a single entry point,
use script_main to run the tests.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/258 | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/258 b/tests/qemu-iotests/258
index a65151dda6..e305a1502f 100755
--- a/tests/qemu-iotests/258
+++ b/tests/qemu-iotests/258
@@ -23,12 +23,6 @@ import iotests
 from iotests import log, qemu_img, qemu_io_silent, \
         filter_qmp_testfiles, filter_qmp_imgfmt
=20
-# Need backing file and change-backing-file support
-iotests.script_initialize(
-    supported_fmts=3D['qcow2', 'qed'],
-    supported_platforms=3D['linux'],
-)
-
 # Returns a node for blockdev-add
 def node(node_name, path, backing=3DNone, fmt=3DNone, throttle=3DNone):
     if fmt is None:
@@ -161,4 +155,7 @@ def main():
     test_concurrent_finish(False)
=20
 if __name__ =3D=3D '__main__':
-    main()
+    # Need backing file and change-backing-file support
+    iotests.script_main(main,
+                        supported_fmts=3D['qcow2', 'qed'],
+                        supported_platforms=3D['linux'])
--=20
2.21.1


