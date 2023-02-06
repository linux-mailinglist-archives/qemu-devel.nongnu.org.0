Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1F468C103
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:09:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP34o-0003r5-Ry; Mon, 06 Feb 2023 10:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34k-0003qW-WD
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:35 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34j-0008Op-7m
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:34 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1ADBC3F457;
 Mon,  6 Feb 2023 15:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675695992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O8MO8fFpHkrT5iCSfryXtaeiZ8WPv8JiXUvDOuHVgjw=;
 b=kju15KLLhTKGMx7NNGY1M05BXofkcVzKEsYg1cdoz1wB/6q2E1FskZQvJrIhcsO0VGoydS
 2lux9w+vYjbcmF1oxedpAEeicjDhaHo0gdbPtadYbXePZWQo9jZTUNdXMjBFCYj2XWJ/X8
 fSFivnmTbPnwIPUeDdlpJEgDqi0UuP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675695992;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O8MO8fFpHkrT5iCSfryXtaeiZ8WPv8JiXUvDOuHVgjw=;
 b=SG3avQZM8Z60QBACOMwSTBs+qGrscR/eHvFiQ1bxKDzfMoJLeF9zZAptaNDOC7BUc4UOOz
 YAoqKlrxJp0U2+CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B89E5138E8;
 Mon,  6 Feb 2023 15:06:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EO0ZIHYX4WPSXwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 15:06:30 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 06/12] tests/qtest: Skip unplug tests that use missing devices
Date: Mon,  6 Feb 2023 12:04:10 -0300
Message-Id: <20230206150416.4604-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230206150416.4604-1-farosas@suse.de>
References: <20230206150416.4604-1-farosas@suse.de>
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
---
 tests/qtest/device-plug-test.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index 5a6afa2b57..931acbdf50 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -67,6 +67,11 @@ static void test_pci_unplug_request(void)
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
@@ -81,6 +86,10 @@ static void test_pci_unplug_request(void)
 
 static void test_q35_pci_unplug_request(void)
 {
+    if (!qtest_has_device("virtio-mouse-pci")) {
+        g_test_skip("Device virtio-mouse-pci not available");
+        return;
+    }
 
     QTestState *qtest = qtest_initf("-machine q35 "
                                     "-device pcie-root-port,id=p1 "
@@ -97,6 +106,11 @@ static void test_pci_unplug_json_request(void)
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
@@ -123,6 +137,11 @@ static void test_q35_pci_unplug_json_request(void)
                                     "'bus': 'b1', "
                                     "'id': 'dev0'}\"";
 
+    if (!qtest_has_device("virtio-mouse-pci")) {
+        g_test_skip("Device virtio-mouse-pci not available");
+        return;
+    }
+
     QTestState *qtest = qtest_initf("-machine q35 %s %s %s",
                                     port, bridge, device);
 
-- 
2.35.3


