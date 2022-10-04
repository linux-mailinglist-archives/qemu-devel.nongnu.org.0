Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943A5F45AB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:38:45 +0200 (CEST)
Received: from localhost ([::1]:42496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofj4F-0003LV-OT
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidP-000238-RS
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:10:59 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidN-0004Hm-Vt
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:10:59 -0400
Received: by mail-pf1-x433.google.com with SMTP id i6so13258191pfb.2
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nRMEXB7YPadVE5hdI4341oxvhxYYKiN9qf3uVsx6pus=;
 b=XWj2HLRvJXtFgF9UIpAXphNml4iv/Ofefy0h3sYt4KBgigALpnHbkrIPlqGKZAth9d
 N/GwtYw3EIW+rt90GKWCmxyvA2PQM9TJuvuRFq40kfnsFDxc4Bwhio+4tFzcbAJSlkDq
 4psdD7KmqoSoZIGyK/RORBSN8U+x7LIwc4W0bhtbLjZ1sB4WA8MqZr+KIXtWLkw6pfRS
 v/p+uczaJRz49obUXQz6Oq/c9jMy6DFTfTtxPDlYEpzDJGvlDjQh3bB9tlj5WFqoN/Ar
 E9eO1H4yFn0zHrFVuT3gfWG7zwQWODsoid/i+95cVDaQqe9IimpIAVsrI3Z9QWhzYSv/
 B2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nRMEXB7YPadVE5hdI4341oxvhxYYKiN9qf3uVsx6pus=;
 b=eWz0U3HVbaA4PLLI4okkV0GF/poA5wTxxKjCfAEkYUUWzI4CJPbaB/nPKFX08/j072
 MdkHQ82q3Oz/Ev/0CTySmjclzDSS/C8kRTX4GkkQ0i01Xg8uCzx+XEGEPsL7CV9MDxEC
 zIk+pSUS9AP1bp3jLqLrr3mJE4ePChH7+PTDXCJubj4VbRfVx/mWEPs5P2A7ybfSMpve
 hR4Y2y+tmz4tm4DZR/qZ9lCV3JNknha6SkX1VQ9L/8qyObsfXcw639ACi8KlB8uGwpcJ
 M0QwnPfbEhET+77XPey+mWwzn3j+nM2zRyctKBqX+nL9OkDM0Qsrp36BKiYv0T8FbcW4
 /bCA==
X-Gm-Message-State: ACrzQf13cWcTCOVNblRIfuoSxJYC+8TGJNEwXc3gDDbSunzcnFk6gCkk
 glKtLfQcHwbafdLWfEVx5c/GIV2ncNJcIg==
X-Google-Smtp-Source: AMsMyM6HCuZBXjLbcKAb0kZzzGe1I3stP7eXZ/1xyPXUaz+tC7h7/Hsv6m6UXUVnQd6Znq5rkoMefQ==
X-Received: by 2002:a63:5322:0:b0:44e:11f7:b414 with SMTP id
 h34-20020a635322000000b0044e11f7b414mr9471813pgb.226.1664892656512; 
 Tue, 04 Oct 2022 07:10:56 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa79ae5000000b00561382a5a25sm1240357pfp.26.2022.10.04.07.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:10:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v7 01/18] cpu: cache CPUClass in CPUState for hot code paths
Date: Tue,  4 Oct 2022 07:10:34 -0700
Message-Id: <20221004141051.110653-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004141051.110653-1-richard.henderson@linaro.org>
References: <20221004141051.110653-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

The class cast checkers are quite expensive and always on (unlike the
dynamic case who's checks are gated by CONFIG_QOM_CAST_DEBUG). To
avoid the overhead of repeatedly checking something which should never
change we cache the CPUClass reference for use in the hot code paths.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220811151413.3350684-3-alex.bennee@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220923084803.498337-3-clg@kaod.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 9 +++++++++
 cpu.c                 | 9 ++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 500503da13..1a7e1a9380 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -51,6 +51,13 @@ typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
  */
 #define CPU(obj) ((CPUState *)(obj))
 
+/*
+ * The class checkers bring in CPU_GET_CLASS() which is potentially
+ * expensive given the eventual call to
+ * object_class_dynamic_cast_assert(). Because of this the CPUState
+ * has a cached value for the class in cs->cc which is set up in
+ * cpu_exec_realizefn() for use in hot code paths.
+ */
 typedef struct CPUClass CPUClass;
 DECLARE_CLASS_CHECKERS(CPUClass, CPU,
                        TYPE_CPU)
@@ -317,6 +324,8 @@ struct qemu_work_item;
 struct CPUState {
     /*< private >*/
     DeviceState parent_obj;
+    /* cache to avoid expensive CPU_GET_CLASS */
+    CPUClass *cc;
     /*< public >*/
 
     int nr_cores;
diff --git a/cpu.c b/cpu.c
index 584ac78baf..14365e36f3 100644
--- a/cpu.c
+++ b/cpu.c
@@ -131,9 +131,8 @@ const VMStateDescription vmstate_cpu_common = {
 
 void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
-#ifndef CONFIG_USER_ONLY
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-#endif
+    /* cache the cpu class for the hotpath */
+    cpu->cc = CPU_GET_CLASS(cpu);
 
     cpu_list_add(cpu);
     if (!accel_cpu_realizefn(cpu, errp)) {
@@ -151,8 +150,8 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
     }
-    if (cc->sysemu_ops->legacy_vmsd != NULL) {
-        vmstate_register(NULL, cpu->cpu_index, cc->sysemu_ops->legacy_vmsd, cpu);
+    if (cpu->cc->sysemu_ops->legacy_vmsd != NULL) {
+        vmstate_register(NULL, cpu->cpu_index, cpu->cc->sysemu_ops->legacy_vmsd, cpu);
     }
 #endif /* CONFIG_USER_ONLY */
 }
-- 
2.34.1


