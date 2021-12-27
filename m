Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0A548046A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 20:39:23 +0100 (CET)
Received: from localhost ([::1]:50440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1vq6-0002Fe-JN
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 14:39:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n1via-0003Je-IP
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 14:31:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n1viY-00059p-LC
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 14:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640633494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1Jrlzv+VyTzFZ5GrX5k7LoGumWAwouAPtyADK6iv84=;
 b=N9l5bcE/dXXDxotFZjn0R3T4VeFZm69AZ0VeB3mL1ABFURUJiGWuF1ZhWOntRZKzv0VKob
 K+J42R+vvKYqNPwSmreCJQpmoPl8Sh25AylWf+cGPbRCSagFvu2XdiF2o4LXU+Draq4xJM
 WeJ1wg0MninHTfiVQ82sOhIcV36TNHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-SpbPUgwPMy63BuW1l9QKzQ-1; Mon, 27 Dec 2021 14:31:33 -0500
X-MC-Unique: SpbPUgwPMy63BuW1l9QKzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8BC12F25;
 Mon, 27 Dec 2021 19:31:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4C9960BF4;
 Mon, 27 Dec 2021 19:31:30 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] tests: acpi: add SLIC table test
Date: Mon, 27 Dec 2021 14:31:19 -0500
Message-Id: <20211227193120.1084176-4-imammedo@redhat.com>
In-Reply-To: <20211227193120.1084176-1-imammedo@redhat.com>
References: <20211227193120.1084176-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.575,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: dlenski@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When user uses '-acpitable' to add SLIC table, some ACPI
tables (FADT) will change its 'Oem ID'/'Oem Table ID' fields to
match that of SLIC. Test makes sure thati QEMU handles
those fields correctly when SLIC table is added with
'-acpitable' option.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 9a468e29eb..e6b72d9026 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1502,6 +1502,20 @@ static void test_acpi_virt_viot(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_slic(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".slic",
+    };
+
+    test_acpi_one("-acpitable sig=SLIC,oem_id='CRASH ',oem_table_id='ME',"
+                  "oem_rev=00002210,asl_compiler_id='qemu',"
+                  "asl_compiler_rev=00000000,data=/dev/null",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1677,6 +1691,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
         qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
+        qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-- 
2.31.1


