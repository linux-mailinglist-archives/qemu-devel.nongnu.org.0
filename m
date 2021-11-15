Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161E84507DC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:08:08 +0100 (CET)
Received: from localhost ([::1]:57996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdaZ-0004dB-7H
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:08:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdS0-0007Ec-SD
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdRy-0008Tv-So
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5aBWgeT8dX8n5hQ5ktoKDC7N22O1xIWSsGNqfC8T6cI=;
 b=FgZeXsQzy0dboNcELF4SMmz8l6U7qe7hgBzu36c5A1cKuhBDwysdJ94XYVXWegN9s5zvcd
 jnRvzRZIXB0W3ERNUzt6wwspUkdIypb8pPpO6kI2tUWIhOqSOhRiWXXzp0I/9uLQt7YgML
 uXrfWapT10kiW7bRAkdIqkR2phtAzPw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-nvaLh1M_N2GdwIxtHoznvg-1; Mon, 15 Nov 2021 09:59:12 -0500
X-MC-Unique: nvaLh1M_N2GdwIxtHoznvg-1
Received: by mail-wm1-f70.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so6309160wmg.9
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:59:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5aBWgeT8dX8n5hQ5ktoKDC7N22O1xIWSsGNqfC8T6cI=;
 b=OSV7pFUU/MrRf+QLnXPMdCvowxw0Nf4tVLXmspF2Fn7t7VJA8s49/VfqPl9iMKttdn
 F14kFY6ZzLt854SDjxZcq0IEjvws2oowmGHQZO81uS8OgXXA11MrK37vLjTzrbqDotG0
 Ma2XKDkpZv8OFm3EpY8aYaMZ8f8ZHx9uWBsjAMS8dPrP8lGr9+m2+82nWCfg1rHX+yo6
 lybuAqHAP19C1os463iHefk9hynW0bLPFuHKLoxyR42B/ojlCVQHluWBYxskop1fTGsD
 +H6RKOO1ZVFJvxkIXx3eyn5aIFRaxfpQQw0J60v8XksuPF+baNBofEzlJLq2+jj6abct
 hjYA==
X-Gm-Message-State: AOAM531hzIh8jcNuEM1uhyDgkkq54uogey1xFIfLOZFKPd+6ZvzRKXrU
 A5B46q6O7KjYJZLZbUinh0fKpfVhJsvU0zMytTjCSM2lG1MJ1KXFxD4LLRoTv65sPfy2CLCo27U
 JuEGCv/FDiVSI05mPqwUYK5IPT0JhiE/n+sgY9VEpqh2W+GR6WlHy2+EquHKGRnre
X-Received: by 2002:a5d:4704:: with SMTP id y4mr46850775wrq.85.1636988350799; 
 Mon, 15 Nov 2021 06:59:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5Sfp5AM6+xO0tVEMe/4po5R+MIwLeW8l/RmHHIhz5RGCmDJZPaa/VBr0hQVulmXgq8Vrr/A==
X-Received: by 2002:a5d:4704:: with SMTP id y4mr46850721wrq.85.1636988350453; 
 Mon, 15 Nov 2021 06:59:10 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l5sm13007464wml.20.2021.11.15.06.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:59:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v4 02/11] tests/unit/test-smp-parse: QOM'ify
 smp_machine_class_init()
Date: Mon, 15 Nov 2021 15:58:51 +0100
Message-Id: <20211115145900.2531865-3-philmd@redhat.com>
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

smp_machine_class_init() is the actual TypeInfo::class_init().
Declare it as such in smp_machine_info, and avoid to call it
manually in each test. Move smp_machine_info definition just
before we register the type to avoid a forward declaration.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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


