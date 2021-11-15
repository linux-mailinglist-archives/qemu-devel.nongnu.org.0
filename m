Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8204450826
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:21:25 +0100 (CET)
Received: from localhost ([::1]:34720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdnQ-0002B5-QT
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:21:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSO-0007oy-7h
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSL-00005O-8S
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2CcO+Z0iBapQD7/VeLORTYFY1zV22osrIJAVn0P+5js=;
 b=IWdQiMCQzRW2LM+ZoZlVGM9GqhybUJOKCU8Jr8hzvGBd9c54yaJdH/q9HNRCx5cGTYc3/2
 KCOQbHwNkOml/W/OHDGasdDGvejCr7cUdpgTmjtuHnOfGfrJY+ixdyPXMy/xpquDGlbZyZ
 nhsnS/wenYg2vCvDaFFHYHx36wIHWIA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-L2mNss_IOxmkzkCYvVmu8g-1; Mon, 15 Nov 2021 09:59:34 -0500
X-MC-Unique: L2mNss_IOxmkzkCYvVmu8g-1
Received: by mail-wr1-f69.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso3657050wrj.12
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:59:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2CcO+Z0iBapQD7/VeLORTYFY1zV22osrIJAVn0P+5js=;
 b=d5MTUFMxJHACW86p9RIc2Cd86m0bJoiFalcsfNcXOtksavzmAVpRldZ1k/MGEYFGUF
 ifogGIHyygHUD71U4MSmXvqIph+QtSCRPoRXNhHP64E/0XXEM2l2dm3sxYKgj3AZzWmS
 gbkxhKhtcaHcb3PHhAiPVYCKF5ST9GH1zI6rw5fwQOteEIRZSFC457CuEAQzfnosEdyE
 g5ErCDQJ/Wk8G0yOJ+mcQeN7NraKe8FVfvkIIaA1Cd9y9b96/YAYZpmJU+q9M8bKz27Z
 KBl5/Wx0Mi6gry+5nqTEtoGh/VDUg/hCi4MOKpnhOPtydaTiLS3H2dxQnRF/zn60Y66x
 Tl9g==
X-Gm-Message-State: AOAM533rQT5XvSR4fLl3oP6ivHqGQwZRkZtm2b1SD3VuJZryJDGDXFrW
 mi/Mp57+gd51r+HWSZT0p2LpTr+4rKS/w9zcITTBp/BN9kNbTAQVXflB8HXnM+MmGqwX2Us6Y5o
 7WhJAqLaQEfyH1TTfyk58HD51aezEzp0If8mLr56p3u5eZftsxFvKZqVexY7fb6+S
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr49312409wrd.346.1636988373115; 
 Mon, 15 Nov 2021 06:59:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6CciOegvif+34GnCt0hD/64UuEDugB7rW9G76m3FCy6yAO30mqJbwBDxaNwN/j5jZNdoVtw==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr49312366wrd.346.1636988372860; 
 Mon, 15 Nov 2021 06:59:32 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o8sm14256154wrm.67.2021.11.15.06.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:59:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 v4 07/11] tests/unit/test-smp-parse: Add
 'smp-without-dies-invalid' machine type
Date: Mon, 15 Nov 2021 15:58:56 +0100
Message-Id: <20211115145900.2531865-8-philmd@redhat.com>
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
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid modifying the MachineClass internals by adding the
'smp-without-dies-invalid' machine, which inherits from TYPE_MACHINE.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index ff61da06e3d..dfe7f1313b0 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -487,6 +487,17 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
     mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
+static void machine_without_dies_invalid_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    /* Force invalid min CPUs and max CPUs */
+    mc->min_cpus = 2;
+    mc->max_cpus = 511;
+
+    mc->smp_props.dies_supported = false;
+}
+
 static void machine_with_dies_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -530,11 +541,6 @@ static void test_generic_invalid(const void *opaque)
     SMPTestData *data = &(SMPTestData){};
     int i;
 
-
-    /* Force invalid min CPUs and max CPUs */
-    mc->min_cpus = 2;
-    mc->max_cpus = 511;
-
     for (i = 0; i < ARRAY_SIZE(data_generic_invalid); i++) {
         *data = data_generic_invalid[i];
         unsupported_params_init(mc, data);
@@ -542,10 +548,6 @@ static void test_generic_invalid(const void *opaque)
         smp_parse_test(ms, data, false);
     }
 
-    /* Reset the supported min CPUs and max CPUs */
-    mc->min_cpus = MIN_CPUS;
-    mc->max_cpus = MAX_CPUS;
-
     object_unref(obj);
 }
 
@@ -607,6 +609,10 @@ static const TypeInfo smp_machine_types[] = {
         .class_init     = machine_base_class_init,
         .class_size     = sizeof(MachineClass),
         .instance_size  = sizeof(MachineState),
+    }, {
+        .name           = MACHINE_TYPE_NAME("smp-without-dies-invalid"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = machine_without_dies_invalid_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("smp-with-dies"),
         .parent         = TYPE_MACHINE,
@@ -626,7 +632,7 @@ int main(int argc, char *argv[])
                          TYPE_MACHINE,
                          test_generic_valid);
     g_test_add_data_func("/test-smp-parse/generic/invalid",
-                         TYPE_MACHINE,
+                         MACHINE_TYPE_NAME("smp-without-dies-invalid"),
                          test_generic_invalid);
     g_test_add_data_func("/test-smp-parse/with_dies",
                          MACHINE_TYPE_NAME("smp-with-dies"),
-- 
2.31.1


