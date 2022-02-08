Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D034AD85F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:33:54 +0100 (CET)
Received: from localhost ([::1]:34868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPgv-0002Fx-Gx
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:33:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqn-0000ii-Hu
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:02 -0500
Received: from [2a00:1450:4864:20::429] (port=39795
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqk-00024B-OI
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:01 -0500
Received: by mail-wr1-x429.google.com with SMTP id d27so1898604wrc.6
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PVQGUaLUYR0ZoTmSZ6QO0Yr2xljBTBn4GGoM7Uq+BeA=;
 b=K8oBm1Q930r/T5dq+sVt7665hLlm4M/LVl6Ol5GcdYYg+MEP5uve4olVvQEat/F0td
 X1Kuw1YASyXuVdEy/B425/uc8iCEwQWTVSVZFhKRx2XlVVeah1BXACp5Rpbp1ErL6lUL
 947JZ4gAhHGf3fOjrsflXewMGNDjI2yWGle+RGypGZq19D7ZDkek+AkSTNH1SGgofwzs
 wLtLsIATP6eDDZk+zwT+c2ntjnmwiK77G81FyyHbFradPlZA28WGgQ9Hnzj358QvgoDj
 xK4zZYi6yoKyCZDDUT1XS00nkXv0XEjc+gssQauxIl+1WKrk/7iSJE7kY7B2QiMEMhCs
 qcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PVQGUaLUYR0ZoTmSZ6QO0Yr2xljBTBn4GGoM7Uq+BeA=;
 b=ZugRvxTmfxo2hoWN7oWQ8CqwUGMcSdw4W53i7PpfLYVThJRFZIhB5tw5iFl/2Kh+bF
 A9uol2vHrxdmfa0vc704pAvuPgqNQ5jvHjKqwUzm0eT7Ny4Eix1LieWVv6cOk4zN7hdQ
 5ymWiz7jA3vEu1EGRRehp/MU60Q3eRG4lSjsF++iXIW4NLdlsJJ0uu37i+R6yksPEAA1
 FvvaszZ5pYIPn83HmrWWMR3tljHradxKP/S5OPP7/LH3gSoZyHCt4EB8W4AGLTjm/xuD
 crzK+7XWqrFgWsKlo770Xi7Q5TRm5GYxAGCUiDHJKllXzZhoBkSwk7o/sGFf2Yl7/XAf
 f+WA==
X-Gm-Message-State: AOAM530/Gdu5mEnmdptWMzMEPkqm+nWt0KJ+dMGklzL7lHjYTXXkKRjY
 rMSL16cYs2r6hkMdP7s8jpvfaI0QeqTc/g==
X-Google-Smtp-Source: ABdhPJzm87WiyTlcjG63aWx+pjw0UvgXOggMXbZvcc8xD9ZA17BuLoSfeClQCUNMCbwTWwWi3Dv6+A==
X-Received: by 2002:a5d:49c1:: with SMTP id t1mr3232732wrs.359.1644320396642; 
 Tue, 08 Feb 2022 03:39:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/39] hw/arm: allwinner: Don't enable PSCI conduit when
 booting guest in EL3
Date: Tue,  8 Feb 2022 11:39:19 +0000
Message-Id: <20220208113948.3217356-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Change the allwinner-h3 based board to use the new boot.c
functionality to allow us to enable psci-conduit only if the guest is
being booted in EL1 or EL2, so that if the user runs guest EL3
firmware code our PSCI emulation doesn't get in its way.

To do this we stop setting the psci-conduit property on the CPU
objects in the SoC code, and instead set the psci_conduit field in
the arm_boot_info struct to tell the common boot loader code that
we'd like PSCI if the guest is starting at an EL that it makes sense
with.

This affects the orangepi-pc board.

This commit leaves the secondary CPUs in the powered-down state if
the guest is booting at EL3, which is the same behaviour as before
this commit.  The secondaries can no longer be started by that EL3
code making a PSCI call but can still be started via the CPU
Configuration Module registers (which we model in
hw/misc/allwinner-cpucfg.c).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20220127154639.2090164-6-peter.maydell@linaro.org
---
 hw/arm/allwinner-h3.c | 9 ++++-----
 hw/arm/orangepi.c     | 1 +
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index f9b7ed18711..318ed4348c7 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -235,11 +235,10 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
     /* CPUs */
     for (i = 0; i < AW_H3_NUM_CPUS; i++) {
 
-        /* Provide Power State Coordination Interface */
-        qdev_prop_set_int32(DEVICE(&s->cpus[i]), "psci-conduit",
-                            QEMU_PSCI_CONDUIT_SMC);
-
-        /* Disable secondary CPUs */
+        /*
+         * Disable secondary CPUs. Guest EL3 firmware will start
+         * them via CPU reset control registers.
+         */
         qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
                           i > 0);
 
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index e7963822367..68fe9182414 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -105,6 +105,7 @@ static void orangepi_init(MachineState *machine)
     }
     orangepi_binfo.loader_start = h3->memmap[AW_H3_DEV_SDRAM];
     orangepi_binfo.ram_size = machine->ram_size;
+    orangepi_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
 }
 
-- 
2.25.1


