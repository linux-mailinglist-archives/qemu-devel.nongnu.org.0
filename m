Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A95B40A22F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:51:08 +0200 (CEST)
Received: from localhost ([::1]:33082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwfD-0007mK-3I
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6s-0001s4-FY
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:38 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:37735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6f-0007tD-J2
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:34 -0400
Received: by mail-pf1-x431.google.com with SMTP id j6so10140098pfa.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kb91+YFTEbFst42ZRz3sMuMZw8QoF+wLwu9dQ16vWm0=;
 b=mnPFaIA1LByPYddFT0sbeR9Jo5oxf7GUSf8bIVCd7wpVbqXxfeOOCKGmrUKa2XLjtD
 KQ1KMjZFD9pmPrL7rXvWNv9mNSS/rlvtBPTYCWGhGZj8g8myUD0FfXBjuHLtjRQM7m4Y
 PrdTn/w+Sob+G9BVbCFnIwILyKA3aqHhKp1KguCcF0VXlo168D2GZNzNI8F+yp/G2Nu0
 yZr9EYwzjbXw6fuVVORkphf/CiMITeVC0psyZ7i5R7tFQ+ITef98awazkHkYAn6b1TMq
 M4a4p2+Muz9cECzTUMT/t2JvqzPDsIufVsjRP9WYewXcdnMmQr1T+wq1cYzcF3FCOhj9
 i2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kb91+YFTEbFst42ZRz3sMuMZw8QoF+wLwu9dQ16vWm0=;
 b=v9IRI7xtH09yRuLn+Emknl/Rb4lV7/ps/cVFdXriPwgmQREfqs1hb1cvml3W7QlVcv
 ynGfHa1wexbJy4DjMo0RIBlU9W48tYxMb6o56JsHv19eUb33C3VkLw5XNXNqFUwLk1RL
 aGuuwEj8JCfoS4aXSirpj5j2QyK0SrKUQspj4Z4VMCcXckNbhhJJRqCm/0965V+2M/xU
 B4nREtgWrgbXAAMiPPYcJwKFtEYOvsyOIw5GGiXrCkm2aFaW6eQdbT7c2Q3rt5VjMeQg
 Tf/mwXXNK0OIROUTlEYvk4Pzdv2AhE806qgFU/z5ON4aGtkPmXqYd7TO+XSaTkx254V2
 jy2Q==
X-Gm-Message-State: AOAM5339oWbd+gGlvVGDc1xhfR3My9ME/7oEANPApDqWcN6YNgLpGEqZ
 Z14b4vnmURL7X2RBqVqDhN1Yb+QBAWTurA==
X-Google-Smtp-Source: ABdhPJxUAM73UPaAMQwaZ5wDWAA1S4rOaWswUZ8Rk+tnTEc44FU5KmHTHbfmdvxZrB10gwcO68DPCQ==
X-Received: by 2002:a63:4464:: with SMTP id t36mr13330937pgk.4.1631578522727; 
 Mon, 13 Sep 2021 17:15:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/44] accel/tcg/user-exec: Fix read-modify-write of code on
 s390 hosts
Date: Mon, 13 Sep 2021 17:14:46 -0700
Message-Id: <20210914001456.793490-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: peter.maydell@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

x86_64 dotnet/runtime uses cmpxchg for code patching. When running it
under s390x qemu-linux user, cpu_signal_handler() does not recognize
this as a write and does not restore PAGE_WRITE cleared by
tb_page_add(), incorrectly forwarding the signal to the guest code.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210803221606.150103-1-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 48 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 90d1a2d327..8fed542622 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -680,18 +680,26 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
     pc = uc->uc_mcontext.psw.addr;
 
-    /* ??? On linux, the non-rt signal handler has 4 (!) arguments instead
-       of the normal 2 arguments.  The 3rd argument contains the "int_code"
-       from the hardware which does in fact contain the is_write value.
-       The rt signal handler, as far as I can tell, does not give this value
-       at all.  Not that we could get to it from here even if it were.  */
-    /* ??? This is not even close to complete, since it ignores all
-       of the read-modify-write instructions.  */
+    /*
+     * ??? On linux, the non-rt signal handler has 4 (!) arguments instead
+     * of the normal 2 arguments.  The 4th argument contains the "Translation-
+     * Exception Identification for DAT Exceptions" from the hardware (aka
+     * "int_parm_long"), which does in fact contain the is_write value.
+     * The rt signal handler, as far as I can tell, does not give this value
+     * at all.  Not that we could get to it from here even if it were.
+     * So fall back to parsing instructions.  Treat read-modify-write ones as
+     * writes, which is not fully correct, but for tracking self-modifying code
+     * this is better than treating them as reads.  Checking si_addr page flags
+     * might be a viable improvement, albeit a racy one.
+     */
+    /* ??? This is not even close to complete.  */
     pinsn = (uint16_t *)pc;
     switch (pinsn[0] >> 8) {
     case 0x50: /* ST */
     case 0x42: /* STC */
     case 0x40: /* STH */
+    case 0xba: /* CS */
+    case 0xbb: /* CDS */
         is_write = 1;
         break;
     case 0xc4: /* RIL format insns */
@@ -702,6 +710,12 @@ int cpu_signal_handler(int host_signum, void *pinfo,
             is_write = 1;
         }
         break;
+    case 0xc8: /* SSF format insns */
+        switch (pinsn[0] & 0xf) {
+        case 0x2: /* CSST */
+            is_write = 1;
+        }
+        break;
     case 0xe3: /* RXY format insns */
         switch (pinsn[2] & 0xff) {
         case 0x50: /* STY */
@@ -715,7 +729,27 @@ int cpu_signal_handler(int host_signum, void *pinfo,
             is_write = 1;
         }
         break;
+    case 0xeb: /* RSY format insns */
+        switch (pinsn[2] & 0xff) {
+        case 0x14: /* CSY */
+        case 0x30: /* CSG */
+        case 0x31: /* CDSY */
+        case 0x3e: /* CDSG */
+        case 0xe4: /* LANG */
+        case 0xe6: /* LAOG */
+        case 0xe7: /* LAXG */
+        case 0xe8: /* LAAG */
+        case 0xea: /* LAALG */
+        case 0xf4: /* LAN */
+        case 0xf6: /* LAO */
+        case 0xf7: /* LAX */
+        case 0xfa: /* LAAL */
+        case 0xf8: /* LAA */
+            is_write = 1;
+        }
+        break;
     }
+
     return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
 }
 
-- 
2.25.1


