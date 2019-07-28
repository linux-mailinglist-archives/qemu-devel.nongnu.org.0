Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5765077E4E
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jul 2019 08:45:00 +0200 (CEST)
Received: from localhost ([::1]:43778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hrcvT-0005DF-0K
	for lists+qemu-devel@lfdr.de; Sun, 28 Jul 2019 02:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42383)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hrcub-0003xJ-UC
 for qemu-devel@nongnu.org; Sun, 28 Jul 2019 02:44:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hrcua-0000x6-Mn
 for qemu-devel@nongnu.org; Sun, 28 Jul 2019 02:44:05 -0400
Received: from ozlabs.org ([203.11.71.1]:33861)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hrcuZ-0000wE-Lf; Sun, 28 Jul 2019 02:44:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45xCvz2Wqpz9s7T; Sun, 28 Jul 2019 16:43:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1564296239;
 bh=c1s9iOXvizLw8tE6vsGL8bG1Z4MGes82/Q3OpOj7wQ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G9JoTdamFsQxY8LJJ0l3Cf8/YcDMQKCMXLPg+AruQ70kkDmgQsBn1hRjIJTcHys7O
 r107SjJGsECd8vDR3DlZTKR3s6stRZ5LNnHOKGZ1j8iP2wErSOsqtj0DwPOMUurNcM
 7uFI9nwcXQfZMqAmuGCpauuHzCyxIYj5caXpc3pI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Sun, 28 Jul 2019 16:43:54 +1000
Message-Id: <20190728064355.2605-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190728064355.2605-1-david@gibson.dropbear.id.au>
References: <20190728064355.2605-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 1/2] spapr/irq: Inform the user when falling
 back to emulated IC
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
Cc: aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, clg@kaod.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Just to give an indication to the user that the error condition is
handled and how.

Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <156398743479.546975.14566809803480887488.stgit@bahia.lan>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index ff3df0bbd8..d07aed8ca9 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -86,6 +86,7 @@ static void spapr_irq_init_kvm(SpaprMachineState *spapr=
,
          * emulated mode
          */
         error_prepend(&local_err, "kernel_irqchip allowed but unavailabl=
e: ");
+        error_append_hint(&local_err, "Falling back to kernel-irqchip=3D=
off\n");
         warn_report_err(local_err);
     }
 }
--=20
2.21.0


