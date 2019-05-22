Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17DC25D5A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 07:08:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJUn-0005i4-K5
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 01:08:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ91-0003U3-Pz
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ8z-0006mO-No
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:27 -0400
Received: from ozlabs.org ([203.11.71.1]:36877)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJ8z-0006kJ-64; Wed, 22 May 2019 00:46:25 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580Sz1pkHz9sPx; Wed, 22 May 2019 14:46:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500371;
	bh=siwZger9wRnZvOxEZY9u/KjVe/b0SGHKQBk2SghV9nE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kh2tt6I2za7HNoWXHVWc1Ku9LURuT+oc+XZkrWrBFXbIHQSUyqMzGMD8EmH3bOnoz
	/F6DzXSpX4l6+7Zrd4lNztkJvShP7GxHpdCO0q6NUco+YV97rNcDBpvQGznD1vx0X+
	HFrSW8yTDcdC6fNtbj0IvYY6/zq5D1wWoBSt7wfY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:46 +1000
Message-Id: <20190522044600.16534-25-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
	Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, clg@kaod.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
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
[dwg: Adjusted for style error]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 63a55614b8..0a050ad3d8 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1646,12 +1646,14 @@ static target_ulong h_client_architecture_support=
(PowerPCCPU *cpu,
      */
     if (guest_xive) {
         if (spapr->irq->ov5 =3D=3D SPAPR_OV5_XIVE_LEGACY) {
-            error_report("Guest requested unavailable interrupt mode (XI=
VE)");
+            error_report(
+"Guest requested unavailable interrupt mode (XIVE), try the ic-mode=3Dxi=
ve or ic-mode=3Ddual machine property");
             exit(EXIT_FAILURE);
         }
     } else {
         if (spapr->irq->ov5 =3D=3D SPAPR_OV5_XIVE_EXPLOIT) {
-            error_report("Guest requested unavailable interrupt mode (XI=
CS)");
+            error_report(
+"Guest requested unavailable interrupt mode (XICS), either don't set the=
 ic-mode machine property or try ic-mode=3Dxics or ic-mode=3Ddual");
             exit(EXIT_FAILURE);
         }
     }
--=20
2.21.0


