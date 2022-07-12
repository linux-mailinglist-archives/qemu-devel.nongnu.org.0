Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB033571BFA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 16:09:04 +0200 (CEST)
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBGZS-000678-Tn
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 10:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=V6zu=XR=zx2c4.com=Jason@kernel.org>)
 id 1oBGIb-0000lQ-FY
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 09:51:37 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:46524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=V6zu=XR=zx2c4.com=Jason@kernel.org>)
 id 1oBGIY-0003rk-KX
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 09:51:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B969B81863;
 Tue, 12 Jul 2022 13:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDBBC341CA;
 Tue, 12 Jul 2022 13:51:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="PSTU8bQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1657633881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SxLPQztIbUsaKTuTPOucFVRGw/rRIqqIpi7g3ZbtuTs=;
 b=PSTU8bQL+El3A/4xmFhZmayi2YDkkbmq6v/fzRFgcYX9yntYPehrFECU04VQ/BIHqaBTqz
 wXc79hdrPHqaSmDdFWk/dX8MmbROnOAcxVsUff9aftIEsJHxWLnJiDc63GCds/j1gBl+4R
 4mTFXegmADMl8+H7kgSU+i8BXxmCN1g=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0d60ef3a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 12 Jul 2022 13:51:21 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: danielhb413@gmail.com,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] hw/ppc: pass random seed to fdt
Date: Tue, 12 Jul 2022 15:51:14 +0200
Message-Id: <20220712135114.289855-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=V6zu=XR=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
initialize early. Set this using the usual guest random number
generation function. This is confirmed to successfully initialize the
RNG on Linux 5.19-rc6. The rng-seed node is part of the DT spec. Set
this on the paravirt platforms, spapr and e500, just as is done on other
architectures with paravirt hardware.

Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/ppc/e500.c  | 5 +++++
 hw/ppc/spapr.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 7f7f5b3452..2f86eb490e 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -17,6 +17,7 @@
 #include "qemu/osdep.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
+#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "e500.h"
 #include "e500-ccsr.h"
@@ -346,6 +347,7 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
         };
     const char *dtb_file = machine->dtb;
     const char *toplevel_compat = machine->dt_compatible;
+    uint8_t rng_seed[32];
 
     if (dtb_file) {
         char *filename;
@@ -403,6 +405,9 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
     if (ret < 0)
         fprintf(stderr, "couldn't set /chosen/bootargs\n");
 
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
+
     if (kvm_enabled()) {
         /* Read out host's frequencies */
         clock_freq = kvmppc_get_clockfreq();
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 9a5382d527..3a5112899e 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -27,6 +27,7 @@
 #include "qemu/osdep.h"
 #include "qemu/datadir.h"
 #include "qemu/memalign.h"
+#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-machine.h"
 #include "qapi/qapi-events-qdev.h"
@@ -1014,6 +1015,7 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
 {
     MachineState *machine = MACHINE(spapr);
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
+    uint8_t rng_seed[32];
     int chosen;
 
     _FDT(chosen = fdt_add_subnode(fdt, 0, "chosen"));
@@ -1091,6 +1093,9 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
         spapr_dt_ov5_platform_support(spapr, fdt, chosen);
     }
 
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    _FDT(fdt_setprop(fdt, chosen, "rng-seed", rng_seed, sizeof(rng_seed)));
+
     _FDT(spapr_dt_ovec(fdt, chosen, spapr->ov5_cas, "ibm,architecture-vec-5"));
 }
 
-- 
2.35.1


