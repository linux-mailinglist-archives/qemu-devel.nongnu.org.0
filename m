Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2189451854
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 23:55:50 +0100 (CET)
Received: from localhost ([::1]:34856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmktB-00065t-Uf
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 17:55:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkm1-0004j4-S5
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:48:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkly-0004MX-0A
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637016496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nEd/ygkIQTZNVKYYqfDQ3gUYWshnM+QoFjlZKizg/LY=;
 b=Yz/p0uzuKSQjQNsJn6vl1gzkXrjpZl7KPHE9oAP/RUrpfEjNLIxGFtb8oKNti5hv/SuZM7
 oLQOs2HJCeUlrua0Mm146+9cuhMz5K0+FJ1dxNEsinoQUI2PAzhd5FS/nN2AsUyC3fM4gy
 UvkHhBKY6/WbCY7RD+BofAYs6x8hNMA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-akGX2gHgOICIQeU2mS3Xzw-1; Mon, 15 Nov 2021 17:48:14 -0500
X-MC-Unique: akGX2gHgOICIQeU2mS3Xzw-1
Received: by mail-wm1-f69.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso244294wme.8
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 14:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nEd/ygkIQTZNVKYYqfDQ3gUYWshnM+QoFjlZKizg/LY=;
 b=525IHFgzwJzsb0KKDi//xhwZ5ymmbEOuvNEC4cI7YIs3a8qNqyaJk6yzEQMOGI970k
 QoGfIerTw8FI0uKi+AsrPzu/EsYDSxFIZOwDiAOi/MEfJ7Dqngg+HqQrWt6HtSX4uhP2
 q9fqSPcxuRr9B4G5zy80EHm3sKL38RL0EtWiEFZ2TDYr+mffi+TN+sn3LfH67xEZCJLM
 0fTQh7n+bhuNlA3BIiOKRhbSQiPIk1Ijkxedrb4pxGp+XXyH3+2Wz6ctWcJyOVueLSlC
 YrsI+Dlnz+jiiUf1G+Wy1TM3FKxcaUuF8S38dnYasVIJbhybWuXMNSY69rxuiIlb5XLM
 ebnw==
X-Gm-Message-State: AOAM530ngAf0+5fw4rmvDctkYJcJs9qKZN2dObhbXO/OZAEA/9PpC214
 ZB46l7vhnQpdxdaAylOdOX0h8S1dg6KSMwBKbIVS6WTRg7J3w+v7VzEqrJAbg7ddkk2eXT7jOeQ
 5INsQ+qNMqUn1R+U1lzJZEa038YKIYEUv76TcdVzYOOew5gjNZcClzxZO5fBmmNPr
X-Received: by 2002:a05:6000:1813:: with SMTP id
 m19mr3265248wrh.51.1637016493375; 
 Mon, 15 Nov 2021 14:48:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlw6Spi22UL5K2B0CXJ+L1BIp50mO4OVEhJnoBZMR8wfvCTeavkZcHpNbKuDxei2CobzlXqw==
X-Received: by 2002:a05:6000:1813:: with SMTP id
 m19mr3265194wrh.51.1637016492993; 
 Mon, 15 Nov 2021 14:48:12 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 n32sm569230wms.42.2021.11.15.14.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 14:48:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] tests/unit/test-smp-parse: QOM'ify smp_machine_class_init()
Date: Mon, 15 Nov 2021 23:48:01 +0100
Message-Id: <20211115224802.2602894-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115224802.2602894-1-philmd@redhat.com>
References: <20211115224802.2602894-1-philmd@redhat.com>
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
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

smp_machine_class_init() is the actual TypeInfo::class_init().
Declare it as such in smp_machine_info, and avoid to call it
manually in each test. Move smp_machine_info definition just
before we register the type to avoid a forward declaration.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211115145900.2531865-3-philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 47774c1ee2a..3fff2af4e27 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -75,14 +75,6 @@ typedef struct SMPTestData {
     const char *expect_error;
 } SMPTestData;
 
-/* Type info of the tested machine */
-static const TypeInfo smp_machine_info = {
-    .name = TYPE_MACHINE,
-    .parent = TYPE_OBJECT,
-    .class_size = sizeof(MachineClass),
-    .instance_size = sizeof(MachineState),
-};
-
 /*
  * List all the possible valid sub-collections of the generic 5
  * topology parameters (i.e. cpus/maxcpus/sockets/cores/threads),
@@ -480,9 +472,10 @@ static void unsupported_params_init(MachineClass *mc, SMPTestData *data)
     }
 }
 
-/* Reset the related machine properties before each sub-test */
-static void smp_machine_class_init(MachineClass *mc)
+static void machine_base_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->min_cpus = MIN_CPUS;
     mc->max_cpus = MAX_CPUS;
 
@@ -498,8 +491,6 @@ static void test_generic(void)
     SMPTestData *data = &(SMPTestData){{ }};
     int i;
 
-    smp_machine_class_init(mc);
-
     for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
         *data = data_generic_valid[i];
         unsupported_params_init(mc, data);
@@ -539,7 +530,6 @@ static void test_with_dies(void)
     unsigned int num_dies = 2;
     int i;
 
-    smp_machine_class_init(mc);
     /* Force the SMP compat properties */
     mc->smp_props.dies_supported = true;
 
@@ -586,12 +576,24 @@ static void test_with_dies(void)
     object_unref(obj);
 }
 
+/* Type info of the tested machine */
+static const TypeInfo smp_machine_types[] = {
+    {
+        .name           = TYPE_MACHINE,
+        .parent         = TYPE_OBJECT,
+        .class_init     = machine_base_class_init,
+        .class_size     = sizeof(MachineClass),
+        .instance_size  = sizeof(MachineState),
+    }
+};
+
+DEFINE_TYPES(smp_machine_types)
+
 int main(int argc, char *argv[])
 {
-    g_test_init(&argc, &argv, NULL);
-
     module_call_init(MODULE_INIT_QOM);
-    type_register_static(&smp_machine_info);
+
+    g_test_init(&argc, &argv, NULL);
 
     g_test_add_func("/test-smp-parse/generic", test_generic);
     g_test_add_func("/test-smp-parse/with_dies", test_with_dies);
-- 
2.31.1


