Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70474507D8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:05:57 +0100 (CET)
Received: from localhost ([::1]:51854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdYS-0000Na-Sk
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:05:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdS4-0007Gb-IF
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdS2-0008VS-9Y
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KAeBrUilj/ve6Ofp+Ew6cDhrRd6+8AxOgCMLHgLOxQ=;
 b=WB3tu6iLh5AUt6QpaK5oIxrK3pnsOlbP+21Mzk64KSJ0ueQOMwzQAjCbsN9EocL1MmvoaX
 DGGdWpf7WFlufjKp4Md0dRv100bjHwMo9fIZgnBXU+XDxorEhtHdwCAPjCLAfdkPwb2GGM
 xog8vHmDUMhMVKnxksK/gfNspnTI3e0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-U4hAGtG8PrmU-qtLlBtxYw-1; Mon, 15 Nov 2021 09:59:16 -0500
X-MC-Unique: U4hAGtG8PrmU-qtLlBtxYw-1
Received: by mail-wr1-f70.google.com with SMTP id
 q7-20020adff507000000b0017d160d35a8so3670245wro.4
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4KAeBrUilj/ve6Ofp+Ew6cDhrRd6+8AxOgCMLHgLOxQ=;
 b=fz22r1FqnuwbyGcR1GBNxumJTOaKWB903y/ceSeySiR9hZq8bVP3VKUc9c4RE8w+Ts
 qGHBr4o60bcPjcEyTI4HB7wrNeeb9QobIeeXSRZMNVyLsigjL8kLzK/Ss3i7ZYYR5Sts
 /eau/b1xH9lL2wgRyLaxpbXmbUbVoZ+F2U48Sgb7hHN2MWziFfhDP0HrJiTpjT1CUpeU
 5pQlIlLSBiKq8MnquhcPLFpVqF0F/yJY3LR+uqG9iafaFi1PpJdGlVK8gHkXkYGZs+R2
 wH5uPiSvCIqbjb8SgxiIOkdtFr96ReK74CHXJLiH049x0Np1Q0mVRbC/KIQt4DL6gaN/
 EDLQ==
X-Gm-Message-State: AOAM5335biwah3gPP+n+o0jqoiybjRDDpnd6Sc0NmLSeH8aiYKgRqTRl
 rE5P3IMRyQyTWdFCzhrUWmw9QK+4VW1Vm1aJvaIm0414nGdzJQxDFItgvtQb8va82sVgB3PC2OG
 +OhKmaTZ8b+8y8emWvt5adwCucGwZkuCwUsqyDF0HLP0uPJGW+bo97soV/wwMokO0
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr47514707wrz.401.1636988355139; 
 Mon, 15 Nov 2021 06:59:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCMKRZjDDT6BXi0z8cGLwmCLsGou+twN0aKM1cAra2VHjcM269z3ycWuB/R3sbQ2VfrV4Wog==
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr47514660wrz.401.1636988354923; 
 Mon, 15 Nov 2021 06:59:14 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k37sm15906619wms.21.2021.11.15.06.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:59:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v4 03/11] tests/unit/test-smp-parse: Explicit
 MachineClass name
Date: Mon, 15 Nov 2021 15:58:52 +0100
Message-Id: <20211115145900.2531865-4-philmd@redhat.com>
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
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>,
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


