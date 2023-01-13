Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47668669A12
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:28:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKiY-0006zb-PH; Fri, 13 Jan 2023 09:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pGKiU-0006xo-Vj; Fri, 13 Jan 2023 09:07:35 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pGKiT-0002mA-Ed; Fri, 13 Jan 2023 09:07:34 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 615E86069B;
 Fri, 13 Jan 2023 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673618851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsVab1v7flwJwn2herGnIiPeja3V6sloYUiKLt3jrmY=;
 b=H76Yj/QvENq5JsalBRsPQDCGB+WVDe+NnksPch/VLXNLMcPtLK0GWdLXppGkuZjC62UQAC
 c/fyFvswOKRR11RKEFIytnIFjxAYaitATLcLUvd7p0yh9FjvyHW+lbHJ7LS6o7Pk3llqu2
 Fss1ZR6EcBSIDJphm1X4hXd72laQ2HM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673618851;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsVab1v7flwJwn2herGnIiPeja3V6sloYUiKLt3jrmY=;
 b=coboO5VhYHWQvk8jfWqOeHWt7cOnefaWcMkK0eJ9K/SDmySMEcpB8V3DXbBOx5bS7Db/XV
 CRW9L4GeUu3ANCCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5FEE71358A;
 Fri, 13 Jan 2023 14:07:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4L6mCqBlwWP8DQAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:28 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v3 21/28] tests/qtest: Skip tests that depend on TCG when
 CONFIG_TCG=n
Date: Fri, 13 Jan 2023 11:04:12 -0300
Message-Id: <20230113140419.4013-22-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
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

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/arm-cpu-features.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 4be1415823..9a052e41fc 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -217,6 +217,15 @@ static void assert_bad_props(QTestState *qts, const char *cpu_type)
     qobject_unref(resp);
 }
 
+static bool tcg_disabled(void)
+{
+#ifndef CONFIG_TCG
+    return true;
+#else
+    return false;
+#endif
+}
+
 static uint64_t resp_get_sve_vls(QDict *resp)
 {
     QDict *props;
@@ -338,6 +347,11 @@ static void sve_tests_sve_max_vq_8(const void *data)
 {
     QTestState *qts;
 
+    if (tcg_disabled()) {
+        g_test_skip("TCG support disabled in this build");
+        return;
+    }
+
     qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
 
     assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
@@ -373,6 +387,11 @@ static void sve_tests_sve_off(const void *data)
 {
     QTestState *qts;
 
+    if (tcg_disabled()) {
+        g_test_skip("TCG support is disabled in this build");
+        return;
+    }
+
     qts = qtest_init(MACHINE "-cpu max,sve=off");
 
     /* SVE is off, so the map should be empty. */
@@ -429,6 +448,11 @@ static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
 
+    if (tcg_disabled()) {
+        g_test_skip("TCG support disabled in this build");
+        return;
+    }
+
     qts = qtest_init(MACHINE "-cpu max");
 
     /* Test common query-cpu-model-expansion input validation */
-- 
2.35.3


