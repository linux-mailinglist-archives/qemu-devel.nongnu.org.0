Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0D7E2C30
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 10:30:18 +0200 (CEST)
Received: from localhost ([::1]:34950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNYVc-0000xu-Si
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 04:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36658)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iNYKW-0004qU-1O
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:18:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iNYKU-0005Dm-Dq
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:18:47 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50725 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iNYKU-00056l-0L; Thu, 24 Oct 2019 04:18:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46zKrZ59Qbz9sRp; Thu, 24 Oct 2019 19:18:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1571905118;
 bh=zjFNkfEC2lqwHnFh4a9YRFMi7iKEynZsNvxFNHQaBOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ONI4c/XUmavxAY3xRrSDWq2rDSawT1GWPe/scy1UrIFGLdpna+XZDZ1aTd3zBxMit
 fMVKmKoOHlobjkarh17I83ZN1nihyw3S1vdmOpaSftd0JONAt9pfgRbBUozg/6rWXB
 UQDJaD0sGMiKnX0dGN/vWumKGpUA9mvP0/8BFYmU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 21/28] spapr: Don't request to unplug the same core twice
Date: Thu, 24 Oct 2019 19:18:06 +1100
Message-Id: <20191024081813.2115-22-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191024081813.2115-1-david@gibson.dropbear.id.au>
References: <20191024081813.2115-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

We must not call spapr_drc_detach() on a detached DRC otherwise bad thing=
s
can happen, ie. QEMU hangs or crashes. This is easily demonstrated with
a CPU hotplug/unplug loop using QMP.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <157185826035.3073024.1664101000438499392.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index f9410d390a..94f9d27096 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3741,9 +3741,10 @@ void spapr_core_unplug_request(HotplugHandler *hot=
plug_dev, DeviceState *dev,
                           spapr_vcpu_id(spapr, cc->core_id));
     g_assert(drc);
=20
-    spapr_drc_detach(drc);
-
-    spapr_hotplug_req_remove_by_index(drc);
+    if (!spapr_drc_unplug_requested(drc)) {
+        spapr_drc_detach(drc);
+        spapr_hotplug_req_remove_by_index(drc);
+    }
 }
=20
 int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
--=20
2.21.0


