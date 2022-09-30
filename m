Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BD25F14F1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:33:02 +0200 (CEST)
Received: from localhost ([::1]:49872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNd0-0007aj-1I
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWi-0005tB-7P
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:32 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:37843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWg-0005N5-Fs
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:31 -0400
Received: by mail-qk1-x733.google.com with SMTP id s9so3616839qkg.4
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nRMEXB7YPadVE5hdI4341oxvhxYYKiN9qf3uVsx6pus=;
 b=JI7MqMZIN4sqpu5KArzh/h/nKvYtzU4gCCdDHY3hgdiSXdekWjRwf59i55SdGIYBUV
 Nrq51aK2sP/+DrvjDmrU7c0oBjPrbD8HdN1yy9uD5YNyqTJ1QMBWepJ2DUNR855cvlLP
 47a/6PehqXa/QAlIhwxyZJMpIitPFOq6YvAimRBntwOfrUDEc2FVvxCyJvwDLQq676D7
 nQ9EUwTvDWE8b7J187Di7sVvs05RuaKmWIp8FnqO8KbGbhqC+bqRb3YWZ2Ro68cpyAC6
 OGR9igfkjkG2dpzaRrGGxtlDDVu6UHCug7nVDuvGPf0NS2U9LikYUx3lCxz/3AtOd30Y
 ZNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nRMEXB7YPadVE5hdI4341oxvhxYYKiN9qf3uVsx6pus=;
 b=MbycM26EzjXNZje7aPrXN9cfYwzSMclmGNcoFILhgzWP/EkMrWhmCWA0icYIwnOpka
 +g8Rz/XJeGc8t37wQKPhU2cvcfwolYw6Ws+ER4QyhFbRlLkx7KwDXRu6n7im5cT7bYsm
 TXQs6VpgPtf0USvF9EuGISFRQVUSnPSghuy7LHoPfxTncA3Ltua74P3Bu3O1Vj9dwSLN
 TtZGUTh0Jd1EnWdlAj75nMqW9ffx/OXIfduBJbCskOEvTozxWWhRoGvpylTMA5Ful30n
 ztOP2U1kms4W27xU5zNnHZBBn8F0kyRzkmKmnKsDB1tBlDZ7WFUNpjQ4nPmv7Riyc1lW
 9HXg==
X-Gm-Message-State: ACrzQf0pYMnvSa35cZ+siAPKlFwZwC33kupv/7NwPAM9DY97RaJuWasJ
 Xtx1gRi2dqoQP6joFZkWyCOEgZSYe74YEQ==
X-Google-Smtp-Source: AMsMyM5ecYLIhHYSqy2Rhi09D2X70FHUyXLO23Dsa+vDjVYjf2ysvdBLEO3HlNY7tbuQYCHnE6iXAg==
X-Received: by 2002:a05:620a:2456:b0:6ce:3cfe:dd62 with SMTP id
 h22-20020a05620a245600b006ce3cfedd62mr7429925qkn.380.1664573189433; 
 Fri, 30 Sep 2022 14:26:29 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b006ce813bb306sm3696370qkp.125.2022.09.30.14.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:26:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linux.org, alex.bennee@linux.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v6 01/18] cpu: cache CPUClass in CPUState for hot code paths
Date: Fri, 30 Sep 2022 14:26:05 -0700
Message-Id: <20220930212622.108363-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930212622.108363-1-richard.henderson@linaro.org>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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


