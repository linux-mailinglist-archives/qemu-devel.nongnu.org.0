Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECED14FA68
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Feb 2020 20:49:40 +0100 (CET)
Received: from localhost ([::1]:50082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixylv-0005XP-Ei
	for lists+qemu-devel@lfdr.de; Sat, 01 Feb 2020 14:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58998)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ixyT1-00084e-0c
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 14:30:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ixySz-0007Fx-LR
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 14:30:06 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37119)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ixySz-0007Ec-FB
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 14:30:05 -0500
Received: by mail-pf1-x444.google.com with SMTP id p14so5273828pfn.4
 for <qemu-devel@nongnu.org>; Sat, 01 Feb 2020 11:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u56IY+HRZxZx4lkNPaNYlhu3dFhpsHvask7g8ioRP78=;
 b=zZ9CvDnyU9pcbNVQ/2X1oYhkXancUwUOIa2ckxIXqiovtNPe5WyaacXv44bDPaiAsK
 xmhsp0UgCdf8PKjNAopAVTXpEcwvFlxgsY3twQUvsBgMqr6P2Qces3HetrW8z4HmbleK
 +2TvbaHH52RrGGlSATqtcOKmBtTXQ9o3Zmun2W7m8qGoy7upchTKie/6UeTrttsrkvcj
 rP/Gwsf7vg4iOdxEKJARhAp7fYNu8qS+3fir/QZdjkLO3twJJMfVcwcgY4NaW6CLQ8S0
 vkkNj/U0Q24g/V0BPo5nb7ceuS9Vi41F64thfNwq9MyxSpJn9xPtuwvHnk/J/jT+jZe0
 Z1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u56IY+HRZxZx4lkNPaNYlhu3dFhpsHvask7g8ioRP78=;
 b=ZlHLc0epi/qPSCPX87AjugJxgKovgHT9dtFkmpMNAWqQh9zLR9IERLTLlNIyGLmAGU
 be0glCAP35U2FFeCg7fNsCXbbKvv9lHU2tFQTg5qOrxUYLLNgvB7PY8ZCtBcOEdAv3lL
 wMT/K0fNbzzBHU0ZwYIhgkRfkiYRXsjZ+DWOdF8/vg5OGHcGMs9n5KLGKR+yRf8cLi2P
 GBdhaJgS4bhyh43t4k7ppsse4wtKq1X5NldxcOSAnWRedbkomlL0FnUaWBzWWETGCtik
 DojDm3xSWyQ+YGS6eaP1zOpiXMYVaE4LzMiUW5ljmQhgNkhXMqz++ZOKNJlLwBo/2pLI
 gtJA==
X-Gm-Message-State: APjAAAUVIYU7putClDG0h11HUd1xWu0DtvldDgxu1YLTTnIyS39Ct43k
 VlfzLDjgQWm8ukqK7s3h42j/9ADqPy4=
X-Google-Smtp-Source: APXvYqwAAjgK5SXRedqTLx9P94fP4c2QVu+tKxxz2Bvq+pGU2f389ArMnDMXxyY969jiQk1TdmrDzw==
X-Received: by 2002:a63:4641:: with SMTP id v1mr16547886pgk.389.1580585404268; 
 Sat, 01 Feb 2020 11:30:04 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id l7sm3668509pga.27.2020.02.01.11.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2020 11:30:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 39/41] target/arm: Pass more cpu state to arm_excp_unmasked
Date: Sat,  1 Feb 2020 11:29:14 -0800
Message-Id: <20200201192916.31796-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200201192916.31796-1-richard.henderson@linaro.org>
References: <20200201192916.31796-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid redundant computation of cpu state by passing it in
from the caller, which has already computed it for itself.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b81ed44bd2..fcee0a2dd4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -411,14 +411,13 @@ static void arm_cpu_reset(CPUState *s)
 }
 
 static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
-                                     unsigned int target_el)
+                                     unsigned int target_el,
+                                     unsigned int cur_el, bool secure,
+                                     uint64_t hcr_el2)
 {
     CPUARMState *env = cs->env_ptr;
-    unsigned int cur_el = arm_current_el(env);
-    bool secure = arm_is_secure(env);
     bool pstate_unmasked;
     int8_t unmasked = 0;
-    uint64_t hcr_el2;
 
     /*
      * Don't take exceptions if they target a lower EL.
@@ -429,8 +428,6 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
         return false;
     }
 
-    hcr_el2 = arm_hcr_el2_eff(env);
-
     switch (excp_idx) {
     case EXCP_FIQ:
         pstate_unmasked = !(env->daif & PSTATE_F);
@@ -535,6 +532,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     CPUARMState *env = cs->env_ptr;
     uint32_t cur_el = arm_current_el(env);
     bool secure = arm_is_secure(env);
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
     uint32_t target_el;
     uint32_t excp_idx;
     bool ret = false;
@@ -542,7 +540,8 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (interrupt_request & CPU_INTERRUPT_FIQ) {
         excp_idx = EXCP_FIQ;
         target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
-        if (arm_excp_unmasked(cs, excp_idx, target_el)) {
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
             cs->exception_index = excp_idx;
             env->exception.target_el = target_el;
             cc->do_interrupt(cs);
@@ -552,7 +551,8 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (interrupt_request & CPU_INTERRUPT_HARD) {
         excp_idx = EXCP_IRQ;
         target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
-        if (arm_excp_unmasked(cs, excp_idx, target_el)) {
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
             cs->exception_index = excp_idx;
             env->exception.target_el = target_el;
             cc->do_interrupt(cs);
@@ -562,7 +562,8 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (interrupt_request & CPU_INTERRUPT_VIRQ) {
         excp_idx = EXCP_VIRQ;
         target_el = 1;
-        if (arm_excp_unmasked(cs, excp_idx, target_el)) {
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
             cs->exception_index = excp_idx;
             env->exception.target_el = target_el;
             cc->do_interrupt(cs);
@@ -572,7 +573,8 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (interrupt_request & CPU_INTERRUPT_VFIQ) {
         excp_idx = EXCP_VFIQ;
         target_el = 1;
-        if (arm_excp_unmasked(cs, excp_idx, target_el)) {
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
             cs->exception_index = excp_idx;
             env->exception.target_el = target_el;
             cc->do_interrupt(cs);
-- 
2.20.1


