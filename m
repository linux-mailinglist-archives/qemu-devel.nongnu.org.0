Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D511124860
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 08:48:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSya0-0005cJ-1T
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 02:48:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHk-0006Am-5X
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:30:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHi-0008Dy-RH
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:30:04 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33233 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hSyHi-0008Co-GS; Tue, 21 May 2019 02:30:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 457Qpl0zKpz9sPM; Tue, 21 May 2019 16:29:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558420175;
	bh=7yuzEo2YA38e2JHCQDxRWnNRmIlLETDhNe3XHS0hfws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bzDUQJwpaeAnCxCZUIdyJEjNmICipbap2+sf8UK9KvzE6pXSS4G+0ye+RpiHqW7ve
	7lnyE8YyB7UBwijUBCdH5MNEl+9UEkWslx7KrqJj3q71eeHZLgzuBcM5uN0mCyIo0f
	2GiAFRdyQq5eC1Gm+eb2N3w12m5FZunKsRvVsOCQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue, 21 May 2019 16:29:10 +1000
Message-Id: <20190521062924.6930-25-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521062924.6930-1-david@gibson.dropbear.id.au>
References: <20190521062924.6930-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 24/38] spapr: Print out extra hints when CAS
 negotiation of interrupt mode fails
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
Cc: lvivier@redhat.com, gkurz@kaod.org, Greg Kurz <groug@kaod.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
	Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Let's suggest to the user how the machine should be configured to allow
the guest to boot successfully.

Suggested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <155799221739.527449.14907564571096243745.stgit@bahia.lan>
Reviewed-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Tested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 63a55614b8..aae9fd2b3e 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1646,12 +1646,12 @@ static target_ulong h_client_architecture_support=
(PowerPCCPU *cpu,
      */
     if (guest_xive) {
         if (spapr->irq->ov5 =3D=3D SPAPR_OV5_XIVE_LEGACY) {
-            error_report("Guest requested unavailable interrupt mode (XI=
VE)");
+            error_report("Guest requested unavailable interrupt mode (XI=
VE), try the ic-mode=3Dxive or ic-mode=3Ddual machine property");
             exit(EXIT_FAILURE);
         }
     } else {
         if (spapr->irq->ov5 =3D=3D SPAPR_OV5_XIVE_EXPLOIT) {
-            error_report("Guest requested unavailable interrupt mode (XI=
CS)");
+            error_report("Guest requested unavailable interrupt mode (XI=
CS), either don't set the ic-mode machine property or try ic-mode=3Dxics =
or ic-mode=3Ddual");
             exit(EXIT_FAILURE);
         }
     }
--=20
2.21.0


