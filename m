Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC8E68C0F1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:07:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP34e-0003nz-N9; Mon, 06 Feb 2023 10:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34a-0003mb-74
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:24 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34Y-0008MM-O6
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:23 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A46E605EA;
 Mon,  6 Feb 2023 15:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675695981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=goSDfx7cmfycf8tBXDj8HVE4wyFuG1uzctEfXFzu2j8=;
 b=b38f/EWiastCCpeu+pM77HwRhEscUWXyIy2OCgiZoXycRQpfIEp1YX79ecV0zYkUDhEXbf
 HlwejqtuBt71PcdJf5YicerOHTa7sSiYRgpIOBDl708ziIN2prmoY7rvllFmJ/dnoTGjtT
 tJs2yzm12R5rNQEO97x0Y03BPao17ig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675695981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=goSDfx7cmfycf8tBXDj8HVE4wyFuG1uzctEfXFzu2j8=;
 b=85qNz+LGJDAW9Rtmw7M2FJFJhuf1lhuvV1ke65q8rxUe9tDRJewfubHwAB0y6Mog8QFoVm
 B0VBAfUZK9wX0xAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34F52138E8;
 Mon,  6 Feb 2023 15:06:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SJB4O2sX4WPSXwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 15:06:19 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 01/12] tests/qtest: Skip PXE tests for missing devices
Date: Mon,  6 Feb 2023 12:04:05 -0300
Message-Id: <20230206150416.4604-2-farosas@suse.de>
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

Check if the devices we're trying to add are present in the QEMU
binary. They could have been removed from the build via Kconfig or the
--without-default-devices option.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/pxe-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
index 52f0b5c67c..62b6eef464 100644
--- a/tests/qtest/pxe-test.c
+++ b/tests/qtest/pxe-test.c
@@ -108,6 +108,10 @@ static void test_batch(const testdef_t *tests, bool ipv6)
         const testdef_t *test = &tests[i];
         char *testname;
 
+        if (!qtest_has_device(test->model)) {
+            continue;
+        }
+
         testname = g_strdup_printf("pxe/ipv4/%s/%s",
                                    test->machine, test->model);
         qtest_add_data_func(testname, test, test_pxe_ipv4);
-- 
2.35.3


