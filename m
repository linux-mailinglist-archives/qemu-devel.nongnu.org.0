Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEB447B4C9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:10:34 +0100 (CET)
Received: from localhost ([::1]:37004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPvV-0000Ix-4W
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:10:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqj-00009s-7y
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:37 -0500
Received: from [2607:f8b0:4864:20::432] (port=34687
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqh-0005t6-5D
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:36 -0500
Received: by mail-pf1-x432.google.com with SMTP id c2so9775131pfc.1
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h2fdYoIHcyUR/++4/QSd+NppRobTSDqFOu9ZoZtWFRE=;
 b=i7EOwVGGZbmSp+ngwoi2ZFb2kUdwpmJm7+gPue71MSI8/i75LeRcLRaCK8Qq+XXoKv
 LJa5asxQkHARpelcN6JvmPM6OZ4mYTndtQzmqvHfnQGUphvgdxUPb1Y2UGAQZlHrdhQv
 7Wo3Gar7s5B4Noy3LvyGEjhB2zb9QhyphDGJxiPKqV02rgDwhrWP2H4pCbhuTDUangv4
 vrK/k8fbl9gvGAOE/8uyrDAqKQ56UUD6TnlZJ6OquVqRC0E2znIElI0kKDY2qhFslegI
 /ipOlw8Uu974e2UnYw0Qj2GDN6tUKA3Jbqhl0HIBqgkxgTO1Dx9PwACwXRJSbLxKvF+P
 b2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h2fdYoIHcyUR/++4/QSd+NppRobTSDqFOu9ZoZtWFRE=;
 b=HH4FLRjUwdBaMXEGgFILppxt7FkCifxVydjq1HAf+qE/OgyqN3WCpsAVbpcAnSxmrI
 vThdwo9SoJJ/h9MqQ8FXV5kPRklxXbOHprNwKzFaicK+V1Iktc2SXDkQqFtq0mYFHI+U
 kv5Bszjw/gw0+XIasAC7MgEzp6xg+jAJ+3gKCfxqcAZUltnk03+aAQ67rx0Cv5ytCw21
 CBWdVJiE7Y1Cr4BbQmU77CBYuJkkPk3xzbNkW8pEkAYzSg69uEc8U6yUgs6Di4Qd2WOP
 pRF72JpdhUSiiUAqg9ujt2CSgQLDSF240eAbiYnhgPOJxue0JYn08oamJOYmSDaNMBsn
 6jiw==
X-Gm-Message-State: AOAM533ka5h1G1bbYQypwqGffr7StxXEKPAYeo0ET4O3upST4m93gxnn
 yK4wFAFanmkuleOeqUPDf8E0ImtDzY1WhA==
X-Google-Smtp-Source: ABdhPJyKoa1qbSWq9jkNxHK2aFy14qPYYiynj0OINVxmqYhECwGjjkjg0NddOIDWPg88FDGgU+lLJg==
X-Received: by 2002:a05:6a00:c88:b0:4ba:96e9:ffdc with SMTP id
 a8-20020a056a000c8800b004ba96e9ffdcmr13768383pfv.33.1640034333760; 
 Mon, 20 Dec 2021 13:05:33 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/24] linux-user/cris: Use force_sig_fault
Date: Mon, 20 Dec 2021 13:05:08 -0800
Message-Id: <20211220210529.150423-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
index 0d5d268609..16a2e889e5 100644
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


