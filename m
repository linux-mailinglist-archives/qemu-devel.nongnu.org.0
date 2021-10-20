Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A310435208
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 19:51:49 +0200 (CEST)
Received: from localhost ([::1]:34440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdFki-0007hH-EJ
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 13:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUe-0005ND-9r
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:12 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUc-0002hv-Da
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:11 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso3433569wmc.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b6FkINxR9TYPTnIwt4QFR5QO1CjWz4r+7L+WyL24pqY=;
 b=TUt58ZwLOXqIzqa7Z8fjADGTOnCKRNIroPpeCTpryE1y7pUkb6zTXOqDaT500SzV/K
 G9XMxhJOneCzhTeegp0gDEyrQOUqarpJ3KAPHQZZdSiOjBKug0hzb4kCuKoXovs8/JfM
 CLg5RBo2vLpaIOIrNbAnj3o3DusDMutYDen5zNnqhXJf+wsEhBBgXZ+m6+zKCcGyQYA3
 f+lUNNFMmZMze3BVQXyjrJx5HXvo6xYcu38XJsKqxmoXjVMF7SNXzLtxt2opggS1Yx4B
 onQMRZzCTuOlPgQZterx98AftbkNBtt/E9fOVd7RTRc8XA8Fp8xK10Stj05/jf1awryr
 GJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b6FkINxR9TYPTnIwt4QFR5QO1CjWz4r+7L+WyL24pqY=;
 b=AKOWJ9wUgpvJQin7tO0u8JNHF7iJIPj1gRIDMF+GZ2cZGbPtQIONFZsOC3iuf/f2GQ
 RL9nGkGBU3iEhWsKrQ9Wfw0i8ruSKZj+lGg26opT9GA63I5Q1WAWREp52h64rgO8EE8j
 LQtDILS0XqBireliti5gk5pT1TRDae+Nz7oT5qSMR8g2BeV7QFZCXewSwR/dqpmFufR4
 rLKNRu3UrNoO7fEB85Imbn1PBA+0UGra1k5vUKbsUCCWO2JX4vSX4++08ngNgduI4utO
 Nc/Ead9qtpWBINCKyo5gzS5Ss5T07qUM7T9c2xnwdj3Sa+A0ElWf2KuFGvO7dWPz2P/2
 n1Kg==
X-Gm-Message-State: AOAM533RO1tJml8y7txlDeu4xFjykeEnrAJxIVnw0lTjqolLr+S3Vy5G
 gcLOi8MhjBorTMpxksaIulSzCRPo6BSg0g==
X-Google-Smtp-Source: ABdhPJziI18hUczn45ny3bPvDlXku7v3xoDCwsM54ZJWUIRYdzpRWmIWQJp1ECWwyZPUrEViIcK6Bg==
X-Received: by 2002:a05:600c:1c10:: with SMTP id
 j16mr713499wms.28.1634751309034; 
 Wed, 20 Oct 2021 10:35:09 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n7sm2662270wrp.17.2021.10.20.10.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:35:08 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 10/12] tests/acpi: add test cases for VIOT
Date: Wed, 20 Oct 2021 18:27:44 +0100
Message-Id: <20211020172745.620101-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020172745.620101-1-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 eric.auger@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add two test cases for VIOT, one on the q35 machine and the other on
virt. To test complex topologies the q35 test has two PCIe buses that
bypass the IOMMU (and are therefore not described by VIOT), and two
buses that are translated by virtio-iommu.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 4f11d03055..599b155201 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1403,6 +1403,42 @@ static void test_acpi_virt_tcg(void)
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
@@ -1567,12 +1603,14 @@ int main(int argc, char *argv[])
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


