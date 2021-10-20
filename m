Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F68434923
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:43:45 +0200 (CEST)
Received: from localhost ([::1]:55718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md94S-0007v0-3q
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hV-00046K-Lf
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hT-00039B-Sw
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+l55gFO3MSoGNl8FmX8HypllSa9dmHDnz4W6+bwhZI4=;
 b=OthCx010L4LBa2V+lG5XPqxSuoF9idxaF2WyHsg2WLuy+9+PoSSm+jIKZvvKZwn2kiZAV2
 2uaGCr+bPP0gFNCLZ4I9NRodOa+MpcD8/Gh1i2jekYI+qGL74OdStisQ9U4OFm45Hxq6U+
 KYLYrHr2Ud7e1OgWU5M2EZTERWVWJTo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-mUL5cKY8MM6CNfgmYXfAMw-1; Wed, 20 Oct 2021 06:19:58 -0400
X-MC-Unique: mUL5cKY8MM6CNfgmYXfAMw-1
Received: by mail-ed1-f70.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so20548706edb.8
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+l55gFO3MSoGNl8FmX8HypllSa9dmHDnz4W6+bwhZI4=;
 b=ZWPB4FxCE6TPdYv45QR9f3zNGnYNrtTbMWKeELRIy20CkaoR8xoh3j4isyZXWXHVkB
 MUx341c5ojCEK/feTrJCBaPClPJXQfTBzBWBlElA4tn2QqCC/PDj/D4WHn6v2ZanO6VP
 ryHG4tOSHnMBnHLsZnZnZ1vni5M8Eb8Y49/v1nNOQhKAdopb85f9A08fLSVwbTXgOB4A
 SdJXj0svsmPOBykj7/xlgpZNdjkJUxFZvVxoSK5RaFPUyQmHqOe5YEoudmI7bSYb0gTd
 l7bcyk1xZko39swkdcBTIUg3VA6hKZhqzgt1NFDLu0WX0gOqSdXi1UIP7zW79S19dsPf
 M/jA==
X-Gm-Message-State: AOAM533viVxHQm8eq4Yt107YKcujQkmWSZ/AAvx7QBnqJ4xSFEdE4e21
 88I9mlmcnyMPi4ba8trqW5Nb3dYFKvZaiSxrObISuiYt0Xo7ULArardw5XSUNhCLyebLTKT1ikU
 yTAsnheOLEeYNhOF8eRIgbDePfSn+lDdX0Le183OXv2vG+FWR8ONNFf0QCM11
X-Received: by 2002:a50:e0c3:: with SMTP id j3mr60891038edl.97.1634725196573; 
 Wed, 20 Oct 2021 03:19:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTE+JjuSKXno5yI3FLNa2ZuyhYOgF1xhd7gV0embkulesqjtPXm+a66ER68hgbLRUq+XOUQg==
X-Received: by 2002:a50:e0c3:: with SMTP id j3mr60891006edl.97.1634725196339; 
 Wed, 20 Oct 2021 03:19:56 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id u16sm823409ejy.16.2021.10.20.03.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:55 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 15/44] tests: bios-tables-test: use qtest_has_accel() API
 to register TCG only tests
Message-ID: <20211020101844.988480-16-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

 .. only if TCG is available

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-16-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 873eb9c037..6e21a650d2 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -722,13 +722,6 @@ static void test_acpi_one(const char *params, test_data *data)
     char *args;
     bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
 
-#ifndef CONFIG_TCG
-    if (data->tcg_only) {
-        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
-        return;
-    }
-#endif /* CONFIG_TCG */
-
     args = test_acpi_create_args(data, params, use_uefi);
     data->qts = qtest_init(args);
     test_acpi_load_tables(data, use_uefi);
@@ -1544,6 +1537,7 @@ int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
     const bool has_kvm = qtest_has_accel("kvm");
+    const bool has_tcg = qtest_has_accel("tcg");
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -1590,7 +1584,6 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/smm-compat-nosmm",
                        test_acpi_q35_tcg_smm_compat_nosmm);
         qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
-        qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
         qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
@@ -1600,19 +1593,24 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
         qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
         qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
-        if (strcmp(arch, "x86_64") == 0) {
-            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+        if (has_tcg) {
+            qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
+            if (strcmp(arch, "x86_64") == 0) {
+                qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+            }
         }
         if (has_kvm) {
             qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
             qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
     } else if (strcmp(arch, "aarch64") == 0) {
-        qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-        qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-        qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
-        qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-        qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+        if (has_tcg) {
+            qtest_add_func("acpi/virt", test_acpi_virt_tcg);
+            qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
+            qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
+            qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
+            qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+        }
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
MST


