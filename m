Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7C9181CE2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:52:26 +0100 (CET)
Received: from localhost ([::1]:54668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3ek-0002rY-0r
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jC3VK-0002xw-TL
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jC3VI-00033F-DJ
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55911
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jC3VI-00030T-6x
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G4epXuozV5upAZ2otn3gIuX0f++/O+nBRWrJUTAsG6Q=;
 b=SKnZcc5L0bvnGs1EHYM49Yt/Ui/84Q4R1mHzO9R5+wuin8C1kmnwQSoZWnIhnWMPLPFNZs
 FBR5sB9kahSe5IiAwrHO8+RRtMbYIQLZrB0LlgxfLO62+zkjEKjFr+86ZuFE34Zm0S2z2a
 TknAvw+83QwGybRlyWYNaujQE+QQVtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-nii55XpTN4CY7myDP1CXeQ-1; Wed, 11 Mar 2020 11:42:37 -0400
X-MC-Unique: nii55XpTN4CY7myDP1CXeQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75E9F8017CC;
 Wed, 11 Mar 2020 15:42:36 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 810B560BEE;
 Wed, 11 Mar 2020 15:42:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/13] tests/qemu-iotests: Fix socket_scm_helper build path
Date: Wed, 11 Mar 2020 16:42:14 +0100
Message-Id: <20200311154218.15532-10-kwolf@redhat.com>
In-Reply-To: <20200311154218.15532-1-kwolf@redhat.com>
References: <20200311154218.15532-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The socket_scm_helper path got corrupted during the mechanical
refactor moving the qtests files into their own sub-directory.

Fixes: 1e8a1fae7 ("test: Move qtests to a separate directory")
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20200306165751.18986-1-philmd@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/Makefile.include       | 1 +
 tests/qtest/Makefile.include | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index edcbd475aa..67e8fcddda 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -589,6 +589,7 @@ include $(SRC_PATH)/tests/qtest/Makefile.include
 tests/test-qga$(EXESUF): qemu-ga$(EXESUF)
 tests/test-qga$(EXESUF): tests/test-qga.o $(qtest-obj-y)
 tests/vhost-user-bridge$(EXESUF): tests/vhost-user-bridge.o $(test-util-ob=
j-y) libvhost-user.a
+tests/qemu-iotests/socket_scm_helper$(EXESUF): tests/qemu-iotests/socket_s=
cm_helper.o
=20
 SPEED =3D quick
=20
diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
index 383b0ab217..76672990a7 100644
--- a/tests/qtest/Makefile.include
+++ b/tests/qtest/Makefile.include
@@ -287,7 +287,6 @@ tests/qtest/usb-hcd-ehci-test$(EXESUF): tests/qtest/usb=
-hcd-ehci-test.o $(libqos
 tests/qtest/usb-hcd-xhci-test$(EXESUF): tests/qtest/usb-hcd-xhci-test.o $(=
libqos-usb-obj-y)
 tests/qtest/cpu-plug-test$(EXESUF): tests/qtest/cpu-plug-test.o
 tests/qtest/migration-test$(EXESUF): tests/qtest/migration-test.o tests/qt=
est/migration-helpers.o
-tests/qtest/qemu-iotests/qtest/socket_scm_helper$(EXESUF): tests/qtest/qem=
u-iotests/qtest/socket_scm_helper.o
 tests/qtest/test-netfilter$(EXESUF): tests/qtest/test-netfilter.o $(qtest-=
obj-y)
 tests/qtest/test-filter-mirror$(EXESUF): tests/qtest/test-filter-mirror.o =
$(qtest-obj-y)
 tests/qtest/test-filter-redirector$(EXESUF): tests/qtest/test-filter-redir=
ector.o $(qtest-obj-y)
--=20
2.20.1


