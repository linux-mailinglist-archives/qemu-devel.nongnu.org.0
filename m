Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449CB373C1A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:14:18 +0200 (CEST)
Received: from localhost ([::1]:44652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHM1-00034t-9S
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH7K-00022r-JW
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:59:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH7D-0004CB-Kg
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620219539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LyoTXCrKRxOQ6HWYt6T0AZz1kzEWAAnmXRDjoh7Y70k=;
 b=csv/6lzZX8xGJNfbM6zl3q2GeB6Ev/xufewNZYpf4Y/IAHzVJ3rF+7bBRTcY66XJRXwhOw
 KMJMvojo48bpcMugzU+/fZ8wzRf4WfSn/A/ntXJ15IioKFDmI16G2VYzHl4OCNxAD7HBqW
 eDUmlByrDpdbTHCbZzIpBNKaLljoycs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-LCmIOSkZOjy7OWoo2V9yGg-1; Wed, 05 May 2021 08:58:57 -0400
X-MC-Unique: LCmIOSkZOjy7OWoo2V9yGg-1
Received: by mail-wr1-f70.google.com with SMTP id
 q18-20020adfc5120000b029010c2bdd72adso663264wrf.16
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LyoTXCrKRxOQ6HWYt6T0AZz1kzEWAAnmXRDjoh7Y70k=;
 b=jEQPRYpuaacmglHEF4w7Efa5SdvWScxuG4igb4hp6dbAKU3nMiInDyMQqKOKSH5pyz
 Q3bboTx5E38V+fxffPnlKK4M1EP0BgD/IZNkBRhdnw6zCm3EgeA7RHclPLUoa9G46j5+
 0uWzp08IZsW2WfFIsdscgWMls9Ki2ElYe1GWaCeQNJG3Y1MeOT/3cn+PgldTXE4H9bb6
 BiudT+oV9D4kVS4LEZEI0H+tSJH8Lk2c6AISJEI9laxz0QQ/6AGVM1ICRBp+XvMEcR/w
 0QolSqcAxvwV1v6C9843AxzDyWsug1+M+d6X6Yl0qtOgFHqOlx39XPyOkmRUFeJ2rDHw
 GAFQ==
X-Gm-Message-State: AOAM533ZbX6hxuoTLEBhLXMPEWkS85Ky26RtwM4OmAjKQBir1InzSq+0
 YIPJpvsjpGSttz1Mv0lUsxwD9yOF919+OtCI7zbMQ+GYzwYNnJ7L0OBIO9oidf1FXQsybvpznxr
 rajp4FKt1L4Z5U+1ZCtBCXO/GDSvTOVG5m0LGAKXMQY6bI26XHRl+rxeGLUJF1FJs
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr33790592wme.68.1620219536476; 
 Wed, 05 May 2021 05:58:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7c9O310nBdDuwOH0hPIkQMrelHuusATPUD5zr1bizc7RGyVjUpcFvu5X3S98ZA1TfmjJwCg==
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr33790569wme.68.1620219536206; 
 Wed, 05 May 2021 05:58:56 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id c5sm5740453wml.2.2021.05.05.05.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 05:58:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/12] qtest/bios-tables-test: Rename TCG specific tests
Date: Wed,  5 May 2021 14:58:04 +0200
Message-Id: <20210505125806.1263441-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505125806.1263441-1-philmd@redhat.com>
References: <20210505125806.1263441-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some tests require TCG, but don't have '_tcg' in their name,
while others do. Unify the test names by adding 'tcg' to the
TCG specific tests.

Reported-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/bios-tables-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index ce498b3ff48..ad877baeb1b 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1255,7 +1255,7 @@ static void test_acpi_microvm_rtc(void)
     free_test_data(&data);
 }
 
-static void test_acpi_microvm_pcie(void)
+static void test_acpi_microvm_pcie_tcg(void)
 {
     test_data data;
 
@@ -1475,7 +1475,7 @@ static void test_acpi_oem_fields_microvm(void)
     g_free(args);
 }
 
-static void test_acpi_oem_fields_virt(void)
+static void test_acpi_oem_fields_virt_tcg(void)
 {
     test_data data = {
         .machine = "virt",
@@ -1555,14 +1555,14 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2);
         qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
         if (strcmp(arch, "x86_64") == 0) {
-            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie);
+            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
         qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-        qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+        qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt_tcg);
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
2.26.3


