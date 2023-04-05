Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18B86D74F0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 09:03:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjxAd-0006r5-Sx; Wed, 05 Apr 2023 03:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pjxAX-0006qZ-L8
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 03:02:57 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pjxAT-0002Aq-OZ
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 03:02:57 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso36366967pjb.2
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 00:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680678172; x=1683270172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Z0+1ZY20suxjwfAVbU4A3dZMNsDAUXYruoP0iRlgbw=;
 b=bfaJ5rgori6YxbwThhAhcny8+ENaOqPdj/1ZnE9RI31Lv3I3x+6Gvu2ifum+YFYYBC
 wAIbyuSUG+NQMKwqXJtTozuIyZVATuETlQC6yNS9aKzCnzbqyiFmb24tkccR4IGdtbGO
 cWRg2R/m05LjbIrBhxsYvuPYXnn11H9lQ4U+9+3CUYRMmEvxUUvmL8YyUzrgTPpoQb47
 VVK2Xcm54c+lFgHmFOeKfQHlT3prb4nuZWe/WYi8V21kfAIM1028hVbMue518YORaBsC
 rzRduTy5WG3pMRVCA02ADpf/v+F5M7qWbKf69QSjWspqM/zE08rWm8PZTTtCTA+YGHUP
 npMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680678172; x=1683270172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Z0+1ZY20suxjwfAVbU4A3dZMNsDAUXYruoP0iRlgbw=;
 b=nJdpGQvEemhfWWjMh8BxZrGnM4nbat7joCI/BJlEc80Z0h6MTQy7cLMNwL5GwefLMP
 t6IeO6aKdJV0s4FazeU5oCKNYs1zuRDcsw0EduWIq5t3+NpipToiSIryS04fbrE1voyr
 30EASm+JYcAJ+XZlk8GkXaMMAfBp0KGK5GI/IvS0TVwIfC474Im66zzs+8En7e/PUHl9
 IgIx5A2O/gsCdmrgThucuKz2x0JqBbPrj3NOc6SZ1Aa8SKnAEeiz/9MtVH9DYnCmZVnJ
 qNt4YXxeF73iZkKmamPWP6u+p3x+Uhc7d01fVf9iVTmVHEfMIPwXMlz0jYNnXpU5DY4c
 qoTQ==
X-Gm-Message-State: AAQBX9cyXTH531TlJ4GM5VN0ro3ZZl0RdmFWsiIqVRY0R6dgy3UdHdSU
 u5ZTnxlts2h5ax5Q/iD9n05gP4N3LVfww8+qaGnfqA==
X-Google-Smtp-Source: AKy350YQjZiQjCktP674kxJT8eArvKfhUjlrzD/of8AUdwEKqspv9wC0kUD9MfsqmUdmA5zaHr151Q==
X-Received: by 2002:a05:6a20:2a28:b0:dd:abea:7a78 with SMTP id
 e40-20020a056a202a2800b000ddabea7a78mr4352261pzh.16.1680678171826; 
 Wed, 05 Apr 2023 00:02:51 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 n9-20020aa79049000000b00625e885a6ffsm10210421pfo.18.2023.04.05.00.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 00:02:51 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] target/arm: Check if debug is already initialized
Date: Wed,  5 Apr 2023 16:02:44 +0900
Message-Id: <20230405070244.23464-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When virtualizing SMP system, kvm_arm_init_debug() will be called
multiple times. Check if the debug feature is already initialized when the
function is called; otherwise it will overwrite pointers to memory
allocated with the previous call and leak it.

Fixes: e4482ab7e3 ("target-arm: kvm - add support for HW assisted debug")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/kvm64.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1197253d12..d2fce5e582 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -32,7 +32,11 @@
 #include "hw/acpi/ghes.h"
 #include "hw/arm/virt.h"
 
-static bool have_guest_debug;
+static enum {
+    GUEST_DEBUG_UNINITED,
+    GUEST_DEBUG_INITED,
+    GUEST_DEBUG_UNAVAILABLE,
+} guest_debug;
 
 /*
  * Although the ARM implementation of hardware assisted debugging
@@ -84,8 +88,14 @@ GArray *hw_breakpoints, *hw_watchpoints;
  */
 static void kvm_arm_init_debug(CPUState *cs)
 {
-    have_guest_debug = kvm_check_extension(cs->kvm_state,
-                                           KVM_CAP_SET_GUEST_DEBUG);
+    if (guest_debug) {
+        return;
+    }
+
+    if (!kvm_check_extension(cs->kvm_state, KVM_CAP_SET_GUEST_DEBUG)) {
+        guest_debug = GUEST_DEBUG_UNAVAILABLE;
+        return;
+    }
 
     max_hw_wps = kvm_check_extension(cs->kvm_state, KVM_CAP_GUEST_DEBUG_HW_WPS);
     hw_watchpoints = g_array_sized_new(true, true,
@@ -94,7 +104,8 @@ static void kvm_arm_init_debug(CPUState *cs)
     max_hw_bps = kvm_check_extension(cs->kvm_state, KVM_CAP_GUEST_DEBUG_HW_BPS);
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
-    return;
+
+    guest_debug = GUEST_DEBUG_INITED;
 }
 
 /**
@@ -1483,7 +1494,7 @@ static const uint32_t brk_insn = 0xd4200000;
 
 int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
-    if (have_guest_debug) {
+    if (guest_debug == GUEST_DEBUG_INITED) {
         if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
             cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
             return -EINVAL;
@@ -1499,7 +1510,7 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     static uint32_t brk;
 
-    if (have_guest_debug) {
+    if (guest_debug == GUEST_DEBUG_INITED) {
         if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
             brk != brk_insn ||
             cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
-- 
2.40.0


