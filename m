Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACF0487A23
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 17:10:00 +0100 (CET)
Received: from localhost ([::1]:51696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5roV-0007ui-MK
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 11:09:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5rmF-0005mw-Sj
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 11:07:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5rmD-000134-9W
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 11:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641571655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LrvJC9H7ONFigeLRlDVbKnAGdDSYP/2G9TDXG60iY5A=;
 b=MVZmWD9tyHL2Pep2QqFMIUUe0uWnJLw4Y7m/QSeTIHIxz9zEIvcE57FItOLtqocpeYyEjY
 rl9OFKN9BqgcAujZ3bb/aEiLuZSOp1Fk0WXO7BZ8GfTtSPk38M0QoryoVNyBaqalZjHC3n
 PhOZEVxluAsxdHRpx880sfSYh+jVckI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-TSHgWblVMvaYgUMjqOudhA-1; Fri, 07 Jan 2022 11:07:32 -0500
X-MC-Unique: TSHgWblVMvaYgUMjqOudhA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0CAC81CCB4;
 Fri,  7 Jan 2022 16:07:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2902387956;
 Fri,  7 Jan 2022 16:07:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] hw/i386: Add the possibility to disable the 'isapc' machine
Date: Fri,  7 Jan 2022 17:07:13 +0100
Message-Id: <20220107160713.235918-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have a CONFIG_ISAPC switch - but we're not using it yet.
Add some "#ifdefs" to make it possible to disable this machine now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/pc_piix.c        | 5 ++++-
 tests/qtest/cdrom-test.c | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1999190276..5147e1ee74 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -357,10 +357,12 @@ static void pc_compat_1_4_fn(MachineState *machine)
     pc_compat_1_5_fn(machine);
 }
 
+#ifdef CONFIG_ISAPC
 static void pc_init_isa(MachineState *machine)
 {
     pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, TYPE_I440FX_PCI_DEVICE);
 }
+#endif
 
 #ifdef CONFIG_XEN
 static void pc_xen_hvm_init_pci(MachineState *machine)
@@ -916,6 +918,7 @@ void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
     pci_config_set_revision(bridge_dev->config, pch_rev_id);
 }
 
+#ifdef CONFIG_ISAPC
 static void isapc_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
@@ -935,7 +938,7 @@ static void isapc_machine_options(MachineClass *m)
 
 DEFINE_PC_MACHINE(isapc, "isapc", pc_init_isa,
                   isapc_machine_options);
-
+#endif
 
 #ifdef CONFIG_XEN
 static void xenfv_4_2_machine_options(MachineClass *m)
diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index cfca24fa94..fdd889a487 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -138,7 +138,7 @@ static void add_x86_tests(void)
      * Unstable CI test under load
      * See https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg05509.html
      */
-    if (g_test_slow()) {
+    if (g_test_slow() && qtest_has_machine("isapc")) {
         qtest_add_data_func("cdrom/boot/isapc", "-M isapc "
                             "-drive if=ide,media=cdrom,file=", test_cdboot);
     }
-- 
2.27.0


