Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D9A6EF9B9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:00:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prjRd-0007Gs-BS; Wed, 26 Apr 2023 14:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1prjRb-0007Bs-0x; Wed, 26 Apr 2023 14:00:43 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1prjRZ-0006eQ-HX; Wed, 26 Apr 2023 14:00:42 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 90A4E1FDD9;
 Wed, 26 Apr 2023 18:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682532039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+3veZcdIkWERrIq0U6SOTlgqwDPgCl2NC5OIDpuMSU=;
 b=oPudpkUd7w/8C3Q8ir2Vtd5u6uHqVW2hK/k12YqZNKwizHRb0F8wyMQcHqQOGExd21R12q
 tt4oJIaKfGX303xACXKBGioQEbBCMRUkQspHYZ9gGmfxFEp1xn0hqeCMnqsYERRZypiAiB
 cirjbqhHdSVfJRLfQY8IsFqsAAOmg08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682532039;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+3veZcdIkWERrIq0U6SOTlgqwDPgCl2NC5OIDpuMSU=;
 b=U4af43uiO4zpeLlLUQQ3ut3wIalvH5tqRZz0/znkbyenwTk+evskP8U0vzMsUB+lfiYG8S
 GeTrDvnW5vNeiTDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48399138F0;
 Wed, 26 Apr 2023 18:00:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WGpDBMRmSWSoVQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:00:36 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v11 06/13] tests/qtest: Adjust and document
 query-cpu-model-expansion test for arm
Date: Wed, 26 Apr 2023 15:00:06 -0300
Message-Id: <20230426180013.14814-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
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

We're about to move the 32-bit CPUs under CONFIG_TCG, so adjust the
query-cpu-model-expansion test to check against the cortex-a7, which
is already under CONFIG_TCG. That allows the next patch to contain
only code movement.

While here add comments clarifying what we're testing.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/arm-cpu-features.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 1cb08138ad..3fc33fc24d 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -506,9 +506,23 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         QDict *resp;
         char *error;
 
-        assert_error(qts, "cortex-a15",
-            "We cannot guarantee the CPU type 'cortex-a15' works "
-            "with KVM on this host", NULL);
+        /*
+         * When using KVM, only the 'host' and 'max' CPU models are
+         * supported. Test that we're emitting a suitable error for
+         * unsupported CPU models.
+         */
+        if (qtest_has_accel("tcg")) {
+            assert_error(qts, "cortex-a7",
+                         "We cannot guarantee the CPU type 'cortex-a7' works "
+                         "with KVM on this host", NULL);
+        } else {
+            /*
+             * With a KVM-only build the 32-bit CPUs are not present.
+             */
+            assert_error(qts, "cortex-a7",
+                         "The CPU type 'cortex-a7' is not a "
+                         "recognized ARM CPU type", NULL);
+        }
 
         assert_has_feature_enabled(qts, "host", "aarch64");
 
-- 
2.35.3


