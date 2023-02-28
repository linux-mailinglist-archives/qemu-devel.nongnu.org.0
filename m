Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDC76A5036
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 01:38:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWnzf-0006SN-FW; Mon, 27 Feb 2023 19:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWnzd-0006Qd-AH
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 19:37:21 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWnzb-0001XI-Fe
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 19:37:21 -0500
Received: by mail-pj1-x1036.google.com with SMTP id oj5so4083611pjb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 16:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4xxvNNq9D11d2cHOwhM2OgWfJwvQhuk5jBDpKihxi4=;
 b=ze2l0GJ1BJATmCRIXOfRHppbNHxsT0HPiXQI7hw6Ow5iJQqyguT1nORQXuaxzQDokU
 B+YvXMSrWZi41Yg9zArlfaPPjwR8lPDhQLp2n57duPN39gKySJ3nldu6RHoCz+ddbjfc
 IF2PlZ+7UKVwitEHBKh+xWDgPQFCMMsp0SPWD76+0J/2ppViJminzoh1h5+2IPJmzRmP
 KJ/mnmxEvO9KPCww0LUDlh/PzLqxx3DNMyDd3SyblFcEVYzZmlJBaZNkoS5cQDW5CTa4
 i99SlENejdZeu6uQa26sPjTHoaOrwAjkmGM+gZqjlVt6KhnMsR+8T++KKGSMKIiGbZmj
 QUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q4xxvNNq9D11d2cHOwhM2OgWfJwvQhuk5jBDpKihxi4=;
 b=DGtDsV06Y769+A4WiVArBZQUoS1Sma1C+IeEAxv4+1KJ+Awzs6EI+stc2WMIyHToB/
 V5djWt3B4i0cbcVxeFGTzU9DtVbj6epVqq0aB/LwvOpSWLdUU0uS8UYMGGf+dQKo5yRA
 6LgVS684wJ4XGtCITn/FOXkCG1YVJfEl2V0yaSb+p3VwEyQaGkHTC5KWkMLb2TfBLJKC
 UZILn61ARDy6oofHrOxYfWpCLw7TIPX9b3Z/fRdY6jl7lLH6Ik4Vrian95kdY/2S53gg
 9BNuGKzjroqr1PhhmucqUzuHE5yYCdt1U50WoGexfkaBJr3vQxGMu64r/uTfsOB9ST30
 yJuw==
X-Gm-Message-State: AO0yUKWPwrpBy4vyKI4ivvpsuLPJVp7X39egHc6tzUKWv7uii80SxYFh
 N/gFiQoKGqALOmiG1Ouyx3ApJdXeOXwU3J3ltvk=
X-Google-Smtp-Source: AK7set9moNBzltlY6F876/ChdDP9KTgfjLP1IkkCGSApPLdV1CoSEuE6wA8pTqlCmRW79fXKYV6eNA==
X-Received: by 2002:a17:903:1386:b0:19c:f18d:96b6 with SMTP id
 jx6-20020a170903138600b0019cf18d96b6mr617218plb.36.1677544637966; 
 Mon, 27 Feb 2023 16:37:17 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a1709028a9300b0019cec7d88c3sm5192651plo.236.2023.02.27.16.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 16:37:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/3] target/arm: Avoid splitting Zregs across lines in dump
Date: Mon, 27 Feb 2023 14:37:11 -1000
Message-Id: <20230228003713.861168-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228003713.861168-1-richard.henderson@linaro.org>
References: <20230228003713.861168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Allow the line length to extend to 548 columns.  While annoyingly wide,
it's still less confusing than the continuations we print.  Also, the
default VL used by Linux (and max for A64FX) uses only 140 columns.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5182ed0c91..f1f454e7a0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -953,7 +953,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     uint32_t psr = pstate_read(env);
-    int i;
+    int i, j;
     int el = arm_current_el(env);
     const char *ns_status;
     bool sve;
@@ -1012,7 +1012,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 
     if (sve) {
-        int j, zcr_len = sve_vqm1_for_el(env, el);
+        int zcr_len = sve_vqm1_for_el(env, el);
 
         for (i = 0; i <= FFR_PRED_NUM; i++) {
             bool eol;
@@ -1052,32 +1052,24 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             }
         }
 
-        for (i = 0; i < 32; i++) {
-            if (zcr_len == 0) {
+        if (zcr_len == 0) {
+            /*
+             * With vl=16, there are only 37 columns per register,
+             * so output two registers per line.
+             */
+            for (i = 0; i < 32; i++) {
                 qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64 "%s",
                              i, env->vfp.zregs[i].d[1],
                              env->vfp.zregs[i].d[0], i & 1 ? "\n" : " ");
-            } else if (zcr_len == 1) {
-                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64
-                             ":%016" PRIx64 ":%016" PRIx64 "\n",
-                             i, env->vfp.zregs[i].d[3], env->vfp.zregs[i].d[2],
-                             env->vfp.zregs[i].d[1], env->vfp.zregs[i].d[0]);
-            } else {
+            }
+        } else {
+            for (i = 0; i < 32; i++) {
+                qemu_fprintf(f, "Z%02d=", i);
                 for (j = zcr_len; j >= 0; j--) {
-                    bool odd = (zcr_len - j) % 2 != 0;
-                    if (j == zcr_len) {
-                        qemu_fprintf(f, "Z%02d[%x-%x]=", i, j, j - 1);
-                    } else if (!odd) {
-                        if (j > 0) {
-                            qemu_fprintf(f, "   [%x-%x]=", j, j - 1);
-                        } else {
-                            qemu_fprintf(f, "     [%x]=", j);
-                        }
-                    }
                     qemu_fprintf(f, "%016" PRIx64 ":%016" PRIx64 "%s",
                                  env->vfp.zregs[i].d[j * 2 + 1],
-                                 env->vfp.zregs[i].d[j * 2],
-                                 odd || j == 0 ? "\n" : ":");
+                                 env->vfp.zregs[i].d[j * 2 + 0],
+                                 j ? ":" : "\n");
                 }
             }
         }
-- 
2.34.1


