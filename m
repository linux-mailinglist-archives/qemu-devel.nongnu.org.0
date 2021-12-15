Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CA84757B2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:24:08 +0100 (CET)
Received: from localhost ([::1]:45446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSOF-0005rh-Lb
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:24:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRij-0007Mr-KY
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:13 -0500
Received: from [2a00:1450:4864:20::32a] (port=44973
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRif-0000Md-E0
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:13 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so15664373wms.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AxAfi0cSCTWP0iQobjmr0rvRXa2XPUga+L6BtFS0ls8=;
 b=asxNSw+sUQmaJBWVfsUCoQq5vwTKFerAZ7hHiBEzsMdxDuj2mBsdv9yi3LME4Ib4AT
 Xg4ydphVVRyCy989cmX1+AY50HAGMXXkNckqMPIL+1VzBo2DdrCbi/FwlNRytpngczSt
 qhuw7AtvSzNJuLpMFvbWzjceI/GbfRRhaRrFQEQ/XmQUSBaOQrz4M6xGpX+WPX6l/T/j
 ovXaTqa3To0gDQesuTy5wEwSGvbzUIPlHswGikJ0MQ1jGaY30OGEAR7vWovE6kxKCW8T
 2R+IR6sSbpgkHJfTDVJJkhKadLJrP/CAItxVZQAKs11VaExAuiOPbrnyLduM/yI4chIh
 lAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AxAfi0cSCTWP0iQobjmr0rvRXa2XPUga+L6BtFS0ls8=;
 b=vIERub9Amfw4BSLyZjo7Tai1jkJVtRno0FI8coScsiCn5ly8KjbhcEm8wLlMxh1YM2
 B9MTbxyPUZpbZXZRv3SEPuTKeY7TnERWuNk1U0xCqItS0qSE+WX74sBVJPZtsKC0M/X+
 2pelz1Q4E92LqfgtOhqKn13iozrBLXj+8LK+x4YNJr69opTjdNEISAA0g03FV91dtkt+
 PpsNOpTbJcbNhizvbhBCx8NwvGw+rOrxAJLvBgUEKjGfnphonmM9nOakzu2RPlg361ac
 pNXzSkaPTED79KngQK1H+5GpdphktwY2o1+CeKS5+pgyz9T2cs7hJLpciExyTa15lpbv
 d+jA==
X-Gm-Message-State: AOAM533qkB1MdDVf/JrpVUGlYGrwVV+p9YP1u6m6MUutty7swk50Hf1j
 8NpsvkrB/L4Wp7dzzOrS4b2GfB4HMMVuMg==
X-Google-Smtp-Source: ABdhPJwfH4yrftyVLbDhsZmoLZSS/pXN9hzRrA0R3zwVLa9dc5mTHdXBplZuc+wrJBk/Xm1uPwEcZQ==
X-Received: by 2002:a7b:c0d7:: with SMTP id s23mr2998395wmh.135.1639564868031; 
 Wed, 15 Dec 2021 02:41:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/33] tests/acpi: add test case for VIOT
Date: Wed, 15 Dec 2021 10:40:47 +0000
Message-Id: <20211215104049.2030475-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Add two test cases for VIOT, one on the q35 machine and the other on
virt. To test complex topologies the q35 test has two PCIe buses that
bypass the IOMMU (and are therefore not described by VIOT), and two
buses that are translated by virtio-iommu.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-id: 20211210170415.583179-7-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 258874167ef..58df53b15b5 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1465,6 +1465,42 @@ static void test_acpi_virt_tcg(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_viot(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".viot",
+    };
+
+    /*
+     * To keep things interesting, two buses bypass the IOMMU.
+     * VIOT should only describes the other two buses.
+     */
+    test_acpi_one("-machine default_bus_bypass_iommu=on "
+                  "-device virtio-iommu-pci "
+                  "-device pxb-pcie,bus_nr=0x10,id=pcie.100,bus=pcie.0 "
+                  "-device pxb-pcie,bus_nr=0x20,id=pcie.200,bus=pcie.0,bypass_iommu=on "
+                  "-device pxb-pcie,bus_nr=0x30,id=pcie.300,bus=pcie.0",
+                  &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_virt_viot(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    test_acpi_one("-cpu cortex-a57 "
+                  "-device virtio-iommu-pci", &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1639,6 +1675,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
             qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
+        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
@@ -1646,6 +1683,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
             qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
             qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+            qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
         }
     }
     ret = g_test_run();
-- 
2.25.1


