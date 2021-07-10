Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DFC3C363D
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 21:01:19 +0200 (CEST)
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2IE1-0001Yg-4Q
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 15:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2IBE-00080L-CV
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 14:58:24 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2IBC-000596-IF
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 14:58:24 -0400
Received: by mail-ed1-x52d.google.com with SMTP id l24so19508318edr.11
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=teFj5+ZMiBAB04Qa3K2z1sm3zrxLx3iweOsMczAmgV8=;
 b=d4j9FNV1ZpQWt62/e+CcStaZk6HyptIv2g4HI3yfVN/E6JqAzOTnaiSct9GkJjh+2+
 Wzy9fVYynrAfxomATFTn5ecXUHyO9ZBRcIacbV7OkTOApC+PmffllNMR1KNhdQTqtags
 0f1DYZ5729Bad9CA6YmLLDkR5sdtUltBE/lNRm9lxYC1g54h+qzJE7VaSdjVOiXkfJiK
 co7WQxbyCcM0Gra9Q2wCqOhJpQhuanO7yFIfL9rE8U9zLI5/wlKEiSM40LTQjRtAoFnm
 5W1nrKn9h/B7XpLh0VrhHm3uhpMIkCy4Cui/dDqhlCXh7BftRNPysPlItu5yJ4vGmNLM
 mQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=teFj5+ZMiBAB04Qa3K2z1sm3zrxLx3iweOsMczAmgV8=;
 b=NdijTxhXgNbH9og/Ok0sDplMZx+JleVRL3aWcGH/8tjYODZDVvpahD2WX0i6ATmjEP
 S8yiVSl3fj3RmzQYxC3pMXlUFeYQm7RVJMRKx4Ced/NPhZWQcl1pTVvM/McNvEilU6AP
 P/DjR7/MJFVh0WbRam1cVN1kkZx8ES99Z2NMC5kTsDgbz1+CNuoL3pHjGhvlEgE/2wOQ
 ty7Pwcevr1yXIT60/Lr9ASVRwPhi6zlRHITF8xc61Ec4WbpDKaXrs35YoIJqT9Se6eKb
 WEbjStD/yVAjfEHl0t8zjadHlEcLnHVK3iye6aBValTnCrYusvrg00bFRYMaswsvVsqB
 ZwZg==
X-Gm-Message-State: AOAM533ohF/R5L5rqy+h5oIkCoBNl+XdMGrU25Gy8fimnbJgSEI481vA
 ysZTLeD9WOvVOCTQCtSU+2PeoTpZJTo=
X-Google-Smtp-Source: ABdhPJzxfvZeb18oAKc0tIu/pt3XumFLD0Qst5pQRLIWX5gRpy1omDCGEhD/Un5jXyJVKeBzBJt7Tg==
X-Received: by 2002:a05:6402:207b:: with SMTP id
 bd27mr14877312edb.195.1625943501225; 
 Sat, 10 Jul 2021 11:58:21 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g8sm5096976edw.89.2021.07.10.11.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 11:58:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 05/48] modules: add modinfo macros
Date: Sat, 10 Jul 2021 20:58:17 +0200
Message-Id: <20210710185818.444407-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210710185818.444407-1-pbonzini@redhat.com>
References: <20210710185818.444407-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Add macros for module info annotations.

Instead of having that module meta-data stored in lists in util/module.c
place directly in the module source code.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-2-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/module.h | 61 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 944d403cbd..b595f15975 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -73,4 +73,65 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail);
 void module_load_qom_one(const char *type);
 void module_load_qom_all(void);
 
+/**
+ * DOC: module info annotation macros
+ *
+ * `scripts/modinfo-collect.py` will collect module info,
+ * using the preprocessor and -DQEMU_MODINFO.
+ *
+ * `scripts/modinfo-generate.py` will create a module meta-data database
+ * from the collected information so qemu knows about module
+ * dependencies and QOM objects implemented by modules.
+ *
+ * See `*.modinfo` and `modinfo.c` in the build directory to check the
+ * script results.
+ */
+#ifdef QEMU_MODINFO
+# define modinfo(kind, value) \
+    MODINFO_START kind value MODINFO_END
+#else
+# define modinfo(kind, value)
+#endif
+
+/**
+ * module_obj
+ *
+ * @name: QOM type.
+ *
+ * This module implements QOM type @name.
+ */
+#define module_obj(name) modinfo(obj, name)
+
+/**
+ * module_dep
+ *
+ * @name: module name
+ *
+ * This module depends on module @name.
+ */
+#define module_dep(name) modinfo(dep, name)
+
+/**
+ * module_arch
+ *
+ * @name: target architecture
+ *
+ * This module is for target architecture @arch.
+ *
+ * Note that target-dependent modules are tagged automatically, so
+ * this is only needed in case target-independent modules should be
+ * restricted.  Use case example: the ccw bus is implemented by s390x
+ * only.
+ */
+#define module_arch(name) modinfo(arch, name)
+
+/**
+ * module_opts
+ *
+ * @name: QemuOpts name
+ *
+ * This module registers QemuOpts @name.
+ */
+#define module_opts(name) modinfo(opts, name)
+
 #endif
-- 
2.31.1



