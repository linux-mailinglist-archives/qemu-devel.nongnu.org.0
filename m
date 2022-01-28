Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E60049FD0F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:47:02 +0100 (CET)
Received: from localhost ([::1]:49624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTSn-0006CT-Ie
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:47:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDB-0002Ax-CI
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:58 -0500
Received: from [2a00:1450:4864:20::32d] (port=54013
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD0-0006Q3-2t
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:47 -0500
Received: by mail-wm1-x32d.google.com with SMTP id n8so4669337wmk.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZFj0BsQuhPdpN6HiulkG32ZQk/456mTtdXfhKwX2aq8=;
 b=B20p+T1xqbTWihSzJeB7Bbqn7C+vQAF76SyqdKqV0BBZQ/ZZN7B1+BsYeOGm55USR8
 27wLa/ZM3LRaDdSQqIUvjVgMXCWQgs5ekSkNeC3wU2tEcODRVRqjhLlq1dXOuz+VFlqu
 4IFjLh/hseeMvioPxC9Vzoo+0tuvApFqUO3EO7XCRHmYUjGGzBJ64cFAgmXi+24Mz3Ct
 IWJwWQn894P0TNY3Vt3ZbIMTZSBCZR7oKgSqdNPDX/580dfgKgKDWnAoga70I0tNMzb0
 sQZX5MP1OvvEhsyjVVZmM/i0KeJTHZ3u1/lGAOZN9Qx+tQJAdZdgMFZO/Q+d5Z8phtPr
 8hFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZFj0BsQuhPdpN6HiulkG32ZQk/456mTtdXfhKwX2aq8=;
 b=SlN5ludbMu/aDKzbm7o+GVwiQ9Kkx+hvvE8wJf6aeKVSduSQyTxRAZN6liW5bhvevn
 nyF+AXiSoJhBko7Gooho+NvoH8ZO6bNolunIEl89AIAuuSRM9hjm/pggOTOrgleaHSEj
 SSI1SUScXTmqsoI9vqBUQKgG6U9OYfAt9QNDauMkjNQT5pDsNlOknN0rAh0eIzWKtV4r
 dzCCv3YdYOok43y20SM94xK3h5EZIjbzLXgJP5tp2DfKvnCvZ7yVyVI9XD1lG8KLvln/
 KdkuIyb7zN47jZktgT/E1mjEkIlDZbrWdNrCDlan/HGeluH0JwSIqOAZDTCcTpedQXND
 TnRw==
X-Gm-Message-State: AOAM533rixMuQMGxKLlIrSuHdDr0OxOGsmsINnilcs8OM+KLXaQDgF2T
 dizuRQmpDGRfHGPWz4R4pASaWfILQOTz0Q==
X-Google-Smtp-Source: ABdhPJwj9yu8Qa4Ftn8N3i1lnes/FomHYuBH/WcLDrYE85dGjJfiVIsMshB7nIbXVQwgiKe33qUpkw==
X-Received: by 2002:a7b:cc93:: with SMTP id p19mr7757552wma.175.1643383832029; 
 Fri, 28 Jan 2022 07:30:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/32] target/arm: Log CPU index in 'Taking exception' log
Date: Fri, 28 Jan 2022 15:29:54 +0000
Message-Id: <20220128153009.2467560-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

In an SMP system it can be unclear which CPU is taking an exception;
add the CPU index (which is the same value used in the TCG 'Trace
%d:' logging) to the "Taking exception" log line to clarify it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220122182444.724087-2-peter.maydell@linaro.org
---
 target/arm/internals.h | 2 +-
 target/arm/helper.c    | 9 ++++++---
 target/arm/m_helper.c  | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 89f7610ebc5..3f05748ea47 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1130,7 +1130,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
     __attribute__((nonnull));
 
-void arm_log_exception(int idx);
+void arm_log_exception(CPUState *cs);
 
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cfca0f5ba6d..4df12394021 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9317,8 +9317,10 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     return target_el;
 }
 
-void arm_log_exception(int idx)
+void arm_log_exception(CPUState *cs)
 {
+    int idx = cs->exception_index;
+
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         const char *exc = NULL;
         static const char * const excnames[] = {
@@ -9352,7 +9354,8 @@ void arm_log_exception(int idx)
         if (!exc) {
             exc = "unknown";
         }
-        qemu_log_mask(CPU_LOG_INT, "Taking exception %d [%s]\n", idx, exc);
+        qemu_log_mask(CPU_LOG_INT, "Taking exception %d [%s] on CPU %d\n",
+                      idx, exc, cs->cpu_index);
     }
 }
 
@@ -10185,7 +10188,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
 
     assert(!arm_feature(env, ARM_FEATURE_M));
 
-    arm_log_exception(cs->exception_index);
+    arm_log_exception(cs);
     qemu_log_mask(CPU_LOG_INT, "...from EL%d to EL%d\n", arm_current_el(env),
                   new_el);
     if (qemu_loglevel_mask(CPU_LOG_INT)
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 2c9922dc292..b11e927df1d 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2206,7 +2206,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     uint32_t lr;
     bool ignore_stackfaults;
 
-    arm_log_exception(cs->exception_index);
+    arm_log_exception(cs);
 
     /*
      * For exceptions we just mark as pending on the NVIC, and let that
-- 
2.25.1


