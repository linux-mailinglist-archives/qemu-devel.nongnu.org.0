Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8713A64F9D6
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 16:26:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Z3r-0003PD-4b; Sat, 17 Dec 2022 10:25:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Z3o-0003Of-Uv
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 10:25:12 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Z3n-0005OV-8H
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 10:25:12 -0500
Received: by mail-ej1-x62b.google.com with SMTP id gh17so12537579ejb.6
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 07:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kw1OjQ5bJTHVjNVBcrbAjUuHpYpt+dRXG1ISohyf01M=;
 b=Di4wYeCNcUyETg+kjFT1GZF088S+YKhSQ/hQikA498Yoh2hFhvDjzBvfVBhaaBNeDY
 aWXeupZsRnSvD1VpmMCnyu51LaHvwMHSPAQ46CtM5GqiEc1wAbK4SGYvfJahnZ3xkGWz
 wHqQxaVmvKsFOv2A/JRHmhRWGptfwRMwYui+mVLD1j9lRkJVS2ibrTbqCPxpqQeAEAD/
 fZOp/H+WJIRux5XUm3UXjsggcWtIM4FXCO8HrOhspWqtwbHURozpvi2+k8rOZ5DFNdrX
 5C55tXi7nSm9FG0o5wAx+09B5VBgRrVxKKzAEuf4FMBNGVWp6o9D1jOUfZc51/WltiwU
 jnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kw1OjQ5bJTHVjNVBcrbAjUuHpYpt+dRXG1ISohyf01M=;
 b=gUvC89mOX8es0hhI6bbTlRY7PPRNlBJRFb5ZxbphORAlkLhUZFfhEKPn5rPOPcPtHZ
 mfDE0droFv+nm7KklBJPHahSy4Ja9DfomwkT0qCvz24f+ALsQFVvE3uawR5TngwiwjSU
 q2IJO9CTyJdb6FLzoBSjrthhUySxrSb8Ygw5S1aS0KQvyxExiQD75XBALUHmWmGRkQJp
 ERAP1Xc6IyFE3BvL5pQyWs8mg/oU6qLUS4LpSTsghhev6/7IK11HVtlvVP4vs+fsISPA
 QYcJy9t8lx1fEWW7QUB3GaqKuoyuF5WVpXGzZ7h9I68emCT92KB6hPThJJFPmV10WzDs
 hjtA==
X-Gm-Message-State: AFqh2kr7Jv5vU6ddKEHPPsAx+7iwpMxI75OoR5/mer0FcLN5AyObBajn
 KaEA2Yr44m+7VCBrEzY+YYqVUbV6sMe0WsF2Xm0=
X-Google-Smtp-Source: AMrXdXv4AoF9d9D8sNfm/tTKxtjGdrVaTyCN/UR/k1QiqRIDMG2T8hE05aIVZyTzwp5vOVYWdwatgA==
X-Received: by 2002:a17:906:a4d:b0:7f7:a985:1849 with SMTP id
 x13-20020a1709060a4d00b007f7a9851849mr3854942ejf.24.1671290709697; 
 Sat, 17 Dec 2022 07:25:09 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a17090631c100b007c07b23a79bsm2089711ejf.213.2022.12.17.07.25.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 07:25:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 2/5] hw/s390x/pv: Un-inline s390_pv_init()
Date: Sat, 17 Dec 2022 16:24:51 +0100
Message-Id: <20221217152454.96388-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217152454.96388-1-philmd@linaro.org>
References: <20221217152454.96388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There is no point in having s390_pv_init() inlined. Directly
call s390_pv_kvm_init() guarded by kvm_enabled() so the compiler
can elide when CONFIG_KVM is not set.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/pv.c              |  4 +++-
 hw/s390x/s390-virtio-ccw.c |  6 ++++--
 include/hw/s390x/pv.h      | 13 -------------
 3 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 8dfe92d8df..17c658402d 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -251,7 +251,9 @@ struct S390PVGuestClass {
 
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
-    if (!object_dynamic_cast(OBJECT(cgs), TYPE_S390_PV_GUEST)) {
+    assert(kvm_enabled());
+
+    if (!cgs || !object_dynamic_cast(OBJECT(cgs), TYPE_S390_PV_GUEST)) {
         return 0;
     }
 
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 2e64ffab45..d9a96e315e 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -255,8 +255,10 @@ static void ccw_init(MachineState *machine)
     /* init CPUs (incl. CPU model) early so s390_has_feature() works */
     s390_init_cpus(machine);
 
-    /* Need CPU model to be determined before we can set up PV */
-    s390_pv_init(machine->cgs, &error_fatal);
+    if (kvm_enabled()) {
+        /* Need CPU model to be determined before we can set up PV */
+        s390_pv_kvm_init(machine->cgs, &error_fatal);
+    }
 
     s390_flic_init();
 
diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index 9360aa1091..fad61cc6c6 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -12,7 +12,6 @@
 #ifndef HW_S390_PV_H
 #define HW_S390_PV_H
 
-#include "qapi/error.h"
 #include "sysemu/kvm.h"
 
 #ifdef CONFIG_KVM
@@ -78,17 +77,5 @@ static inline int kvm_s390_dump_completion_data(void *buff) { return 0; }
 #endif /* CONFIG_KVM */
 
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
-static inline int s390_pv_init(ConfidentialGuestSupport *cgs, Error **errp)
-{
-    if (!cgs) {
-        return 0;
-    }
-    if (kvm_enabled()) {
-        return s390_pv_kvm_init(cgs, errp);
-    }
-
-    error_setg(errp, "Protected Virtualization requires KVM");
-    return -1;
-}
 
 #endif /* HW_S390_PV_H */
-- 
2.38.1


