Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F44475DEF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:56:28 +0100 (CET)
Received: from localhost ([::1]:51462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXZr-0005G9-Tk
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:56:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXTH-0004ar-BU
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXTE-00020j-FD
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639586975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D0SkCPb2Wszbwa3QNykXiWoYzTzgco57XfQsArolZfs=;
 b=J91PyIGIwQy7gG1RvFUcLPXMlgQF67+xhYx4zzANuO/X4WzfsfByITqhmz82eDFvux8KF6
 l7xt0ZDRoY215TZ6ijHPGeixXsK0r+nnsDEGgB9tUns7zYXSlFOFSWYu73krq1/FlQxOR3
 wk9O6IqjyjDQidYJNFJCk0B568xy8Nc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-Os1MyDdYNJWaeluRUwAAkw-1; Wed, 15 Dec 2021 11:49:34 -0500
X-MC-Unique: Os1MyDdYNJWaeluRUwAAkw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h12-20020adfa4cc000000b001a22dceda69so777984wrb.16
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 08:49:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D0SkCPb2Wszbwa3QNykXiWoYzTzgco57XfQsArolZfs=;
 b=OEgGXvcgHeQptHys1EAW6t2Wy6LtmAG6QgCA51B2wr4+LKvOp7jH/F0Sl/kM+fejrp
 8m6wL+Szte6LyPaJRNV6mpppIWRbnSLX1wiQDSsrmmb6QrEYUv0KYJPMAH8CGXp+exme
 WMWc7wXf+3C/NuFVsfFYvQI0h1eLYJlwxaPMoezisFWsSmSXZaCI6g/n65rQ/iGGTS+R
 FZ+FGzwJXU2nN5zR3R1dQG28GyrztU2/D+c/PRoEhZyRMy6ozUL/XyojNY9aRL2eEFwk
 8ZkMRpuu9QKxRaxh+vGOCz0ii5mXIPWT7FATCk7v546b1M8Db3no+xzjRU9WsqBSoJWn
 UcVg==
X-Gm-Message-State: AOAM531CfBybX18RYo91VK5atGdYb7mhn7Hiwsoafwe2H29X0Pu09yCe
 BylB7z0JvSMukKV73MRLUIQm0bthMqTEMvvWi3utA9TxzhJdNEk9kYGEyOaHShkrU55Bpauc2qi
 RanICan1jjSrw0TL8ZmwG9vHaB6Bxbfr0ERWewa226uoxMReIRvpZeOukZ4ZYA8Kc
X-Received: by 2002:a7b:c2f7:: with SMTP id e23mr743156wmk.92.1639586972635;
 Wed, 15 Dec 2021 08:49:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUh5gt6K62qDoWHEvtRipwUyEYToY0j/sL2PlV2cCMr4cBHVx4QqF22sqe8KUvvvqZF0MTjw==
X-Received: by 2002:a7b:c2f7:: with SMTP id e23mr743129wmk.92.1639586972422;
 Wed, 15 Dec 2021 08:49:32 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o64sm2480926wme.28.2021.12.15.08.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:49:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 6/8] tests/unit/test-smp-parse: Simplify pointer to
 compound literal use
Date: Wed, 15 Dec 2021 17:48:54 +0100
Message-Id: <20211215164856.381990-7-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215164856.381990-1-philmd@redhat.com>
References: <20211215164856.381990-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
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
---
 tests/unit/test-smp-parse.c | 66 ++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 5349ae14824..251c83c60c2 100644
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


