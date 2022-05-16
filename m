Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A8752899D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:08:33 +0200 (CEST)
Received: from localhost ([::1]:46290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdGq-0006GE-Fe
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqcca-0004nj-5r
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccY-0006Jg-Gs
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/AtQ7bXh171cWvNBdcjV6vBiQObvg0wEYBOcC3b+/c8=;
 b=TEN0I721Ul3fkPM9Mrm+PVRKgjclTlTUAQXzKZXc83Eq2Oe0unftrr3kuJqe0x6HRK+DQt
 WGqqBjfZ6zs9KdXAbNjClQT3cyXL4hIs5znogpJk9f7v51MPvNpjrHACs47ptNKtb5c5B8
 YF0NMtzDBELnkAErklrdnjQ6ShOznG4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-TZ1Kuz6dNDGhMF29P1Werw-1; Mon, 16 May 2022 11:26:49 -0400
X-MC-Unique: TZ1Kuz6dNDGhMF29P1Werw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8082D3802B9D;
 Mon, 16 May 2022 15:26:49 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50201492C14;
 Mon, 16 May 2022 15:26:48 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: [PATCH 27/35] tests: acpi: add pvpanic-isa: testcase
Date: Mon, 16 May 2022 11:26:02 -0400
Message-Id: <20220516152610.1963435-28-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-1-imammedo@redhat.com>
References: <20220516152610.1963435-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index b7be634d23..ecbb4dab5a 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1593,6 +1593,17 @@ static void test_acpi_q35_applesmc(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_pvpanic_isa(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".pvpanic-isa",
+    };
+
+    test_acpi_one("-device pvpanic", &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1752,6 +1763,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
         qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
         qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);
+        qtest_add_func("acpi/q35/pvpanic-isa", test_acpi_q35_pvpanic_isa);
         qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
         qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
-- 
2.31.1


