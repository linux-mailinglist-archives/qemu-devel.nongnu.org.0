Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF3C3FED4D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 13:58:24 +0200 (CEST)
Received: from localhost ([::1]:52964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLlMN-0005WW-Ol
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 07:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0k-00005P-26
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0i-0004yp-HX
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630582559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3SlwbLNooBIexEetY9CKn2z2rTHQUhU2+f7ZMFAzBGA=;
 b=RfvogCIzGOh6iVhGk9WTgP7ESXOXcLUcX2EAy515N/JlxyAzso2ut0ZT7j/SN3y41V1G6A
 vqDBB9WT49dDZRS/VTBZHAVGC060qbwOjF2AXh1NkoC4UQc8UGKO+eCPVIxftjX/vcUpj2
 IfKdOQMahIkj/DNJ+rfVi1y1u4k4yi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-7G0BitKuNEuoj6S4qum9Ug-1; Thu, 02 Sep 2021 07:35:58 -0400
X-MC-Unique: 7G0BitKuNEuoj6S4qum9Ug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A3136F303
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 11:35:58 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38F9E6ACE3;
 Thu,  2 Sep 2021 11:35:57 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/15] tests: acpi: q35: test for x2APIC entries in SRAT
Date: Thu,  2 Sep 2021 07:35:40 -0400
Message-Id: <20210902113551.461632-5-imammedo@redhat.com>
In-Reply-To: <20210902113551.461632-1-imammedo@redhat.com>
References: <20210902113551.461632-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set -smp 1,maxcpus=288 to test for ACPI code that
deal with CPUs with large APIC ID (>255).

PS:
Test requires KVM and in-kernel irqchip support,
so skip test if KVM is not available.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v3:
  - add dedicated test instead of abusing 'numamem' one
  - add 'kvm' prefix to the test name
      ("Michael S. Tsirkin" <mst@redhat.com>)
v2:
  - switch to qtest_has_accel() API

CC: thuth@redhat.com
CC: lvivier@redhat.com
---
 tests/qtest/bios-tables-test.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 51d3a4e239..1f6779da87 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1033,6 +1033,19 @@ static void test_acpi_q35_tcg_numamem(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_kvm_xapic(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".xapic";
+    test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
+                  " -numa node -numa node,memdev=ram0"
+                  " -machine kernel-irqchip=on -smp 1,maxcpus=288", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_nosmm(void)
 {
     test_data data;
@@ -1506,6 +1519,7 @@ static void test_acpi_oem_fields_virt(void)
 int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
+    const bool has_kvm = qtest_has_accel("kvm");
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -1561,6 +1575,9 @@ int main(int argc, char *argv[])
         if (strcmp(arch, "x86_64") == 0) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
+        if (has_kvm) {
+            qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
+        }
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-- 
2.27.0


