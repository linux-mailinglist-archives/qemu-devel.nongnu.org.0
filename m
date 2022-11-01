Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E1E615047
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:14:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprcw-0004BR-4s; Tue, 01 Nov 2022 09:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oprcs-0004AO-Kq
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oprci-0000Gf-24
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667310486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WYo7Qu6N9anE9rJUoWCVW0OIfw4NDhUmd4YuOygr0zo=;
 b=aAmf1n5qPdEHw/Nq40/GRy/M9DM2QUXaxmOGrVnDYC7hNMYAjUWLXKPwA4ZuNjEeujTSxk
 w3tYwPtUsVbTZkT0fv7qtbBxBfu5+eXgETOMLpQrCS4PPk9C3Do5lZxcgmb5UQ4f3W6oaf
 acGw37WtogDLw1F1t+AN5qywybhuVJ0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-ndMqeVGJN6ut7aaeU_RHlQ-1; Tue, 01 Nov 2022 09:48:03 -0400
X-MC-Unique: ndMqeVGJN6ut7aaeU_RHlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F5E01C09C93;
 Tue,  1 Nov 2022 13:48:03 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B0DC40C94CE;
 Tue,  1 Nov 2022 13:48:02 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	stefanha@gmail.com
Subject: [PATCH] fixup! bios-tables-test: add test for number of cores > 255
Date: Tue,  1 Nov 2022 14:48:00 +0100
Message-Id: <20221101134800.2725965-1-imammedo@redhat.com>
In-Reply-To: <CAJSP0QXz+7Yvde1-N4OjQQ+Vo95UsQoOONmRXQsBg8wEJFaC3g@mail.gmail.com>
References: <CAJSP0QXz+7Yvde1-N4OjQQ+Vo95UsQoOONmRXQsBg8wEJFaC3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

testcase requires KVM for execution and would fail with
 "
  qemu-system-i386: current -smp configuration requires kernel irqchip
  and X2APIC API support
 "
move it to kvm guarded section.
This fixes CI failure on hosts that doesn't have KVM enabled for Q35
machine type.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 9d97354df5..395d441212 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1994,8 +1994,6 @@ int main(int argc, char *argv[])
                 qtest_add_func("acpi/q35/tpm12-tis",
                                test_acpi_q35_tcg_tpm12_tis);
             }
-            qtest_add_func("acpi/q35/core-count2",
-                           test_acpi_q35_tcg_core_count2);
             qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
             qtest_add_func("acpi/q35/multif-bridge",
                            test_acpi_q35_multif_bridge);
@@ -2026,6 +2024,8 @@ int main(int argc, char *argv[])
             if (has_kvm) {
                 qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
                 qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
+                qtest_add_func("acpi/q35/core-count2",
+                               test_acpi_q35_tcg_core_count2);
             }
             qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
 #ifdef CONFIG_POSIX
-- 
2.31.1


