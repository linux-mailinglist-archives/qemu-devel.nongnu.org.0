Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94409C4601
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 05:04:42 +0200 (CEST)
Received: from localhost ([::1]:50904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFUwS-0003kS-5m
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 23:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59565)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iFUkg-0001Zt-IB
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 22:52:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iFUkf-0002m7-5Y
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 22:52:30 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51771)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iFUkb-0002bz-NH; Tue, 01 Oct 2019 22:52:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46jgf640t0z9sPq; Wed,  2 Oct 2019 12:52:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569984734;
 bh=nQZ6RYMQSnBaHohmcBBdc5v6CdjWwiWcXseE3ZORP8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I070B1qz61GR9pEl9Ld5GbyiDmRsIiFZbYhj35cZeujy2jYPhI+vp4kNU5sm4jGWh
 V9pc7EKJfoWAMkuRt7JNi6LwxDbpZkXzipSEA3dRzVDf2K57pVEu2b4xYZrFghIsJd
 YjEbP2YmwBbDO6Qgwpr+/TuNQnmBlI9zf9p+QJZ0=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org,
	clg@kaod.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 01/34] xics: Minor fixes for XICSFabric interface
Date: Wed,  2 Oct 2019 12:51:35 +1000
Message-Id: <20191002025208.3487-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191002025208.3487-1-david@gibson.dropbear.id.au>
References: <20191002025208.3487-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, groug@kaod.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Interface instances should never be directly dereferenced.  So, the commo=
n
practice is to make them incomplete types to make sure no-one does that.
XICSFrabric, however, had a dummy type which is less safe.

We were also using OBJECT_CHECK() where we should have been using
INTERFACE_CHECK().

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/xics.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
index 64a2c8862a..faa33ae943 100644
--- a/include/hw/ppc/xics.h
+++ b/include/hw/ppc/xics.h
@@ -147,13 +147,9 @@ struct ICSIRQState {
     uint8_t flags;
 };
=20
-struct XICSFabric {
-    Object parent;
-};
-
 #define TYPE_XICS_FABRIC "xics-fabric"
 #define XICS_FABRIC(obj)                                     \
-    OBJECT_CHECK(XICSFabric, (obj), TYPE_XICS_FABRIC)
+    INTERFACE_CHECK(XICSFabric, (obj), TYPE_XICS_FABRIC)
 #define XICS_FABRIC_CLASS(klass)                                     \
     OBJECT_CLASS_CHECK(XICSFabricClass, (klass), TYPE_XICS_FABRIC)
 #define XICS_FABRIC_GET_CLASS(obj)                                   \
--=20
2.21.0


