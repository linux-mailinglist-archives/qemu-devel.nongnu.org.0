Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D10F68C0F0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:07:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP34l-0003qY-Ld; Mon, 06 Feb 2023 10:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34j-0003pf-5D
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:33 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34h-0008OL-Ca
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:32 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B4726056C;
 Mon,  6 Feb 2023 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675695990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+GYSl9BGML22x7esUYqOdo8etuTX5DUa2/li2dtsRA=;
 b=ycZ/SuEPeLDjiItb8QEXLnNgvo8sphEE8KqKzcz7vXtXWtcBsDYgl+mF4qzKmYLnKOVS7F
 qATgpswhEu8RPGmicQVcIFY5FHY9nulV8uw6umbcc18QadjZbO+B61AfFJ32vTvmK1zGJa
 KxZIJMR+K6hnuesf1Ay2NZRd0sRa1pg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675695990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+GYSl9BGML22x7esUYqOdo8etuTX5DUa2/li2dtsRA=;
 b=bHvMi5zCGsdHvUB3LH9RdvPu0hv1d62wlre6IkwFzBd3wZvvdk1LQHbvcJSWkxtYBQZxIf
 cWAgiLIJ1ikCfbCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED86B138E8;
 Mon,  6 Feb 2023 15:06:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oM32LHQX4WPSXwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 15:06:28 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 05/12] tests/qtest: hd-geo-test: Check for missing devices
Date: Mon,  6 Feb 2023 12:04:09 -0300
Message-Id: <20230206150416.4604-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230206150416.4604-1-farosas@suse.de>
References: <20230206150416.4604-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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

Don't include tests that require devices not available in the QEMU
binary.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/hd-geo-test.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index 4a7628077b..5aa258a2b3 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -1090,30 +1090,42 @@ int main(int argc, char **argv)
         qtest_add_func("hd-geo/override/ide", test_override_ide);
         if (qtest_has_device("lsi53c895a")) {
             qtest_add_func("hd-geo/override/scsi", test_override_scsi);
-            qtest_add_func("hd-geo/override/scsi_2_controllers",
-                           test_override_scsi_2_controllers);
+            if (qtest_has_device("virtio-scsi-pci")) {
+                qtest_add_func("hd-geo/override/scsi_2_controllers",
+                               test_override_scsi_2_controllers);
+            }
         }
-        qtest_add_func("hd-geo/override/virtio_blk", test_override_virtio_blk);
         qtest_add_func("hd-geo/override/zero_chs", test_override_zero_chs);
-        qtest_add_func("hd-geo/override/scsi_hot_unplug",
-                       test_override_scsi_hot_unplug);
-        qtest_add_func("hd-geo/override/virtio_hot_unplug",
-                       test_override_virtio_hot_unplug);
+        if (qtest_has_device("virtio-scsi-pci")) {
+            qtest_add_func("hd-geo/override/scsi_hot_unplug",
+                           test_override_scsi_hot_unplug);
+        }
+        if (qtest_has_device("virtio-blk-pci")) {
+            qtest_add_func("hd-geo/override/virtio_hot_unplug",
+                           test_override_virtio_hot_unplug);
+            qtest_add_func("hd-geo/override/virtio_blk",
+                           test_override_virtio_blk);
+        }
 
         if (qtest_has_machine("q35")) {
             qtest_add_func("hd-geo/override/sata", test_override_sata);
-            qtest_add_func("hd-geo/override/virtio_blk_q35",
-                           test_override_virtio_blk_q35);
             qtest_add_func("hd-geo/override/zero_chs_q35",
                            test_override_zero_chs_q35);
             if (qtest_has_device("lsi53c895a")) {
                 qtest_add_func("hd-geo/override/scsi_q35",
                                test_override_scsi_q35);
             }
-            qtest_add_func("hd-geo/override/scsi_hot_unplug_q35",
-                           test_override_scsi_hot_unplug_q35);
-            qtest_add_func("hd-geo/override/virtio_hot_unplug_q35",
-                           test_override_virtio_hot_unplug_q35);
+            if (qtest_has_device("virtio-scsi-pci")) {
+                qtest_add_func("hd-geo/override/scsi_hot_unplug_q35",
+                               test_override_scsi_hot_unplug_q35);
+            }
+            if (qtest_has_device("virtio-blk-pci")) {
+                qtest_add_func("hd-geo/override/virtio_hot_unplug_q35",
+                               test_override_virtio_hot_unplug_q35);
+                qtest_add_func("hd-geo/override/virtio_blk_q35",
+                               test_override_virtio_blk_q35);
+            }
+
         }
     } else {
         g_test_message("QTEST_QEMU_IMG not set or qemu-img missing; "
-- 
2.35.3


