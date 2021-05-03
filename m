Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A3B372250
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:16:56 +0200 (CEST)
Received: from localhost ([::1]:42766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldfvz-0002ed-Ef
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfqL-00051k-2O
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:11:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfqI-0007Hv-54
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:11:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620076261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
 b=F5FXOlmPK2fgT6VLjCs1MRfWS5JKZUfiileU/oNvFT1HQj3+TCZL14mxAqkMQNeRQtqf5E
 a/wrsSDQ8eDSUgQtttlMtf4ZfKrnipmndioCtSYauo8v40Fg4thPlBARzIFHwi75ba8c1p
 5UkVgN8yCI1F4o0lAxS+IrWw29Rv91c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-PNTe8jtiNwifXvBdYdAY6A-1; Mon, 03 May 2021 17:11:00 -0400
X-MC-Unique: PNTe8jtiNwifXvBdYdAY6A-1
Received: by mail-wr1-f69.google.com with SMTP id
 i102-20020adf90ef0000b029010dfcfc46c0so1415117wri.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
 b=Ih8gthRvq3wyF9U3QZB0hgGAVnTac/gzvUGeDxkIhPBVj+Rj6oM4U71FjET+UiPs3v
 WyQ+2KuKL+tzI78xk0qw7dixvi6ItX7rigO7Wg6MigSoxxk65aN2segsD9j7y+Kaoe66
 9rwMP+YcQwxmCcACKdpn2N/xKz92LyAkd81+ZuBIHSO7vbwTu6x3dBXMJWN0k5a6ToRG
 dKgFE9YXcUa33vfKSfl9yCq3VufG5IGTsG1n5Ggus1ZmrViMF+DunhGb76ey10ZMHC4F
 Br2yXO0qOAdSTz7i321AYw1wo6iHiIhXRUzlba+SxfG0HqUwxVRlGnqE1FOv6XMpyG/a
 iSog==
X-Gm-Message-State: AOAM532TNQsIhTLPziY78uFsPld6Ietv+y2Drj/ng/qIq4fBsmxLYsSE
 TXiViF2MKbP3enktVRPBvtPyB/BvOOEMSC3kBZk4U/4D+yj7A/6C9gO+huDkXrvDaMeufSe1e8u
 gf8zOKeZoWA0O5gtZmQ6JF3TskSlmv6hVDtGFhdQCWfMtkSkTrbgD/VMU2+16EQSG
X-Received: by 2002:a05:600c:4a19:: with SMTP id
 c25mr23190389wmp.94.1620076258928; 
 Mon, 03 May 2021 14:10:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJAwBOXgq1yit/bRg+VltP7Pim7vlOp5vhcOsW+PMcjOuFA2L9Y3GNm/C1sqLVSMIAgEhFNQ==
X-Received: by 2002:a05:600c:4a19:: with SMTP id
 c25mr23190359wmp.94.1620076258718; 
 Mon, 03 May 2021 14:10:58 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id c2sm743435wmr.22.2021.05.03.14.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:10:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/12] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for TCG
Date: Mon,  3 May 2021 23:10:15 +0200
Message-Id: <20210503211020.894589-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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


