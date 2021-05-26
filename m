Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAC4391E17
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:26:46 +0200 (CEST)
Received: from localhost ([::1]:34734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxIr-0007TP-Ou
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwz6-0007u0-G1
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:06:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwz2-0004Za-4v
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NrRlnxcfy5rfyxKOgrn4KzLZv/0uqhFPtkaZ4qrEJ9Q=;
 b=JR+UsR0AsvkiKQMrzDBZXDKmSxcW+atAmHIEvLPGopv8eOP/W2ufuEX62KcepAtzcL15/F
 KQ+kballFLm0vSxh8VxWDAZC6mJv1gZ8xRy78dBKn5LaG9BH+SFzWezNXxQsYdySdHtGKy
 RWQlzh+QV+e4iGus2lUwDvH88yx/4Yc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-oz6pvosmNgK66FWddYf28w-1; Wed, 26 May 2021 13:06:11 -0400
X-MC-Unique: oz6pvosmNgK66FWddYf28w-1
Received: by mail-wm1-f72.google.com with SMTP id
 y65-20020a1c64440000b0290192ec2dddffso622365wmb.8
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NrRlnxcfy5rfyxKOgrn4KzLZv/0uqhFPtkaZ4qrEJ9Q=;
 b=pqKcGsvXLtFsHCgzrWzCb7SVDD4D/f6ukuXEdcvXoQLlCZ45iF6CBKNx4o51ZwwHev
 ynHVMKNaBWCOry+4GK/FwZquowzyoxYsqiSfoRUDSeyYRL6vp4b7GOsGS4vOtJfQ2tRd
 Xg/ihJEyZ2DteOIDf0OitAC2xofMvol+yGnGA4T+FRyeHTFjcMhrltlji1GdFHXgBbRX
 4gy6RmEeAF+vWz2uI/Yux9mUNji16QTlYf7Rb3TLl3sHj/ge6aPCbYt7kwOK5Ny7sgpg
 Utuw1+bsVienNCKW2BhF+rkErD3PocY9gvAMslOARkyXVmlHezijT8St/2FpYj4xSaci
 ev2w==
X-Gm-Message-State: AOAM5332AoBqJWGr0WwvMMRZHOWzazvGmq4fr+2TVfrQD1/xbr/0+RgP
 DFerAlqe2rVS+xrWbPrzmsI3HCeQky5In2Xo0hO/qJlsgjCMhywHYaITbkpRwi9mDC2g4c4isjl
 avPacWsAIIpAWehX820a1AoM/4hAfokWzn+KUhJea7xD7lsH8B5sbtseMVJZZSkxT
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr34874291wrr.336.1622048770542; 
 Wed, 26 May 2021 10:06:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV+z6DRBd0p+if3smIv7jZFtdYDhYSb0l85mC3zaptQaPnDh5cZotIJyPt6ISQ+UF/WxRBEQ==
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr34874260wrr.336.1622048770307; 
 Wed, 26 May 2021 10:06:10 -0700 (PDT)
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id v12sm21670414wrv.76.2021.05.26.10.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:06:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 11/12] qtest/bios-tables-test: Make test build-independent
 from accelerator
Date: Wed, 26 May 2021 19:04:31 +0200
Message-Id: <20210526170432.343588-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we can probe if the TCG accelerator is available
at runtime with a QMP command, do it once at the beginning
and only register the tests we can run.
We can then replace the #ifdef'ry by an assertion.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/bios-tables-test.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index ad877baeb1b..762d154b340 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -97,6 +97,7 @@ typedef struct {
     QTestState *qts;
 } test_data;
 
+static bool tcg_accel_available;
 static char disk[] = "tests/acpi-test-disk-XXXXXX";
 static const char *data_dir = "tests/data/acpi";
 #ifdef CONFIG_IASL
@@ -718,12 +719,7 @@ static void test_acpi_one(const char *params, test_data *data)
     char *args;
     bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
 
-#ifndef CONFIG_TCG
-    if (data->tcg_only) {
-        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
-        return;
-    }
-#endif /* CONFIG_TCG */
+    assert(!data->tcg_only || tcg_accel_available);
 
     args = test_acpi_create_args(data, params, use_uefi);
     data->qts = qtest_init(args);
@@ -1506,6 +1502,8 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
+    tcg_accel_available = qtest_has_accel("tcg");
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         ret = boot_sector_init(disk);
         if (ret) {
@@ -1554,10 +1552,10 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc);
         qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2);
         qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
-        if (strcmp(arch, "x86_64") == 0) {
+        if (strcmp(arch, "x86_64") == 0 && tcg_accel_available) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
-    } else if (strcmp(arch, "aarch64") == 0) {
+    } else if (strcmp(arch, "aarch64") == 0 && tcg_accel_available) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
-- 
2.26.3


