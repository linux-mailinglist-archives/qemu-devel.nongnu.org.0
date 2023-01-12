Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F9E667846
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBP-0002LH-Pd; Thu, 12 Jan 2023 09:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB9-000274-Ms
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB3-0005tX-2e
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YeZBW8hQfVtgBQC5YyazjW8Oz3umG81OOxn1gCFh8rQ=;
 b=KNWITcm8KCGgH+wm7XqxYN2AJIuqDFtz9LhFbtYKnElpFMbAKCT1qRHrMViNqFA1x4TDb9
 4oc7kGEs7ZodxlrkP5I3QTehX0Pb4jWoTNw9Y9zaEK6wb5SPwYug2YEteCqU7RAGprLTp6
 rw6XDkMA/ObRFAUI1JnaEzz9VhfNeLE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-VepHKZrTMdOkmax5cEvMlg-1; Thu, 12 Jan 2023 09:03:27 -0500
X-MC-Unique: VepHKZrTMdOkmax5cEvMlg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7915E3C42231;
 Thu, 12 Jan 2023 14:03:27 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E798C4085720;
 Thu, 12 Jan 2023 14:03:26 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 16/40] tests: acpi: add reboot cycle to bridge test
Date: Thu, 12 Jan 2023 15:02:48 +0100
Message-Id: <20230112140312.3096331-17-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

hotplugged bridges should not be described in DSDT,
while it works on cold boot, some ACPPI PCI code
are invoked during reboot.

This patch will let us catch unexpected AML if hotplug
checks are broken.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index b65e864a9c..a8c17461c8 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -812,7 +812,7 @@ static void test_vm_prepare(const char *params, test_data *data)
     g_free(args);
 }
 
-static void process_acpi_tables(test_data *data)
+static void process_acpi_tables_noexit(test_data *data)
 {
     test_acpi_load_tables(data);
 
@@ -831,7 +831,11 @@ static void process_acpi_tables(test_data *data)
         SmbiosEntryPointType ep_type = test_smbios_entry_point(data);
         test_smbios_structs(data, ep_type);
     }
+}
 
+static void process_acpi_tables(test_data *data)
+{
+    process_acpi_tables_noexit(data);
     qtest_quit(data->qts);
 }
 
@@ -883,6 +887,11 @@ static void test_acpi_piix4_tcg_bridge(void)
     qtest_qmp_send(data.qts, "{'execute':'cont' }");
     qtest_qmp_eventwait(data.qts, "RESUME");
 
+    process_acpi_tables_noexit(&data);
+    free_test_data(&data);
+
+    /* check that reboot/reset doesn't change any ACPI tables  */
+    qtest_qmp_send(data.qts, "{'execute':'system_reset' }");
     process_acpi_tables(&data);
     free_test_data(&data);
 }
@@ -1005,6 +1014,11 @@ static void test_acpi_q35_multif_bridge(void)
     qtest_qmp_send(data.qts, "{'execute':'cont' }");
     qtest_qmp_eventwait(data.qts, "RESUME");
 
+    process_acpi_tables_noexit(&data);
+    free_test_data(&data);
+
+    /* check that reboot/reset doesn't change any ACPI tables  */
+    qtest_qmp_send(data.qts, "{'execute':'system_reset' }");
     process_acpi_tables(&data);
     free_test_data(&data);
 }
-- 
2.31.1


