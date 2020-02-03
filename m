Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD96150196
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 07:15:21 +0100 (CET)
Received: from localhost ([::1]:34772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyV0y-0007uq-RE
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 01:15:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57133)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxL-0002LX-UV
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:11:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxK-0002W5-UF
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:11:35 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:33803 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iyUxK-0002Tt-Jg; Mon, 03 Feb 2020 01:11:34 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 489yBm4bMpz9sSD; Mon,  3 Feb 2020 17:11:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580710288;
 bh=PVwxscjrI7jhsuwlQkAC7qDnh7+BHJbvc7CrDJ8cLlc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gkRz04Q3e2RRTz6JGFaK2GtPf2sfvTYxAmzwgPGaKhkSjzUNql9s0bASRaPtwZs2A
 RYtQ5Ox92CyhEnPDBa+5sfNDZolGSDbFl5dvp8V6l2v9HjXBWWUMxHOM/XjnEEWiOb
 mzinrI+y2321k0H0eoOFPGNpxvtysgEF7+rLBIIs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 06/35] spapr: Fail CAS if option vector table cannot be parsed
Date: Mon,  3 Feb 2020 17:10:54 +1100
Message-Id: <20200203061123.59150-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203061123.59150-1-david@gibson.dropbear.id.au>
References: <20200203061123.59150-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Most of the option vector helpers have assertions to check their
arguments aren't null. The guest can provide an arbitrary address
for the CAS structure that would result in such null arguments.
Fail CAS with H_PARAMETER and print a warning instead of aborting
QEMU.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <157925255250.397143.10855183619366882459.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index f1799b1b70..ffb14641f9 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1703,7 +1703,15 @@ static target_ulong h_client_architecture_support(=
PowerPCCPU *cpu,
     ov_table =3D addr;
=20
     ov1_guest =3D spapr_ovec_parse_vector(ov_table, 1);
+    if (!ov1_guest) {
+        warn_report("guest didn't provide option vector 1");
+        return H_PARAMETER;
+    }
     ov5_guest =3D spapr_ovec_parse_vector(ov_table, 5);
+    if (!ov5_guest) {
+        warn_report("guest didn't provide option vector 5");
+        return H_PARAMETER;
+    }
     if (spapr_ovec_test(ov5_guest, OV5_MMU_BOTH)) {
         error_report("guest requested hash and radix MMU, which is inval=
id.");
         exit(EXIT_FAILURE);
--=20
2.24.1


