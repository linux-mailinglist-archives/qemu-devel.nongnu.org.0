Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4D625D86
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 07:24:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJjP-0002au-7F
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 01:24:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9h-00045h-KU
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9g-000776-0g
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:09 -0400
Received: from ozlabs.org ([203.11.71.1]:56111)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJ9f-00076R-If; Wed, 22 May 2019 00:47:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580T22nSqz9sPk; Wed, 22 May 2019 14:46:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500374;
	bh=DhoK2motTlgMA6PD1KwSyR0Bct17q6LIWfIaLI4TIJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B6RAFZZfefUCymrLRaq8R6gbvumaRCOAIn5QogEzrV1kM73QOBLXoBEycGGWiCr7y
	dkRXFDBZvdeYv8zv4Bq4132SX5JQVuY00bAcr39kMbgi8Nu1rQT6p5xixYUFmlsUHW
	pGOLcnswlD3FZm/H9C5kzPTk5I4bi1rE6/OS6eIg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:29 +1000
Message-Id: <20190522044600.16534-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 07/38] target/ppc: Add ibm, purr and ibm,
 spurr device-tree properties
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
	qemu-ppc@nongnu.org, clg@kaod.org,
	Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

The ibm,purr and ibm,spurr device tree properties are used to indicate
that the processor implements the Processor Utilisation of Resources
Register (PURR) and Scaled Processor Utilisation of Resources Registers
(SPURR), respectively. Each property has a single value which represents
the level of architecture supported. A value of 1 for ibm,purr means
support for the version of the PURR defined in book 3 in version 2.02 of
the architecture. A value of 1 for ibm,spurr means support for the
version of the SPURR defined in version 2.05 of the architecture.

Add these properties for all processors for which the PURR and SPURR
registers are generated.

Fixes: 0da6f3fef9a "spapr: Reorganize CPU dt generation code"
Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Message-Id: <20190506014803.21299-1-sjitindarsingh@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 2ef3ce4362..8580a8dc67 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -500,7 +500,10 @@ static void spapr_populate_cpu_dt(CPUState *cs, void=
 *fdt, int offset,
     _FDT((fdt_setprop(fdt, offset, "64-bit", NULL, 0)));
=20
     if (env->spr_cb[SPR_PURR].oea_read) {
-        _FDT((fdt_setprop(fdt, offset, "ibm,purr", NULL, 0)));
+        _FDT((fdt_setprop_cell(fdt, offset, "ibm,purr", 1)));
+    }
+    if (env->spr_cb[SPR_SPURR].oea_read) {
+        _FDT((fdt_setprop_cell(fdt, offset, "ibm,spurr", 1)));
     }
=20
     if (ppc_hash64_has(cpu, PPC_HASH64_1TSEG)) {
--=20
2.21.0


