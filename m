Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B057885E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:28:30 +0200 (CEST)
Received: from localhost ([::1]:37572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUXl-0005rQ-Mf
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDURz-0007YY-Dw; Mon, 18 Jul 2022 13:22:31 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDURx-0001fK-2U; Mon, 18 Jul 2022 13:22:31 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-10c0e6dd55eso25479072fac.7; 
 Mon, 18 Jul 2022 10:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=os9AduoJ1gIAScXVgZouLa+p4v5DNDafIjCB8RpIDFM=;
 b=HH8WEbv2/uWvXqPK6+8yZEG6sImpoe3AvQQqA6H5vDvJ3HlNjz72CdHf+9Vi5uv34z
 30RKZM2QdM56kVWMrUTqq0mcGdn7U7mhjHyBCEJVKIAG6PCwvsbbpg15VczFCJIFyzd1
 MhOdX+wzEaSXXDY2g7VF6ZnONr0zL5pHEtNQ5yTVVfzyLwUq1FLrc9s+faCDyfuLes0u
 YXg8G+kzNjJ+8a/oxo9BV0CQATLFDdTnzLpZoXJsf/zfMWQZUiqTE95j8GRHZ1sFBSCR
 zbekrfr5sc5qQkr5hY5s2GdZikhlGsEVFakN6nuJ1zzgjcs3jlmGBDIeum85BmODo5+0
 lCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=os9AduoJ1gIAScXVgZouLa+p4v5DNDafIjCB8RpIDFM=;
 b=Go3C8ckG/YNm0GpEeoJZSwOJ7JZwbibkRMn0fUSYe+i88kbcqBSA4Gb9yIF3Kudv/Q
 zYVxwCoG5jkTL/D3FAQdvCDv1FASHnXlse+JtqMuWFl2EMn8OPYcdbHqG1yaCM4JBAud
 DaP92nIKz6YTCQkouBtA0thm2Rm+uSpimW3T+FbeGTEwwMjbYw4Af4m5+2VCkE2pGS06
 f4w8bOmueoqqfjiZtyZvacnnuJwfVqEdImgG4ao5ahgHmHAlu0mD029onxqRr1pIOW4R
 TN9E6Cl+yoh9DwD0CtJtn2YPGbU36LzsrWG5WTHzveur6jhOBrvVJk1A34slXN46EXoN
 PqgA==
X-Gm-Message-State: AJIora850MLH+iqi/ab05v0zgcmTbCr+I/jQz9+kwXADg7xik+dFWRWr
 V5HmJGGM3DuWpEu/XkFog2HJR/5ba+M=
X-Google-Smtp-Source: AGRyM1sbYToM/tMbzwmnE6J37RqhkcqQjItLSLbtktEngkhPbCrAWcL9U+JK3um8TzmjtclACpPFhA==
X-Received: by 2002:a05:6808:1928:b0:339:f15a:ec8f with SMTP id
 bf40-20020a056808192800b00339f15aec8fmr16696455oib.35.1658164948001; 
 Mon, 18 Jul 2022 10:22:28 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PULL 06/30] hw/ppc: pass random seed to fdt
Date: Mon, 18 Jul 2022 14:21:44 -0300
Message-Id: <20220718172208.1247624-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
initialize early. Set this using the usual guest random number
generation function. This is confirmed to successfully initialize the
RNG on Linux 5.19-rc6. The rng-seed node is part of the DT spec. Set
this on the paravirt platforms, spapr and e500, just as is done on other
architectures with paravirt hardware.

Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220712135114.289855-1-Jason@zx2c4.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c  | 5 +++++
 hw/ppc/spapr.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 757cfaa62f..32495d0123 100644
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
2.36.1


