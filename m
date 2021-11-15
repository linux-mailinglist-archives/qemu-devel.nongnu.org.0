Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30864507F5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:11:28 +0100 (CET)
Received: from localhost ([::1]:40634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmddn-0003Ve-P8
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:11:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSf-00082i-Ff
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdST-000084-2i
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qrzT/vnokZ3nh9S7J+fR3Ca5gL/K7rOLc2Ix6PJKjc=;
 b=RxosOmOMseojs0qHhCh55Np6+gCbfo1uCJM4Ygk+/Iyt+8K4vcSHL+VebQokvYZqu6qljd
 NIIxkAVJP4Q4YysgWODv38fMdDdbC+L1vGVDspcpj/vGwrDrdSihzr0OdJIQ0Uqa1OAtms
 3K4CkSIPGTljRWRvnOsh2fOEle/1oBQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-hJlYuoBfNjipk9xC1yCHOA-1; Mon, 15 Nov 2021 09:59:43 -0500
X-MC-Unique: hJlYuoBfNjipk9xC1yCHOA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l187-20020a1c25c4000000b0030da46b76daso9723222wml.9
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:59:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7qrzT/vnokZ3nh9S7J+fR3Ca5gL/K7rOLc2Ix6PJKjc=;
 b=DkYgh5wkqdyQPEL9g3Og7YoUsgt/qZFceSgvx8sMh1a9cESbjGMKTo/+qcbUPz2PP0
 om+8lmkulLRZ1z1AfCW+zNQaFgHRKseOs/dXvFVoG/NA8QGRnRy7jQGvyi9kXVYCSxHF
 KMoDIhE8c2ISChzXhV8HXa/glRBVj5dst+/IoB+kZ7/BqPfFNO6Oisf7eXX4nforPYwV
 tgRVuF5aF8wEP8Cvs7Sc4+R6l91AdeSVNvnj90vlnlwTLx9aLGWy5sy1wGCg9dCMHTyp
 L3h94h1zsaYanD0V4YWRTFiNwm2XQ0zFEeahUkKonEa+JOY9xPjaU6Z1uqKQCOtX3alX
 ygBg==
X-Gm-Message-State: AOAM533BBoLDNNKvtOXV1iS+a5lRg6lb2xp8HLUfgrv7ygaH8CzRm7LM
 MSw+yls0vg/Tn9C+QyjNWBNDpjy718gm6GFKKSgQHlTu+v4jLQ9k/aYLfnF29EJ+6GPcJs71xAq
 12fHQByh+gNpNzkZjsHtPDKfZFP9UdOFyTfjDIAzPOAgEnzRIsqo+e89x7qb48j5K
X-Received: by 2002:a1c:448b:: with SMTP id r133mr60991518wma.85.1636988381983; 
 Mon, 15 Nov 2021 06:59:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykDunek8iQ6DRO/1a7gbv8dm/sXnTEje1uFEdMxUcwqTlr0/Y4tcY1g6TJ2uU2BGzyKxPDvA==
X-Received: by 2002:a1c:448b:: with SMTP id r133mr60991475wma.85.1636988381663; 
 Mon, 15 Nov 2021 06:59:41 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 4sm18966325wrz.90.2021.11.15.06.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:59:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 v4 09/11] tests/unit/test-smp-parse: Simplify pointer
 to compound literal use
Date: Mon, 15 Nov 2021 15:58:58 +0100
Message-Id: <20211115145900.2531865-10-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115145900.2531865-1-philmd@redhat.com>
References: <20211115145900.2531865-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>,
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
index 90a249fe8c8..2f3bcf198a5 100644
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
2.31.1


