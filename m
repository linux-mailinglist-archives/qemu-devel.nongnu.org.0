Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95A339BBB4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:23:00 +0200 (CEST)
Received: from localhost ([::1]:40688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBf1-0004a8-Qu
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa6-0007mj-6V
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:54 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa4-0008EY-R0
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:53 -0400
Received: by mail-ed1-x532.google.com with SMTP id ba2so9857094edb.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cMD/MQJK6RuY6kQefUquuNuGpcrRXIPINqzY23mVatU=;
 b=IKkFGxW+gAbEOez0Fzp2hQg+gzkuYQ2/sk7rr23eubSwCCS+YfbupkE08FEgY0Pzs3
 LI9UQQGSJldEHCaA55NryZGmIp+tGDUZvucuzIhodwvaxGzvCHMmP/E4qFHSPG+MMyYo
 2AWjzhSGbDsaRJogdjTluSbqfaKPmnS2hYyh93BBT3DPJgx0b644J+tKm4Xj+2XJJr51
 dlOmGCMvXbI7eF6zjaX8hc9CCR/vmuzFh4lYT9bEKQQY3tblwDup51WIzkZ1Vk4Jsx9K
 YjAwk0OnkIEHYj4waixL7wx3PZFlD2TQy+23MQLtmufeMJ1KxQb3g2hkMO2e8gVhQ+ZJ
 bp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cMD/MQJK6RuY6kQefUquuNuGpcrRXIPINqzY23mVatU=;
 b=FgjZ4hv0YXr4HQh8z5RxWPC8zTylmK3aBRkTSAPB8MH3mNx7B0BZHAKr8fNhp8aq5x
 DyLjoXD43beVxTAjusFN9JSbHULwZNk/0ob7JwgSDpfML1t3KWmm0YfAQfBhoCNsFQu+
 fgU6qQ4Y9jA3wVMie+5HiuvMJXkKf41rhQy3Cfa1mq0MQXshP+sGY5mwZjHKat14O5JT
 kEvlXT5/iMR2FO8eVEbucp2TcSJDQufkDuCAkm5CToRxsMWPeP9DrMMyYDWNTMGMZAng
 ICoQYjrzt8WvY9mlmCaMd0dqxuCj9aLHOF+DgTm9U2yYHQ9aNbs0wPjhvYlCA/DEylNS
 +j5A==
X-Gm-Message-State: AOAM532Y98moHrU6MzzHzMT3IySV1U2b3Ry2cPNjlKJX7uaIGSMsFk0x
 8v0V1bocDJO78VAaT3EurLRSnMjvNfU2sA==
X-Google-Smtp-Source: ABdhPJy6sD9sAOao9e11LBu4Rm48m9/EjQYJI/faD0Xt/iv5zdOxo6TPjQlalSKC5/RXDYjRgQTWEA==
X-Received: by 2002:a05:6402:5194:: with SMTP id
 q20mr5429369edd.356.1622819871084; 
 Fri, 04 Jun 2021 08:17:51 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm2402451eds.37.2021.06.04.08.17.50 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:17:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/13] target/i386: tcg: fix loading of registers from 16-bit
 TSS
Date: Fri,  4 Jun 2021 17:17:37 +0200
Message-Id: <20210604151745.310318-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604151745.310318-1-pbonzini@redhat.com>
References: <20210604151745.310318-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

According to the manual, the high 16-bit of the registers are preserved
when switching to a 16-bit task.  Implement this in switch_tss_ra.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/seg_helper.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 547b959689..2112c5fc51 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -277,8 +277,7 @@ static void switch_tss_ra(CPUX86State *env, int tss_selector,
         new_eip = cpu_lduw_kernel_ra(env, tss_base + 0x0e, retaddr);
         new_eflags = cpu_lduw_kernel_ra(env, tss_base + 0x10, retaddr);
         for (i = 0; i < 8; i++) {
-            new_regs[i] = cpu_lduw_kernel_ra(env, tss_base + (0x12 + i * 2),
-                                             retaddr) | 0xffff0000;
+            new_regs[i] = cpu_lduw_kernel_ra(env, tss_base + (0x12 + i * 2), retaddr);
         }
         for (i = 0; i < 4; i++) {
             new_segs[i] = cpu_lduw_kernel_ra(env, tss_base + (0x22 + i * 2),
@@ -391,19 +390,17 @@ static void switch_tss_ra(CPUX86State *env, int tss_selector,
     env->eip = new_eip;
     eflags_mask = TF_MASK | AC_MASK | ID_MASK |
         IF_MASK | IOPL_MASK | VM_MASK | RF_MASK | NT_MASK;
-    if (!(type & 8)) {
-        eflags_mask &= 0xffff;
+    if (type & 8) {
+        cpu_load_eflags(env, new_eflags, eflags_mask);
+        for (i = 0; i < 8; i++) {
+            env->regs[i] = new_regs[i];
+        }
+    } else {
+        cpu_load_eflags(env, new_eflags, eflags_mask & 0xffff);
+        for (i = 0; i < 8; i++) {
+            env->regs[i] = (env->regs[i] & 0xffff0000) | new_regs[i];
+        }
     }
-    cpu_load_eflags(env, new_eflags, eflags_mask);
-    /* XXX: what to do in 16 bit case? */
-    env->regs[R_EAX] = new_regs[0];
-    env->regs[R_ECX] = new_regs[1];
-    env->regs[R_EDX] = new_regs[2];
-    env->regs[R_EBX] = new_regs[3];
-    env->regs[R_ESP] = new_regs[4];
-    env->regs[R_EBP] = new_regs[5];
-    env->regs[R_ESI] = new_regs[6];
-    env->regs[R_EDI] = new_regs[7];
     if (new_eflags & VM_MASK) {
         for (i = 0; i < 6; i++) {
             load_seg_vm(env, i, new_segs[i]);
-- 
2.31.1



