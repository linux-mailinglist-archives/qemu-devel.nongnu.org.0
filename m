Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64194507DE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:08:42 +0100 (CET)
Received: from localhost ([::1]:60448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdb6-0006IH-GG
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:08:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSH-0007au-Mq
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSF-000057-Co
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xRdiXmpdnfeTUGpX5NMgs94Fe642FxHpeJMvGfGSJQ=;
 b=PkNx1vVthJresEPv0AEPQMCe6OwiQPQTnh+dL7sr9nWVGRnZiFFjfXUDTWtFaYfb9y5VJP
 0RhChKDKkRKMKqEkJRRXRjd9Rf6nEm/muUYg6QGYhfWVxN3M9l6G8A4Oo8N/cp8t9eS2jx
 m2+WF91Gb/85OadjEZLlAQWnuU0ic3w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-9VPUh_mUN567LNYRycLYIA-1; Mon, 15 Nov 2021 09:59:29 -0500
X-MC-Unique: 9VPUh_mUN567LNYRycLYIA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so3653868wro.18
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4xRdiXmpdnfeTUGpX5NMgs94Fe642FxHpeJMvGfGSJQ=;
 b=Hgf4YgfP4Q9aJOkjtUt6dofpqK0AOzdi1eEkynnqRdy7X00q23BW1pSC6wGokqX6sQ
 Etbnz00sjCJtsrz0r4ZHUzr08uFfzDlp7DhX8oi1VXo7vMXmQjbiBL0O1XczEGdg9f44
 i6d+IlZq4DgXLikbX5XV6mpE61kKPtHfmyLC/RFBlJanzZ2YLEn6cgueqfE2lNOFcui/
 tSibbChawAHByxfsNy3nZSBpiAEQPcnidm1zE4+ZkuEVRIehgRr1T9D52Dwz4opgmLkU
 bJHvUtYcXP7O2Thlfp3n3mED/4imaJGCsyooD3Eim68WdhfDl0IugPJASzPOUaL1fnBB
 y5nQ==
X-Gm-Message-State: AOAM533+Z/udbOKM62J8Hj5iqa21UpkDx/0bEDSDaAeQ2qbNLwf+gyFr
 a4F9VzvXU8/dVEparXYRRdlkAbu81hgj5d16jQsB+yjlrC0x8z76jwl1VXd09cwWx9NanleRYBZ
 HbEQaggwtw9QsFheMLoYN3Z/4FFd1Dyut4aKWALjajEtrLluFiVgjwaV7LF3bvlNI
X-Received: by 2002:a05:600c:3227:: with SMTP id
 r39mr64451050wmp.120.1636988368455; 
 Mon, 15 Nov 2021 06:59:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwk/zqiwkSztF//4rF24BcxpTmpw66DybNwLZPSvoC8yRbT5o1dKrbJxPMDTtIEOmfTezfvmA==
X-Received: by 2002:a05:600c:3227:: with SMTP id
 r39mr64451019wmp.120.1636988368289; 
 Mon, 15 Nov 2021 06:59:28 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id w17sm15203043wrp.79.2021.11.15.06.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:59:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 v4 06/11] tests/unit/test-smp-parse: Add
 'smp-with-dies' machine type
Date: Mon, 15 Nov 2021 15:58:55 +0100
Message-Id: <20211115145900.2531865-7-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid modifying the MachineClass internals by adding the
'smp-with-dies' machine, which inherits from TYPE_MACHINE.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index e27aedad354..ff61da06e3d 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -487,6 +487,16 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
     mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
+static void machine_with_dies_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->min_cpus = MIN_CPUS;
+    mc->max_cpus = MAX_CPUS;
+
+    mc->smp_props.dies_supported = true;
+}
+
 static void test_generic_valid(const void *opaque)
 {
     const char *machine_type = opaque;
@@ -549,9 +559,6 @@ static void test_with_dies(const void *opaque)
     unsigned int num_dies = 2;
     int i;
 
-    /* Force the SMP compat properties */
-    mc->smp_props.dies_supported = true;
-
     for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
         *data = data_generic_valid[i];
         unsupported_params_init(mc, data);
@@ -589,9 +596,6 @@ static void test_with_dies(const void *opaque)
         smp_parse_test(ms, data, false);
     }
 
-    /* Restore the SMP compat properties */
-    mc->smp_props.dies_supported = false;
-
     object_unref(obj);
 }
 
@@ -603,6 +607,10 @@ static const TypeInfo smp_machine_types[] = {
         .class_init     = machine_base_class_init,
         .class_size     = sizeof(MachineClass),
         .instance_size  = sizeof(MachineState),
+    }, {
+        .name           = MACHINE_TYPE_NAME("smp-with-dies"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = machine_with_dies_class_init,
     }
 };
 
@@ -621,7 +629,7 @@ int main(int argc, char *argv[])
                          TYPE_MACHINE,
                          test_generic_invalid);
     g_test_add_data_func("/test-smp-parse/with_dies",
-                         TYPE_MACHINE,
+                         MACHINE_TYPE_NAME("smp-with-dies"),
                          test_with_dies);
 
     g_test_run();
-- 
2.31.1


