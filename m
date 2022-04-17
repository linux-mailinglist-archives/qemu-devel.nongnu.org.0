Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267EA5048A9
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 19:53:39 +0200 (CEST)
Received: from localhost ([::1]:42652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng95e-0003Ef-7b
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 13:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x0-0000fZ-7O
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:43 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wx-0003HP-AS
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:41 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so15524804pjn.3
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=28ulwBk/DdHKOhHfzeHCOUU8iGC2wvWNCEyLXBlgf/g=;
 b=JAj8bIiAgO5uzz4Oe7l6bjlADn4o1Vg69i2QGlT6tTEESbK2OvQj0MnybKY8D2Cueu
 1ZwlHh3eDqwI3DmWLxOCZODdIknmUVWVaCJ0J8CVER5YBmY3OU2W6pZxCj3x74+Ha0sr
 vsNYCAHIUrZradqz33jQEAdKI2001/xqhGJ/MVnd3Wq3CDGt81iI+25K9fnRU7FYRMFB
 lY/PL7cJO6jyrgYTAXqHfctZpiBdNNp+VyQf9FEsGpXnJsFA1gGYpTDR0ELQ6nnuwhNe
 dNW9Pt2tY8g4XXPN5OlaEQ1SUCeTytlvf8TbLp47OyXgpt6ChGWv3TjOPtOCiSEFr9Ot
 G97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=28ulwBk/DdHKOhHfzeHCOUU8iGC2wvWNCEyLXBlgf/g=;
 b=BNMOZMknVYIz4s2XFUQ3A/SqQn2OmRSfDXLEMh9DfAFN33PHkzegQKkv42kprBR4aS
 diFCSWxoLHi1gI3zHHNfgZgtMLlEZLQ0vvwhS/I09kq+8Xoap+5ctlb6WyiW3FXQc9gk
 BOc01oa9yrvjgySw4/tHsCx18Sc6+Vn6711TPUIKrXdFJaWjHLZSNYYbOV4uuSCbzNnK
 9z4z/YvgJocCMTePDtJprIFJxf1y8w1ylc9ZvLkMHlT1i/gF54MZ/2l8aKOHBBbMtdpA
 8UpFodqNeb9rAFUY53SEYJwdEuaQgeuxYliYb3woKjk8mlRDlaO77h5HBBaoqxjYm/uK
 0t6w==
X-Gm-Message-State: AOAM53121C8Ke55OwRwf4LmY9d5LKyry5soYf99WvA4SkB7XwprRt5jp
 xNoEiQV9or5faJkt5OBhNCDeZ92xfFhlLg==
X-Google-Smtp-Source: ABdhPJwXPF47FuVlVKGf2CpbPZmCHTt3kiBHIeaAb3nVEjpawCc6tWQ5rKIh5sx2pXBXSjOWEJh/Kg==
X-Received: by 2002:a17:90a:5902:b0:1cb:a0eb:8f8c with SMTP id
 k2-20020a17090a590200b001cba0eb8f8cmr8955487pji.17.1650217477378; 
 Sun, 17 Apr 2022 10:44:37 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/60] target/arm: Change CPUArchState.thumb to bool
Date: Sun, 17 Apr 2022 10:43:35 -0700
Message-Id: <20220417174426.711829-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bool is a more appropriate type for this value.
Adjust the assignments to use true/false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          | 2 +-
 linux-user/arm/cpu_loop.c | 2 +-
 target/arm/cpu.c          | 2 +-
 target/arm/m_helper.c     | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a61a52e2f6..4eb378ede2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -259,6 +259,7 @@ typedef struct CPUArchState {
      */
     uint32_t pstate;
     bool aarch64; /* True if CPU is in aarch64 state; inverse of PSTATE.nRW */
+    bool thumb;   /* True if CPU is in thumb mode; cpsr[5] */
 
     /* Cached TBFLAGS state.  See below for which bits are included.  */
     CPUARMTBFlags hflags;
@@ -285,7 +286,6 @@ typedef struct CPUArchState {
     uint32_t ZF; /* Z set if zero.  */
     uint32_t QF; /* 0 or 1 */
     uint32_t GE; /* cpsr[19:16] */
-    uint32_t thumb; /* cpsr[5]. 0 = arm mode, 1 = thumb mode. */
     uint32_t condexec_bits; /* IT bits.  cpsr[15:10,26:25].  */
     uint32_t btype;  /* BTI branch type.  spsr[11:10].  */
     uint64_t daif; /* exception masks, in the bits they are in PSTATE */
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index aae375d617..2979109f92 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -231,7 +231,7 @@ do_kernel_trap(CPUARMState *env)
     /* Jump back to the caller.  */
     addr = env->regs[14];
     if (addr & 1) {
-        env->thumb = 1;
+        env->thumb = true;
         addr &= ~1;
     }
     env->regs[15] = addr;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 30e0d16ad4..561f180067 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -51,7 +51,7 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 
     if (is_a64(env)) {
         env->pc = value;
-        env->thumb = 0;
+        env->thumb = false;
     } else {
         env->regs[15] = value & ~1;
         env->thumb = value & 1;
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index b7a0fe0114..a740c3e160 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -564,7 +564,7 @@ void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
         env->v7m.control[M_REG_S] &= ~R_V7M_CONTROL_SFPA_MASK;
     }
     switch_v7m_security_state(env, dest & 1);
-    env->thumb = 1;
+    env->thumb = true;
     env->regs[15] = dest & ~1;
     arm_rebuild_hflags(env);
 }
@@ -590,7 +590,7 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
          * except that the low bit doesn't indicate Thumb/not.
          */
         env->regs[14] = nextinst;
-        env->thumb = 1;
+        env->thumb = true;
         env->regs[15] = dest & ~1;
         return;
     }
@@ -626,7 +626,7 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
     }
     env->v7m.control[M_REG_S] &= ~R_V7M_CONTROL_SFPA_MASK;
     switch_v7m_security_state(env, 0);
-    env->thumb = 1;
+    env->thumb = true;
     env->regs[15] = dest;
     arm_rebuild_hflags(env);
 }
-- 
2.25.1


