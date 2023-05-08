Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206F96FB645
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 20:17:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw5QB-0002Qd-2D; Mon, 08 May 2023 14:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pw5PT-0002DF-5E; Mon, 08 May 2023 14:16:31 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pw5PP-0004NY-SR; Mon, 08 May 2023 14:16:29 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 62CDD1FF6A;
 Mon,  8 May 2023 18:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683569785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1zafHn16XtoiP6kc+hds89WELr+cCfzccygkbaSPXbE=;
 b=VNuk5VInCXWkgMncRkDGhEbohCZ1TgIXtTVun1YRiCne4BVgnWK3+Y3gznrkyy/UBchbO2
 I1Jnycy/zP89sK4H+uVmdxqpHNkiqdomLeOU9Q40qOcx63aT8xCt2UkaeqjTR0B70AebAf
 bW/hGWtHZrDojc6mFjTx3rbFcJrANR4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683569785;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1zafHn16XtoiP6kc+hds89WELr+cCfzccygkbaSPXbE=;
 b=nJkfAKHgEaqHJD3xmN2pzu9JimUx8O6op81dP6K28qI0Eh5j6m4z/rGvw5SGux+Bvngm6V
 sqF4fCvnwELk36DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8AEF41346B;
 Mon,  8 May 2023 18:16:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mLAbFHY8WWSIdwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 08 May 2023 18:16:22 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v3 3/3] tests/qtest: Don't run cdrom boot tests if no
 accelerator is present
Date: Mon,  8 May 2023 15:16:11 -0300
Message-Id: <20230508181611.2621-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230508181611.2621-1-farosas@suse.de>
References: <20230508181611.2621-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On a build configured with: --disable-tcg --enable-xen it is possible
to produce a QEMU binary with no TCG nor KVM support. Skip the cdrom
boot tests if that's the case.

Fixes: 0c1ae3ff9d ("tests/qtest: Fix tests when no KVM or TCG are present")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/cdrom-test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 26a2400181..31d3bacd8c 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -130,6 +130,11 @@ static void test_cdboot(gconstpointer data)
 
 static void add_x86_tests(void)
 {
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available, skipping boot tests");
+        return;
+    }
+
     qtest_add_data_func("cdrom/boot/default", "-cdrom ", test_cdboot);
     qtest_add_data_func("cdrom/boot/virtio-scsi",
                         "-device virtio-scsi -device scsi-cd,drive=cdr "
@@ -176,6 +181,11 @@ static void add_x86_tests(void)
 
 static void add_s390x_tests(void)
 {
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available, skipping boot tests");
+        return;
+    }
+
     qtest_add_data_func("cdrom/boot/default", "-cdrom ", test_cdboot);
     qtest_add_data_func("cdrom/boot/virtio-scsi",
                         "-device virtio-scsi -device scsi-cd,drive=cdr "
-- 
2.35.3


