Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A50373BFE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:07:38 +0200 (CEST)
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHFZ-0002Iv-51
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH7M-00024E-Gx
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:59:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH7I-0004EU-Fh
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620219543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NrRlnxcfy5rfyxKOgrn4KzLZv/0uqhFPtkaZ4qrEJ9Q=;
 b=NiDVB8iFuqkjIWMgmX5gJRXySAVY/bbCBHXlhkHyCcwlWAZ9yeEMd4z959ajifNEyI32we
 Mm+aSD5g9w/hbHJEx25S5mTbCwOfiAXpf1QiepezWIx9GH03XvF/ZuE3ed45Sk9NxriHks
 gTEqvZhvt2Z3Jo3sZ1psdZTezsOlOj4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-WQpdkefIMgSnzbzuBg8joQ-1; Wed, 05 May 2021 08:59:02 -0400
X-MC-Unique: WQpdkefIMgSnzbzuBg8joQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 q18-20020adfc5120000b029010c2bdd72adso663359wrf.16
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NrRlnxcfy5rfyxKOgrn4KzLZv/0uqhFPtkaZ4qrEJ9Q=;
 b=NPbEeXzSU8Aij+xKsYlEVzYASxDtqrV7B/l3yPl3wiFhkrOlTywC46p191C9MYaqAU
 KiIrJwGe/sL4RzEpxS0xdPDAjSh1zRgzHGPFib1DTe7e+nX8CRQBlBG4X9PwbHVwt9vM
 4vqLxl+gLdQ9cNzW31qocVQr092cqhoFYYgrLd3eQa6R1rhfThL1N9BtCyw4x0osRCT4
 88K4B0FFjRF09CPB9YL32XD9LG/7PY2Ma9tAn30eidplrpqBE5Y/dxMcefv/S21NAg8w
 abcvdUDI/oTSMhaguNxQSjKtEFX6yzQteG8LGyxrkXNyHCNKsc/nhlNkS1yUfe1fjbhO
 rknA==
X-Gm-Message-State: AOAM533Ka8SXSwrrEYUzSbznqS79dvI/gCLTkd9/G5kn/K3rElq8gE/H
 LOYJDaYLZmIjSVM3ZG3IHMlIKcfF3kgZQVRWm8DHlpQk8Wn/TwpAK4y1LBNHOVGPAxmSeoolsjv
 pS/eh08g4sudRP6rsvOJ5dMGlAty58w5zBFHXPy+l9kns7EWUNmxN4FauHBytdazw
X-Received: by 2002:a05:600c:4f96:: with SMTP id
 n22mr10004776wmq.117.1620219541047; 
 Wed, 05 May 2021 05:59:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlB1TotUYG8y+Lqpew5ljjsVF7MwbsMdq/wWf0PXdkHKCNifjwJLE6ZgWT5InkNlOTtByYLw==
X-Received: by 2002:a05:600c:4f96:: with SMTP id
 n22mr10004759wmq.117.1620219540885; 
 Wed, 05 May 2021 05:59:00 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id z2sm21450346wrg.6.2021.05.05.05.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 05:59:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/12] qtest/bios-tables-test: Make test build-independent
 from accelerator
Date: Wed,  5 May 2021 14:58:05 +0200
Message-Id: <20210505125806.1263441-12-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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


