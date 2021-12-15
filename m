Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717F5475E2F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:06:37 +0100 (CET)
Received: from localhost ([::1]:45786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXjg-000490-In
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:06:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXTD-0004YV-1q
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXTB-0001zb-FG
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639586966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gzBQu4QmY83ZJxn/RGUigkeYNejwi9D3HBZlC+kt004=;
 b=SrsmXejsc7wI3y917n/+Cep/siU5L/b+DcMmAdP6W5fp8yGUYFMwIpR2gkadaczbjWSMGd
 OW1iGG/T2hwd1IBxvtxzB3hw2AB7H4/RnT9G8Wqb9pttT80NCv6rQ9RaSdfsLODfaMD7a6
 585nSnfF5fciLmya+2ioufUZSgJSqZ4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-tARZ9GLHOgyhOQUQORpDZQ-1; Wed, 15 Dec 2021 11:49:25 -0500
X-MC-Unique: tARZ9GLHOgyhOQUQORpDZQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 b75-20020a1c804e000000b0034569bde713so1017032wmd.9
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 08:49:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gzBQu4QmY83ZJxn/RGUigkeYNejwi9D3HBZlC+kt004=;
 b=bEeOrKsDLeL/hXcd3Nvmajh+PFBAY1auSiiXpHWviIDGSf+4A3nJlouRKfpTG3fK2k
 abm47AXXb63xdZ0CWIsrvEqk3jqxVmpYz1TSraom62ZJ4/yOuHvSf5kDrm8aRHXr0Oe/
 pce4KJ5eA8W+Tsn3vpzAvD/htcfam3KJT0M1LttNsn4ZiS6WmxnLHUqngByeaEmZaMAk
 aYKinRoD2dbdABOlbcT+htVurE3/J2L/1+zhuMUPviyNW0oH3Ho+Hj37l+2M5mfm6Ybh
 gURL86W4ct40EcAUO4EH6VNVBPijiDWgzorItJJ0aXdPH+EjNy7FeCAyo9oCy6RxSo6m
 D8nw==
X-Gm-Message-State: AOAM531BBdLwk7DGbKUCV5RTO0bSrVY3IbmSGe52e7jUzU1FQquls54L
 DQ9nMknf9Kkkzko2TeJjgOE+LHK5ZLdFFRJT8rki5av2vYGaKIyMKE0OrCVmkgfB14aiA62fYeX
 A4EuafDegnzufaPCnHaQBmZ4RGlOsmgFf4EtCkexXOAlLI048Px30vvhNl1UAf1rN
X-Received: by 2002:adf:9cc4:: with SMTP id h4mr5178906wre.644.1639586963875; 
 Wed, 15 Dec 2021 08:49:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXuiAJUWKwJjDdKhC6tiSLXZKZVSJVpPsjSjHdVdioz1ncOuETMqAfL+zESKB3gKAuPP+www==
X-Received: by 2002:adf:9cc4:: with SMTP id h4mr5178890wre.644.1639586963692; 
 Wed, 15 Dec 2021 08:49:23 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g18sm2470449wrv.42.2021.12.15.08.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:49:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/8] tests/unit/test-smp-parse: Add 'smp-generic-invalid'
 machine type
Date: Wed, 15 Dec 2021 17:48:52 +0100
Message-Id: <20211215164856.381990-5-philmd@redhat.com>
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid modifying the MachineClass internals by adding the
'smp-generic-invalid' machine, which inherits from TYPE_MACHINE.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index f66cf7bb598..72e7236afd9 100644
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
@@ -530,10 +541,6 @@ static void test_generic_invalid(const void *opaque)
     SMPTestData *data = &(SMPTestData){};
     int i;
 
-    /* Force invalid min CPUs and max CPUs */
-    mc->min_cpus = 2;
-    mc->max_cpus = 511;
-
     for (i = 0; i < ARRAY_SIZE(data_generic_invalid); i++) {
         *data = data_generic_invalid[i];
         unsupported_params_init(mc, data);
@@ -541,10 +548,6 @@ static void test_generic_invalid(const void *opaque)
         smp_parse_test(ms, data, false);
     }
 
-    /* Reset the supported min CPUs and max CPUs */
-    mc->min_cpus = MIN_CPUS;
-    mc->max_cpus = MAX_CPUS;
-
     object_unref(obj);
 }
 
@@ -606,6 +609,10 @@ static const TypeInfo smp_machine_types[] = {
         .class_init     = machine_base_class_init,
         .class_size     = sizeof(MachineClass),
         .instance_size  = sizeof(MachineState),
+    }, {
+        .name           = MACHINE_TYPE_NAME("smp-generic-invalid"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = machine_without_dies_invalid_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("smp-with-dies"),
         .parent         = TYPE_MACHINE,
@@ -625,7 +632,7 @@ int main(int argc, char *argv[])
                          TYPE_MACHINE,
                          test_generic_valid);
     g_test_add_data_func("/test-smp-parse/generic/invalid",
-                         TYPE_MACHINE,
+                         MACHINE_TYPE_NAME("smp-generic-invalid"),
                          test_generic_invalid);
     g_test_add_data_func("/test-smp-parse/with_dies",
                          MACHINE_TYPE_NAME("smp-with-dies"),
-- 
2.33.1


