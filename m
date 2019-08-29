Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AE0A1196
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 08:12:16 +0200 (CEST)
Received: from localhost ([::1]:45654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3DfJ-00072K-VD
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 02:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i3DcM-0004jh-3m
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:09:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i3DcK-0003tq-Sf
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:09:09 -0400
Received: from ozlabs.org ([203.11.71.1]:38717)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i3DcK-0003hC-HK; Thu, 29 Aug 2019 02:09:08 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46JscP1Rzfz9sPq; Thu, 29 Aug 2019 16:08:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1567058917;
 bh=EbS8l11A74/nQZf0qQxLFxG/g0Zh+FO1CsotAPo3sYU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dDXOagoRGIRtvJDR+crbWF2HxXiw6iRZQlqHBOSZuBw6D9QZtVNgwW1Baea5kSHDa
 Le1N432A8xdx/DBXPiZ+TZYoLeZbFpgfFTw/WxeCpfPEJPOsyIk4CwxT9Z3rJ+4M4+
 QfLh6LBc8b4rgx61VY3i3aFUILQ99XlAmQp+Nhps=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Thu, 29 Aug 2019 16:08:24 +1000
Message-Id: <20190829060827.25731-17-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829060827.25731-1-david@gibson.dropbear.id.au>
References: <20190829060827.25731-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 16/19] spapr: Use SHUTDOWN_CAUSE_SUBSYSTEM_RESET
 for CAS reboots
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, groug@kaod.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sPAPR platform includes feature negotiation between the guest and
platform.  That sometimes requires reconfiguring the virtual hardware, an=
d
in some cases that is a complex enough process that we trigger a system
reset to handle it.  That interacts badly with -no-reboot - we trigger th=
e
reboot, -no-reboot means we exit and so the guest never gets to try again=
.

Eventually we want to get rid of CAS reboots entirely, since they're odd
and irritating for the user.  But in the meantime we can fix the -no-rebo=
ot
problem by using SHUTDOWN_CAUSE_SUBSYSTEM_RESET which ignores -no-reboot
and seems to be designed for this sort of faux-reset for internal purpose=
s
only.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index e20a946b99..23e4bdb829 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1811,7 +1811,7 @@ static target_ulong h_client_architecture_support(P=
owerPCCPU *cpu,
     spapr_ovec_cleanup(ov5_updates);
=20
     if (spapr->cas_reboot) {
-        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        qemu_system_reset_request(SHUTDOWN_CAUSE_SUBSYSTEM_RESET);
     }
=20
     return H_SUCCESS;
--=20
2.21.0


