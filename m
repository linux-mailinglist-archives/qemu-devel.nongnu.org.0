Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FBF1627FC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 15:20:38 +0100 (CET)
Received: from localhost ([::1]:35980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j43jp-0006QY-RG
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 09:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53148)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j43Y1-0007jC-KZ
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j43Y0-0001bd-Mn
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:25 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50292
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j43Y0-0001bH-I8
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582034904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DI209BynksEztCkqaq75OCyE6lPOVrTKq6UqNPL7+6g=;
 b=FtPL0YdfXOpIcRHrSH+DAGZhYV1bFa6cQv7ojK4GhlkWKUnYjQzMa1YK/Nqq9s710mkRKt
 BOuQTDrb5vJaGLSYGKsy5JCQgfTXt0gtdVQEOwooRBzAGTYZ3Xdi7lhP45HvC1nkcNG1Ta
 G4Vm9F7pdqKGVM3hB8Y1PS8tQoGcbXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-5Rsi27taMv2G6Bs9RHm2iA-1; Tue, 18 Feb 2020 09:08:20 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEF25DB63;
 Tue, 18 Feb 2020 14:08:19 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-181.ams2.redhat.com
 [10.36.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC03419E9C;
 Tue, 18 Feb 2020 14:08:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 21/36] iotests: Let 041 use -blockdev for quorum children
Date: Tue, 18 Feb 2020 15:07:07 +0100
Message-Id: <20200218140722.23876-22-kwolf@redhat.com>
In-Reply-To: <20200218140722.23876-1-kwolf@redhat.com>
References: <20200218140722.23876-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 5Rsi27taMv2G6Bs9RHm2iA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Using -drive with default options means that a virtio-blk drive will be
created that has write access to the to-be quorum children.  Quorum
should have exclusive write access to them, so we should use -blockdev
instead.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20200218103454.296704-5-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/041 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 43556b9727..aa7d54d968 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -885,7 +885,10 @@ class TestRepairQuorum(iotests.QMPTestCase):
             # Assign a node name to each quorum image in order to manipula=
te
             # them
             opts =3D "node-name=3Dimg%i" % self.IMAGES.index(i)
-            self.vm =3D self.vm.add_drive(i, opts)
+            opts +=3D ',driver=3D%s' % iotests.imgfmt
+            opts +=3D ',file.driver=3Dfile'
+            opts +=3D ',file.filename=3D%s' % i
+            self.vm =3D self.vm.add_blockdev(opts)
=20
         self.vm.launch()
=20
--=20
2.20.1


