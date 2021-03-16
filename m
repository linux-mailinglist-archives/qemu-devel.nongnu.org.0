Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A833DE11
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:48:33 +0100 (CET)
Received: from localhost ([::1]:38978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMFg8-00039x-5V
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMEZk-00026z-Rn
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:37:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:36182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMEZc-0007pG-SG
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:37:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6360FAF24;
 Tue, 16 Mar 2021 18:37:24 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v8 32/44] tests: restrict TCG-only arm-cpu-features tests to TCG
 builds
Date: Tue, 16 Mar 2021 19:36:50 +0100
Message-Id: <20210316183702.10216-33-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316183702.10216-1-cfontana@suse.de>
References: <20210316183702.10216-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sve_tests_sve_max_vq_8,
sve_tests_sve_off,
test_query_cpu_model_expansion

all require TCG to run. Skip them for KVM-only builds.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 tests/qtest/arm-cpu-features.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb8..e793bffcaa 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -352,6 +352,11 @@ static void sve_tests_sve_max_vq_8(const void *data)
 {
     QTestState *qts;
 
+#ifndef CONFIG_TCG
+    g_test_skip("TCG disabled, skipping tcg_only sve_tests_sve_max_vq_8");
+    return;
+#endif /* CONFIG_TCG */
+
     qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
 
     assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
@@ -387,6 +392,11 @@ static void sve_tests_sve_off(const void *data)
 {
     QTestState *qts;
 
+#ifndef CONFIG_TCG
+    g_test_skip("TCG disabled, skipping tcg_only sve_tests_sve_off");
+    return;
+#endif /* CONFIG_TCG */
+
     qts = qtest_init(MACHINE "-cpu max,sve=off");
 
     /* SVE is off, so the map should be empty. */
@@ -443,6 +453,11 @@ static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
 
+#ifndef CONFIG_TCG
+    g_test_skip("TCG disabled, skipping tcg_only test_query_cpu_model_expansion");
+    return;
+#endif /* CONFIG_TCG */
+
     qts = qtest_init(MACHINE "-cpu max");
 
     /* Test common query-cpu-model-expansion input validation */
-- 
2.26.2


