Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCD1482410
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:55:55 +0100 (CET)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HRq-00069v-OG
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:55:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKv-0006VN-8H
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKt-0000lo-3w
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHb0d47BqaQovUrZGLdCQsKap1jR8qeraBMow5jr+io=;
 b=UHG/oNExRHSAt39MTNr1surjs+x+RbaxDm8mIB27G9VCbunSCCRftUTJas5nrTNmfOKFpJ
 XuDylgNd75zqIzeTZqAHXev5xpgOZIukqI6YTsFkvU5SKpLvNjWunxaIUtFMXNJ9q/SUBq
 5rDyeHETwuBBFkyLDc++fcNbKe2oPcs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-ORoj_-2aOzyASskahBxKlg-1; Fri, 31 Dec 2021 07:48:41 -0500
X-MC-Unique: ORoj_-2aOzyASskahBxKlg-1
Received: by mail-wr1-f70.google.com with SMTP id
 q21-20020adfab15000000b001a24b36e47eso7487099wrc.2
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cHb0d47BqaQovUrZGLdCQsKap1jR8qeraBMow5jr+io=;
 b=tYWreeROPkh3U0bAFCIY6rev/T3DoZVohRAB8YZbvIwCbpSnUdjXoxcLDGRr+bVSvh
 Ve+whIJqcX3EBXGfbVE92G87X0MkA8jSBuJRYVUd1EUcGVKU/oqXFIZ1ezENwm6dlb0n
 xOS2AVB7IqdZMwSQQKv7NOcn4VKzNxMT85DXtyFaXq/CUmARkdWq6B/3QMDIQDsSzpeo
 jBZGFPnQX7EOJIRM46yG2Dkae2PZaptN2ZJlF8ZUhhcAe43V05vmhvbjbGNa/GrWQZjs
 YeOyE7/vsKLGGMTCHKleIX0k+qLKYUohDrcCRS3fmZW5til22pFC/w1MR0uIklJKCEwF
 cUgw==
X-Gm-Message-State: AOAM533hUwlwZitMAntlHTeDUySkOV4zW3oIXfpdVLRSPH/Th9tUR6+L
 RG3B+PJZS8tR3Kr6rncRLIBtO/vyD9c27wpRpp66WuEIpgg9UMH1GxXa99L6V/D6JyfSaLnUSHZ
 luUHJTeiqTs+8L/6yXXqnlk7XqszNy/P1PY5HsX9QALfgdaFG0+et2/z+CWgwV4+e
X-Received: by 2002:a5d:624f:: with SMTP id m15mr28453959wrv.13.1640954919494; 
 Fri, 31 Dec 2021 04:48:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8tV+HTVMllwUuNbaYaFtmIe6xnL7PYjuMrZsxJOvKNowv2IA3MlKADyRUi5fakEyReup9Wg==
X-Received: by 2002:a5d:624f:: with SMTP id m15mr28453947wrv.13.1640954919255; 
 Fri, 31 Dec 2021 04:48:39 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id m3sm26830443wrv.95.2021.12.31.04.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:48:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/20] tests/unit/test-smp-parse: Simplify pointer to compound
 literal use
Date: Fri, 31 Dec 2021 13:47:44 +0100
Message-Id: <20211231124754.1005747-11-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can simply use a local variable (and pass its pointer) instead
of a pointer to a compound literal.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211216132015.815493-7-philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 66 ++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index b20bf2c2359..395929b66cf 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -520,19 +520,19 @@ static void test_generic_valid(const void *opaque)
     Object *obj = object_new(machine_type);
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
-    SMPTestData *data = &(SMPTestData){{ }};
+    SMPTestData data = {};
     int i;
 
     for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
-        *data = data_generic_valid[i];
-        unsupported_params_init(mc, data);
+        data = data_generic_valid[i];
+        unsupported_params_init(mc, &data);
 
-        smp_parse_test(ms, data, true);
+        smp_parse_test(ms, &data, true);
 
         /* Unsupported parameters can be provided with their values as 1 */
-        data->config.has_dies = true;
-        data->config.dies = 1;
-        smp_parse_test(ms, data, true);
+        data.config.has_dies = true;
+        data.config.dies = 1;
+        smp_parse_test(ms, &data, true);
     }
 
     object_unref(obj);
@@ -544,14 +544,14 @@ static void test_generic_invalid(const void *opaque)
     Object *obj = object_new(machine_type);
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
-    SMPTestData *data = &(SMPTestData){};
+    SMPTestData data = {};
     int i;
 
     for (i = 0; i < ARRAY_SIZE(data_generic_invalid); i++) {
-        *data = data_generic_invalid[i];
-        unsupported_params_init(mc, data);
+        data = data_generic_invalid[i];
+        unsupported_params_init(mc, &data);
 
-        smp_parse_test(ms, data, false);
+        smp_parse_test(ms, &data, false);
     }
 
     object_unref(obj);
@@ -563,45 +563,45 @@ static void test_with_dies(const void *opaque)
     Object *obj = object_new(machine_type);
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
-    SMPTestData *data = &(SMPTestData){{ }};
+    SMPTestData data = {};
     unsigned int num_dies = 2;
     int i;
 
     for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
-        *data = data_generic_valid[i];
-        unsupported_params_init(mc, data);
+        data = data_generic_valid[i];
+        unsupported_params_init(mc, &data);
 
         /* when dies parameter is omitted, it will be set as 1 */
-        data->expect_prefer_sockets.dies = 1;
-        data->expect_prefer_cores.dies = 1;
+        data.expect_prefer_sockets.dies = 1;
+        data.expect_prefer_cores.dies = 1;
 
-        smp_parse_test(ms, data, true);
+        smp_parse_test(ms, &data, true);
 
         /* when dies parameter is specified */
-        data->config.has_dies = true;
-        data->config.dies = num_dies;
-        if (data->config.has_cpus) {
-            data->config.cpus *= num_dies;
+        data.config.has_dies = true;
+        data.config.dies = num_dies;
+        if (data.config.has_cpus) {
+            data.config.cpus *= num_dies;
         }
-        if (data->config.has_maxcpus) {
-            data->config.maxcpus *= num_dies;
+        if (data.config.has_maxcpus) {
+            data.config.maxcpus *= num_dies;
         }
 
-        data->expect_prefer_sockets.dies = num_dies;
-        data->expect_prefer_sockets.cpus *= num_dies;
-        data->expect_prefer_sockets.max_cpus *= num_dies;
-        data->expect_prefer_cores.dies = num_dies;
-        data->expect_prefer_cores.cpus *= num_dies;
-        data->expect_prefer_cores.max_cpus *= num_dies;
+        data.expect_prefer_sockets.dies = num_dies;
+        data.expect_prefer_sockets.cpus *= num_dies;
+        data.expect_prefer_sockets.max_cpus *= num_dies;
+        data.expect_prefer_cores.dies = num_dies;
+        data.expect_prefer_cores.cpus *= num_dies;
+        data.expect_prefer_cores.max_cpus *= num_dies;
 
-        smp_parse_test(ms, data, true);
+        smp_parse_test(ms, &data, true);
     }
 
     for (i = 0; i < ARRAY_SIZE(data_with_dies_invalid); i++) {
-        *data = data_with_dies_invalid[i];
-        unsupported_params_init(mc, data);
+        data = data_with_dies_invalid[i];
+        unsupported_params_init(mc, &data);
 
-        smp_parse_test(ms, data, false);
+        smp_parse_test(ms, &data, false);
     }
 
     object_unref(obj);
-- 
2.33.1


