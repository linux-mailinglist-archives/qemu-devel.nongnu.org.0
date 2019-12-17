Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEA81223E3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 06:36:41 +0100 (CET)
Received: from localhost ([::1]:35968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih5XE-0007D1-6t
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 00:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35350)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4k0-0002LV-Ib
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:45:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4jz-0007xj-GE
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:45:48 -0500
Received: from ozlabs.org ([203.11.71.1]:37161)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ih4jw-0007Oo-7q; Mon, 16 Dec 2019 23:45:45 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47cQWg16NBz9sTT; Tue, 17 Dec 2019 15:43:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576557823;
 bh=n8oIL2+nZlBzgcIXuaZwztF3/7D7XKvuOUrx0Eqt9sE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hJSjFhMVW78KPVlwr0fANyBoB0doLE9l2tF4Q5zNpEBUckYaIOp17/RLyHS9TM1PW
 ehp8PYXSgoclv/8o8VDbKq/gRa0WzVBIQsVcnTlHirxicMbO79D/yy75kX0PeN5gi/
 aDG63tCaxVJSBasM4GNgX6bBmQMSZoW6uwO6gp3o=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 60/88] ppc: Make PPCVirtualHypervisor an incomplete type
Date: Tue, 17 Dec 2019 15:42:54 +1100
Message-Id: <20191217044322.351838-61-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191217044322.351838-1-david@gibson.dropbear.id.au>
References: <20191217044322.351838-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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

PPCVirtualHypervisor is an interface instance. It should never be
dereferenced. Drop the dummy type definition for extra safety, which
is the common practice with QOM interfaces.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <157589808041.21182.18121655959115011353.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f9528fc29d..60cf030ce6 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1222,10 +1222,6 @@ PowerPCCPUClass *ppc_cpu_class_by_pvr(uint32_t pvr=
);
 PowerPCCPUClass *ppc_cpu_class_by_pvr_mask(uint32_t pvr);
 PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc);
=20
-struct PPCVirtualHypervisor {
-    Object parent;
-};
-
 struct PPCVirtualHypervisorClass {
     InterfaceClass parent;
     void (*hypercall)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
--=20
2.23.0


