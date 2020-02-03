Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240341500B2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 04:21:42 +0100 (CET)
Received: from localhost ([::1]:33662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iySIu-0005l7-OK
	for lists+qemu-devel@lfdr.de; Sun, 02 Feb 2020 22:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48303)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1iySI7-0005Eb-4U
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 22:20:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1iySI5-000215-6v
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 22:20:50 -0500
Received: from [107.174.27.60] (port=36746 helo=ozlabs.ru)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1iySI5-0001xF-1i; Sun, 02 Feb 2020 22:20:49 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id C6042AE8000F;
 Sun,  2 Feb 2020 22:19:20 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu] spapr/rtas: Print message from "ibm,os-term"
Date: Mon,  3 Feb 2020 14:20:44 +1100
Message-Id: <20200203032044.118585-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 107.174.27.60
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "ibm,os-term" RTAS call has a single parameter which is a pointer to
a message from the guest kernel about the termination cause; this prints
it.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 hw/ppc/spapr_rtas.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 883fe28465e6..656fdd221665 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -345,6 +345,13 @@ static void rtas_ibm_os_term(PowerPCCPU *cpu,
                             target_ulong args,
                             uint32_t nret, target_ulong rets)
 {
+    target_ulong msgaddr = rtas_ld(args, 0);
+    char msg[512];
+
+    cpu_physical_memory_read(msgaddr, msg, sizeof(msg) - 1);
+    msg[sizeof(msg) - 1] = 0;
+
+    error_report("OS terminated: %s", msg);
     qemu_system_guest_panicked(NULL);
 
     rtas_st(rets, 0, RTAS_OUT_SUCCESS);
-- 
2.17.1


