Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B260E53E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 18:09:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oniuM-0003EJ-LV; Wed, 26 Oct 2022 12:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oniuF-00034Q-Ph
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 12:05:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oniuE-0003Rg-0L
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 12:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666800325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JtuyE+/JhAwvLcTl5IV1s7J0KPJe3lRgENyKzlR0B2k=;
 b=Vul4V4Z/3l/5MxLCsELhKP/nXke09nZo3tNIzjH/4uIqhEHN0VZdSjG7famJAXcPfX0V7k
 sWjePVVVPi5q5LYLS+gQtjhIDH+ID25eLBNRzbM6ySTa4GIoCI+dMQxcD9hlDU6exO7RAW
 +3/R/HH9RvasSsaMO5EORTD9rjSuckk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-y71F_LfVOISmnaMCOxXvxQ-1; Wed, 26 Oct 2022 12:05:21 -0400
X-MC-Unique: y71F_LfVOISmnaMCOxXvxQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 075701C0BC60;
 Wed, 26 Oct 2022 16:05:21 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50A68C15BAB;
 Wed, 26 Oct 2022 16:05:19 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 2/2] qtests/arm: add some mte tests
Date: Wed, 26 Oct 2022 18:05:11 +0200
Message-Id: <20221026160511.37162-3-cohuck@redhat.com>
In-Reply-To: <20221026160511.37162-1-cohuck@redhat.com>
References: <20221026160511.37162-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 76 ++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 5a145273860c..e264d2178a8b 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -22,6 +22,7 @@
 
 #define MACHINE     "-machine virt,gic-version=max -accel tcg "
 #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
+#define MACHINE_MTE "-machine virt,gic-version=max,mte=on -accel tcg "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
@@ -155,6 +156,18 @@ static bool resp_get_feature(QDict *resp, const char *feature)
     g_assert(qdict_get_bool(_props, feature) == (expected_value));     \
 })
 
+#define resp_assert_feature_str(resp, feature, expected_value)         \
+({                                                                     \
+    QDict *_props;                                                     \
+                                                                       \
+    g_assert(_resp);                                                   \
+    g_assert(resp_has_props(_resp));                                   \
+    _props = resp_get_props(_resp);                                    \
+    g_assert(qdict_get(_props, feature));                              \
+    g_assert_cmpstr(qdict_get_try_str(_props, feature), ==,            \
+                    expected_value);                                   \
+})
+
 #define assert_feature(qts, cpu_type, feature, expected_value)         \
 ({                                                                     \
     QDict *_resp;                                                      \
@@ -165,6 +178,16 @@ static bool resp_get_feature(QDict *resp, const char *feature)
     qobject_unref(_resp);                                              \
 })
 
+#define assert_feature_str(qts, cpu_type, feature, expected_value)     \
+({                                                                     \
+    QDict *_resp;                                                      \
+                                                                       \
+    _resp = do_query_no_props(qts, cpu_type);                          \
+    g_assert(_resp);                                                   \
+    resp_assert_feature_str(_resp, feature, expected_value);           \
+    qobject_unref(_resp);                                              \
+})
+
 #define assert_set_feature(qts, cpu_type, feature, value)              \
 ({                                                                     \
     const char *_fmt = (value) ? "{ %s: true }" : "{ %s: false }";     \
@@ -176,6 +199,16 @@ static bool resp_get_feature(QDict *resp, const char *feature)
     qobject_unref(_resp);                                              \
 })
 
+#define assert_set_feature_str(qts, cpu_type, feature, value, _fmt)    \
+({                                                                     \
+    QDict *_resp;                                                      \
+                                                                       \
+    _resp = do_query(qts, cpu_type, _fmt, feature);                    \
+    g_assert(_resp);                                                   \
+    resp_assert_feature_str(_resp, feature, value);                    \
+    qobject_unref(_resp);                                              \
+})
+
 #define assert_has_feature_enabled(qts, cpu_type, feature)             \
     assert_feature(qts, cpu_type, feature, true)
 
@@ -412,6 +445,24 @@ static void sve_tests_sve_off_kvm(const void *data)
     qtest_quit(qts);
 }
 
+static void mte_tests_tag_memory_on(const void *data)
+{
+    QTestState *qts;
+
+    qts = qtest_init(MACHINE_MTE "-cpu max");
+
+    /*
+     * With tag memory, "mte" should default to on, and explicitly specifying
+     * either on or off should be fine.
+     */
+    assert_has_feature(qts, "max", "mte");
+
+    assert_set_feature_str(qts, "max", "mte", "off", "{ 'mte': 'off' }");
+    assert_set_feature_str(qts, "max", "mte", "on", "{ 'mte': 'on' }");
+
+    qtest_quit(qts);
+}
+
 static void pauth_tests_default(QTestState *qts, const char *cpu_type)
 {
     assert_has_feature_enabled(qts, cpu_type, "pauth");
@@ -424,6 +475,21 @@ static void pauth_tests_default(QTestState *qts, const char *cpu_type)
                  "{ 'pauth': false, 'pauth-impdef': true }");
 }
 
+static void mte_tests_default(QTestState *qts, const char *cpu_type)
+{
+    assert_has_feature(qts, cpu_type, "mte");
+
+    /*
+     * Without tag memory, mte will be off under tcg.
+     * Explicitly enabling it yields an error.
+     */
+    assert_has_feature(qts, cpu_type, "mte");
+
+    assert_set_feature_str(qts, "max", "mte", "off", "{ 'mte': 'off' }");
+    assert_error(qts, cpu_type, "mte=on requires tag memory",
+                 "{ 'mte': 'on' }");
+}
+
 static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
@@ -473,6 +539,7 @@ static void test_query_cpu_model_expansion(const void *data)
 
         sve_tests_default(qts, "max");
         pauth_tests_default(qts, "max");
+        mte_tests_default(qts, "max");
 
         /* Test that features that depend on KVM generate errors without. */
         assert_error(qts, "max",
@@ -516,6 +583,13 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         assert_set_feature(qts, "host", "pmu", false);
         assert_set_feature(qts, "host", "pmu", true);
 
+        /*
+         * Unfortunately, there's no easy way to test whether this instance
+         * of KVM supports MTE. So we can only assert that the feature
+         * is present, but not whether it can be toggled.
+         */
+        assert_has_feature(qts, "host", "mte");
+
         /*
          * Some features would be enabled by default, but they're disabled
          * because this instance of KVM doesn't support them. Test that the
@@ -630,6 +704,8 @@ int main(int argc, char **argv)
                             NULL, sve_tests_sve_off);
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
                             NULL, sve_tests_sve_off_kvm);
+        qtest_add_data_func("/arm/max/query-cpu-model-expansion/tag-memory",
+                            NULL, mte_tests_tag_memory_on);
     }
 
     return g_test_run();
-- 
2.37.3


