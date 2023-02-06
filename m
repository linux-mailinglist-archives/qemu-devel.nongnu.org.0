Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BEE68C107
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:10:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP34k-0003q3-Iw; Mon, 06 Feb 2023 10:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34h-0003or-1S
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:31 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34f-0008Nm-JJ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:30 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 808383F457;
 Mon,  6 Feb 2023 15:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675695988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHXn+iXSeZx5fTkpypKbwr2Y15Iugu7LIivXTes9CAI=;
 b=ep+hx7G7KWE3pSSsMRrd3Galf73/O/2ONmj8nYp6mbbZbkM72w061k7wsUgiQnwHbDsH2k
 uBqt+wcx4jcN9+oG2At0+YEFAjd8icJN3hXAPd77+xA+6/a6+vsAOHJ/w1H5ky6Lv4AKU8
 Dkl/S+HpmioOpNfo7bXjtOAVJK/xhbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675695988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHXn+iXSeZx5fTkpypKbwr2Y15Iugu7LIivXTes9CAI=;
 b=tJHXPQVaqBQ5k9MiG1XK6xmXZtCKqjS6JUksSMkzqgwocRk1O5Rf0A0Z48wUDoF/5ruJFr
 zZwDQG9eNdrStLAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E29B3138E8;
 Mon,  6 Feb 2023 15:06:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SENZKnIX4WPSXwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 15:06:26 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 04/12] tests/qtest: Skip virtio-serial-console tests if device
 not present
Date: Mon,  6 Feb 2023 12:04:08 -0300
Message-Id: <20230206150416.4604-5-farosas@suse.de>
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

The virtconsole device might not be present in the QEMU build that is
being tested. Skip the test if that's the case.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/virtio-serial-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/virtio-serial-test.c b/tests/qtest/virtio-serial-test.c
index 2541034822..f4e05e8fdd 100644
--- a/tests/qtest/virtio-serial-test.c
+++ b/tests/qtest/virtio-serial-test.c
@@ -28,6 +28,10 @@ static void register_virtio_serial_test(void)
 {
     QOSGraphTestOptions opts = { };
 
+    if (!qtest_has_device("virtconsole")) {
+        return;
+    }
+
     opts.edge.before_cmd_line = "-device virtconsole,bus=vser0.0";
     qos_add_test("console-nop", "virtio-serial", virtio_serial_nop, &opts);
 
-- 
2.35.3


