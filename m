Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DC4338147
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:16:19 +0100 (CET)
Received: from localhost ([::1]:53052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKUXS-0006vR-Ij
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUU1-0001oS-HT
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTr-00056i-Dj
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615504354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RFAPWPzF+QVyifcBwUCcpdXWMGqVbGgf494aIhQQBM4=;
 b=Fj5KZ8A9mzB/XasUNwnzUuKqdtmWaFuJgXQvNa9YGUwq8HAlvasCYH6Ts1nlY48+vRL4U0
 AjxULgU6TqKvR334RCqh8hLTsgNwC3l9xN+J39I2voL8TnM3vUxAExCbv9GXnE0EjEO4jr
 CmuBRrn4i8+EiVSmeLHdK1e2ycxfkKk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-4Wqt5vycOwu2FOk61MCbDw-1; Thu, 11 Mar 2021 18:12:33 -0500
X-MC-Unique: 4Wqt5vycOwu2FOk61MCbDw-1
Received: by mail-wr1-f72.google.com with SMTP id m23so5228623wrh.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 15:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RFAPWPzF+QVyifcBwUCcpdXWMGqVbGgf494aIhQQBM4=;
 b=p3DumM+m6RalYurbad7lrvYtA+oyb1NB3oUCyNuXnleisTsUKv7ZKIQHR0bjKdCtdk
 5qAAtmqZ04YkRH2Dsy9he/mG86LPMv9sKe6tU4/4a9JHnlbBUwuriTuRTwXA+yfclsLm
 NgZDc+UWzXhtCuUeLJ2zWyveClRyLR7+MKfVSCnbyjrfLKSfZhihRXlV1oB7DAvIOt2E
 RwdhtBdDMvuPihfLU967gES6115pLS0cORFpogBTJJ9WExwF/WMuD7+OYVfR1wc6Ssd4
 ThPpObp5AYcRESAKu16hU1aZFjIy876d9/6MZY8wWKOghONW116OEhqj8w1UwORzmN/Z
 BaYw==
X-Gm-Message-State: AOAM530TmxLSKbiPoBa9qy8XDSA62LmPVo6sVrSK+fFgVl3F9JdEnB4c
 pQ+qr7lp07xMCCDcKqd6vc1c1JQSQY7LP5eK8zm6DewLJ5R1WpRTmcRuf2Pia85/KvMBSfcWWNq
 CZgWWNB9rQrQlDw5qV8EBw+KY5fCwSXPFK89mbJ1gq/aYDzwaQraWfPnA4hbjoP8G
X-Received: by 2002:adf:a2cf:: with SMTP id t15mr11421892wra.250.1615504351838; 
 Thu, 11 Mar 2021 15:12:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQHPfYI7RPFM7ojwKpQ4LZ+KuOHHkUYjLR4IZIvh+wazRrJ+xdJwFFOJ/N6jrFtTYp33EOEw==
X-Received: by 2002:adf:a2cf:: with SMTP id t15mr11421869wra.250.1615504351689; 
 Thu, 11 Mar 2021 15:12:31 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d13sm6037274wro.23.2021.03.11.15.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:12:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Claudio Fontana <cfontana@suse.de>
Subject: [PATCH 5/6] qtest/arm-cpu-features: Check TCG availability at runtime
Date: Fri, 12 Mar 2021 00:12:01 +0100
Message-Id: <20210311231202.1536040-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311231202.1536040-1-philmd@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, skip these TCG specific tests
when TCG is not built into the QEMU binary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 2b70104515d..7acdccd10ef 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -20,7 +20,7 @@
  */
 #define SVE_MAX_VQ 16
 
-#define MACHINE     "-machine virt,gic-version=max -accel tcg "
+#define MACHINE_TCG "-machine virt,gic-version=max -accel tcg "
 #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
@@ -352,7 +352,11 @@ static void sve_tests_sve_max_vq_8(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
+    qts = qtest_init(MACHINE_TCG "-cpu max,sve-max-vq=8");
+    if (!qtest_probe_accel(qts, "tcg")) {
+        g_test_skip("TCG not available, skipping test");
+        goto done;
+    }
 
     assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
 
@@ -380,6 +384,7 @@ static void sve_tests_sve_max_vq_8(const void *data)
     assert_sve_vls(qts, "max", 0xff, "{ 'sve256': true }");
     assert_error(qts, "max", "cannot disable sve256", "{ 'sve256': false }");
 
+done:
     qtest_quit(qts);
 }
 
@@ -387,7 +392,11 @@ static void sve_tests_sve_off(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max,sve=off");
+    qts = qtest_init(MACHINE_TCG "-cpu max,sve=off");
+    if (!qtest_probe_accel(qts, "tcg")) {
+        g_test_skip("TCG not available, skipping test");
+        goto done;
+    }
 
     /* SVE is off, so the map should be empty. */
     assert_sve_vls(qts, "max", 0, NULL);
@@ -405,6 +414,7 @@ static void sve_tests_sve_off(const void *data)
     assert_sve_vls(qts, "max", 0x3,
                    "{ 'sve': true, 'sve128': true, 'sve256': true }");
 
+done:
     qtest_quit(qts);
 }
 
@@ -448,7 +458,11 @@ static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max");
+    qts = qtest_init(MACHINE_TCG "-cpu max");
+    if (!qtest_probe_accel(qts, "tcg")) {
+        g_test_skip("TCG not available, skipping test");
+        goto done;
+    }
 
     /* Test common query-cpu-model-expansion input validation */
     assert_type_full(qts);
@@ -489,6 +503,7 @@ static void test_query_cpu_model_expansion(const void *data)
                      "{ 'aarch64': false }");
     }
 
+done:
     qtest_quit(qts);
 }
 
-- 
2.26.2


