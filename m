Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B583F3C59
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 22:03:22 +0200 (CEST)
Received: from localhost ([::1]:45434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHXD7-0005OR-6Q
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 16:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9y-00028E-U8
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:06 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9v-0004Te-4P
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:06 -0400
Received: by mail-pf1-x42f.google.com with SMTP id m26so11717912pff.3
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 13:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S3Ic6iGbb2NTPoozAwoc6s7WItVnl35pmUzWVFyhl0M=;
 b=v16q45jbY0Bm/F9kON0YGyVoryrkJwCvBW2A/deLNRcp1d22BKL4IYCTzBd59Xn7zJ
 0AaQXu87hv6aB67MJRVJNdf+kBpZtgsvMSvgMfPPuH6d6YPFYhfFtV0flPWgwFPDDV7x
 bBtiz8GWUCoL9f+xRTCPqe54KD5ln6LJn8JQBYTS8dIj30lJfoM2r3dB9mgn43WDgtmK
 Tl78iBelCV5fGKRwU5F76zie1xjwfEjqfCUxYu2lPXxpNabf6qt3wutqO1Z6lMmOf0sw
 /yPQ/87BXX8mM4vRM8Xjk0ENLTCGH2ezQVvK0Uog+dW8MnamJcFH2Al31pCl0KpNjShj
 bBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S3Ic6iGbb2NTPoozAwoc6s7WItVnl35pmUzWVFyhl0M=;
 b=LDHWHgvW+fEg7OWRCJxNIcDlhZF/2s2xQqRdzeM9UF3YY83LnUzGvDnDm2U1N3uJZx
 EvzPBoysX0RaUUx+8MI1lY1cz3boMgwSmhAr5ez/xUwnYTtz+6yIG557X/Isueqp91DW
 sFhY9jzL3LH2xsQAE7ZH6hi5msxMUgvBHN3PqRbE6I5PHoxNEcg9DJm+UM41I0kOBnSI
 yqFmv5oAM5Of674WNTeLqXIP6qDMe2Q2I1fwN8guqoCSni6U7qe+CD0vbkd8HblMj0BK
 jChXkUTZqHMyUy01/BZcxPBeBF8Dh/srqm691ndWtYgllyasOsQ7umBG4YYKeDgLg+L7
 1aXA==
X-Gm-Message-State: AOAM533JH/Ff92+nMCLWuJGVw5kGG2xVHzWFhCXHBy3h+aSleCZcJ228
 TtMX+STSo4Ksmd4M8H9IrMz0CFLTKUkPeg==
X-Google-Smtp-Source: ABdhPJwvnXMK9yBp4jpMpVYpJNyX5WHVxyfXJ+703E2OWhiqJcp+nPIh7kDYkioLodDhJ8SacAE1PQ==
X-Received: by 2002:a62:9288:0:b0:3e1:c44f:a1b7 with SMTP id
 o130-20020a629288000000b003e1c44fa1b7mr26538632pfd.63.1629576001839; 
 Sat, 21 Aug 2021 13:00:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h13sm12562257pgh.93.2021.08.21.13.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 13:00:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] linux-user/aarch64: Handle EC_PCALIGNMENT
Date: Sat, 21 Aug 2021 12:59:53 -0700
Message-Id: <20210821195958.41312-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210821195958.41312-1-richard.henderson@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will shortly be raised for execution with a misaligned pc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 44 +++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 11e34cb100..6e03afb2bd 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -78,7 +78,7 @@
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, ec, fsc, si_code;
+    int trapnr, ec, fsc, si_sig, si_code;
     abi_long ret;
 
     for (;;) {
@@ -112,28 +112,38 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
             ec = syn_get_ec(env->exception.syndrome);
-            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
-
-            /* Both EC have the same format for FSC, or close enough. */
-            fsc = extract32(env->exception.syndrome, 0, 6);
-            switch (fsc) {
-            case 0x04 ... 0x07: /* Translation fault, level {0-3} */
-                si_code = TARGET_SEGV_MAPERR;
+            switch (ec) {
+            case EC_DATAABORT:
+            case EC_INSNABORT:
+                /* Both EC have the same format for FSC, or close enough. */
+                fsc = extract32(env->exception.syndrome, 0, 6);
+                switch (fsc) {
+                case 0x04 ... 0x07: /* Translation fault, level {0-3} */
+                    si_sig = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_MAPERR;
+                    break;
+                case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
+                case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
+                    si_sig = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_ACCERR;
+                    break;
+                case 0x11: /* Synchronous Tag Check Fault */
+                    si_sig = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_MTESERR;
+                    break;
+                default:
+                    g_assert_not_reached();
+                }
                 break;
-            case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
-            case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
-                si_code = TARGET_SEGV_ACCERR;
-                break;
-            case 0x11: /* Synchronous Tag Check Fault */
-                si_code = TARGET_SEGV_MTESERR;
+            case EC_PCALIGNMENT:
+                si_sig = TARGET_SIGBUS;
+                si_code = TARGET_BUS_ADRALN;
                 break;
             default:
                 g_assert_not_reached();
             }
-
-            force_sig_fault(TARGET_SIGSEGV, si_code, env->exception.vaddress);
+            force_sig_fault(si_sig, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-- 
2.25.1


