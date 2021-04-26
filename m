Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E7936AB02
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:16:05 +0200 (CEST)
Received: from localhost ([::1]:52638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larjA-0006n5-QX
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNs-0008Fw-I9
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:04 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNf-0007bz-VN
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:04 -0400
Received: by mail-pg1-x535.google.com with SMTP id w20so242923pge.13
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=StsRKN9z7yfTj0IH3GzexqhFO/ZIMPkNxjefbCkcPBA=;
 b=SC1Ql7Xh/47S5kRmTAVinfQHrx9KYVF18FQ+PIisUsNqctjjmGV7qArubM6PT+DQAa
 4Buz3FX4mDR6qzRDypdcJ1kXkBHK+fGhLfxlqXqnZEwYclEyCHmqsny30z+sVxvhC+h3
 PARveFmfrQ8uxqVesEFg9T0SjTMLVQWpB4ECEN+kkQWoBajLYpl1bOsCrpRbSnqnaoX1
 mrhyWBGqBdB6Kd0Lo4RkuYtuVr/u7nSqUv+8RaM8oPRoa31bvSQ1p0PeUdUmfyIdiKdU
 LJNw23MHzKe0nF/e1CdzIJwM9TDfy50GcKaiYI6K+48Gm7VRyjN0pK5yGYsA9/6mLjpI
 auig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=StsRKN9z7yfTj0IH3GzexqhFO/ZIMPkNxjefbCkcPBA=;
 b=KBpD5QN2MVI4xQuENLlHqpTbs3KZLAmZMCnkuZKB9RBBqZjS3/o6A4Mkm3jc9EPuVN
 jq8/DpaaYuuuG7e4bgoCwxFpkbMROreMIgvvoYjriW9bOyx+sIIVqAbXvtBDizR9pvhP
 m3ecWOsKoWXk0x7SvtFXFrgsdUaTtM1sIKehNhM275/LUazXfhQ5y0PV0D+gSkj1BLrP
 NkO2Wn7PiWFckqJPMyyntXbOSSNYIEeUuV10tUUrtKkUfoTjA3Wg9Vm6sJ4uPJKv/u5g
 pQ+LAUCrgvIoSg4oS1LAw3jHc/TMJUdvrVrKxz1vZsFSzRlGVO5M73y3ncEJEazElPSx
 u5Wg==
X-Gm-Message-State: AOAM530uRne7HeQbYC5IvbDiblYLesoUsfwOXnsDcNFSpfsMlzc2ebYY
 bHLQsyzoIFuYC9t2wpEe8nEnyVgskIQhUg==
X-Google-Smtp-Source: ABdhPJzZIxFIzp3HataLPdXDfZSjaPTmpsfsiNUtmWGOFWmI3AfkCwMVWLYhK7dvCQaIF27tuUcJ1Q==
X-Received: by 2002:a62:8cd0:0:b029:256:a7a9:2a3a with SMTP id
 m199-20020a628cd00000b0290256a7a92a3amr15329914pfd.69.1619405629811; 
 Sun, 25 Apr 2021 19:53:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/25] linux-user/sparc: Minor corrections to do_sigreturn
Date: Sun, 25 Apr 2021 19:53:30 -0700
Message-Id: <20210426025334.1168495-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

Check that the input sp is 16 byte aligned, not 4.
Do that before the lock_user_struct check.

Validate the saved sp is 8 byte aligned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/signal.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index f0f614a3af..0ff57af43d 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -254,7 +254,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 long do_sigreturn(CPUSPARCState *env)
 {
     abi_ulong sf_addr;
-    struct target_signal_frame *sf;
+    struct target_signal_frame *sf = NULL;
     abi_ulong pc, npc, ptr;
     target_sigset_t set;
     sigset_t host_set;
@@ -262,18 +262,21 @@ long do_sigreturn(CPUSPARCState *env)
 
     sf_addr = env->regwptr[WREG_SP];
     trace_user_do_sigreturn(env, sf_addr);
-    if (!lock_user_struct(VERIFY_READ, sf, sf_addr, 1)) {
+
+    /* 1. Make sure we are not getting garbage from the user */
+    if ((sf_addr & 15) || !lock_user_struct(VERIFY_READ, sf, sf_addr, 1)) {
         goto segv_and_exit;
     }
 
-    /* 1. Make sure we are not getting garbage from the user */
-
-    if (sf_addr & 3)
+    /* Make sure stack pointer is aligned.  */
+    __get_user(ptr, &sf->regs.u_regs[14]);
+    if (ptr & 7) {
         goto segv_and_exit;
+    }
 
-    __get_user(pc,  &sf->regs.pc);
+    /* Make sure instruction pointers are aligned.  */
+    __get_user(pc, &sf->regs.pc);
     __get_user(npc, &sf->regs.npc);
-
     if ((pc | npc) & 3) {
         goto segv_and_exit;
     }
@@ -309,7 +312,7 @@ long do_sigreturn(CPUSPARCState *env)
     unlock_user_struct(sf, sf_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
 
-segv_and_exit:
+ segv_and_exit:
     unlock_user_struct(sf, sf_addr, 0);
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
-- 
2.25.1


