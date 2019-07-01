Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DCB186C3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 10:26:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOeOC-0000PU-Mf
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 04:26:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hOeHM-0001qX-EK
	for qemu-devel@nongnu.org; Thu, 09 May 2019 04:19:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hOeHL-0000IJ-KT
	for qemu-devel@nongnu.org; Thu, 09 May 2019 04:19:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38206)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>) id 1hOeHL-0000I2-FW
	for qemu-devel@nongnu.org; Thu, 09 May 2019 04:19:47 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C931785539;
	Thu,  9 May 2019 08:19:46 +0000 (UTC)
Received: from thuth.com (ovpn-116-115.ams2.redhat.com [10.36.116.115])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B586F5B680;
	Thu,  9 May 2019 08:19:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu,  9 May 2019 10:19:19 +0200
Message-Id: <20190509081930.19081-4-thuth@redhat.com>
In-Reply-To: <20190509081930.19081-1-thuth@redhat.com>
References: <20190509081930.19081-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 09 May 2019 08:19:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 03/14] tests/megasas: Make test independent of
 global_qtest
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test uses memwrite() and thus relies on global_qtest. Let's replace i=
t
with qtest_memwrite(), so that we are independent from global_qtest here.

Message-Id: <20190409085245.31548-3-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/megasas-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/megasas-test.c b/tests/megasas-test.c
index 33aa97042c..1111d331d3 100644
--- a/tests/megasas-test.c
+++ b/tests/megasas-test.c
@@ -66,7 +66,7 @@ static void megasas_pd_get_info_fuzz(void *obj, void *d=
ata, QGuestAllocator *all
     context[7] =3D cpu_to_le32(0);
=20
     context_pa =3D guest_alloc(alloc, sizeof(context));
-    memwrite(context_pa, context, sizeof(context));
+    qtest_memwrite(dev->bus->qts, context_pa, context, sizeof(context));
     qpci_io_writel(dev, bar, 0x40, context_pa);
 }
=20
--=20
2.21.0


