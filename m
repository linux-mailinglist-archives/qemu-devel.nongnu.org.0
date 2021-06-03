Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5FD39A341
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:33:21 +0200 (CEST)
Received: from localhost ([::1]:42414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looPQ-0000zK-N9
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1looJd-0005h7-2C
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:27:21 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1looJb-0000IT-7d
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:27:20 -0400
Received: by mail-ed1-x532.google.com with SMTP id t3so7345894edc.7
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cMD/MQJK6RuY6kQefUquuNuGpcrRXIPINqzY23mVatU=;
 b=pbZuXFr7Br2cSmjYWWLCXuPupneXHm2z+UnvP4BH5AwJ2+Tuukz4+uXxVDUvTDdkYX
 hTV+gmZU+bKcUz3jlbweMZqEucEVi1JdDfpw8M6F33HXAEzUpW8jcuOZE8oVjAm1jJ7P
 xn/JUeFuKkxlyJvxkAVrdF4hXyHR/qT1E7b2260Q3CcUrJwUN+1LXA7fTTKaz+WHrWDv
 6H+mq6j1/rg7BowON/vnZVlkawfLS/eY5RNU/IX9mjpXydBvDBw8LbSb3FBBDbgCIi+W
 1Ouapxjr9jqA4NCiyCRw2OK81OMsDAP5tnI5k8V2IGDu1cRedOZI+flY149KEV57JnAb
 dCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cMD/MQJK6RuY6kQefUquuNuGpcrRXIPINqzY23mVatU=;
 b=Ksx7KoJfn3q9mT4DSB5lz1Yy2EjSjNqpmqWMJzYckWRPgqwHSvR+O6sdIQzT/wWmUc
 EMgEgIo6tUDRf4bcBb435C+vH2IwrcjNMZBkksAUyQVRNC2NgALPQlee2D1OYDePeQn9
 h/scNb/1t19BPXqOpuXQtzETwf0KbCnwhTpnXONZCNLA9QtE3rCGIR1a12ACtyufxE02
 g+9MqYzmqz8ZhqA22do1Dem8+pksUJEAn1Ozn3MpK4mEfeTK6SqppLE7B4iAQCkkX8IS
 YE7Mpou3OhxdFblqIzei/2aavEt4NyBiywo84P4dMOVgVyqoIn2jVgo5XGDZF+0bb9hD
 RZ/Q==
X-Gm-Message-State: AOAM531dHki5SFOwVCprtkmeCRE8yjRuv/8n0SCaYws7MCav35qVUun5
 QcfJ/cAmJcl4n9lTRmdyWKxEhsVhmeuxiw==
X-Google-Smtp-Source: ABdhPJxX19lyHmgqx0nfueYsSSdCGmlpg99Sea1JIlrm2yM1h26yjw1XynMX+hUmXFF34HNoqIP69A==
X-Received: by 2002:a05:6402:4c5:: with SMTP id n5mr90195edw.322.1622730437923; 
 Thu, 03 Jun 2021 07:27:17 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 p13sm1562747ejr.87.2021.06.03.07.27.17 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:27:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/i386: tcg: fix loading of registers from 16-bit TSS
Date: Thu,  3 Jun 2021 16:27:13 +0200
Message-Id: <20210603142714.224210-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603142714.224210-1-pbonzini@redhat.com>
References: <20210603142714.224210-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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



