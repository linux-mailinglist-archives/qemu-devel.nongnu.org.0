Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6121466B3A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:56:34 +0100 (CET)
Received: from localhost ([::1]:53524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mst85-0004pZ-J1
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:56:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0t-00005h-8H
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:08 -0500
Received: from [2607:f8b0:4864:20::434] (port=34796
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0r-0005Su-7c
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:06 -0500
Received: by mail-pf1-x434.google.com with SMTP id r130so749749pfc.1
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 12:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4CLF5Cf10tY7ttRY0ouAmhAHzRXoDrzVwZM6NDHKcnI=;
 b=ay1ku5Wao1FtsQ0RT74QPm/zJV4gV7UFziabVlO3qnAiFkd+Q6J4I0mUcIcvjEAVJQ
 tyqB4MZC+0yK3XEipyPA3jfEklXauPVo/SO7pld0fse6vkI6zm5Kj3ceuGeYmWARj2kH
 Hwr9UXByaC3AMo/yL5xsC5bc0XrbJgd2Bx9yDcQQ6POLwh2IellazIWQBL8Hd4uvTnJf
 /Yb5sKfw4OJyiF5khxc+HdQ4yDlq+1xri846uct1/5H0HunkWYDp9QhhO7Wd6MbJqcYJ
 +ylwYwRDHF99qy69Er/V87JvNICdGzgRMnjANNj7lah2XXqOU2c1ym8OVQvgiFdzE8Nd
 fpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4CLF5Cf10tY7ttRY0ouAmhAHzRXoDrzVwZM6NDHKcnI=;
 b=0AKXj5coqfE4cPugo34MATWTZSx4fgt5LnkMV5JkZs6fEeC9EFaHayd9M0hkKIahpi
 2GdZSaIzBPYKheYxMe6pB0UBJM6Qo/lO0eusiJkgmiEIwjxz7aPhCBsG6zBOxsLxnVwD
 JYdVBjsBt5M92bAb7tSG47Gur9giInsbZL1gU5msQ4ZLDHio1g99STLb3zr0CmLbrMRR
 UQp59gOQFVSpEiLwVE9ueZZo7CfZAf+8ZJQTzf2hXLPNktAsb+p8VKF2j0nJwn6vXrDJ
 AminDHignF5PX9zGWQwOqFNS0GnXnYUMmi5np+g1eTZhswGQVXEFb0jPl0Vt58kmVrUG
 Cbbg==
X-Gm-Message-State: AOAM533hGmJsJ7Lxyb9bLrG7IxDQQZwmXsjdIFNVgoN0Yq2CpsVgQtZO
 Ha/Pf9Nqtu2+O4Y1dQs9TO5rhsqSEJdiDg==
X-Google-Smtp-Source: ABdhPJyr8GvbchL2FWHUbO4j6+Br6xlJ1ZsTpM+Tmpw3ld1vfOLKV4jJbFI6l0z6vW4GWIsVJjo0eQ==
X-Received: by 2002:a63:90c7:: with SMTP id a190mr1235794pge.526.1638478142974; 
 Thu, 02 Dec 2021 12:49:02 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pi17sm3721391pjb.34.2021.12.02.12.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:49:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/15] target/m68k: Switch over exception type in
 m68k_interrupt_all
Date: Thu,  2 Dec 2021 12:48:47 -0800
Message-Id: <20211202204900.50973-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202204900.50973-1-richard.henderson@linaro.org>
References: <20211202204900.50973-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace an if ladder with a switch for clarity.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 45 +++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 36662de149..71176eb3d8 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -332,7 +332,8 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         sp &= ~1;
     }
 
-    if (cs->exception_index == EXCP_ACCESS) {
+    switch (cs->exception_index) {
+    case EXCP_ACCESS:
         if (env->mmu.fault) {
             cpu_abort(cs, "DOUBLE MMU FAULT\n");
         }
@@ -390,26 +391,36 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
                      "ssw:  %08x ea:   %08x sfc:  %d    dfc: %d\n",
                      env->mmu.ssw, env->mmu.ar, env->sfc, env->dfc);
         }
-    } else if (cs->exception_index == EXCP_ADDRESS) {
+        break;
+
+    case EXCP_ADDRESS:
         do_stack_frame(env, &sp, 2, oldsr, 0, retaddr);
-    } else if (cs->exception_index == EXCP_ILLEGAL ||
-               cs->exception_index == EXCP_DIV0 ||
-               cs->exception_index == EXCP_CHK ||
-               cs->exception_index == EXCP_TRAPCC ||
-               cs->exception_index == EXCP_TRACE) {
+        break;
+
+    case EXCP_ILLEGAL:
+    case EXCP_DIV0:
+    case EXCP_CHK:
+    case EXCP_TRAPCC:
+    case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
         do_stack_frame(env, &sp, 2, oldsr, env->pc, retaddr);
-    } else if (is_hw && oldsr & SR_M &&
-               cs->exception_index >= EXCP_SPURIOUS &&
-               cs->exception_index <= EXCP_INT_LEVEL_7) {
-        do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
-        oldsr = sr;
-        env->aregs[7] = sp;
-        cpu_m68k_set_sr(env, sr &= ~SR_M);
-        sp = env->aregs[7] & ~1;
-        do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
-    } else {
+        break;
+
+    case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
+        if (is_hw && oldsr & SR_M) {
+            do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+            oldsr = sr;
+            env->aregs[7] = sp;
+            cpu_m68k_set_sr(env, sr &= ~SR_M);
+            sp = env->aregs[7] & ~1;
+            do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
+            break;
+        }
+        /* fall through */
+
+    default:
         do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+        break;
     }
 
     env->aregs[7] = sp;
-- 
2.25.1


