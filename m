Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A685B2530B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 16:54:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT69v-0000Jj-T4
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 10:54:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1hT68q-0008TU-Tu
	for qemu-devel@nongnu.org; Tue, 21 May 2019 10:53:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1hT68p-0000jA-PN
	for qemu-devel@nongnu.org; Tue, 21 May 2019 10:53:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36298)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hT68p-0000iU-KR
	for qemu-devel@nongnu.org; Tue, 21 May 2019 10:53:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CB183087935;
	Tue, 21 May 2019 14:53:22 +0000 (UTC)
Received: from localhost (ovpn-116-150.ams2.redhat.com [10.36.116.150])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 136F04387;
	Tue, 21 May 2019 14:53:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 21 May 2019 15:53:18 +0100
Message-Id: <20190521145318.12787-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 21 May 2019 14:53:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] build: use $(DESTDIR)x instead of $(DESTDIR)/x
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GNU make manual[1] demonstrates $(DESTDIR)$(bindir)/foo and QEMU
mostly follows that.  There are just a few instances of
$(DESTDIR)/$(bindir)/foo.  Fix these inconsistencies.

[1] https://www.gnu.org/software/make/manual/html_node/DESTDIR.html

Cc: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 Makefile | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 155f066a20..57b786d238 100644
--- a/Makefile
+++ b/Makefile
@@ -840,19 +840,19 @@ ifneq ($(DESCS),)
 	done
 endif
 	for s in $(ICON_SIZES); do \
-		mkdir -p "$(DESTDIR)/$(qemu_icondir)/hicolor/$${s}/apps"; \
+		mkdir -p "$(DESTDIR)$(qemu_icondir)/hicolor/$${s}/apps"; \
 		$(INSTALL_DATA) $(SRC_PATH)/ui/icons/qemu_$${s}.png \
-			"$(DESTDIR)/$(qemu_icondir)/hicolor/$${s}/apps/qemu.png"; \
+			"$(DESTDIR)$(qemu_icondir)/hicolor/$${s}/apps/qemu.png"; \
 	done; \
-	mkdir -p "$(DESTDIR)/$(qemu_icondir)/hicolor/32x32/apps"; \
+	mkdir -p "$(DESTDIR)$(qemu_icondir)/hicolor/32x32/apps"; \
 	$(INSTALL_DATA) $(SRC_PATH)/ui/icons/qemu_32x32.bmp \
-		"$(DESTDIR)/$(qemu_icondir)/hicolor/32x32/apps/qemu.bmp"; \
-	mkdir -p "$(DESTDIR)/$(qemu_icondir)/hicolor/scalable/apps"; \
+		"$(DESTDIR)$(qemu_icondir)/hicolor/32x32/apps/qemu.bmp"; \
+	mkdir -p "$(DESTDIR)$(qemu_icondir)/hicolor/scalable/apps"; \
 	$(INSTALL_DATA) $(SRC_PATH)/ui/icons/qemu.svg \
-		"$(DESTDIR)/$(qemu_icondir)/hicolor/scalable/apps/qemu.svg"
-	mkdir -p "$(DESTDIR)/$(qemu_desktopdir)"
+		"$(DESTDIR)$(qemu_icondir)/hicolor/scalable/apps/qemu.svg"
+	mkdir -p "$(DESTDIR)$(qemu_desktopdir)"
 	$(INSTALL_DATA) $(SRC_PATH)/ui/qemu.desktop \
-		"$(DESTDIR)/$(qemu_desktopdir)/qemu.desktop"
+		"$(DESTDIR)$(qemu_desktopdir)/qemu.desktop"
 ifdef CONFIG_GTK
 	$(MAKE) -C po $@
 endif
--=20
2.21.0


