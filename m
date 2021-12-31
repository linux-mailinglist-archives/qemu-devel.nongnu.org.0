Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F315D482412
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:58:28 +0100 (CET)
Received: from localhost ([::1]:35392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HUJ-0003P4-W6
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:58:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKc-00065m-I1
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKa-0000kL-WF
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnirtv3DDKZob6GdBwHAAuf1H+WbvfHFWSgEQSJCoyk=;
 b=bzmJiQAPeqCFvskXUt+qNHuatjMEwd4a4hlOvXxYhVD6CnOVo+w5711OMfUQ3DVChA+kEZ
 +01w/L2XyFlg+ZZi803A3n7GyPOAjkGPuf2rQ4Knk4+RtjGElWPO8HH4wsdoIilADUoQfS
 ZPmRg92M/Iv2fpgCiKrgRDkye7/zbAE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-w3lukQ0COLaNOaC4sR3kPg-1; Fri, 31 Dec 2021 07:48:23 -0500
X-MC-Unique: w3lukQ0COLaNOaC4sR3kPg-1
Received: by mail-wr1-f71.google.com with SMTP id
 k4-20020adfc704000000b001a32d86a772so4036044wrg.5
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xnirtv3DDKZob6GdBwHAAuf1H+WbvfHFWSgEQSJCoyk=;
 b=pxEoWTeI3U5sl9XieWbYt+sgxnNXZQHvXHYJyJSbOvSw+fNtvITIXwJ5Bz0xCnQFTi
 IcUKEGE77o1gzj1cP6avXZZnvxnpWE+dv0whydDk1oWyAVgBpWxF1Eh8ALCOJiFHNAAk
 94IwmUYGx0z1+ptOq77aw8QBA5/zIMoUYf9PDJGfdeD5zuzkm2eQVyHi715icJcMaxIX
 jZ4ReON5e95tcqaMkupZ1sL9aSoT9YPYcYChUTak6ug2WMGJWEgd3z/QneW7R8EEWXCA
 j5QeHrnilnHLNyqelHROVzrS9gSXWxJRUNYGUI5Z6t3z1FJ4SZwUCfInAO3Kpw2YHf7B
 uIUw==
X-Gm-Message-State: AOAM531x8bqcnfBDXBWE5MpB8Stdj381tw/fMWFVMnKKywvIbQYLMv+B
 3dvcc/ahbSMNgsO9MrTJ57JDg2QzNy+L6lZs3qx/4wtgmKmNEZfntKv63YHdnuT9OKGP5zd1Nzv
 H1h1PJ9RmUQ6F8St9QEwc3h72nxe/Na7EZyOUv2RamoiClFyMKfn+FsCZfLaAFw+u
X-Received: by 2002:a5d:608a:: with SMTP id w10mr27929592wrt.596.1640954902048; 
 Fri, 31 Dec 2021 04:48:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGpjjk4tzWjiPHjEdm1o8BkJteGLRBGEKRaLEhLNX1O1ySxoGayuX1MD+2dg7MQyDSpgtMDQ==
X-Received: by 2002:a5d:608a:: with SMTP id w10mr27929581wrt.596.1640954901873; 
 Fri, 31 Dec 2021 04:48:21 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id i8sm27098781wmq.4.2021.12.31.04.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:48:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/20] tests/unit/test-smp-parse: Split the 'generic' test in
 valid / invalid
Date: Fri, 31 Dec 2021 13:47:40 +0100
Message-Id: <20211231124754.1005747-7-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

Split the 'generic' test in two tests: 'valid' and 'invalid'.
This will allow us to remove the hack which modifies the
MachineClass internal state.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211216132015.815493-3-philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 37c6b4981db..425ed6b6b92 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -487,7 +487,7 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
     mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
-static void test_generic(const void *opaque)
+static void test_generic_valid(const void *opaque)
 {
     const char *machine_type = opaque;
     Object *obj = object_new(machine_type);
@@ -508,6 +508,18 @@ static void test_generic(const void *opaque)
         smp_parse_test(ms, data, true);
     }
 
+    object_unref(obj);
+}
+
+static void test_generic_invalid(const void *opaque)
+{
+    const char *machine_type = opaque;
+    Object *obj = object_new(machine_type);
+    MachineState *ms = MACHINE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    SMPTestData *data = &(SMPTestData){};
+    int i;
+
     /* Force invalid min CPUs and max CPUs */
     mc->min_cpus = 2;
     mc->max_cpus = 511;
@@ -601,9 +613,12 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
-    g_test_add_data_func("/test-smp-parse/generic",
+    g_test_add_data_func("/test-smp-parse/generic/valid",
                          TYPE_MACHINE,
-                         test_generic);
+                         test_generic_valid);
+    g_test_add_data_func("/test-smp-parse/generic/invalid",
+                         TYPE_MACHINE,
+                         test_generic_invalid);
     g_test_add_data_func("/test-smp-parse/with_dies",
                          TYPE_MACHINE,
                          test_with_dies);
-- 
2.33.1


