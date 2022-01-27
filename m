Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5F249E7CF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:42:15 +0100 (CET)
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD7qf-0002gk-Sz
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:42:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zU-0006qU-HJ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:16 -0500
Received: from [2a00:1450:4864:20::334] (port=37648
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zQ-0008Ob-UZ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso6225082wmj.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/vGnghbsyXVm29DGZvmuMVyl3fMFFrfkrrbD0nUxv8g=;
 b=sJ77hw0uqGXG62HKRfIt1W8KSQeGUdl0ZyCaKM8Lp9JvPSyAyFjiQqUidH7rtmzOT9
 Exf/WoNx/Bde8t7sKO6aRuBPJ39sD9m2/WnYS+lVgZfz7ampWgq6Tn0umLrUmuzwfHs9
 D+qmggZeVf4qkFNDstJnMjHxysuZaheL8cqP2InzJ2sF5t6e6Jhx5vjLnDFPyRWQ0zeV
 3fZZz7gQpbp5ae42gNekq6iqJEC7U+Gd2qPUR5HcpjvdIKmIIFhmdpSkkWx+3uoGwsqZ
 gY1Vk4jFHzhbfRa7QVIE2F8wmaGKt88po89S8SHS4udNEXtlDWUQSxJY06vdDX/SZGOq
 vveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vGnghbsyXVm29DGZvmuMVyl3fMFFrfkrrbD0nUxv8g=;
 b=2DO0dK44cvJrQMufT0I4u9TW3jf+pvB52fY4oPY45+c14wy//lYi3CNFgfkqPeMzgJ
 0+HJqKGYpB5gJMt/REOWAosq85+dgiV8NhH5O/E8LNUB6xr10jjmGrvHl8U+9+ddRcnj
 yLELlDsgzuSKp/y2Wg18U4IdHQDyfxy8mdzDsJPBy6SMHLxhKcSb1dC05lM9RZnJtfEJ
 Vzb39loxLABG5Fz/E5jyaos+bmZ/wrk7cS5STr+JF4v6O06DrBfM2dP4farEB9LJm5Hx
 7uqzEKlaR5iHJ1V1rcArbTZV1ZlP6UQQ5mlDlFESHH23rXZ3SZsWdLMWrCSFZIzqp+ax
 qx3w==
X-Gm-Message-State: AOAM530yAxYod0w4zuH2SWX+2BFSwKozAFa5qIwTcWOHsPIi1f+HoHn/
 K3Z7zAGd39r8AUiEUP2Meng3wQ==
X-Google-Smtp-Source: ABdhPJwzLZCQDBC6ElRNRIfZuw9HSgVRfZm0Map6Fl+laG/BVhFP1ja0jXYAva4hOp34zf20jKsIXQ==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr12176591wmj.2.1643298424687; 
 Thu, 27 Jan 2022 07:47:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:47:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/16] hw/arm/highbank: Drop use of secure_board_setup
Date: Thu, 27 Jan 2022 15:46:34 +0000
Message-Id: <20220127154639.2090164-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

Guest code on highbank may make non-PSCI SMC calls in order to
enable/disable the L2x0 cache controller (see the Linux kernel's
arch/arm/mach-highbank/highbank.c highbank_l2c310_write_sec()
function).  The ABI for this is documented in kernel commit
8e56130dcb as being borrowed from the OMAP44xx ROM.  The OMAP44xx TRM
documents this function ID as having no return value and potentially
trashing all guest registers except SP and PC. For QEMU's purposes
(where our L2x0 model is a stub and enabling or disabling it doesn't
affect the guest behaviour) a simple "do nothing" SMC is fine.

We currently implement this NOP behaviour using a little bit of
Secure code we run before jumping to the guest kernel, which is
written by arm_write_secure_board_setup_dummy_smc().  The code sets
up a set of Secure vectors where the SMC entry point returns without
doing anything.

Now that the PSCI SMC emulation handles all SMC calls (setting r0 to
an error code if the input r0 function identifier is not recognized),
we can use that default behaviour as sufficient for the highbank
cache controller call.  (Because the guest code assumes r0 has no
interesting value on exit it doesn't matter that we set it to the
error code).  We can therefore delete the highbank board code that
sets secure_board_setup to true and writes the secure-code bootstub.

(Note that because the OMAP44xx ABI puts function-identifiers in
r12 and PSCI uses r0, we only avoid a clash because Linux's code
happens to put the function-identifier in both registers. But this
is true also when the kernel is running on real firmware that
implements both ABIs as far as I can see.)

This change fixes in passing booting on the 'midway' board model,
which has been completely broken since we added support for Hyp
mode to the Cortex-A15 CPU. When we did that boot.c was made to
start running the guest code in Hyp mode; this includes the
board_setup hook, which instantly UNDEFs because the NSACR is
not accessible from Hyp. (Put another way, we never made the
secure_board_setup hook support cope with Hyp mode.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/highbank.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 048f8550cb9..a21afd178d1 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -48,12 +48,6 @@
 
 /* Board init.  */
 
-static void hb_write_board_setup(ARMCPU *cpu,
-                                 const struct arm_boot_info *info)
-{
-    arm_write_secure_board_setup_dummy_smc(cpu, info, MVBAR_ADDR);
-}
-
 static void hb_write_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
 {
     int n;
@@ -389,8 +383,6 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     highbank_binfo.write_secondary_boot = hb_write_secondary;
     highbank_binfo.secondary_cpu_reset_hook = hb_reset_secondary;
     highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
-    highbank_binfo.write_board_setup = hb_write_board_setup;
-    highbank_binfo.secure_board_setup = true;
     highbank_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
 
     arm_load_kernel(ARM_CPU(first_cpu), machine, &highbank_binfo);
-- 
2.25.1


