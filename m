Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DDF49E811
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:52:14 +0100 (CET)
Received: from localhost ([::1]:37670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD80L-0005iU-Pg
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:52:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z4-0005um-Nu
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:50 -0500
Received: from [2a00:1450:4864:20::430] (port=34541
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z2-0008FX-MC
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:50 -0500
Received: by mail-wr1-x430.google.com with SMTP id f17so5618857wrx.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hqSSqW9mYLnln3gzM+pPhLBH+fYEcqnCz8mEiXgmBXs=;
 b=owOrx5FcfF+arn2fUABM8GImD2nGuHYE+8Whjp6gEmMTxtzfzUtL9REtCz7AG+PX0I
 2QHJ95biicYSYnljURuWa0i7zpV9E59dA87NYUdh61Y6QaoaGn1/DMKSqQz0/HN1DyW0
 4XBmEwsdl0SwF3tXaHCzRUEe9HYiiImb5T4nQ5YWt+PWtovbVWozy3o4jxO1jfV8SJ0+
 B6EJULnXqDkTVpqULJDjbNg9oaTxT6QkS5wmWIxolqBM065eGpUe8buoPrdtp8/aiiCf
 jB/EtNkQmvCjCYsfqum7CZxdRrIgrerub9dYjqP9rPUQqFGZbO9tPmbbhASjCVQUJNel
 C7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hqSSqW9mYLnln3gzM+pPhLBH+fYEcqnCz8mEiXgmBXs=;
 b=b1JLEa6PYSOS68Rery4epLdd7wquMBmZnOwTQjcBXgZ8Kwc1mbTuJIDjPpjy8rOFBG
 XQwnbaFYYQYv2L3vZc1eyoBz9Y/rzeIknJdkeguVQMhjDVoy5sN8waoxRgXt0TfK7Ibe
 LkkW7lEOT4jJPtg+Iys+GRY97vaf1uvsVDsQ8YMV2EKxANtkhI4fATzZaw/5+e220HLW
 KfkI+5bHItqe+grTm8wvqRN9zzE7oQA7M7l6LPkPgaxAesFjkyUK5SmlySjm9b+qLFUP
 TwctJjiJBM4iiY7AatATd1egzXNqQPdRB1O2Q+vkTpS+dacYxwDaLlf2fGsRctyZ3/s9
 LSOg==
X-Gm-Message-State: AOAM533ExxZQOnnY6G298VxXFTPk4PrHXwnz5kqG2vx20wViPog3mt9z
 comyPVeae6RpMqhDcRNhtFBBdQ==
X-Google-Smtp-Source: ABdhPJxB2fCG4DsoJPBN2+ENoop6WWKnDluBXjbmj99puZ4B8NsE7j7NzdGcQrnfvX+NrXjJpVWKmg==
X-Received: by 2002:a5d:47cf:: with SMTP id o15mr3463388wrc.577.1643298407303; 
 Thu, 27 Jan 2022 07:46:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:46:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/16] hw/arm/boot: Support setting psci-conduit based on
 guest EL
Date: Thu, 27 Jan 2022 15:46:26 +0000
Message-Id: <20220127154639.2090164-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Currently we expect board code to set the psci-conduit property on
CPUs and ensure that secondary CPUs are created with the
start-powered-off property set to false, if the board wishes to use
QEMU's builtin PSCI emulation.  This worked OK for the virt board
where we first wanted to use it, because the virt board directly
creates its CPUs and is in a reasonable position to set those
properties.  For other boards which model real hardware and use a
separate SoC object, however, it is more awkward.  Most PSCI-using
boards just set the psci-conduit board unconditionally.

This was never strictly speaking correct (because you would not be
able to run EL3 guest firmware that itself provided the PSCI
interface, as the QEMU implementation would overrule it), but mostly
worked in practice because for non-PSCI SMC calls QEMU would emulate
the SMC instruction as normal (by trapping to guest EL3).  However,
we would like to make our PSCI emulation follow the part of the SMCC
specification that mandates that SMC calls with unknown function
identifiers return a failure code, which means that all SMC calls
will be handled by the PSCI code and the "emulate as normal" path
will no longer be taken.

We tried to implement that in commit 9fcd15b9193e81
("arm: tcg: Adhere to SMCCC 1.3 section 5.2"), but this
regressed attempts to run EL3 guest code on the affected boards:
 * mcimx6ul-evk, mcimx7d-sabre, orangepi, xlnx-zcu102
 * for the case only of EL3 code loaded via -kernel (and
   not via -bios or -pflash), virt and xlnx-versal-virt
so for the 7.0 release we reverted it (in commit 4825eaae4fdd56f).

This commit provides a mechanism that boards can use to arrange that
psci-conduit is set if running guest code at a low enough EL but not
if it would be running at the same EL that the conduit implies that
the QEMU PSCI implementation is using.  (Later commits will convert
individual board models to use this mechanism.)

We do this by moving the setting of the psci-conduit and
start-powered-off properties to arm_load_kernel().  Boards which want
to potentially use emulated PSCI must set a psci_conduit field in the
arm_boot_info struct to the type of conduit they want to use (SMC or
HVC); arm_load_kernel() will then set the CPUs up accordingly if it
is not going to start the guest code at the same or higher EL as the
fake QEMU firmware would be at.

Board/SoC code which uses this mechanism should no longer set the CPU
psci-conduit property directly.  It should only set the
start-powered-off property for secondaries if EL3 guest firmware
running bare metal expects that rather than the alternative "all CPUs
start executing the firmware at once".

Note that when calculating whether we are going to run guest
code at EL3, we ignore the setting of arm_boot_info::secure_board_setup,
which might cause us to run a stub bit of guest code at EL3 which
does some board-specific setup before dropping to EL2 or EL1 to
run the guest kernel. This is OK because only one board that
enables PSCI sets secure_board_setup (the highbank board), and
the stub code it writes will behave the same way whether the
one SMC call it makes is handled by "emulate the SMC" or by
"PSCI default returns an error code". So we can leave that stub
code in place until after we've changed the PSCI default behaviour;
at that point we will remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/boot.h | 10 +++++++++
 hw/arm/boot.c         | 50 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index ce2b48b88bc..0bcb58babba 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -86,6 +86,16 @@ struct arm_boot_info {
      * the user it should implement this hook.
      */
     void (*modify_dtb)(const struct arm_boot_info *info, void *fdt);
+    /*
+     * If a board wants to use the QEMU emulated-firmware PSCI support,
+     * it should set this to QEMU_PSCI_CONDUIT_HVC or QEMU_PSCI_CONDUIT_SMC
+     * as appropriate. arm_load_kernel() will set the psci-conduit and
+     * start-powered-off properties on the CPUs accordingly.
+     * Note that if the guest image is started at the same exception level
+     * as the conduit specifies calls should go to (eg guest firmware booted
+     * to EL3) then PSCI will not be enabled.
+     */
+    int psci_conduit;
     /* Used internally by arm_boot.c */
     int is_linux;
     hwaddr initrd_start;
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 399f8e837ce..327e449f831 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1299,6 +1299,8 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
 {
     CPUState *cs;
     AddressSpace *as = arm_boot_address_space(cpu, info);
+    int boot_el;
+    CPUARMState *env = &cpu->env;
 
     /*
      * CPU objects (unlike devices) are not automatically reset on system
@@ -1329,6 +1331,54 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
         arm_setup_direct_kernel_boot(cpu, info);
     }
 
+    /*
+     * Disable the PSCI conduit if it is set up to target the same
+     * or a lower EL than the one we're going to start the guest code in.
+     * This logic needs to agree with the code in do_cpu_reset() which
+     * decides whether we're going to boot the guest in the highest
+     * supported exception level or in a lower one.
+     */
+
+    /* Boot into highest supported EL ... */
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        boot_el = 3;
+    } else if (arm_feature(env, ARM_FEATURE_EL2)) {
+        boot_el = 2;
+    } else {
+        boot_el = 1;
+    }
+    /* ...except that if we're booting Linux we adjust the EL we boot into */
+    if (info->is_linux && !info->secure_boot) {
+        boot_el = arm_feature(env, ARM_FEATURE_EL2) ? 2 : 1;
+    }
+
+    if ((info->psci_conduit == QEMU_PSCI_CONDUIT_HVC && boot_el >= 2) ||
+        (info->psci_conduit == QEMU_PSCI_CONDUIT_SMC && boot_el == 3)) {
+        info->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
+    }
+
+    if (info->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
+        for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
+            Object *cpuobj = OBJECT(cs);
+
+            object_property_set_int(cpuobj, "psci-conduit", info->psci_conduit,
+                                    &error_abort);
+            /*
+             * Secondary CPUs start in PSCI powered-down state. Like the
+             * code in do_cpu_reset(), we assume first_cpu is the primary
+             * CPU.
+             */
+            if (cs != first_cpu) {
+                object_property_set_bool(cpuobj, "start-powered-off", true,
+                                         &error_abort);
+            }
+        }
+    }
+
+    /*
+     * arm_load_dtb() may add a PSCI node so it must be called after we have
+     * decided whether to enable PSCI and set the psci-conduit CPU properties.
+     */
     if (!info->skip_dtb_autoload && have_dtb(info)) {
         if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as, ms) < 0) {
             exit(1);
-- 
2.25.1


