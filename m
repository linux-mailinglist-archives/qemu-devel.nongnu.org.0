Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC874CB779
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 11:40:50 +0200 (CEST)
Received: from localhost ([::1]:43772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGK4v-00073U-My
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 05:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52205)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2C-0004oy-De
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2B-0004z8-8m
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:00 -0400
Received: from ozlabs.org ([203.11.71.1]:43637)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK2A-0004ve-Dv; Fri, 04 Oct 2019 05:37:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YF5Vzbz9sQp; Fri,  4 Oct 2019 19:37:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181873;
 bh=OPluXa4qYRAYPp0b/0a7pI97i+PJYoa+vQAbavFSld0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R8U9ndwcLaLmhS603Qa/i24ZYJlJCuH7FcdCdSGD2s2cf4x9astmsDD8gkN+TIaAQ
 EY5heANKbc+Y3Sr7FSQS9sYO77bGcSGGIFX/AadPh+t3PCbQD2LPhIXeKkBkOaDtZQ
 FiEBAP3CCvDFhgi6sC/Ny+kFqoWCnWVH356uA2d8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 05/53] spapr: Report kvm_irqchip_in_kernel() in 'info pic'
Date: Fri,  4 Oct 2019 19:36:59 +1000
Message-Id: <20191004093747.31350-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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

From: Greg Kurz <groug@kaod.org>

Unless the machine was started with kernel-irqchip=3Don, we cannot easily
tell if we're actually using an in-kernel or an emulated irqchip. This
information is important enough that it is worth printing it in 'info
pic'.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <156829860985.2073005.5893493824873412773.stgit@bahia.tls.ibm=
.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index f976d76eca..2725b139a7 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -81,6 +81,8 @@
 #include "hw/mem/memory-device.h"
 #include "hw/ppc/spapr_tpm_proxy.h"
=20
+#include "monitor/monitor.h"
+
 #include <libfdt.h>
=20
 /* SLOF memory layout:
@@ -4354,6 +4356,8 @@ static void spapr_pic_print_info(InterruptStatsProv=
ider *obj,
     SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
=20
     spapr->irq->print_info(spapr, mon);
+    monitor_printf(mon, "irqchip: %s\n",
+                   kvm_irqchip_in_kernel() ? "in-kernel" : "emulated");
 }
=20
 int spapr_get_vcpu_id(PowerPCCPU *cpu)
--=20
2.21.0


