Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D07BBFEB6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 07:53:44 +0200 (CEST)
Received: from localhost ([::1]:46574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDjCH-0000Zy-9h
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 01:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iDj9O-0006kZ-EI
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 01:50:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iDj9N-0004x8-92
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 01:50:42 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:49017)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iDj9M-0004tk-Dq; Fri, 27 Sep 2019 01:50:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46fgrC3Y76z9sNf; Fri, 27 Sep 2019 15:50:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569563435;
 bh=fWFs/+F2xIiWNCCLaeFDmoBxXkejZr/tBxUs5P1Vqqs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oo5ZJjskSvzjsn0mrk9mHFkzTt2SmdL0U60psx8mciuIqg+h/4w7+KNNLtgbDJR9L
 FhUiVX871PvSAjqGndlnu0+HnkB8lyIVeHizFG9CganmlJSouqlKbcuMM0YGW6E0Kd
 YIrqi4xAWMd6gsQd07cOXL1++NWKKSYV2qRMWofY=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	clg@kaod.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 01/33] xics: Minor fixes for XICSFabric interface
Date: Fri, 27 Sep 2019 15:49:56 +1000
Message-Id: <20190927055028.11493-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190927055028.11493-1-david@gibson.dropbear.id.au>
References: <20190927055028.11493-1-david@gibson.dropbear.id.au>
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
 groug@kaod.org, Laurent Vivier <laurent@vivier.eu>,
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


