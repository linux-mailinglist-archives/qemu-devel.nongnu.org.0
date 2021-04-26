Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B5A36AB01
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:14:25 +0200 (CEST)
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larhZ-0005qv-1E
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNp-00087J-9a
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:01 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNf-0007c5-VD
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:01 -0400
Received: by mail-pl1-x62c.google.com with SMTP id y1so12490353plg.11
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TkKT5OMJxjXKKyi/UocWIxlnEBUiJVtr7KGGLmdTMQc=;
 b=K4FQhBKpa3UfLwf3NkUriynEmfNxzMyZMSlKT9jpSbiZhR5z8IkU5oUke5r+vURhFW
 uYPqLxJeE8HDuOz03xgyiRGjjTdZcXGh68ot+Io1lgVSsdQWt1X6QJFFmQ2/ML7QdmXA
 3QNwWicnkPir94tBK3uTHiRRMq2Uc+HGeHG+aclfL/qa3zSECh5KbyzKxxHcW9XPQdiZ
 zU/VKhuMp4i1cO4btPRly1OEF3AkSRvZ0egkD08+0QYIuqnLsFz089cwEf1EWKefAyM/
 iMqFtTkXUg2XnN6BWdvFZ5fkAyNSzhYaP1vN7GsaXY1bclkohlp5fXZxFLWlc1UbycCd
 GuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TkKT5OMJxjXKKyi/UocWIxlnEBUiJVtr7KGGLmdTMQc=;
 b=Ww4YOqEBN3NAd3eZy85oCri6ywwMin+h3KVqX4bVudovfCS1u8o79IDLZfrFZkmzm2
 suTNzRwLXWyQtjH3mt1UrxZlY+wN6IpYtN7QBGXGXE+enpWyDQ/IEpQOqKPqKz/Q6ZQ2
 5w7f0zPB9pJ+c4krgMxOuG542F8JWz9t1ld5e1r9b6K6C7eGOxS9aehchJs+W1Rs/+1q
 YLvdvohXTH4esRaHa4PVkNdflvK3f3HW2O2T1R1z5oxo7TUboj+BgLclW/Ze2sHl3B9g
 MSPRLhzKn81QY/zGNioaCoN7P/Zl2n1rYKKiPzq0q83lu6ek6Ir61Qa9ELwTFskzO7Uq
 kK5A==
X-Gm-Message-State: AOAM531QDsBSz8jNsRPWEZy7+pxC++3uo8wpZBsGe2HdDsFpL6E+dR0/
 ZQ1+Axn5IYE4227E8MgRK1o9evCC052mbQ==
X-Google-Smtp-Source: ABdhPJx8Zkcqf2UX3gG+LcurTwM0ESBFBUlX4zd2m8ZBex7xs01GZjZ6nkG7h142kahmsdOQPsqoww==
X-Received: by 2002:a17:902:b10d:b029:ec:b5c2:5724 with SMTP id
 q13-20020a170902b10db02900ecb5c25724mr16132894plr.2.1619405630267; 
 Sun, 25 Apr 2021 19:53:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/25] linux-user/sparc: Add 64-bit support to fpu
 save/restore
Date: Sun, 25 Apr 2021 19:53:31 -0700
Message-Id: <20210426025334.1168495-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The shape of the kernel's __siginfo_fpu_t is dependent on
the cpu type, not the abi.  Which is weird, but there ya go.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/signal.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 0ff57af43d..41a8b33bac 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -44,6 +44,12 @@ struct target_stackf {
 };
 
 struct target_siginfo_fpu {
+#ifdef TARGET_SPARC64
+    uint64_t si_double_regs[32];
+    uint64_t si_fsr;
+    uint64_t si_gsr;
+    uint64_t si_fprs;
+#else
     /* It is more convenient for qemu to move doubles, not singles. */
     uint64_t si_double_regs[16];
     uint32_t si_fsr;
@@ -52,6 +58,7 @@ struct target_siginfo_fpu {
         uint32_t insn_addr;
         uint32_t insn;
     } si_fpqueue [16];
+#endif
 };
 
 struct target_signal_frame {
@@ -167,21 +174,50 @@ static void save_fpu(struct target_siginfo_fpu *fpu, CPUSPARCState *env)
 {
     int i;
 
+#ifdef TARGET_SPARC64
+    for (i = 0; i < 32; ++i) {
+        __put_user(env->fpr[i].ll, &fpu->si_double_regs[i]);
+    }
+    __put_user(env->fsr, &fpu->si_fsr);
+    __put_user(env->gsr, &fpu->si_gsr);
+    __put_user(env->fprs, &fpu->si_fprs);
+#else
     for (i = 0; i < 16; ++i) {
         __put_user(env->fpr[i].ll, &fpu->si_double_regs[i]);
     }
     __put_user(env->fsr, &fpu->si_fsr);
     __put_user(0, &fpu->si_fpqdepth);
+#endif
 }
 
 static void restore_fpu(struct target_siginfo_fpu *fpu, CPUSPARCState *env)
 {
     int i;
 
+#ifdef TARGET_SPARC64
+    uint64_t fprs;
+    __get_user(fprs, &fpu->si_fprs);
+
+    /* In case the user mucks about with FPRS, restore as directed. */
+    if (fprs & FPRS_DL) {
+        for (i = 0; i < 16; ++i) {
+            __get_user(env->fpr[i].ll, &fpu->si_double_regs[i]);
+        }
+    }
+    if (fprs & FPRS_DU) {
+        for (i = 16; i < 32; ++i) {
+            __get_user(env->fpr[i].ll, &fpu->si_double_regs[i]);
+        }
+    }
+    __get_user(env->fsr, &fpu->si_fsr);
+    __get_user(env->gsr, &fpu->si_gsr);
+    env->fprs |= fprs;
+#else
     for (i = 0; i < 16; ++i) {
         __get_user(env->fpr[i].ll, &fpu->si_double_regs[i]);
     }
     __get_user(env->fsr, &fpu->si_fsr);
+#endif
 }
 
 void setup_frame(int sig, struct target_sigaction *ka,
-- 
2.25.1


