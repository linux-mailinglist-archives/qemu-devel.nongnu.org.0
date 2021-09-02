Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC5F3FED4F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 13:58:38 +0200 (CEST)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLlMb-00069w-DH
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 07:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0n-0000Il-K4
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0l-0004zc-Tw
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630582563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3SlFsaYDlkxzOrfFfPp2Xy2oQB3iBWZ+lxueAg13AhM=;
 b=ThBWKaxH/WwIafhM+7nMro8G+sO0khR5c5/UisGdvkqVsGj46L6pK/doHw+BL9+p/brs5B
 U+NcoTAOPQL9Y/r8MH5/iJHb2pZHfOK9+9mivy0uSs5LzAIoSe7S340pvL+Ba7umH7p/JJ
 S16h+hAIxiALLoXprAGHinW09Nb1Pog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-TIKsY6QmP_eXBl9jhmfjYg-1; Thu, 02 Sep 2021 07:36:02 -0400
X-MC-Unique: TIKsY6QmP_eXBl9jhmfjYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F8256F306
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 11:36:01 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D2076A8F8;
 Thu,  2 Sep 2021 11:36:00 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/15] tests: acpi: add testcase for intel_iommu (DMAR
 table)
Date: Thu,  2 Sep 2021 07:35:43 -0400
Message-Id: <20210902113551.461632-8-imammedo@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
  * add 'kvm' prefix to test name

CC: thuth@redhat.com
CC: lvivier@redhat.com
---
 tests/qtest/bios-tables-test.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 1f6779da87..4abeaa6f6b 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1090,6 +1090,18 @@ static void test_acpi_q35_tcg_nohpet(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_kvm_dmar(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".dmar";
+    test_acpi_one("-machine kernel-irqchip=split -accel kvm"
+                  " -device intel-iommu,intremap=on,device-iotlb=on", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_piix4_tcg_numamem(void)
 {
     test_data data;
@@ -1577,6 +1589,7 @@ int main(int argc, char *argv[])
         }
         if (has_kvm) {
             qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
+            qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-- 
2.27.0


