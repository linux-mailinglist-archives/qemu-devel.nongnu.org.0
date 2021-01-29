Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CBA308873
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:44:51 +0100 (CET)
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SCo-0004E4-JI
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnD-0004Fn-9A
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:23 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnB-0005uX-OX
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:23 -0500
Received: by mail-ed1-x52c.google.com with SMTP id f1so10084627edr.12
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6i9W6OOUOf+/H2AgjkKfRW+CSfY5qPrCTrtVFBIN+NA=;
 b=YiDHuOrjo+0EsVJqxCN4iUJK/6apnyprpvUvx4W8VOAfb3avoW0lhcyNR585b8et7R
 p4wuLl/4djTwrGS2b+VVF4s/y7H3zYdLfYbHrzxqN2sdoncp6gt6vRgg4bdnzpfe9HI/
 NRutKH/lXXzu3fZWaEfsRhWWTFIG6o+LfJfXCrELTJUzzkI4K6CIODFB+yl7Z252pr/d
 9K9gnBiqvQJgSqjBX8Yx9sV//eShFSwOh5a6WPem3jgU3hA6GDA2PHS9OC0kz9hxx9hQ
 EOWHIqsdrTtOZ4o2wknbSmwD8c4/SH+HPSLqyUS972EDQLTKRwBR2k3E8kZ4/U/+Pv+o
 CK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6i9W6OOUOf+/H2AgjkKfRW+CSfY5qPrCTrtVFBIN+NA=;
 b=SMr0cxnuy5jtQSMG5M2UWGhvEBl5EunPqMrGHRmUTI5Kel6XfTCrXVQ/LVomK6EzqW
 oW5481GPnM3mqAVibMDuaVbbI/LnosI2MMXCDH1D9xo83yktjTh43T+5uX3/Nx4iqNHd
 cp/dgibtpFvy5LUaORqftFC2FJvlDJ2GsH1buAUHSzeXCz7co3vtnZEhXBhMdhfFR6bY
 LBZSb33BVG3d/CWGrwPRZo8YWMIAjvdf99zUd24tNzUq8AKVm7VdlM1gC0wnGOD3aj+k
 g22cLcny/4gj8VRQRCrmcwtJ90ULqBmQMCcqIf4L8tOBWeoeNNjcq86gN6ZWDOhw74AC
 P/4A==
X-Gm-Message-State: AOAM533Z711sH/Y2/LZj1uB6kodmVpDjEL8ukU7Ojl/PKMqFgGaKI4wV
 rCly5DDp3GuJQrq864tq3rMXLwmq6wsHHw==
X-Google-Smtp-Source: ABdhPJxU1Jnh0WtkYx0Cz0EKk7nhQcRMiWuONP+SSMINukwMTO5685I8+NxxC+alPhyvsy/WlfJAHg==
X-Received: by 2002:a05:6402:2d1:: with SMTP id
 b17mr4460795edx.95.1611919100416; 
 Fri, 29 Jan 2021 03:18:20 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/36] fuzz: enable dynamic args for generic-fuzz configs
Date: Fri, 29 Jan 2021 12:17:43 +0100
Message-Id: <20210129111814.566629-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

For some device configurations, it is useful to configure some
resources, and adjust QEMU arguments at runtime, prior to fuzzing. This
patch adds an "argfunc" to generic the generic_fuzz_config. When
specified, it is responsible for configuring the resources and returning
a string containing the corresponding QEMU arguments. This can be useful
for targets that rely on e.g.:
 * a temporary qcow2 image
 * a temporary directory
 * an unused TCP port used to bind the VNC server

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210117230924.449676-2-alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c         | 10 +++++++++-
 tests/qtest/fuzz/generic_fuzz_configs.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index deb74f15be..ee8c17a04c 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -933,12 +933,20 @@ static GString *generic_fuzz_cmdline(FuzzTarget *t)
 
 static GString *generic_fuzz_predefined_config_cmdline(FuzzTarget *t)
 {
+    gchar *args;
     const generic_fuzz_config *config;
     g_assert(t->opaque);
 
     config = t->opaque;
     setenv("QEMU_AVOID_DOUBLE_FETCH", "1", 1);
-    setenv("QEMU_FUZZ_ARGS", config->args, 1);
+    if (config->argfunc) {
+        args = config->argfunc();
+        setenv("QEMU_FUZZ_ARGS", args, 1);
+        g_free(args);
+    } else {
+        g_assert_nonnull(config->args);
+        setenv("QEMU_FUZZ_ARGS", config->args, 1);
+    }
     setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
     return generic_fuzz_cmdline(t);
 }
diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index aa4c03f1ae..51e69c6e42 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -16,6 +16,7 @@
 
 typedef struct generic_fuzz_config {
     const char *name, *args, *objects;
+    gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
 } generic_fuzz_config;
 
 const generic_fuzz_config predefined_configs[] = {
-- 
2.29.2



