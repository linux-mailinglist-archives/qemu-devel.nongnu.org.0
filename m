Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6212C4284
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 23:19:31 +0200 (CEST)
Received: from localhost ([::1]:48276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFPYQ-0006WO-7m
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 17:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO9i-0006k8-Be
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:49:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO9h-0000V6-5i
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:49:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48482)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO9e-0000T0-TA; Tue, 01 Oct 2019 15:49:51 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2839318CB8FE;
 Tue,  1 Oct 2019 19:49:50 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF6305D6D0;
 Tue,  1 Oct 2019 19:49:49 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 65/67] iotests/262: Honor $IMGOPTS
Date: Tue,  1 Oct 2019 21:47:13 +0200
Message-Id: <20191001194715.2796-66-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Tue, 01 Oct 2019 19:49:50 +0000 (UTC)
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
 tests/qemu-iotests/262 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/262 b/tests/qemu-iotests/262
index 6879665f99..b436fb3e14 100755
--- a/tests/qemu-iotests/262
+++ b/tests/qemu-iotests/262
@@ -21,11 +21,12 @@
 # iothread just for fun.
=20
 import iotests
+from iotests import create_test_image
 import os
=20
 iotests.script_initialize(supported_fmts=3D['qcow2'])
=20
-with iotests.FilePath('img') as img_path, \
+with iotests.ImagePath('img') as img_path, \
      iotests.FilePath('mig_fifo') as fifo, \
      iotests.VM(path_suffix=3D'a') as vm_a, \
      iotests.VM(path_suffix=3D'b') as vm_b:
@@ -49,7 +50,7 @@ with iotests.FilePath('img') as img_path, \
=20
         vm.add_device('virtio-blk,drive=3D%s,iothread=3Diothread0' % roo=
t)
=20
-    iotests.qemu_img_pipe('create', '-f', iotests.imgfmt, img_path, '64M=
')
+    create_test_image(img_path, '64M')
=20
     os.mkfifo(fifo)
=20
--=20
2.21.0


