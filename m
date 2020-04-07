Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8721A05DB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 06:41:59 +0200 (CEST)
Received: from localhost ([::1]:41066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLg3i-0007td-FY
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 00:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52382)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jLfyN-0007zR-9E
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 00:36:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jLfyM-0004EG-2g
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 00:36:27 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:39321)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jLfyL-0004Bj-Ob; Tue, 07 Apr 2020 00:36:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48xF3K3t5jz9sSx; Tue,  7 Apr 2020 14:36:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1586234173;
 bh=sh6TtPXrdue9B6HZ43emGvTJpQJECTK+zFY9Ut9jfDQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k8RsCwVE9gioOH9JSdq91A+g+2lnyEqh0mJ6KmCV0hPtX7lGG2s9AAOqUoJWR7Wyd
 ljfrWQ+vU0xPI1GVHyJ2851yZ2UlCHfRuiRClBzLApXNsOIZ8dkpvQ2nNB1hrcuInh
 Acrark0/ZZl4Avj3We3SE/9L77Yu9HOGm3WBmOV8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 05/10] ppc/spapr: Add FWNMI machine check delivery warnings
Date: Tue,  7 Apr 2020 14:36:01 +1000
Message-Id: <20200407043606.291546-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200407043606.291546-1-david@gibson.dropbear.id.au>
References: <20200407043606.291546-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
Cc: aik@ozlabs.ru, qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

Add some messages which explain problems and guest misbehaviour that
may be difficult to diagnose in rare cases of machine checks.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20200325142906.221248-4-npiggin@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_events.c | 4 ++++
 hw/ppc/spapr_rtas.c   | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index a908c5d0e9..c8964eb25d 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -833,6 +833,8 @@ static void spapr_mce_dispatch_elog(PowerPCCPU *cpu, =
bool recovered)
     /* get rtas addr from fdt */
     rtas_addr =3D spapr_get_rtas_addr();
     if (!rtas_addr) {
+        error_report(
+"FWNMI: Unable to deliver machine check to guest: rtas_addr not found.")=
;
         qemu_system_guest_panicked(NULL);
         g_free(ext_elog);
         return;
@@ -874,6 +876,8 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recove=
red)
          * that CPU called "ibm,nmi-interlock")
          */
         if (spapr->fwnmi_machine_check_interlock =3D=3D cpu->vcpu_id) {
+            error_report(
+"FWNMI: Unable to deliver machine check to guest: nested machine check."=
);
             qemu_system_guest_panicked(NULL);
             return;
         }
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 29abe66d01..bcac0d00e7 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -462,6 +462,9 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
     }
=20
     if (spapr->fwnmi_machine_check_addr =3D=3D -1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+"FWNMI: ibm,nmi-interlock RTAS called with FWNMI not registered.\n");
+
         /* NMI register not called */
         rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
         return;
--=20
2.25.2


