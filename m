Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819876F830F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:36:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuez-0003B1-SC; Fri, 05 May 2023 08:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puuey-0003AF-7J; Fri, 05 May 2023 08:35:40 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puuew-0005Eu-Oj; Fri, 05 May 2023 08:35:39 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 35D2A22AE4;
 Fri,  5 May 2023 12:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683290137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pb4QQCvxzabUE7t1Q+mi8AHbjHxilUXW5WJZhE5XcO8=;
 b=xvfyqIiC3NfSsheYxbY+03fcoTktw83ajKLz3+erle2NF3QOQxt38Yi7mYEAqEIbNBrdd+
 nJ1KuKddhQMVZKMJbDk2Euu9h6NWbi2p2jZKZGdFmLjdI+6mUe4uklfYhnia/iZxG5BvhJ
 yCdTyl7iMuqCXL2uOmIn/p8nlNmeO0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683290137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pb4QQCvxzabUE7t1Q+mi8AHbjHxilUXW5WJZhE5XcO8=;
 b=iMYiTMt3HiH6mtiRUK8lpHyL9sFxK1aieXDeC5tOK+DmDVrmP2DIa3K/2AVMi8wRWkKM1U
 +Lms5Eb/GNF/9QDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D82113513;
 Fri,  5 May 2023 12:35:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SPJAERb4VGTaOgAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 05 May 2023 12:35:34 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 3/3] tests/qtest: Don't run cdrom tests if no accelerator
 is present
Date: Fri,  5 May 2023 09:35:24 -0300
Message-Id: <20230505123524.23401-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230505123524.23401-1-farosas@suse.de>
References: <20230505123524.23401-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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
to produce a QEMU binary with no TCG nor KVM support. Skip the test if
that's the case.

Fixes: 0c1ae3ff9d ("tests/qtest: Fix tests when no KVM or TCG are present")
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/cdrom-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 26a2400181..09655e6ff0 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -205,6 +205,11 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available");
+        return 0;
+    }
+
     if (exec_genisoimg(genisocheck)) {
         /* genisoimage not available - so can't run tests */
         return g_test_run();
-- 
2.35.3


