Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9F143009
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 17:36:44 +0100 (CET)
Received: from localhost ([::1]:39732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ita2d-0001My-52
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 11:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59634)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1ita0J-00084f-PI
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 11:34:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1ita08-0007xh-3S
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 11:34:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34084
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1ita08-0007xO-03
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 11:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579538047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cL08OkGUJaYgWYXUtiibvTijuOu4OJbqIgrOVeFFH3I=;
 b=WSBwoaxXTyK4De/FOS7YiUg9pTvD25/JdXPWJQYiYrTLKaSw0Iseq8h29LX8Lbw3Q4J1Z7
 r5cIbNoaVJeOK5418LmmFDnT8Zai/7cJSmKn0zBIyodEJ39yEsfSXFwZaB73sMl26OYUyk
 Ce75cuYHXbSdnpjisKRHQjt5rxZIu9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-k6nsDlNkOGaP2IVQgiL9dQ-1; Mon, 20 Jan 2020 11:34:06 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36D28107ACC9;
 Mon, 20 Jan 2020 16:34:05 +0000 (UTC)
Received: from localhost (ovpn-117-223.ams2.redhat.com [10.36.117.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE17986CC2;
 Mon, 20 Jan 2020 16:34:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Makefile: add missing mkdir MANUAL_BUILDDIR
Date: Mon, 20 Jan 2020 16:34:00 +0000
Message-Id: <20200120163400.603449-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: k6nsDlNkOGaP2IVQgiL9dQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mrezanin@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MANUAL_BUILDDIR directory is automatically created by sphinx-build
for the other targets.  The index.html target does not use sphinx-build
so we must manually create the directory to avoid the following error:

  GEN     docs/built/index.html
  /bin/sh: docs/built/index.html: No such file or directory

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index afa5cb6548..6562b0dc97 100644
--- a/Makefile
+++ b/Makefile
@@ -1022,6 +1022,7 @@ $(MANUAL_BUILDDIR)/interop/qemu-ga.8: $(call manual-d=
eps,interop)
 =09$(call build-manual,interop,man)
=20
 $(MANUAL_BUILDDIR)/index.html: $(SRC_PATH)/docs/index.html.in qemu-version=
.h
+=09@mkdir -p "$(MANUAL_BUILDDIR)"
 =09$(call quiet-command, sed "s|@@VERSION@@|${VERSION}|g" $< >$@, \
              "GEN","$@")
=20
--=20
2.24.1


