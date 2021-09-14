Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B0D40B273
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:03:49 +0200 (CEST)
Received: from localhost ([::1]:36380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9yO-0000hh-52
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MW-0006Fe-PX
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:45 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:42825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MP-0005Ri-BS
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:40 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso2706290wmc.1
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3D6Y3PvRWCDvWbbifCcyvKIH074CbOWIFebtpK8KpRk=;
 b=wHr8Bc/xfufFLw8hn6VUZNdbS2j4KdCkE9Nmy6YtCnuWrPpIdid1/7QYAFo/eV1MMM
 6nHglWfTlQnzP0PUU0pAvRTECKHwpZjcdFoLNNR5dHUOAXaltaD1h8JeXd/7OWOaNa0U
 rC+VGI1vUk4SL2t1naba0qh6QNvE99Csa41CjhnF1i1ZNLh4he79EAG4tDQ8zL15w1Je
 DCiJFUl4II6iHot7PbZEkhgvGWWgyGlhBlFU7TnjtKBOjYiQEHGlFBmKZDO7NYN2QZXt
 WiNTUUE73OlIh03zS4s+U7nZo3DM5PY66c4BW+FRu3ULU8biC64fFuKeJUDnN7gLcPrb
 HMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3D6Y3PvRWCDvWbbifCcyvKIH074CbOWIFebtpK8KpRk=;
 b=lWoNs+bnXuqLvSC1lSt9Xsf+sCJD1tGS0JnNB6jNe926lne1o8o9eu5qND8uqIrkOj
 6PxYk4e/kw8EujfsKOzgQATH+kDuzIiZyQkr6SfwzJDiT0s5QI6q/s/PDvgAMW4lgC6O
 zA/xw6BW+r054EMYYPvqkZyQ+44ZG2FAt7RPN+gOv93DK1iMd73/luBTjtP/5ea3kFlW
 V6p3ncEu/qQxtcIrfG4XQJ3Yh/jmbPqJkWT1BLzQyxmNDgs0BP5uULa7mQCMD1dq0Qai
 ICJlZz7m+kTeSNf56JdntLOrHASMRAW7JbnOIWLvexTIcY2Gpw/gDhdQSgUeYrnxn2Qp
 g1qw==
X-Gm-Message-State: AOAM5332O7j1Bsyshr+48bFeWSTstdph+F7qtiACo0qjTAZ+nZHjwZeQ
 yyH5NBp3s5OGrlMQym+uz4jjjg==
X-Google-Smtp-Source: ABdhPJyBlpSFt6T92TRgSuVAMBbcTwjZGGpL8ah9c31hPUdxK5xQz9BnGxnaZoxqXsvDUf8VEQ+1NQ==
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr2532533wmq.39.1631629468447; 
 Tue, 14 Sep 2021 07:24:28 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:28 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 07/10] tests/acpi: add test cases for VIOT
Date: Tue, 14 Sep 2021 15:20:02 +0100
Message-Id: <20210914142004.2433568-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914142004.2433568-1-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add two test cases for VIOT, one on the q35 machine and the other on
virt. To test complex topologies the q35 test has two PCIe buses that
bypass the IOMMU (and are therefore not described by VIOT), and two
buses that are translated by virtio-iommu.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test.c | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 4f11d03055..f8bfe2f247 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1403,6 +1403,43 @@ static void test_acpi_virt_tcg(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_viot(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".viot",
+        .blkdev = "virtio-blk,bus=pcie.0",
+    };
+
+    /*
+     * To keep things interesting, two buses bypass the IOMMU.
+     * VIOT should only describes the other two buses.
+     */
+    test_acpi_one("-machine default_bus_bypass_iommu=on "
+                  "-device virtio-iommu "
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
+                  "-device virtio-iommu", &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1567,12 +1604,14 @@ int main(int argc, char *argv[])
         if (strcmp(arch, "x86_64") == 0) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
+        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
         qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
         qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+        qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
2.33.0


