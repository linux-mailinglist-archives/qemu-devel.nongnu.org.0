Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574E16952C5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 22:11:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRg5R-0007F0-0e; Mon, 13 Feb 2023 16:10:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pRg5K-0007BE-AZ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 16:10:02 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pRg5G-00011l-0S
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 16:09:59 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E0E16224B4;
 Mon, 13 Feb 2023 21:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676322596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hHKPxt4zJElPD+Cpx7MNEhU7CMVE87JnH/SfSBzg2bc=;
 b=eiWZSr9yW3alnyPixoFTEuYDvXEA8vKoVNAXoRgXJSu8kO162AzlrxN5qJ9SSDnvnFpgSN
 1iDTLsHTlRjHmNT6226XydUyBc6ftehX66ExATtbLXokc50xeMGGB4DWAlBV5jKKzLupse
 CDLaDFEnlz3I8fZ3h5kM/gyCN1gmEnw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676322596;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hHKPxt4zJElPD+Cpx7MNEhU7CMVE87JnH/SfSBzg2bc=;
 b=aBvCYynNWPnIfSN5XwcKpe6qlH+cuCIHabFgC3lZWuthTbfEnSXhJ+IjnRIV1qZaxbebwQ
 LE83D/OfRhYavGDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 843A1138E6;
 Mon, 13 Feb 2023 21:09:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6E7AEiOn6mPoRAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 21:09:55 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 07/12] tests/qtest: Skip unplug tests that use missing
 devices
Date: Mon, 13 Feb 2023 18:07:33 -0300
Message-Id: <20230213210738.9719-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213210738.9719-1-farosas@suse.de>
References: <20230213210738.9719-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/device-plug-test.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index 4f92617335..01cecd6e20 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -68,6 +68,11 @@ static void test_pci_unplug_request(void)
     const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
+    if (!qtest_has_device("virtio-mouse-pci")) {
+        g_test_skip("Device virtio-mouse-pci not available");
+        return;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         machine_addition = "-machine pc";
     }
@@ -82,11 +87,17 @@ static void test_pci_unplug_request(void)
 
 static void test_q35_pci_unplug_request(void)
 {
+    QTestState *qtest;
+
+    if (!qtest_has_device("virtio-mouse-pci")) {
+        g_test_skip("Device virtio-mouse-pci not available");
+        return;
+    }
 
-    QTestState *qtest = qtest_initf("-machine q35 "
-                                    "-device pcie-root-port,id=p1 "
-                                    "-device pcie-pci-bridge,bus=p1,id=b1 "
-                                    "-device virtio-mouse-pci,bus=b1,id=dev0");
+    qtest = qtest_initf("-machine q35 "
+                        "-device pcie-root-port,id=p1 "
+                        "-device pcie-pci-bridge,bus=p1,id=b1 "
+                        "-device virtio-mouse-pci,bus=b1,id=dev0");
 
     process_device_remove(qtest, "dev0");
 
@@ -99,6 +110,11 @@ static void test_pci_unplug_json_request(void)
     const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
+    if (!qtest_has_device("virtio-mouse-pci")) {
+        g_test_skip("Device virtio-mouse-pci not available");
+        return;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         machine_addition = "-machine pc";
     }
@@ -114,6 +130,7 @@ static void test_pci_unplug_json_request(void)
 
 static void test_q35_pci_unplug_json_request(void)
 {
+    QTestState *qtest;
     const char *port = "-device \"{'driver': 'pcie-root-port', "
                                   "'id': 'p1'}\"";
 
@@ -125,8 +142,12 @@ static void test_q35_pci_unplug_json_request(void)
                                     "'bus': 'b1', "
                                     "'id': 'dev0'}\"";
 
-    QTestState *qtest = qtest_initf("-machine q35 %s %s %s",
-                                    port, bridge, device);
+    if (!qtest_has_device("virtio-mouse-pci")) {
+        g_test_skip("Device virtio-mouse-pci not available");
+        return;
+    }
+
+    qtest = qtest_initf("-machine q35 %s %s %s", port, bridge, device);
 
     process_device_remove(qtest, "dev0");
 
-- 
2.35.3


