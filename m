Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1465F49F5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 21:59:31 +0200 (CEST)
Received: from localhost ([::1]:41476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofo4g-0001Ne-3p
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 15:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyC-0001hR-5d
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:48 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:45666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofny8-0000F8-RF
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:46 -0400
Received: by mail-pg1-x535.google.com with SMTP id r18so446926pgr.12
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nRMEXB7YPadVE5hdI4341oxvhxYYKiN9qf3uVsx6pus=;
 b=Ovr8LVjxTZV4jPUkhmNVH/mkP4ioR74o75OUxxB7YAzmGKP+yEx8B2HyRPgvBcubo+
 ZjhA450AErjI0/ZdHO7XfKlU5bfxJcX+O38N3FO1YD3JE/0ZFIFoauOdAM+ga367jBVo
 AIK4sbKwse3aTuLqsq3ASj59GOA8FRKm09LKNHV0qx/APAIJT09QMX6AgxvP4nm/zzL9
 VdwMXytkGaNpgYTUkmDkMb6wWRZqX3wapmaf7z5PlufRFMSBsAOuWBhz8zJ4flq6r/5p
 Pf94sLuWUxeiXEgIW6nhFBtpJKxYV+iTtBozCjBEZTprjPDbDmhbY0OIN/Vz0SKM04sP
 DScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nRMEXB7YPadVE5hdI4341oxvhxYYKiN9qf3uVsx6pus=;
 b=VZr0RD54+vUGepN4mwIbsnRZSybqhuJ5wjjRIy/IpYJ+qLQFV+AZ4QYhjr8vZHePHD
 R4VCqg6cVXRKrdt4hAnekEV5Ia7gUX6AaJ6U2mMvUeVNHHjdN/cFVwThm6VrQtdc10RP
 JATvd1iM2+b+wdFarx5MBZQIezN+XQIUoKq3O0g2/z3NRssfMFXOHzfr1MjdMJwlrqpm
 hjobe1WD40A4iXD6AMy77NPD4lmaKzLDtvQ939ADIXIZtZ5fOMHqZ1yLL00iRj5eW/+H
 uLGHxyxeHwOuzWTOAGg/o3zQFpKFaNx4FNWmPw91YhxtP4V9Xe/oCLMlMXI/OxdxHTQt
 N8lg==
X-Gm-Message-State: ACrzQf0kUKtpJYe21mTphWpIpxUlz14t6hexhOCYSptCUk6fjV5fg5S4
 et6FRj7FTi/j5poqpsXtDhJwqkpN7LKSCw==
X-Google-Smtp-Source: AMsMyM6kNK9ny1qiTxf01FTX49ldjKcCPs6qbFn2OIL66cUxRscvrLI2nFnL1h9xJHGKdP56DUkyMw==
X-Received: by 2002:a05:6a00:2449:b0:528:3a29:e79d with SMTP id
 d9-20020a056a00244900b005283a29e79dmr29488266pfj.39.1664913163539; 
 Tue, 04 Oct 2022 12:52:43 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:52:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 01/20] cpu: cache CPUClass in CPUState for hot code paths
Date: Tue,  4 Oct 2022 12:52:22 -0700
Message-Id: <20221004195241.46491-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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


