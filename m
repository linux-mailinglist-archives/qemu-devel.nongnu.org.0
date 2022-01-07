Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD89487E6A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:44:26 +0100 (CET)
Received: from localhost ([::1]:59242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5x29-0003Oe-Ay
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:44:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqv-00057t-Pe
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:50 -0500
Received: from [2607:f8b0:4864:20::629] (port=36796
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqu-0007ms-9w
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:49 -0500
Received: by mail-pl1-x629.google.com with SMTP id p14so5838972plf.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mv1fuUpltIxjjPECtR2wMWMWUuHJti3WH2udOrlkbEI=;
 b=v9Cl+2jIU0v2IuH8d1zjMn1RluwrjZVp3m5Yc3e0nPGI50mPHLlLWdhSt/pq/g3VkA
 Q/zLjyU+4QqdlhNKW4tf7zsKVATs1hEOuxlDYSwhcYRm9okzAF8Cl2za2er8TLfq7PUa
 fALFcKYi1f8LmkNdgumwfaBkz0O0wKu4kKTkPMQ8HfqcsbC942Eems0c4OqybVKxgUWv
 43UhWSGOkKc5ZfOfIWOt+pgIRy5NZllkkNEcyt/yab9AvlMiSMasUfDLLHfp7sjOq9ny
 e+cZz3Vl5UU+MsB/avtjrBQGfucv2j/wumdOXUP7hot8RN4S6R85NCXlCZ4IhLPKibuS
 TlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mv1fuUpltIxjjPECtR2wMWMWUuHJti3WH2udOrlkbEI=;
 b=y5XFGvqxs6eSEyzcs3BQfxJjicjVr2rv/06Tu/z1rIUiHBxLMQoQYgBZ0Qg6UNs58r
 77Ichr36muz1cVNHuSY7nGFc7J9esEHQQ6qywiAwKaYP2rqLauVlWI+bw1alRg6Uy9ZZ
 OBlPz6lxQQrHqPweBPxjPVYaMKulzc2AemBAGQrZOLeu2bLPGr9w0VGb3l7sYMcAQcA+
 KPe5l8DaItb6tCTMXYVVhJHcYqNRtxfSOI8xQPxnw0ewvWTlVn74CmDWNcrBPcGUos2y
 oYfa5XmSHx5ZjFqXRrot4DZt6CxPd9iYT4oP9mMC+EybtnCG14NTktOJUm2vHdTo681O
 WAFg==
X-Gm-Message-State: AOAM532VX2aEgelUFXrKA6EsIn/mtEgWJozbrYWu4n72MQIrN0ZrB/Ph
 pQoZdKNu0rtafnzSSK3tMnSTsvK/xLce1g==
X-Google-Smtp-Source: ABdhPJxnZw+OC/yEflre1M6AhPwkmOlGZlAFXW4S2/PeYMk0lPnBXYoy6ittGKyFQFHx+U2jF2TK0Q==
X-Received: by 2002:a17:902:b082:b0:149:f81f:a29c with SMTP id
 p2-20020a170902b08200b00149f81fa29cmr7719384plr.39.1641591167100; 
 Fri, 07 Jan 2022 13:32:47 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/24] linux-user/cris: Use force_sig_fault
Date: Fri,  7 Jan 2022 13:32:23 -0800
Message-Id: <20220107213243.212806-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal.  Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/cris/cpu_loop.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 5213aebf55..0f46b3c1a8 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -28,8 +28,7 @@ void cpu_loop(CPUCRISState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, ret;
-    target_siginfo_t info;
-    
+
     while (1) {
         cpu_exec_start(cs);
         trapnr = cpu_exec(cs);
@@ -38,8 +37,8 @@ void cpu_loop(CPUCRISState *env)
 
         switch (trapnr) {
         case EXCP_INTERRUPT:
-          /* just indicate that signals should be handled asap */
-          break;
+            /* just indicate that signals should be handled asap */
+            break;
         case EXCP_BREAK:
             ret = do_syscall(env, 
                              env->regs[9], 
@@ -57,10 +56,7 @@ void cpu_loop(CPUCRISState *env)
             }
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.25.1


