Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0AE482415
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:58:34 +0100 (CET)
Received: from localhost ([::1]:35562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HUP-0003VV-6g
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:58:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKl-0006JY-KC
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKj-0000l6-Si
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjJ0UEI6mxoPBPhQ4qwChpI2WWsxbhsBTViV87e9vj8=;
 b=fX0TN9c0OZsCx732xvpoaSC4GFGDP6CCugIHkYri8Dt4mxqQyfsUMhP/yDDsrZ/P7Y8zYI
 ULBKsjvRCg9RrTCFukPdWq8aYqrYuGKiywMD8kxnqIks+Sh5hdeqOoHyYLyXlJJ+n+uDRN
 IEWbtltUzjmD/Bl/x9IFAmDkulxXT3U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-KpeGu_FrNQekkKK9gwMKuw-1; Fri, 31 Dec 2021 07:48:32 -0500
X-MC-Unique: KpeGu_FrNQekkKK9gwMKuw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so7574091wrc.17
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pjJ0UEI6mxoPBPhQ4qwChpI2WWsxbhsBTViV87e9vj8=;
 b=Mrk8puF67rNM3oQtFeQ1qaxfQFMUQIAy9UGFmU6IGivnbXwzSf6cTieSYZJ3621nmV
 U8rPmPfaL7u9eJGmnqqsYO54XhUkLRKndae0+m9npdnkmRK51csMTufeIIyfJ5lAnDkl
 H5uDPJ8FR9uAvJNQHCNuFHDOVLMzw400HaV3q136+XdugejDyg4x8FOs3IKet3JXtrs5
 gnvO8kC6Q0Bbst9LUBAo5aCHgEbQRvR7j+no2DU5l1ldBFGRHwOmLhvsKbflVCitYkMt
 kxrMWFgHuCr3cd+Z14tz6XKs+ivTeSK0PeM4V8mrETkXw0YA1xFFpOTovgsYYIIImBiq
 R4AQ==
X-Gm-Message-State: AOAM530HNdEEOPC7OL+L3JrupEnSLsmvrKgTTdRBm1PV0ra4Dryf/6CV
 sXH1+U1uFLTK+MR4bjh9c3n4xRe+wSIt4q7+wIPUxaEF6B5ngOZWPZDFDg1lJrTBriKI+Hh7ctE
 f4jDmtORBWAPHJI2Nfse4NV4yUMqBvw4JiJEa3uEqO4AFXbsNxNC/xSCguP6R6zM+
X-Received: by 2002:a5d:5847:: with SMTP id i7mr14528738wrf.450.1640954910747; 
 Fri, 31 Dec 2021 04:48:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwytI4jANY9FirMbwDS536/kl1pGIL8C8dk6hG/uhRuLHAFY7TSpsl/85aQQT/F8wlj1+Sw0Q==
X-Received: by 2002:a5d:5847:: with SMTP id i7mr14528723wrf.450.1640954910588; 
 Fri, 31 Dec 2021 04:48:30 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id i4sm28833365wmd.34.2021.12.31.04.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:48:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/20] tests/unit/test-smp-parse: Add 'smp-generic-invalid'
 machine type
Date: Fri, 31 Dec 2021 13:47:42 +0100
Message-Id: <20211231124754.1005747-9-philmd@redhat.com>
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid modifying the MachineClass internals by adding the
'smp-generic-invalid' machine, which inherits from TYPE_MACHINE.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Message-Id: <20211216132015.815493-5-philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index f66cf7bb598..47e11089e22 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -487,6 +487,17 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
     mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
+static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
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
+        .class_init     = machine_generic_invalid_class_init,
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


