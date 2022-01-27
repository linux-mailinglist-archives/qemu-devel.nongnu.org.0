Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A59349E829
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:56:19 +0100 (CET)
Received: from localhost ([::1]:47428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD84I-0003rU-Jj
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:56:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z7-00062y-0H
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:53 -0500
Received: from [2a00:1450:4864:20::331] (port=37644
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z5-0008HI-A3
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:52 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso6224558wmj.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T+1ej9mTsCTQvcQ+nmnN96HZqUCNnh9Zhy+mdjh86Jk=;
 b=THqGeUqq2zdo2r3+m43mKWhjXoiFyvNSWIM0eo3szXW5dt6lug3y5Dx8CjH8/i87xH
 wP2vd6wKRq1dPUAPILT6LWFjni3OMnV3Nk7oHY7I2LcEv5eMZkCiFbcGZeJbhAsu6Jl5
 OUBrYJRKzmN2IrLba01we7hxr1Dh31u2haIhGHGkS1dFuZHakfaNtP3EyEzOZhMsJyaO
 emfa46nudIX/Cgx2nKX1hiAhdhGr6DHEV7Dcr9iXla9S+Be2pud7sEA94KcP4H3/sgqv
 nc+yiZzvBVpAjekiWx3KWl0rzmZAyfMc9SHsX0Svq/ODh7bFDetnOMgl3V5hEHKaSjHH
 btTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T+1ej9mTsCTQvcQ+nmnN96HZqUCNnh9Zhy+mdjh86Jk=;
 b=fEWXSzAikTU/e6kV1IWRWPKeK0hUotnrc+NJvYTQESocFxAFLGyDrLOHBRTni0sy90
 ULnNGtBzXrpSnuREYTmxC3MUfzV4wO/qfXlnyLSuFUCY4MLpjcsFx6QCgVgeNcpUBxAd
 n9DWFKc3RjYpU7M64ZZDZ8VEjrB7xoavUly0ork9RLgayhgeeuoaMVqEeKjFKqCFxWoy
 8haJjZJoj9gJFl19fCEVvS7BWDe2NBvhh6GdRSUGYGDMIxOnIGg+t8Fz1QkeEu6lBF7X
 ShUqTYPUJXVbJzY7iGdQupkcqsJwjJkdtMIYrbJFyV/FfN/TcKFZMniEvNKxOK54H+Qe
 f2uQ==
X-Gm-Message-State: AOAM532NOCRo2h2+Nbv7I1EIbHCAyVX0JSCkYvaVmAVyhl67meOBUFQK
 kjxdxZOgf/kDZKdi0gLt44ECoA==
X-Google-Smtp-Source: ABdhPJyjLs0ow8F1saSwdggp25/m9rYNVd12v9bBuuzb8pWglILZ1JoljUjlf35XvV7KjAQle7if/Q==
X-Received: by 2002:a05:600c:3005:: with SMTP id
 j5mr3697280wmh.35.1643298410046; 
 Thu, 27 Jan 2022 07:46:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:46:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/16] hw/arm: allwinner: Don't enable PSCI conduit when
 booting guest in EL3
Date: Thu, 27 Jan 2022 15:46:28 +0000
Message-Id: <20220127154639.2090164-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
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
---
If anybody knows for definite that the secondaries should be
powered-down at startup for guest firmware, we can delete the TODO.
The allwinner-cpucfg.c code makes the reset value for the
REG_CPU*_RST_CTRL registers "CPUX_RESET_RELEASED", which might
suggest otherwise, but that could easily just be a QEMU error.
---
 hw/arm/allwinner-h3.c | 9 ++++-----
 hw/arm/orangepi.c     | 1 +
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index f9b7ed18711..f54aff6d2d2 100644
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
+         * Disable secondary CPUs. TODO: check whether this is what
+         * guest EL3 firmware would really expect.
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


