Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C582C39BC58
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:56:07 +0200 (CEST)
Received: from localhost ([::1]:51824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCB4-00086m-Pg
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8f-0003D9-UI
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:37 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8b-00008M-FB
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:37 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so8206279wmd.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YzeACc1wsH/oKOcJhjQoY6+4BE5bGAGTHjMBp9qY+rQ=;
 b=l/E2T43Mtl+Bfg/wVWB0xLuC2QJ8kJrYS9/fn2dhcIsMPJhwwOxgQEYqr86pE3WMYo
 igXoesKIHiU8siquKI39ttrW6RdREx30d951yWEw4TubQg/5KTLwQDymcv4uGNn5fUk8
 Ejx64XeujPRpqIAh8YyYnEuNRKB19BRKq7UbJ1saxAc+jXqoVPZajWC3uYFC996w2k96
 oZXcbVHkX8VY65rCCIYkuog73QLZxk1NcEah6o1bGv6rHuEoC/QCJsYsqpKrJdZWUBfk
 mnWc1RMZ2AfOHeaBMcmyNGpImHiDO7dRrrJMNGMyjp1CYm+FZSSS29WwVojMSV6HndhX
 fOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YzeACc1wsH/oKOcJhjQoY6+4BE5bGAGTHjMBp9qY+rQ=;
 b=sKbpcODBkqiSem4XYGA4zD43xlDWoEFqnDZfYgh6lo1e5EYT9F4CRVQUZ/R2RlcHVN
 AoVNmTAFr5zYWI/7FlHvOJXlThN4y6OmqgA/1RyA5DUKVeMdM7drGU+CaW9hiph7E+b7
 Z3//II9oxoC+Q6e+5KUsuCrK2ft+g5oZMAQovWp1lFaEzz7frXNELe/WitZXzBK3r/fM
 2YJg2IE4cgbvmIM0PHPBJdDJoXE/b6gPseUA49vwFPc5bxCZ1LgEEJJWduZbmXF2Xtwg
 egEEBlHU7MkaksIcXIuzfau2QobGxGzeGeeyNpRent0p6CDoH4MxI70gG1GExLSDGjMg
 8z6A==
X-Gm-Message-State: AOAM533qQPNmuczOAzsPG1XC5KU9CYEgt4kCJZ+n2aKtWFgS5FcBS52B
 MB8z38eVzZPWl5snwFNRrJ073w==
X-Google-Smtp-Source: ABdhPJwyO8s6HYNMMlFYKenvSdfFwHFRUaFQa/hk9zoTD7ikTSWTyBhZE8351YF5Qt39W+JKCIhfhA==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr4462876wme.129.1622822011826; 
 Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 32sm7976328wrs.5.2021.06.04.08.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 492161FF99;
 Fri,  4 Jun 2021 16:53:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 10/99] qtest/bios-tables-test: Rename TCG specific tests
Date: Fri,  4 Jun 2021 16:51:43 +0100
Message-Id: <20210604155312.15902-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Some tests require TCG, but don't have '_tcg' in their name,
while others do. Unify the test names by adding 'tcg' to the
TCG specific tests.

Reported-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210505125806.1263441-11-philmd@redhat.com>
---
 tests/qtest/bios-tables-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index ce498b3ff4..ad877baeb1 100644
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
2.20.1


