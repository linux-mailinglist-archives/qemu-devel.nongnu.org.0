Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37F265C623
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:25:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrY-0008Sn-EN; Tue, 03 Jan 2023 13:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqg-0008I4-3r
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:22 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqd-0005CK-OG
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:17 -0500
Received: by mail-vs1-xe31.google.com with SMTP id p30so26963198vsr.1
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XAGObJvGqrVWdz2gSKRqPWH5ISliRfssMEo9w+SvRe8=;
 b=LSS15VX8SvVQ+6ffZOzSViYP69YP+saEqdoygB8fwAc6jswtQeJSJ6qJloX7DYA2Zy
 YblpNcvR4aUxzxgtCDs8LI9+U8K9ZjZClFS/sgHjptiN6CqhLHOs4kj1NI4wJhcXfE7Y
 B1+3PVaB55jCD+rNEF4sIx+7poEl+7VxbvdV4tN56VgfqVzpz01eerbTUtiqEN5PvYmO
 WQ8joL72c7SROTgmin2IJ/Km7JNXEuyEDKjmRXecMERKhWqYNfb2NtVUs426OM8sg8yB
 AGOzJQZZr+BJr/x2u2zdhf3lN0ZSIVf7IysOdcn1nI3htifxCvU9lqLYGIgrZpTMPH1v
 oCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XAGObJvGqrVWdz2gSKRqPWH5ISliRfssMEo9w+SvRe8=;
 b=I22wefYmUr/93AiRNf5Hh/aN5mWAvPXb6/cTVON09HJvCWXWlyOxvRvy+ghmWdId1P
 mzkvj4wnOQLE4swRD9GJLAtREQWdxVdVw/MKW/EkphOqrPNjufesG19k41yN4Y+0Njeh
 Qd/FLfb89GHOJSbsoeEI4nE9+DmHLw3XedDsMHzUmrU+LxQ7Ixp4Dg0TtjI65lNJZqzF
 YLAp3N479xnicFtkGcSrCYw52uhbd0AgPUulY5LD3RzeMn9/937/zlvlMh+u+WHrrqNe
 DrVQu9d0vdrw92STHR6rbjoK6dvNf2WDyff6kr+vdXfE3PDSYxH18Nn/peUC4TqdyUY4
 iEtQ==
X-Gm-Message-State: AFqh2konLigUG7Crqs/cCcq4R6ROP6tv7KmvwaO0Pj6CAUYr4bZ0+WYR
 5FdHyULaAxttJcj2t8nyV5f/NN76Yx4LkC+3CGA=
X-Google-Smtp-Source: AMrXdXtCzC30j7c3N7zT23dqxspa+91sGDOFy9uTUEgzR/z5C7IXJNXIDqe55bHgot7piHgdn8BG1A==
X-Received: by 2002:a05:6102:a4a:b0:3cb:93d:406f with SMTP id
 i10-20020a0561020a4a00b003cb093d406fmr12585208vss.32.1672769834757; 
 Tue, 03 Jan 2023 10:17:14 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 08/40] target/arm: Pass ARMCPUClass to
 ARMCPUInfo.class_init
Date: Tue,  3 Jan 2023 10:16:14 -0800
Message-Id: <20230103181646.55711-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Streamline new instances of this hook, so that we always go
through arm_cpu_leaf_class_init first, performing common tasks,
and have resolved the ARMCPUClass.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h |  2 +-
 target/arm/cpu.c     | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index ae31289582..057978b9db 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -36,7 +36,7 @@ OBJECT_DECLARE_CPU_TYPE(ARMCPU, ARMCPUClass, ARM_CPU)
 typedef struct ARMCPUInfo {
     const char *name;
     void (*initfn)(Object *obj);
-    void (*class_init)(ObjectClass *oc, void *data);
+    void (*class_init)(ARMCPUClass *acc);
 } ARMCPUInfo;
 
 void arm_cpu_register_parent(const ARMCPUInfo *info, const char *parent);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a2f59ac378..b16d9bbe47 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2253,11 +2253,15 @@ static void arm_cpu_instance_init(Object *obj)
     arm_cpu_post_init(obj);
 }
 
-static void cpu_register_class_init(ObjectClass *oc, void *data)
+static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    const ARMCPUInfo *info = data;
 
-    acc->info = data;
+    acc->info = info;
+    if (info->class_init) {
+        info->class_init(acc);
+    }
 }
 
 void arm_cpu_register_parent(const ARMCPUInfo *info, const char *parent)
@@ -2268,7 +2272,7 @@ void arm_cpu_register_parent(const ARMCPUInfo *info, const char *parent)
         .instance_align = __alignof__(ARMCPU),
         .instance_init = arm_cpu_instance_init,
         .class_size = sizeof(ARMCPUClass),
-        .class_init = info->class_init ?: cpu_register_class_init,
+        .class_init = arm_cpu_leaf_class_init,
         .class_data = (void *)info,
     };
 
-- 
2.34.1


