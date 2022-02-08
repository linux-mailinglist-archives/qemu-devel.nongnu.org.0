Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2174AD88A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:13:46 +0100 (CET)
Received: from localhost ([::1]:32984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQJV-000610-5X
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:13:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-0000lC-Q9
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:08 -0500
Received: from [2a00:1450:4864:20::42d] (port=38564
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqn-00026Q-Sv
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:05 -0500
Received: by mail-wr1-x42d.google.com with SMTP id s10so27592484wra.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QtabcHuqRoobl9uCmQRJITCYrON5FJXP9MgJHRnT3j0=;
 b=qe/HDIvjGrCeMw6hL0Wq3CiTjiyzPTO103Y2m4txq/9ZH5P6kQ1v/Av6sM9veSutx9
 hRb/uQeooj44SuPdGz4h2xCuZrFuuhSM0IOE3pBmqo2OcUBzO184VKhxBfP9xjVbz8Hv
 WWTUNPJhknt4xr4T2DnBjDnJdGprDk/eOoCLmWoi+IrypbHAUMnCzGwoxLWfalHlul4w
 BpiMwy284RhtAizRyAtdPNFTq9QvDJMmkByOdpV3DooGeg6xBVQl8tJ4+qRyQqq9D/4D
 pSxmIT7ru8sQHRZ+H2/9bj91upwmecDZuhUiOXQNrc/sRQpHT9ehFcmX36+L8gv1aS76
 3TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QtabcHuqRoobl9uCmQRJITCYrON5FJXP9MgJHRnT3j0=;
 b=M2PVJGBSDi1AG7a4kVq9mFRXxuJ4wH7+OUeCGlX2u+LnBLPsAZ/BQskUz9SLhhUSFw
 qdBoiZqBV9AyOWj3VgAKxr2idZ8cL0+L4yMwAQXHxUSEYHxN1si57UufZYOo+W7Dhnz5
 4B68Biek7J5EpPU+eCPU/zsYEvvjhhNMu5Fqa5ymHHLTOqFxIpKhkm8wAakIHZjuiwxA
 WOfIfsyI9WqCk8Rm2ChkILEzENA+tLNIUQNogZtw3WEVPmpugQnCQxf7DCB3CrMCM7Ch
 ld6H9OyQBdCHmU++J5GWegbWcnW22xM3zMd3UQCYpJUNgixvNHlDqkOt1b9Pn9z6qz/y
 uAIA==
X-Gm-Message-State: AOAM533AxFGTExUcr7qEU0SdD4r2Oy+ars6Pw07f7H4nCMioSmNYV66L
 zF0h1WPHT0i0b1kQV5X+V1/mr5x1qAjftQ==
X-Google-Smtp-Source: ABdhPJxxFdOpC+esPg2o2mP9gvlV0pzxDc/uX7r2nmnPo2dYLsE7JIiULtT81ebL+R5bOGqJfcJ1bA==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr3245150wrr.220.1644320400540; 
 Tue, 08 Feb 2022 03:40:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/39] hw/arm/highbank: Drop use of secure_board_setup
Date: Tue,  8 Feb 2022 11:39:25 +0000
Message-Id: <20220208113948.3217356-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20220127154639.2090164-12-peter.maydell@linaro.org
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


