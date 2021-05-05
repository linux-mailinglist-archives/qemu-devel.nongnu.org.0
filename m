Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5B8373C0B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:11:39 +0200 (CEST)
Received: from localhost ([::1]:36202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHJS-00085z-RR
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH71-0001bE-AF
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:58:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH6z-000445-Dz
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620219524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
 b=evCaIk8ADb1YVnta9R+cHvKmPefRYvHc1Kqt1KwzdP0KxbQrHYlc2wLd2/G3Qqxu5TFduQ
 bPvG750gciu5c6w7C2LVRPHEi1FZ5ydlKUlC1yXs4dV8yLQcSukDVSJyrNIq8goBjeyFyl
 i6HmYYKM4ycWqp0dNVNx1Ykp+tflaDg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-AC2AD3rCP7eIj_nUpNYkig-1; Wed, 05 May 2021 08:58:43 -0400
X-MC-Unique: AC2AD3rCP7eIj_nUpNYkig-1
Received: by mail-wr1-f70.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so654560wrl.20
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
 b=prcRRfjIdlbsUexD8ULfTYR6bNRcN/c23ZynrO8khGhtpncElT53FTbIZabKBQaW81
 qe1eHdhfgkc9o/LP2k0dWOXi3h0oC3HaHYHAZQi5QOHq5sqYRLSZrQ2rKuRKQ+jg1p2k
 oekDMDCMFNz+5XrJVcHvxbr/mNkisUMVPdkP7hphfHF9rTZZjTJCjiWTUbMhuPRPc4+U
 0ZhwSAHCCZXMRBwWPB9muZF/NlkBRZ8v5c5yCwZ23MuqgwqFmzG+ToMxEDxgD1UDoR63
 Q7c4N8rkqND7lXV6g9lWYimRIZomkNpttuyKruU2VE65PNzHotECDmL11gvvlmJVAHVs
 JGnQ==
X-Gm-Message-State: AOAM532yDl2q/3N8ayQTH3mkbfWjesLDZ8nD2KksS1ed1REMmfk7wttm
 cYQt/J/8LChZorKvutQJNUziwHpn79LK2Rikvg3fEro/DCeWAeWUpN1FKNsIkI/VZ2TGLG03Bi+
 R5nUJ7pdyqT36R0TtUqYdiuD5p41xjpQQRS9IERNhSq1CsKisAAVurLQN+/68IhHN
X-Received: by 2002:adf:d215:: with SMTP id j21mr39288725wrh.251.1620219522148; 
 Wed, 05 May 2021 05:58:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9hjisKNeCuPYpd6jymyhVYMLdeGguTG09aIqsY4w6QD4/OlmTTHpWvr9iyG1tGOychlV7nA==
X-Received: by 2002:adf:d215:: with SMTP id j21mr39288699wrh.251.1620219521951; 
 Wed, 05 May 2021 05:58:41 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id b8sm20053235wrx.15.2021.05.05.05.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 05:58:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/12] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for TCG
Date: Wed,  5 May 2021 14:58:01 +0200
Message-Id: <20210505125806.1263441-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505125806.1263441-1-philmd@redhat.com>
References: <20210505125806.1263441-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, only run these tests if TCG
is built into the QEMU binary.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index b1d406542f7..0d9145dd168 100644
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
@@ -337,7 +337,7 @@ static void sve_tests_sve_max_vq_8(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
+    qts = qtest_init(MACHINE_TCG "-cpu max,sve-max-vq=8");
 
     assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
 
@@ -372,7 +372,7 @@ static void sve_tests_sve_off(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max,sve=off");
+    qts = qtest_init(MACHINE_TCG "-cpu max,sve=off");
 
     /* SVE is off, so the map should be empty. */
     assert_sve_vls(qts, "max", 0, NULL);
@@ -428,7 +428,7 @@ static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max");
+    qts = qtest_init(MACHINE_TCG "-cpu max");
 
     /* Test common query-cpu-model-expansion input validation */
     assert_type_full(qts);
@@ -593,8 +593,10 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
-    qtest_add_data_func("/arm/query-cpu-model-expansion",
-                        NULL, test_query_cpu_model_expansion);
+    if (qtest_has_accel("tcg")) {
+        qtest_add_data_func("/arm/query-cpu-model-expansion",
+                            NULL, test_query_cpu_model_expansion);
+    }
 
     /*
      * For now we only run KVM specific tests with AArch64 QEMU in
@@ -608,7 +610,7 @@ int main(int argc, char **argv)
                             NULL, sve_tests_sve_off_kvm);
     }
 
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("tcg")) {
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-max-vq-8",
                             NULL, sve_tests_sve_max_vq_8);
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
-- 
2.26.3


