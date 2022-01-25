Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC7249A228
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:53:16 +0100 (CET)
Received: from localhost ([::1]:54550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCB1H-0004Un-Lv
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:53:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAex-00027f-Ha
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:11 -0500
Received: from [2607:f8b0:4864:20::133] (port=40793
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAev-0001Yy-I5
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:10 -0500
Received: by mail-il1-x133.google.com with SMTP id s1so273331ilj.7
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CjD6pNrb8Cxfr/lH07t3FSihICXtScIbMn43yN5Gho8=;
 b=IGVMI6ANj623zVvfYSkE++O3167mtODc9e+LwXZFZgAUq3xFrgnB8jAGXYz8rJ3D0E
 ZH7/w/A5nSsi8Tm6aJPxbqQtTAYOXudr2782IjlpFn+HubKEyfNvp/EQPWGsb74oO6SP
 MlysP6/xZMnw3Aq7ihC8yw/t+cztr+RvLctlLStPEs1qx5aNdjQEC+6IL0DNy28GBxo8
 xJ40feQSb5XlIxWwXqBkZrcnjjoZVg7K5vsOiGuoJIkXH4CtswvRsHIsAPCteqORYf70
 KxHATiMvUi/9EPk0UjJJFhcd5nxG+h4ucofqiFiUpU2SEpuj1zVbJQnuG3c/Uycn/EaZ
 4yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CjD6pNrb8Cxfr/lH07t3FSihICXtScIbMn43yN5Gho8=;
 b=iNm39IFxR3zxk1EIvUqgI6TFn/KCZZOjkAssYW8DVSTfOiOR7247pblvGwVp+NHwp1
 8a8QxkrnouXhmaomQ5xfYnvgBPdgheDNWYuCVCpy6XDWlYKPE5hkJndwbNbFB6JQL55f
 8CC1hoLhNdp1PHQyxqDYboFV79t7mRst6ChflzRagEsFu+vqKQce9tUmtNCtcr8KA9PS
 OYowbqxknV3S2e2BjCA8jua2khP72YUaKmWgwZ1/AzYd8CkBL5iJ9p2H+WZZkPZ2LIUE
 x0co/oJdSzjt17DiF00hUWW0ps6dpn6MHUmMy8r6ZkSXlKD4/8E427M0MLQ1u4ZZBAl3
 wQvg==
X-Gm-Message-State: AOAM530K22oJ7eZlpDwN7UIxnWXCJZ9jeO8iSCBz6iBSKGj5r8NHQtb9
 SCy1X8f56h5FpDRGjJbZoyQJYvMs7Y3x7w==
X-Google-Smtp-Source: ABdhPJzKuXWZMHecpTg3lpR9yVTWdihLWlXxy/WZ4zokpehH2jLsGrgDpikNRPJeGVS/x3vpBgutPQ==
X-Received: by 2002:a05:6e02:12a4:: with SMTP id
 f4mr9919451ilr.77.1643074208253; 
 Mon, 24 Jan 2022 17:30:08 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:07 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/40] bsd-user/arm/target_arch_cpu.h: Implement data faults
Date: Mon, 24 Jan 2022 18:29:22 -0700
Message-Id: <20220125012947.14974-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update for the richer set of data faults that are now possible. Copied
largely from linux-user/arm/cpu_loop.c, with minor typo fixes.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 45 ++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index f4b72939b2d..2f1ab4c6ac2 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -39,8 +39,7 @@ static inline void target_cpu_init(CPUARMState *env,
 
 static inline void target_cpu_loop(CPUARMState *env)
 {
-    int trapnr;
-    target_siginfo_t info;
+    int trapnr, si_signo, si_code;
     unsigned int n;
     CPUState *cs = env_cpu(env);
 
@@ -150,15 +149,41 @@ static inline void target_cpu_loop(CPUARMState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_PREFETCH_ABORT:
-            /* See arm/arm/trap.c prefetch_abort_handler() */
         case EXCP_DATA_ABORT:
-            /* See arm/arm/trap.c data_abort_handler() */
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            /* XXX: check env->error_code */
-            info.si_code = 0;
-            info.si_addr = env->exception.vaddress;
-            queue_signal(env, info.si_signo, &info);
+            /*
+             * See arm/arm/trap-v6.c prefetch_abort_handler() and
+             * data_abort_handler()
+             *
+             * However, FreeBSD maps these to a generic value and then uses that
+             * to maybe fault in pages in vm/vm_fault.c:vm_fault_trap(). I
+             * believe that the indirection maps the same as Linux, but haven't
+             * chased down every single possible indirection.
+             */
+
+            /* For user-only we don't set TTBCR_EAE, so look at the FSR. */
+            switch (env->exception.fsr & 0x1f) {
+            case 0x1: /* Alignment */
+                si_signo = TARGET_SIGBUS;
+                si_code = TARGET_BUS_ADRALN;
+                break;
+            case 0x3: /* Access flag fault, level 1 */
+            case 0x6: /* Access flag fault, level 2 */
+            case 0x9: /* Domain fault, level 1 */
+            case 0xb: /* Domain fault, level 2 */
+            case 0xd: /* Permission fault, level 1 */
+            case 0xf: /* Permission fault, level 2 */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_ACCERR;
+                break;
+            case 0x5: /* Translation fault, level 1 */
+            case 0x7: /* Translation fault, level 2 */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_MAPERR;
+                break;
+            default:
+                g_assert_not_reached();
+            }
+            force_sig_fault(si_signo, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-- 
2.33.1


