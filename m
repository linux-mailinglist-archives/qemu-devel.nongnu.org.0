Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBDF6951FD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:37:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfVY-00076K-RV; Mon, 13 Feb 2023 15:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pRfVW-0006wl-3o; Mon, 13 Feb 2023 15:33:02 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pRfVU-0002oS-AW; Mon, 13 Feb 2023 15:33:01 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D5FB122353;
 Mon, 13 Feb 2023 20:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676320378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P2wIshjuiSQLiuLTFO2x8NqskzvrsEhNu8VusTOC9K4=;
 b=P8LA1Q6muj4rsV3jZTokEZoOjTgfgXRDFSj6teA/FTPaFgQAtm/YS0q1uerqv7w2sL6QG3
 Lg1gXiu6BQst8VSvZD86uxvwM3MtXkQm+o3Gq7WYHB8H4WfRHIGkKeCGZoFIJYRyFwXMuW
 +zorDIy19qzH8AeqPrIeT3n7u53PvOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676320378;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P2wIshjuiSQLiuLTFO2x8NqskzvrsEhNu8VusTOC9K4=;
 b=l76pd1HiXD1/GmcqpxvwSYvUAUUwFaCoYGCbnLjLsSdKJjuGuDGjjFDmsaThu7RdMeATVX
 ovnrL8NE6aq2dXCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F0C71391B;
 Mon, 13 Feb 2023 20:32:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IOCCCXee6mOVMwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:32:55 +0000
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
Subject: [PATCH RESEND v5 23/28] tests/qtest: arm-cpu-features: Match tests to
 required accelerators
Date: Mon, 13 Feb 2023 17:29:22 -0300
Message-Id: <20230213202927.28992-24-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 4ff2014bea..1555b0bab8 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -21,7 +21,7 @@
 #define SVE_MAX_VQ 16
 
 #define MACHINE     "-machine virt,gic-version=max -accel tcg "
-#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
+#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
@@ -613,31 +613,39 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
-    qtest_add_data_func("/arm/query-cpu-model-expansion",
-                        NULL, test_query_cpu_model_expansion);
+    if (qtest_has_accel("tcg")) {
+        qtest_add_data_func("/arm/query-cpu-model-expansion",
+                            NULL, test_query_cpu_model_expansion);
+    }
+
+    if (!g_str_equal(qtest_get_arch(), "aarch64")) {
+        goto out;
+    }
 
     /*
      * For now we only run KVM specific tests with AArch64 QEMU in
      * order avoid attempting to run an AArch32 QEMU with KVM on
      * AArch64 hosts. That won't work and isn't easy to detect.
      */
-    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
+    if (qtest_has_accel("kvm")) {
         /*
          * This tests target the 'host' CPU type, so register it only if
          * KVM is available.
          */
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
+
+        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
+                            NULL, sve_tests_sve_off_kvm);
     }
 
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+    if (qtest_has_accel("tcg")) {
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-max-vq-8",
                             NULL, sve_tests_sve_max_vq_8);
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
                             NULL, sve_tests_sve_off);
-        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
-                            NULL, sve_tests_sve_off_kvm);
     }
 
+out:
     return g_test_run();
 }
-- 
2.35.3


