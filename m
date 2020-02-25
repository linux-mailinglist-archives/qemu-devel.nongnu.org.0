Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6322C16C1E0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 14:14:42 +0100 (CET)
Received: from localhost ([::1]:55396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6a2r-0006ti-Ai
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 08:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37110)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ovoshcha@redhat.com>) id 1j6a1S-0005DX-4e
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:13:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ovoshcha@redhat.com>) id 1j6a1R-0001NL-5K
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:13:14 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56971
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ovoshcha@redhat.com>) id 1j6a1R-0001Mx-1i
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582636392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pIAxnqLbBPi8HGVHGPcFX+gvFTpwFK4hEINmy/jM51U=;
 b=bQFZw+Z4TxX1Yplnp7wXHdq+LaOur9NVPA5Qd2odOwSuOBhW5MZ06ZBwy5lC4U4gdQZ7uG
 8BvBkFV3RpRDjYRzhsrjpBnm4uswGJV9+0lQX1Lb7XPp8eWnLBUy64LJ+S0ToeXJLwWP5P
 XhNzPs/SmLPv7oFs4S6ajgvi+qkMQUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-SbleWzxIOaaT7WQ3gt7GDg-1; Tue, 25 Feb 2020 08:13:10 -0500
X-MC-Unique: SbleWzxIOaaT7WQ3gt7GDg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BBE518AB2C3
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 13:13:10 +0000 (UTC)
Received: from kh066.redhat.com (ovpn-204-125.brq.redhat.com [10.40.204.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84D0991840;
 Tue, 25 Feb 2020 13:13:08 +0000 (UTC)
From: Oksana Vohchana <ovoshcha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] Acceptance test: adds param 'address' in _get_free_port
Date: Tue, 25 Feb 2020 15:12:59 +0200
Message-Id: <20200225131302.4792-2-ovoshcha@redhat.com>
In-Reply-To: <20200225131302.4792-1-ovoshcha@redhat.com>
References: <20200225131302.4792-1-ovoshcha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: ovoshcha@redhat.com, philmd@redhat.com, wainersm@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the migration test function _get_free_port works only for localhost,
but in the case to use migration through an RDMA we need to get a free port
on the configured network RDMA-interface.
This patch is the start for another migration option

Signed-off-by: Oksana Vohchana <ovoshcha@redhat.com>
---
 tests/acceptance/migration.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
index a8367ca023..e4c39b85a1 100644
--- a/tests/acceptance/migration.py
+++ b/tests/acceptance/migration.py
@@ -52,8 +52,8 @@ class Migration(Test):
         source_vm.qmp('migrate', uri=3Dsrc_uri)
         self.assert_migration(source_vm, dest_vm)
=20
-    def _get_free_port(self):
-        port =3D network.find_free_port()
+    def _get_free_port(self, address=3D'localhost'):
+        port =3D network.find_free_port(address=3Daddress)
         if port is None:
             self.cancel('Failed to find a free port')
         return port
--=20
2.21.1


