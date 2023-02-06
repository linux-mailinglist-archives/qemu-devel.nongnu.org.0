Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B414568C111
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:11:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP34v-0003xp-Kn; Mon, 06 Feb 2023 10:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34q-0003uH-N0
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:40 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34p-0008QA-1f
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:40 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC7AE3F458;
 Mon,  6 Feb 2023 15:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675695997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ERF/eYRp1uSXd+v28TrQ+yEaIQU6blReaQ6jeUk4Uzo=;
 b=WsPrrd4VEbcFJ7l6Q2L8ha2N+02eN0bwwVE5EuAfRMsPMjYeQV1fk3PUpW77gCSAe0RnCP
 QClecxpHrQgv/xBFY5y72Y5x63UVAv9U5pwoCcdCCsghElLGCcNZC7NwR8eJW+dgkPS0nW
 px54g5r5wgaJhnxkYbCq7vgOLq6i3Mk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675695997;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ERF/eYRp1uSXd+v28TrQ+yEaIQU6blReaQ6jeUk4Uzo=;
 b=GcfvnPmdsG16C6zGf7M0FwKRlaQ3RG9SLEVrddhDc/qtHYpyPldaRvX3jxwMHJMo5Ii32g
 d9G+EsiVQu5HYkCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 50831138E8;
 Mon,  6 Feb 2023 15:06:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yPmgBnwX4WPSXwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 15:06:36 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Su Hang <suhang16@mails.ucas.ac.cn>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 09/12] tests/qtest: Do not include hexloader-test if loader
 device is not present
Date: Mon,  6 Feb 2023 12:04:13 -0300
Message-Id: <20230206150416.4604-10-farosas@suse.de>
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
 tests/qtest/hexloader-test.c | 5 +++++
 tests/qtest/meson.build      | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/hexloader-test.c b/tests/qtest/hexloader-test.c
index 3023548041..3ab464f438 100644
--- a/tests/qtest/hexloader-test.c
+++ b/tests/qtest/hexloader-test.c
@@ -22,6 +22,11 @@ static void hex_loader_test(void)
     unsigned int i;
     const unsigned int base_addr = 0x00010000;
 
+    if (!qtest_has_device("loader")) {
+        g_test_skip("Device 'loader' not available");
+        return;
+    }
+
     QTestState *s = qtest_initf(
         "-M vexpress-a9 -device loader,file=tests/data/hex-loader/test.hex");
 
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 431b623df9..a930706a43 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -197,11 +197,11 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
   (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
+  (config_all_devices.has_key('CONFIG_GENERIC_LOADER') ? ['hexloader-test'] : []) + \
   ['arm-cpu-features',
    'microbit-test',
    'test-arm-mptimer',
-   'boot-serial-test',
-   'hexloader-test']
+   'boot-serial-test']
 
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
-- 
2.35.3


