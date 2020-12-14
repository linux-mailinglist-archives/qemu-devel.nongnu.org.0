Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D190A2D9270
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:09:09 +0100 (CET)
Received: from localhost ([::1]:40094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kog6e-0001SE-Tt
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwV-0005H3-TV; Sun, 13 Dec 2020 23:58:40 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:50009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwT-0004sC-R0; Sun, 13 Dec 2020 23:58:39 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfs1vcfz9sWX; Mon, 14 Dec 2020 15:58:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921893;
 bh=chEF8D4+gY4i8ttVlD0cjDG3WMAwgoRw30EJwDdJF4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d22h08e/lYnTAQ1FvZS2NsrLZLl1mR9K6jzACMvFbNe4Z+iWsjKCu/l/u9i96XYbY
 zUTeam3CtecycxPo1dDLNv/nT7N4AL8q1mTJMC/6cJHMonRx6w6glGzm1JixHQ3F+9
 vNWAj1AO+pLGGnKRbtEEbPsY6lj2PeJh5MDwM7YY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 18/30] spapr: Abort if ppc_set_compat() fails for hot-plugged
 CPUs
Date: Mon, 14 Dec 2020 15:57:55 +1100
Message-Id: <20201214045807.41003-19-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

When a CPU is hot-plugged, we set its compat mode to match the boot
CPU, which was either set by machine reset or by CAS. This is currently
handled in the plug handler after the core got realized. Potential errors
of ppc_set_compat() are propagated to the hot-plug logic.

Handling errors this late in the hot-plug sequence is generally frown
upon. Ideally, we should do sanity checks in a pre-plug handler and pass
&error_abort to ppc_set_compat() in the plug handler.

We can filter out some error cases of ppc_set_compat() by calling
ppc_check_compat() at pre-plug. But ppc_set_compat() also sets the
compat register in KVM, and KVM doesn't provide any API that would
allow to check valid compat mode settings beforehand.

However, at this point we know that the compat mode was already
successfully set for the boot CPU. Since this all boils down to
setting a register with the very same value that was valid
for the boot CPU, it should definitely not fail for hot-plugged
CPUS.

Pass &error_abort to ppc_set_compat().

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201201113728.885700-3-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 5fbae8adda..99139a692c 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3784,15 +3784,13 @@ static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     /*
      * Set compatibility mode to match the boot CPU, which was either set
-     * by the machine reset code or by CAS.
+     * by the machine reset code or by CAS. This really shouldn't fail at
+     * this point.
      */
     if (hotplugged) {
         for (i = 0; i < cc->nr_threads; i++) {
-            if (ppc_set_compat(core->threads[i],
-                               POWERPC_CPU(first_cpu)->compat_pvr,
-                               errp) < 0) {
-                return;
-            }
+            ppc_set_compat(core->threads[i], POWERPC_CPU(first_cpu)->compat_pvr,
+                           &error_abort);
         }
     }
 
-- 
2.29.2


