Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED942CB814
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 12:19:02 +0200 (CEST)
Received: from localhost ([::1]:44860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGKft-0004SI-Pf
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 06:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK35-0005gT-8p
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK34-0005y5-2n
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:55 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:54247)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK33-0005UY-Lu; Fri, 04 Oct 2019 05:38:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YN2pCNz9sSH; Fri,  4 Oct 2019 19:38:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181880;
 bh=+Leo6gdE5aiIdaGLcdtFPtPIKtr7cmssxnY1G1lp+co=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=REHtZ4gSw9EGlMJ+Tx0n+TC9G20HoOFw0L0aYsjp9aQXb0z86SiKqHMwnVqOr0pIC
 4hBy3jBxhFn7Pb7WaLlI94LOzAu59I2o8EE7b4BsrczxBT7JTPTuIXKnIlUq1CFkD8
 Nxn+mAJRgMfNuWABtwpR2aHKYbnmjNGYyHSZ3gJw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 33/53] xics: Minor fixes for XICSFabric interface
Date: Fri,  4 Oct 2019 19:37:27 +1000
Message-Id: <20191004093747.31350-34-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
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
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
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


