Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFBD444320
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:10:54 +0100 (CET)
Received: from localhost ([::1]:38100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miGyc-0004pJ-19
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwg-00026t-UX
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:54 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:34548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwe-0004v0-Gm
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:54 -0400
Received: by mail-qt1-x836.google.com with SMTP id u7so944663qtc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h2fdYoIHcyUR/++4/QSd+NppRobTSDqFOu9ZoZtWFRE=;
 b=VqR6SFi0nhsxTuhz0+n1nr2SepKsLpYzuXp8SeI50nmxAN2UMjoq5brxyRMqeupayX
 Y2Kih3G5rP/Qk+r6H7nsRTCvd8LRhT53URwpTZmjUNoHWp9zEwxeuVo4B2K5/pYW2wXk
 5El2k4QKlhZKOGvEP97ITGpcCEOCTIVrpD5V5yKFyOdgB0kdAOtjBrP2SFdPanYm11KY
 PbwK647h7Wbn4xwwgcDFyhWaRwu7h4bqF8BmUGkaJ6ebB0NkwtGZp8mKwBFU7CEQjxFJ
 rFN3DYnzH5XwfXuTxFZT999kIMQzmROI5dRUS6cTgWAlHIOOhKQpKydVrUc7rc0lytiX
 zW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h2fdYoIHcyUR/++4/QSd+NppRobTSDqFOu9ZoZtWFRE=;
 b=xpLivcPh+Lq4uIisXkkPBIsfnUAmWGvLrrC+QgirSQOqcZqoflyB8OZjJJo3NFxK0z
 fv6yhNhOEOZN4+Wi3m14V+0i7o/V9APp3H0gu/CUQAa1mE25ZGI5UyZsd4B0E7eDJkAD
 ZRQSmJaLtEVIZ7wSkflf/Cd4VqZkahAgUWQRkn+egFXduuqkzc7Eu5p298TY9y1R6WJC
 wtVmDDyqUKMcAMFDMWDI3BlLrzC+UndmFLQSBxAuS8Zjroj74PIRYyAr/wQ6PVg9hh/B
 LXwEYcLRdU3OgaS8NwdQlnz0OIBI2vPmKvXMKJSPZfZIYXOKDHc+t6Vy4IgrijcKaGXY
 1MOQ==
X-Gm-Message-State: AOAM531ezLYf+LAf4jyXxopUT33z4jzaqrK1OaMpYmp0IQAcmGgwbzOT
 3U9EJl4GmJrfaOFs1PjUh9/5rG7R5xxt7Q==
X-Google-Smtp-Source: ABdhPJwEnLSWUQx1JEi5vUfVLWtbUJuQiiQMP69v46ufbExSTXe0XDJoMnTLrVcdmYfZU3HZbSvXPQ==
X-Received: by 2002:a05:622a:d5:: with SMTP id
 p21mr30872854qtw.44.1635948531365; 
 Wed, 03 Nov 2021 07:08:51 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/23] linux-user/cris: Use force_sig_fault
Date: Wed,  3 Nov 2021 10:08:28 -0400
Message-Id: <20211103140847.454070-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
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


