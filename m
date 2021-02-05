Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA918310CB5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:50:14 +0100 (CET)
Received: from localhost ([::1]:37774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82R3-00005s-UX
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82Lj-0003Ia-Cs; Fri, 05 Feb 2021 09:44:43 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:32938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82Lg-0002bB-NP; Fri, 05 Feb 2021 09:44:43 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c6so9109472ede.0;
 Fri, 05 Feb 2021 06:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gjWjrkoo9fwMU9Sch1mUKkw5VscVbA8NCnnTZX/2IUQ=;
 b=YfbL3wd7WIFvDX66J6x/emlBwMT1vunccIADjGH5sA4zJ/cFFH+CrHhF7uOUJBg664
 JZMOaMoGEKYIXEX6q6Dv3gnJCQwTdw98g/8Uh4Zf9GdgGTPkDZz0KPypUwra1LHb2608
 nvejPdqhCSGmvdDxA2ZSwlOtqiuorJgOM1Ia2etQUCTLYQIU+vUKfGCTXAsTHKm80/62
 X1mrFC7nqOdzl1YEpve4azx4vA/4JKMHno6PCGoUzxFl2KK8n7lJwAPqG3QNOmgm5fl6
 2Hxls14icc2CsOCssTn0V1furNTPQIOa0nVvbO+prPo9EQudmofNp9WJXUAV246yKH9c
 iEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gjWjrkoo9fwMU9Sch1mUKkw5VscVbA8NCnnTZX/2IUQ=;
 b=l78Ovalr6my6hWGs/Vq2PlRdZVnkvfpz0BaVmJZsJiU4IVSu/LjoHklNtj83i2+HLA
 QV2f41cpc1d2DQ5FHR10zznSJgJcAzYEO8jVrP3+dyJ2lteFw1RXIWZAhJTh3rbO8E5G
 Wn2VZG//QYIfv2vYeS81pdndOnpbh7VH74hDpkdXY3nzeq5YBE3DouP5eRSBZBWpMtVy
 qMpfj9/vEuJtBB3nlg41Ya9SSNGmM48ABwbvAqgoNBHuNQ4UAoNuv4QewBiQwpGQj3WJ
 9aLrRWP8GOmTS3w++lY+reT7eajBmQRhzekDATGjtZogMclI6kIRoAfCc9eMQISVeHXf
 kFcg==
X-Gm-Message-State: AOAM530Zjhk1S7HO/x7aGod11k3ayAu912sEsvau9r+7KeFtT3rbrESy
 okJgzbtewejGyODOfwngNqw5vcmF8Vw=
X-Google-Smtp-Source: ABdhPJxA0vKoza0E4rwkL255gG4NozbcAGeH9pTZfgqUu89/kfQHAHe/SMFvyoE4XELbfzLsNPM86A==
X-Received: by 2002:a05:6402:524f:: with SMTP id
 t15mr3755462edd.158.1612536278411; 
 Fri, 05 Feb 2021 06:44:38 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id hr3sm3883275ejc.41.2021.02.05.06.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:44:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 9/9] tests/qtest/arm-cpu-features: Restrict TCG-only tests
Date: Fri,  5 Feb 2021 15:43:45 +0100
Message-Id: <20210205144345.2068758-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some tests explicitly request the TCG accelerator. As these
tests will obviously fails if TCG is not present, disable
them in such case.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
Cc: Claudio Fontana <cfontana@suse.de>

RFC because of the TODO.

Roman posted a series to have a QMP command to query enabled
accelerators.
---
 tests/qtest/arm-cpu-features.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index c59c3cb002b..c6e86282b66 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -20,7 +20,7 @@
  */
 #define SVE_MAX_VQ 16
 
-#define MACHINE     "-machine virt,gic-version=max -accel tcg "
+#define MACHINE_TCG "-machine virt,gic-version=max -accel tcg "
 #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
@@ -41,6 +41,16 @@ static bool kvm_enabled(QTestState *qts)
     return enabled;
 }
 
+static bool tcg_enabled(QTestState *qts)
+{
+    /* TODO: Implement QMP query-accel? */
+#ifdef CONFIG_TCG
+    return true;
+#else
+    return false;
+#endif /* CONFIG_TCG */
+}
+
 static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
 {
     return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
@@ -352,7 +362,12 @@ static void sve_tests_sve_max_vq_8(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
+    qts = qtest_init(MACHINE_TCG "-cpu max,sve-max-vq=8");
+
+    if (!tcg_enabled(qts)) {
+        qtest_quit(qts);
+        return;
+    }
 
     assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
 
@@ -387,7 +402,12 @@ static void sve_tests_sve_off(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max,sve=off");
+    qts = qtest_init(MACHINE_TCG "-cpu max,sve=off");
+
+    if (!tcg_enabled(qts)) {
+        qtest_quit(qts);
+        return;
+    }
 
     /* SVE is off, so the map should be empty. */
     assert_sve_vls(qts, "max", 0, NULL);
@@ -443,7 +463,12 @@ static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max");
+    qts = qtest_init(MACHINE_TCG "-cpu max");
+
+    if (!tcg_enabled(qts)) {
+        qtest_quit(qts);
+        return;
+    }
 
     /* Test common query-cpu-model-expansion input validation */
     assert_type_full(qts);
-- 
2.26.2


