Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172F614E547
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 23:02:48 +0100 (CET)
Received: from localhost ([::1]:40008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixHtf-0007p0-30
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 17:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ixHct-0005Tg-4B
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:45:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ixHcp-0005Nt-S7
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:45:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59342
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ixHcp-0005Li-M3
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:45:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580420723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKEgQJJAD+cD01BP6Kg+6JM2yzv9ZXtLc2lrG+rh4sE=;
 b=Q5cmJO4in5uODLwgOnZJkxkXvGgqR6Ic5PsrAUL+YSUFehw0+USeIigQyG0SRZjm2YjJ/I
 yyd+yJTOV2lETnrTbEkLBNhUbT7cVigvS4OkmwztL3aXG/n0qoIhKsL6fI5WJ2AW89ZM1m
 kjhemarPhjudcfxM8C8OiQXDUFEcL6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-bAWalxJKOt2TxSRRU_cSZg-1; Thu, 30 Jan 2020 16:45:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E09C108C317;
 Thu, 30 Jan 2020 21:45:20 +0000 (UTC)
Received: from localhost (ovpn-204-145.brq.redhat.com [10.40.204.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0619B60BE1;
 Thu, 30 Jan 2020 21:45:19 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 19/21] iotests: Use self.image_len in TestRepairQuorum
Date: Thu, 30 Jan 2020 22:44:29 +0100
Message-Id: <20200130214431.333510-20-mreitz@redhat.com>
In-Reply-To: <20200130214431.333510-1-mreitz@redhat.com>
References: <20200130214431.333510-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: bAWalxJKOt2TxSRRU_cSZg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

041's TestRepairQuorum has its own image_len, no need to refer to
TestSingleDrive.  (This patch allows commenting out TestSingleDrive to
speed up 041 during test testing.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/041 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 41db2c222a..1295a92021 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -872,7 +872,7 @@ class TestRepairQuorum(iotests.QMPTestCase):
         # Add each individual quorum images
         for i in self.IMAGES:
             qemu_img('create', '-f', iotests.imgfmt, i,
-                     str(TestSingleDrive.image_len))
+                     str(self.image_len))
             # Assign a node name to each quorum image in order to manipula=
te
             # them
             opts =3D "node-name=3Dimg%i" % self.IMAGES.index(i)
--=20
2.24.1


