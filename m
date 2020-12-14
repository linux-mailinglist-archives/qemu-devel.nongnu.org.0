Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4581B2D927C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:13:35 +0100 (CET)
Received: from localhost ([::1]:57222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogAv-0008ON-WA
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwV-0005H1-RD; Sun, 13 Dec 2020 23:58:40 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58613 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwT-0004s0-4L; Sun, 13 Dec 2020 23:58:39 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfs0TTsz9sW8; Mon, 14 Dec 2020 15:58:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921893;
 bh=VEVsQoNOTp6RC84Xqfdj8Fs1+zfFBV3XfyThxL+idf8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AP4ZPDnT56UeZeXY6N4hCv9wT1Yt6njFf5PfHGWMPRjH4oCTDMiX5rzE8H7cX0qI4
 jKNBlRME1UU7GD/qqi/tAzmuSojMg3n376Du1IvpUZZtsonyKPB8iVFaUj19BkVaAc
 D4FimPaQ8usFCht6xCICd0OzHfkYfHwxon26eyR0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 17/30] spapr: Fix pre-2.10 dummy ICP hack
Date: Mon, 14 Dec 2020 15:57:54 +1100
Message-Id: <20201214045807.41003-18-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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

This hack registers dummy VMState entries of ICPs in order to
support migration of old pseries machine types that used to
create all smp.max_cpus possible ICPs at machine init.

Part of the work is to unregister the dummy entries when plugging
an actual vCPU core, and to register them back when unplugging the
core. The code that unregisters the dummy ICPs in spapr_core_plug()
is misplaced: if ppc_set_compat() fails afterwards, the hotplug
operation will be cancelled and the dummy ICPs won't be registered
back since the unplug handler isn't called.

Unregister the dummy ICPs at the end of spapr_core_plug().

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201201113728.885700-2-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d51c550288..5fbae8adda 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3782,13 +3782,6 @@ static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     core_slot->cpu = OBJECT(dev);
 
-    if (smc->pre_2_10_has_unused_icps) {
-        for (i = 0; i < cc->nr_threads; i++) {
-            cs = CPU(core->threads[i]);
-            pre_2_10_vmstate_unregister_dummy_icp(cs->cpu_index);
-        }
-    }
-
     /*
      * Set compatibility mode to match the boot CPU, which was either set
      * by the machine reset code or by CAS.
@@ -3802,6 +3795,13 @@ static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
             }
         }
     }
+
+    if (smc->pre_2_10_has_unused_icps) {
+        for (i = 0; i < cc->nr_threads; i++) {
+            cs = CPU(core->threads[i]);
+            pre_2_10_vmstate_unregister_dummy_icp(cs->cpu_index);
+        }
+    }
 }
 
 static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
-- 
2.29.2


