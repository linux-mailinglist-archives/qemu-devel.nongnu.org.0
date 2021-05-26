Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0F5391DA6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:14:57 +0200 (CEST)
Received: from localhost ([::1]:41546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llx7P-0000P2-MG
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwyz-0007jE-Ru
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:06:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwyv-0004Vn-Le
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LyoTXCrKRxOQ6HWYt6T0AZz1kzEWAAnmXRDjoh7Y70k=;
 b=ZfJqR+HiZHV+QDy3OKc80NSjhpeM5SmyFxy9ONrE777TiN3eKhcOb79T9w/NWD9YqJ916M
 CvocUdRKIBk41pY3sEhtO1xZ8PrB6L6ZCZVYLQyaFtlvqIxz0Bq3riN04/6PE1i6mZqT6y
 suBzOz2tEGe3xIqkfH2YlJxDBTVqhtg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-r_d0Q2OCMSOT9y8lagCrsg-1; Wed, 26 May 2021 13:06:07 -0400
X-MC-Unique: r_d0Q2OCMSOT9y8lagCrsg-1
Received: by mail-wm1-f71.google.com with SMTP id
 o10-20020a05600c4fcab029014ae7fdec90so384761wmq.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LyoTXCrKRxOQ6HWYt6T0AZz1kzEWAAnmXRDjoh7Y70k=;
 b=G8uSE/XRL6Y0Cpr+ndZudgWKFLegnN0B7rMR7yT6SOOQlqluTHR7R+BSA4ADgdJ5HW
 C6HeVdAEVk+UJH9C2jLKLp+1A4ncOrLFImWYFYeCkae3vd6LD/QgDwEHFx6JgmAMEdud
 K4jZAI58YmkRz+RDnd63gmJUB3pmxstnzmhWvSjk98P7HSqCj9BB47MM/n3Fjvp+wbD6
 ACVAu7gR5HT66xGvgcx5ez33ng1SCzCtbZHTux6U/trf+u+DkQqAACzACArjbkqrOTFp
 q7aP/maCb9PYfpRDq/ujbOn9Wdlx7ignuswOuaNsh8NWPc1SLdKdoQCIHgebs2r8ZbBb
 YtVA==
X-Gm-Message-State: AOAM530jEPY9l8egxIcuV9QSF4fJW/eWO+RYSyzPEWhsyR8bSlnV1uaq
 GOoeMyUfMKfbsHzaZ+fiSl6OrzTk5Lrm43O8KiU9h94S1N1HwZ8j+TOom6M+cCeF41IHBJBTvcV
 ZQdS7skMKeGj6+EAfYpDV5v9CtWS+SDl+sU14TriTfjXUfo35ra8PNH2MKre0XNhL
X-Received: by 2002:a7b:cf23:: with SMTP id m3mr4538324wmg.24.1622048765668;
 Wed, 26 May 2021 10:06:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+0UcjGSNeZsFkMbbtdgTs1Yp9YNfi4sUPYUQR/FGajmBrcKGCBwRBT0ygDfmJcXItImKFJg==
X-Received: by 2002:a7b:cf23:: with SMTP id m3mr4538294wmg.24.1622048765433;
 Wed, 26 May 2021 10:06:05 -0700 (PDT)
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id e8sm20905113wrt.30.2021.05.26.10.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:06:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 10/12] qtest/bios-tables-test: Rename TCG specific tests
Date: Wed, 26 May 2021 19:04:30 +0200
Message-Id: <20210526170432.343588-11-philmd@redhat.com>
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


