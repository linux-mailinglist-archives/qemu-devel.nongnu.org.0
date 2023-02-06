Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD668C116
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:12:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP34i-0003pJ-Vh; Mon, 06 Feb 2023 10:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34g-0003og-4v
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:30 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34e-0008NP-It
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:29 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 768BA3F456;
 Mon,  6 Feb 2023 15:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675695986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3J7/NcxoVEWec5A/Vpx7Mh9Ixo+lExXmGYXiad7Zabk=;
 b=Oxy3CrloHPET3zJl8WlBIjym4LkkIf1tBMEKAc1Y2u/pIFOJAv5jzHwCg92AW0Yqgk17gU
 xp8NHelf/w20xRi4CVpkV7p5EearDW/2jznxzom9XLwoA0QjiFr3wqoJJ+dZizRmQvRk5n
 Ckl6VVGRO7EDt1RWO74bElMTbSsZPhM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675695986;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3J7/NcxoVEWec5A/Vpx7Mh9Ixo+lExXmGYXiad7Zabk=;
 b=SwBmnultg/4YNn6h8UDZdl5hCD5zAfBf3eThwtqC+7bpf8ipjpTCJebhTI+XWzpJbUjXG7
 dxb/5oBl6zS1RXBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FF43138E8;
 Mon,  6 Feb 2023 15:06:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QIyJNnAX4WPSXwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 15:06:24 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 03/12] tests/qtest: Add dependence on PCIE_ROOT for
 virtio-net-failover.c
Date: Mon,  6 Feb 2023 12:04:07 -0300
Message-Id: <20230206150416.4604-4-farosas@suse.de>
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

This test depends on the presence of the pcie-root-port device. Add a
build time dependency and a runtime check.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/meson.build           | 3 ++-
 tests/qtest/virtio-net-failover.c | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e97616d327..431b623df9 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -73,7 +73,8 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
   (config_host.has_key('CONFIG_POSIX') and                                                  \
    config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                   \
-  (config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
+  (config_all_devices.has_key('CONFIG_PCIE_ROOT') and                                       \
+   config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
    config_all_devices.has_key('CONFIG_Q35') and                                             \
    config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
    slirp.found() ? ['virtio-net-failover'] : []) +                                          \
diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 4a809590bf..9ca52cb026 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -1835,6 +1835,11 @@ int main(int argc, char **argv)
     gchar *tmpfile;
     int ret;
 
+    if (!qtest_has_device("pcie-root-port") ||
+        !qtest_has_device("virtio-net")) {
+        return 0;
+    }
+
     g_test_init(&argc, &argv, NULL);
 
     ret = g_file_open_tmp("failover_test_migrate-XXXXXX", &tmpfile, NULL);
-- 
2.35.3


