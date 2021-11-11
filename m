Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362D944D4C7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:09:14 +0100 (CET)
Received: from localhost ([::1]:49826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml717-0000en-Bm
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:09:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6wI-0006z8-Ko
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6wF-00011G-Cr
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636625050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6CWt9qvUfdPUYJvJPJwk4S85pT07giVjWWIGVSTBQMQ=;
 b=h/oRLNmgegtPKhJ9ItokFy8DFtXxyNkiAtb0MHuHrRDRfF2AvRI7wdnWBfnj12OzC3/P7R
 feZZVk2fGTMSs7xJegL5gLFlyBKs5+qOEnEK6sdYhFuXh0h8c7/o7H3jpp+PGXe/k2tVtU
 yBn+bL3Wkpwzr9ICEN2OIwhZvR12/cw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-DiruEl8AMZCtHMHOY96D3w-1; Thu, 11 Nov 2021 05:04:07 -0500
X-MC-Unique: DiruEl8AMZCtHMHOY96D3w-1
Received: by mail-wr1-f72.google.com with SMTP id
 w14-20020adfbace000000b001884bf6e902so929635wrg.3
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 02:04:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6CWt9qvUfdPUYJvJPJwk4S85pT07giVjWWIGVSTBQMQ=;
 b=6qxty2ELkFInwXa6ld2p2yPy4nZGA1j/o1DhBx5V7MpjXhVdjM8kZK5b+VahYrkFD2
 QvxMp5qUx2YZOqi5Gym4Za8LRKVuCQEWCv6UoEOVeirCdpOZmW9hUsAni+I54rwG3gAx
 6jA4j229NmDWnEj9JRDnHCoWgsdD1ZL1lN9/j35cOh4Wa6UNNa/HEw0r591MQ+rkHU85
 nFYtgirlXc/Q2QqmcX7LPrQPObJ9S3P8G6qh7Xtfd0XKYxk4MpviairmB6n3cV/xsEz6
 k19fmUp1FJQ4KxKiH62msKesSfzvHaOCmxYLLcKSDlC7wLDeQpcKSbobHOZIdyuBHTJ+
 xMqQ==
X-Gm-Message-State: AOAM533SZANygc+NPsv/o/X9UOH93qx3fQq2NK/dxQvkea2FkSve4H/w
 bHmcVPucbhFUMUxuHH64ix9FmNphpng2ks8HR3EZtWPe89TeBwICUETCyxo5Rh3W0iV5fUHaIvq
 uxMBAJmXnQneDFAnBwo6DY2URo1ACbGBZcwxUj9d9jo+YgbnXmJQtLKsAd7oS3s+k
X-Received: by 2002:adf:fb09:: with SMTP id c9mr6997175wrr.223.1636625046282; 
 Thu, 11 Nov 2021 02:04:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjkKP3jlm7WgcixPtOzz5Nu78jHIxpkFcloO0+roEU6MxpDlS9/SXchhwk0sqcXEOXQ2yMJw==
X-Received: by 2002:adf:fb09:: with SMTP id c9mr6997147wrr.223.1636625046094; 
 Thu, 11 Nov 2021 02:04:06 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 f7sm2727883wri.74.2021.11.11.02.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 02:04:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 3/6] tests/unit/test-smp-parse: Explicit
 MachineClass name
Date: Thu, 11 Nov 2021 11:03:48 +0100
Message-Id: <20211111100351.2153662-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111100351.2153662-1-philmd@redhat.com>
References: <20211111100351.2153662-1-philmd@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the MachineClass::name pointer is not explicitly set, it is NULL.
Per the C standard, passing a NULL pointer to printf "%s" format is
undefined. Some implementations display it as 'NULL', other as 'null'.
Since we are comparing the formatted output, we need a stable value.
The easiest is to explicit a machine name string.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 51670297bf9..de6d226b455 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -23,6 +23,8 @@
 #define MIN_CPUS 1   /* set the min CPUs supported by the machine as 1 */
 #define MAX_CPUS 512 /* set the max CPUs supported by the machine as 512 */
 
+#define SMP_MACHINE_NAME "TEST-SMP"
+
 /*
  * Used to define the generic 3-level CPU topology hierarchy
  *  -sockets/cores/threads
@@ -307,13 +309,13 @@ static struct SMPTestData data_generic_invalid[] = {
          * should tweak the supported min CPUs to 2 for testing */
         .config = SMP_CONFIG_GENERIC(T, 1, F, 0, F, 0, F, 0, F, 0),
         .expect_error = "Invalid SMP CPUs 1. The min CPUs supported "
-                        "by machine '(null)' is 2",
+                        "by machine '" SMP_MACHINE_NAME "' is 2",
     }, {
         /* config: -smp 512
          * should tweak the supported max CPUs to 511 for testing */
         .config = SMP_CONFIG_GENERIC(T, 512, F, 0, F, 0, F, 0, F, 0),
         .expect_error = "Invalid SMP CPUs 512. The max CPUs supported "
-                        "by machine '(null)' is 511",
+                        "by machine '" SMP_MACHINE_NAME "' is 511",
     },
 };
 
@@ -481,6 +483,8 @@ static void machine_class_init(ObjectClass *oc, void *data)
 
     mc->smp_props.prefer_sockets = true;
     mc->smp_props.dies_supported = false;
+
+    mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
 static void test_generic(void)
-- 
2.31.1


