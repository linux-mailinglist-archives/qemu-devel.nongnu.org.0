Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D451E6ED29
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jul 2019 03:29:22 +0200 (CEST)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoeBd-0000WF-HW
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 21:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43842)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aik@ozlabs.ru>) id 1hoeBQ-0008T2-Of
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 21:29:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1hoeBP-0003EX-MC
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 21:29:08 -0400
Received: from ozlabs.ru ([107.173.13.209]:59038)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1hoeBP-0003A2-HN; Fri, 19 Jul 2019 21:29:07 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id CF18EAE807F3;
 Fri, 19 Jul 2019 21:28:57 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Sat, 20 Jul 2019 11:28:49 +1000
Message-Id: <20190720012850.14369-4-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190720012850.14369-1-aik@ozlabs.ru>
References: <20190720012850.14369-1-aik@ozlabs.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 107.173.13.209
Subject: [Qemu-devel] [PATCH qemu RFC 3/4] spapr: Advertise H_RTAS to the
 guest
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
Cc: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 qemu-ppc@nongnu.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since day 1 QEMU implemented RTAS as a custom hypercall wrapped into
a small 20 bytes blob which guest would call to enter RTAS. Although
it works fine, it is still a separate binary image which requires signing
at no additional benefit.

This adds a flag into /chosen to tell a modified guest that if the flag
is there, it can call H_RTAS directly and avoid calling into the RTAS
blob.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 hw/ppc/spapr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 81ad6a6f28de..b097a99951f1 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1230,6 +1230,9 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt)
         _FDT(fdt_setprop_cell(fdt, chosen, "linux,pci-probe-only", 0));
     }
 
+    /* We always implemented RTAS as hcall, tell guests to call it directly */
+    _FDT(fdt_setprop_cell(fdt, chosen, "qemu,h_rtas", 1));
+
     spapr_dt_ov5_platform_support(spapr, fdt, chosen);
 
     g_free(stdout_path);
-- 
2.17.1


