Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF65F372246
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:13:50 +0200 (CEST)
Received: from localhost ([::1]:33702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldfsz-0007SS-9g
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfqf-0005kh-J6
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:11:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfqc-0007Zg-RB
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620076282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=55DSOQd/Ti/CUKuyk0Cp1QnVj2/mT8NrttR0T4lOw2k=;
 b=BCUuH9LsKviJ2kl8FsUhJwGtzfNh8/AXZZSsTMGMPQcjy75q/Vv1tWhf+afsU9SN1CmIa/
 vwxeMSQdOa1xnlfsFUdErOmPzYu5VdbWb8yeYMgdDevL1JStAwGhm6SnQh/IOlVHbEBY/S
 1Kwhu3loA4tY4+CtIpxc8PDtvatPVeU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-bFe5Qg65Me-aETnDO9dj-Q-1; Mon, 03 May 2021 17:11:20 -0400
X-MC-Unique: bFe5Qg65Me-aETnDO9dj-Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 t18-20020adfdc120000b02900ffe4432d8bso4664024wri.6
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=55DSOQd/Ti/CUKuyk0Cp1QnVj2/mT8NrttR0T4lOw2k=;
 b=Q2d7rY8twy0R6OajpHuf7xsWDYAXkpXMsYjt3E3phojjx4Pkn8QpD9E21Jle9oTItg
 V28megBvct8KD2EIJFhrpX4rgi74euIcmdgKDo0xvOhN3fZcEPIxi9XM3eY18FAjvoVb
 3cF4jvlvqgRQTP3EUEbWrqGhF7lMKW2Sm+PX9amwQbGtXiAOk6GAl73JsIC5zB4oUqMP
 IRKID/Ykrajgims5xiq62LRlTrGIa3qC5fDnSmjPpitXimHqXB5yr8Q74YNqEdBQn7cB
 3eCB8UE4j6fdvuude+QMThNLc3WJXuTaAT6c3GN+yTneg8rzinw6j8Ke4Bqh7Q7AIa6V
 XGtQ==
X-Gm-Message-State: AOAM532mF+fFJDKmDU/L1NWETcDs6mmyQIGP8PnvpbahcFMc4ax/Hyrk
 MgpJAQy/Jhx2n0k5s8NqGunL4wS1BHo2rVw3Ny8Moret2K3a3cEcEy1LtWSDdFiZJLbTRtZILuW
 Gp31xQhMParC0e/FH72qpIlsAMABx936hdNIn+72lcUP8dNsRg1wgnBxp6KslXkyr
X-Received: by 2002:a5d:590a:: with SMTP id v10mr27356372wrd.306.1620076278666; 
 Mon, 03 May 2021 14:11:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV1qhTF/cSFGi6edJcm6U39w2RXor4odw2skyISAbixSE9bV3i2oLRbybHHM5Z1O7CgeQAjQ==
X-Received: by 2002:a5d:590a:: with SMTP id v10mr27356350wrd.306.1620076278480; 
 Mon, 03 May 2021 14:11:18 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id y5sm721079wmj.25.2021.05.03.14.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:11:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/12] qtest/bios-tables-test: Make test build-independent
 from accelerator
Date: Mon,  3 May 2021 23:10:19 +0200
Message-Id: <20210503211020.894589-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, do it once at the beginning
and only register the tests we can run.
We can then replace the #ifdef'ry by an assertion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v5 had:
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

v6 is simplified and keeps the same logic, however since
it is different, I'm not keeping the R-b tags.
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


