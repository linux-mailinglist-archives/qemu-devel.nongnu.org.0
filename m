Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44983A9F10
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:28:32 +0200 (CEST)
Received: from localhost ([::1]:55584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXSx-0007BK-U6
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ltXQn-000429-K2
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:26:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ltXQl-00085q-D8
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623857174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zyx+c52A+ihznCUtDUtP2qgCG98vj7V8qyM1fjJ0mgQ=;
 b=NsnxM6MdtfVvT0MnNd7s/PbNgyxAmKCNhyeYtw07gF9EWAHwcLsjIlfTK7nmXzgXSamxNd
 uGxp68W78/4rqFFt7q+Iz5+kJd6HOkaNntNMP2PjTOHXTPpPz/gRHd+WJKk8fZvTNfbMU6
 gBbjTOBLyqzQzpjokdQOIcTay68uW2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-pqpTXGt7Nm6ak6JEiCIkdg-1; Wed, 16 Jun 2021 11:25:09 -0400
X-MC-Unique: pqpTXGt7Nm6ak6JEiCIkdg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5646B180D518
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 15:25:08 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A57C5C1C5;
 Wed, 16 Jun 2021 15:25:07 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 2/3] tests: acpi: q35: test for x2APIC entries in SRAT
Date: Wed, 16 Jun 2021 11:24:54 -0400
Message-Id: <20210616152455.1270264-3-imammedo@redhat.com>
In-Reply-To: <20210616152455.1270264-1-imammedo@redhat.com>
References: <20210616152455.1270264-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: lvivier@redhat.com, thuth@redhat.com, philmd@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set -smp 1,maxcpus=288 to test for ACPI code that
deal with CPUs with large APIC ID (>255).

PS:
Test requires KVM and in-kernel irqchip support,
so skip test if KVM is not available.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  4 ++++
 tests/data/acpi/q35/APIC.numamem            |  0
 tests/data/acpi/q35/FACP.numamem            |  0
 tests/qtest/bios-tables-test.c              | 10 +++++++---
 4 files changed, 11 insertions(+), 3 deletions(-)
 create mode 100644 tests/data/acpi/q35/APIC.numamem
 create mode 100644 tests/data/acpi/q35/FACP.numamem

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..c4c132e49b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/SRAT.numamem",
+"tests/data/acpi/q35/FACP.numamem",
+"tests/data/acpi/q35/APIC.numamem",
diff --git a/tests/data/acpi/q35/APIC.numamem b/tests/data/acpi/q35/APIC.numamem
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/FACP.numamem b/tests/data/acpi/q35/FACP.numamem
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 51d3a4e239..3ecf7d0d58 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1021,7 +1021,7 @@ static void test_acpi_piix4_tcg_nohpet(void)
     free_test_data(&data);
 }
 
-static void test_acpi_q35_tcg_numamem(void)
+static void test_acpi_q35_kvm_numamem(void)
 {
     test_data data;
 
@@ -1029,7 +1029,9 @@ static void test_acpi_q35_tcg_numamem(void)
     data.machine = MACHINE_Q35;
     data.variant = ".numamem";
     test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
-                  " -numa node -numa node,memdev=ram0", &data);
+                  " -numa node -numa node,memdev=ram0"
+                  " -machine kernel-irqchip=on -smp 1,maxcpus=288"
+                   , &data);
     free_test_data(&data);
 }
 
@@ -1536,7 +1538,6 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
         qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
         qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
-        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
         qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
         qtest_add_func("acpi/piix4/smm-compat",
                        test_acpi_piix4_tcg_smm_compat);
@@ -1561,6 +1562,9 @@ int main(int argc, char *argv[])
         if (strcmp(arch, "x86_64") == 0) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
+        if (qtest_has_kvm()) {
+            qtest_add_func("acpi/q35/numamem", test_acpi_q35_kvm_numamem);
+        }
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-- 
2.27.0


