Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2353243B9AD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:36:15 +0200 (CEST)
Received: from localhost ([::1]:43348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRIz-0005Np-H7
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfR8V-0005tZ-KZ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:25:23 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfR8M-0006kn-2L
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:25:23 -0400
Received: by mail-wr1-x42e.google.com with SMTP id o14so3617290wra.12
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qt5axnO0OaNcSTLDmMP/AtPoeSrtu9sIOj7togz8E+k=;
 b=KH/qNslBSHyLdT9pSclX/WNHUswwalG7a4jJR2ozShhTQ9OmbkXB2DWj8BBcnMYIkT
 yDwBZ7NltCddJS+MLDvBWoSJiJ7CEZZYqPKjKjJ1/qJPvDUGpfbZ9ceU2jVDxovEx2s5
 Nt1gHGMHgqxgjChvCCj20nCRwnSg400HtfBINFUeH4jUef30yWS+w1WzxlfP9OAWQ+XJ
 UNVO1N5MZilAY9kGJYy7eEJ3W2JIvtYww8FKww1WMLTLZ3b+JisQz8WswpnApHIIqey7
 5n8xhuHgupAAqJPFLkAloURJaDnqLBraNklAt+6B5BeBhHFIgpp0ucac3CKw4qRBy1xU
 8Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qt5axnO0OaNcSTLDmMP/AtPoeSrtu9sIOj7togz8E+k=;
 b=bs2Fmcyd24LmLHoKDKUhYF0sKQ41eat5WXp81aJv8LNlDJ082o78sUwD5mV2uPyT6I
 S5uTxMInbeq2H5EIKo79y0u56ZLgLj7ZPLuGwIFIVtydnuTSWfM+NUA/Lb69Q22p41vE
 djmdVCP0D4pJao1lZndlKl5c2W4XtyAdkrjSZGheEeuKm8XfCzol13RU8B/IctwjMTrF
 liHiD2MiCznDy3K2SLk3sylsT9tbx2X1sqMJ19nAeCQQEhInvsR89HYQROh6JkP+gEYM
 cIemMLchj/R7RejDfLXQOaS6MyDGnp26NuFbIcfPYCAHIuV8WL0ZoBhoPyzBRd64WXRl
 Q+ag==
X-Gm-Message-State: AOAM530bQcUJ4uxD3xqEeOT18f75Fk4DogceFZoj7SM4exmCboZL4VlF
 ILdoGK0dI43+IMmj0gHy9vfEdw==
X-Google-Smtp-Source: ABdhPJyx3l3Wqxxe36wEK/mBM+DHydpbf0fPnEieTi6oABxYvjjW8M+Jz9NuHYX8uqoBh7OEy/cc1w==
X-Received: by 2002:a05:6000:44:: with SMTP id
 k4mr34220006wrx.68.1635272712476; 
 Tue, 26 Oct 2021 11:25:12 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id b19sm1275283wmj.9.2021.10.26.11.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 11:25:11 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v6 6/7] tests/acpi: add test case for VIOT on q35 machine
Date: Tue, 26 Oct 2021 19:20:25 +0100
Message-Id: <20211026182024.2642038-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211026182024.2642038-1-jean-philippe@linaro.org>
References: <20211026182024.2642038-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42e.google.com
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
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, eric.auger@redhat.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a test case for VIOT on the q35 machine. To test complex topologies
it has two PCIe buses that bypass the IOMMU (and are therefore not
described by VIOT), and two buses that are translated by virtio-iommu.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 258874167e..a5e0fab9d5 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1465,6 +1465,26 @@ static void test_acpi_virt_tcg(void)
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
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1639,6 +1659,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
             qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
+        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-- 
2.33.0


