Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9774428D80
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 15:03:55 +0200 (CEST)
Received: from localhost ([::1]:36904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZuyA-0005Ss-Er
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 09:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mZuuR-00040N-Ae
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:00:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mZuuN-0007zV-0W
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633957198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yy/yi6ARdWEQr2RFi3r2MhZJCVVyaET0RSYyKPIRVd8=;
 b=YMatG+HcIx7iBdiZKPhhXFJOGiCcap0xfkSpnrirwVgf7T/5kM61WVB/2Y9zBH1KnTOqeE
 LazBAdKXI615h8VgX5eniGi5+i9BU3mZO7+4aXBstu1atEo1Ujwe56JezhdKFzNzcZ7bj5
 CFkVKjvQ15qAJV837CZDP5Tt0NprsL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-haqRf1YqN7-Mbx9XbTMNFA-1; Mon, 11 Oct 2021 08:59:55 -0400
X-MC-Unique: haqRf1YqN7-Mbx9XbTMNFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03CDD50764;
 Mon, 11 Oct 2021 12:59:54 +0000 (UTC)
Received: from thuth.com (unknown [10.40.195.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BE175C25D;
 Mon, 11 Oct 2021 12:59:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance: Add tests for the ppc405 boards
Date: Mon, 11 Oct 2021 14:59:30 +0200
Message-Id: <20211011125930.750217-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-ppc@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using the U-Boot firmware, we can check that at least the serial console
of the ppc405 boards is still usable.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Based-on: 20211006071140.565952-1-thuth@redhat.com

 tests/acceptance/ppc_405.py | 40 +++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 tests/acceptance/ppc_405.py

diff --git a/tests/acceptance/ppc_405.py b/tests/acceptance/ppc_405.py
new file mode 100644
index 0000000000..bf7c2f22fc
--- /dev/null
+++ b/tests/acceptance/ppc_405.py
@@ -0,0 +1,40 @@
+# Test that the U-Boot firmware boots on ppc 405 machines and check the console
+#
+# Copyright (c) 2021 Red Hat, Inc.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado.utils import archive
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command_and_wait_for_pattern
+
+class Ppc405Machine(Test):
+
+    timeout = 90
+
+    def do_test_ppc405(self):
+        uboot_url = ('https://gitlab.com/huth/u-boot/-/raw/'
+                     'taihu-2021-10-09/u-boot-taihu.bin')
+        uboot_hash = ('3208940e908a5edc7c03eab072c60f0dcfadc2ab');
+        file_path = self.fetch_asset(uboot_url, asset_hash=uboot_hash)
+        self.vm.set_console(console_index=1)
+        self.vm.add_args('-bios', file_path)
+        self.vm.launch()
+        wait_for_console_pattern(self, 'AMCC PPC405EP Evaluation Board')
+        exec_command_and_wait_for_pattern(self, 'reset', 'AMCC PowerPC 405EP')
+
+    def test_ppc_taihu(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:taihu
+        """
+        self.do_test_ppc405()
+
+    def test_ppc_ref405ep(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:ref405ep
+        """
+        self.do_test_ppc405()
-- 
2.27.0


