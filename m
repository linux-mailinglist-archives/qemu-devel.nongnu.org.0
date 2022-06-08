Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8994254323C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:10:38 +0200 (CEST)
Received: from localhost ([::1]:45046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywOL-0005Zc-BR
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8L-0001j4-RI
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:54:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8J-0004Pm-Sk
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HrMxyr0XcHNQ8sY+5pW/KagV+i2RckZD/0L3NU4WVHs=;
 b=TaLw1F/YHC0tKSKDkfUTYlUcXOA+FwIpNJsYktUD9tN/alTfsYDxynufRTCYee4u93JRxf
 /Jc3DpWWUyD55YWWKKIU4GfAnx7bCWfh3QVwsz9RIAQa2tPt0m513ZzHOMqYWobpgtUPdo
 yc4YpNpeXQZ4CCpb/AbgQScC4vGUzcM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-Xo8VhKJOM2OxoWW7xYJOlA-1; Wed, 08 Jun 2022 09:54:02 -0400
X-MC-Unique: Xo8VhKJOM2OxoWW7xYJOlA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1A9080A0AD
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 13:54:01 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D385C27E97;
 Wed,  8 Jun 2022 13:54:01 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 23/35] tests: acpi: add applesmc testcase
Date: Wed,  8 Jun 2022 09:53:28 -0400
Message-Id: <20220608135340.3304695-24-imammedo@redhat.com>
In-Reply-To: <20220608135340.3304695-1-imammedo@redhat.com>
References: <20220608135340.3304695-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d896840270..7d238218ca 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1625,6 +1625,17 @@ static void test_acpi_q35_slic(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_applesmc(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".applesmc",
+    };
+
+    test_acpi_one("-device isa-applesmc", &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1783,6 +1794,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
         qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
         qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
+        qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);
         qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
         qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
-- 
2.31.1


