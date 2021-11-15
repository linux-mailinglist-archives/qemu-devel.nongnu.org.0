Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133B745082C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:22:44 +0100 (CET)
Received: from localhost ([::1]:38960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdog-0005HL-UT
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:22:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSf-00082j-Gl
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSO-00006f-Ah
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7Mfm0kJ9oi+go9Fu+Y6UDaHOPdntdv19UcC7ZtAoHg=;
 b=YRTrzlR9DxEvInLYZziRiau8yEHpiHSUSgOITFs3bzdzgo0mbQp5fvQfPMm3gDzT1TOBg9
 hnluReZAcwNfkNwKwi+8dtL9HlsOGGoaortNmylO+e4GNSsVULlBB2Sc2pWpFvBxox9ROu
 ksUfUIT73OxbwvaLSEqI9165vCuF/Xg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-ai0nrpJTNCOdHeFKS2Dvmw-1; Mon, 15 Nov 2021 09:59:38 -0500
X-MC-Unique: ai0nrpJTNCOdHeFKS2Dvmw-1
Received: by mail-wr1-f69.google.com with SMTP id
 u4-20020a5d4684000000b0017c8c1de97dso3654614wrq.16
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:59:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k7Mfm0kJ9oi+go9Fu+Y6UDaHOPdntdv19UcC7ZtAoHg=;
 b=cE8I0GUzd9jvs5VssB0mq+VJK5H+2hDf4xbVHthS0a5eJktN8V/aB4ao6+nVSpgOt8
 2L4gcyKS3wIZLLmqyrSCsS1ah1bsO2qLrKj5wob1BFXT97sM/yqecaUAEEa5+963AKLL
 8XipYJlCcbCfs5+e+tD7toIVX1oTvdW5Bsiex74khoV2TV0E9p1c6WyCECB3EfBOSgYi
 Um6GJNSyMV4NhirRcjI8zDcgLOappyvffchW2KAF3FUuwYtXF18Ui6g+MwyvzJR10ZUI
 7ZfNO5RdooqVNxoDmIIncYGPi4jqDo4kMsFc/tq8uyJy5UKJ7DUIJ3eJ5lrYtj5W3Cyy
 JN1w==
X-Gm-Message-State: AOAM5304Sa07jNUJgj0uvfWtqt4dSnfRtNKlGzEbU3FSmdNLnjvJ8qfO
 s8dOKOLeGSA6fqmOp4+p9loBqy+VEkQXguCTtTtKVJV3a83RKyciRQPI698ohhjiQodFe8HGnGq
 HiafDvq63z6VLzI94yBGvZj7pCHGvUGj2GnRYy1+/HJzyaS0DBTYv7wLt54sbv3Zq
X-Received: by 2002:a5d:464c:: with SMTP id j12mr47415619wrs.150.1636988377382; 
 Mon, 15 Nov 2021 06:59:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZcmTp4r0jzDzTwRnun/HIV1bv/UO4CRlPVTREiare+KSKukQl/Vr0NsBwexNnIWCObYijcg==
X-Received: by 2002:a5d:464c:: with SMTP id j12mr47415595wrs.150.1636988377243; 
 Mon, 15 Nov 2021 06:59:37 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b188sm14043968wmd.45.2021.11.15.06.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:59:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 v4 08/11] tests/unit/test-smp-parse: Add
 'smp-without-dies-valid' machine type
Date: Mon, 15 Nov 2021 15:58:57 +0100
Message-Id: <20211115145900.2531865-9-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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

Keep the common TYPE_MACHINE class initialization in
machine_base_class_init(), make it abstract, and move
the non-common code to a new class: "smp-without-dies-valid".

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index dfe7f1313b0..90a249fe8c8 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -478,13 +478,19 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
+    mc->smp_props.prefer_sockets = true;
+
+    mc->name = g_strdup(SMP_MACHINE_NAME);
+}
+
+static void machine_without_dies_valid_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->min_cpus = MIN_CPUS;
     mc->max_cpus = MAX_CPUS;
 
-    mc->smp_props.prefer_sockets = true;
     mc->smp_props.dies_supported = false;
-
-    mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
 static void machine_without_dies_invalid_class_init(ObjectClass *oc, void *data)
@@ -606,9 +612,14 @@ static const TypeInfo smp_machine_types[] = {
     {
         .name           = TYPE_MACHINE,
         .parent         = TYPE_OBJECT,
+        .abstract       = true,
         .class_init     = machine_base_class_init,
         .class_size     = sizeof(MachineClass),
         .instance_size  = sizeof(MachineState),
+    }, {
+        .name           = MACHINE_TYPE_NAME("smp-without-dies-valid"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = machine_without_dies_valid_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("smp-without-dies-invalid"),
         .parent         = TYPE_MACHINE,
@@ -629,7 +640,7 @@ int main(int argc, char *argv[])
     g_test_init(&argc, &argv, NULL);
 
     g_test_add_data_func("/test-smp-parse/generic/valid",
-                         TYPE_MACHINE,
+                         MACHINE_TYPE_NAME("smp-without-dies-valid"),
                          test_generic_valid);
     g_test_add_data_func("/test-smp-parse/generic/invalid",
                          MACHINE_TYPE_NAME("smp-without-dies-invalid"),
-- 
2.31.1


