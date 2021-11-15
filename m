Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9998745183B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 23:53:12 +0100 (CET)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmkqd-0002KP-OX
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 17:53:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkm2-0004kX-8E
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:48:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkm0-0004Mg-Cz
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637016500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=byTizwcSSoKyIq1puLjEKJm8typeg4ZcFgPzEW52fJE=;
 b=KjzxV5dWLf/HPWl/qiocO0oXSIVO9LY7VqfiSyLgXAlfXl0Da1iPNUZFQuP4FPwJ2cMK0C
 hr4ri5D9hezYiiTEIlN1A/01HxlDn+TRWbD5ZVAlHJ9UUSkd76EpSrYpSUIin0zhQrbCIc
 QZUcy7gdtMOrfBSJL/+rYezIanKZfRs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-40-OJ0b6_lgP1-sI3hE1Zg-FA-1; Mon, 15 Nov 2021 17:48:18 -0500
X-MC-Unique: OJ0b6_lgP1-sI3hE1Zg-FA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso569807wms.1
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 14:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=byTizwcSSoKyIq1puLjEKJm8typeg4ZcFgPzEW52fJE=;
 b=ZcCvkTFY6wgrXaw2Rz8VxfLYCo/EyxL+NoDJnvnYzGqRpDnBNJ5rDPzDG7BE6qPVF3
 76zgGyNWBSb8pJqPg6MwRMehQESwIiICiGHLYI/mBbleho4WMnJ9tqxjs8Swvua83Unn
 Y6TruqEE8pUS0TRWsLBFiAfq4NCEWC0xodTP5Kcy6jO0cB0g4J0S+K28ooVsBhdUZDrg
 F0lJ5arjQRYjcbrDTMOPGet65W8E8Rb3QZ11FvgKSWDC84Zp/iltJMTfy4mdT04/ihuc
 A1d6idj4GkhLz377LKU45ATyB6mRpmEywYia53fHwNPo0D6HQNjjDlVyp0rU9KG3otPc
 cXxg==
X-Gm-Message-State: AOAM532XK7rSvTK9Wk293qnJ5tugOJ4mUt9AHm/QImbvpg/dSE5KMHXz
 jX2+sjwh4ucBwLtymb4y4A+74aaDDDsyctZ7PLq9LxzknBirCm4kEbkgPgbeA5iP2LTKz223Pq5
 X087Y3D6hdhsyShq/JbBoyZ4LO9ZKKoyGhZ7vkp41CQLesxrqAIZVpYbY5zck3EzV
X-Received: by 2002:a7b:c157:: with SMTP id z23mr63780288wmi.113.1637016497539; 
 Mon, 15 Nov 2021 14:48:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyUxgeyIf+IubjhuVTfJfUFbfIMBiJ1BfbKXAXROwmjorBqnPkThWuY9iSPlyvdjTF1Du8kw==
X-Received: by 2002:a7b:c157:: with SMTP id z23mr63780256wmi.113.1637016497309; 
 Mon, 15 Nov 2021 14:48:17 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o63sm613510wme.2.2021.11.15.14.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 14:48:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] tests/unit/test-smp-parse: Explicit MachineClass name
Date: Mon, 15 Nov 2021 23:48:02 +0100
Message-Id: <20211115224802.2602894-4-philmd@redhat.com>
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

If the MachineClass::name pointer is not explicitly set, it is NULL.
Per the C standard, passing a NULL pointer to printf "%s" format is
undefined. Some implementations display it as 'NULL', other as 'null'.
Since we are comparing the formatted output, we need a stable value.
The easiest is to explicit a machine name string.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211115145900.2531865-4-philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 3fff2af4e27..b02450e25a3 100644
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
 
@@ -481,6 +483,8 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
 
     mc->smp_props.prefer_sockets = true;
     mc->smp_props.dies_supported = false;
+
+    mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
 static void test_generic(void)
-- 
2.31.1


