Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBA7484470
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:19:41 +0100 (CET)
Received: from localhost ([::1]:53448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lbA-00041d-J0
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:19:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGh-0007Ps-2S
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:31 -0500
Received: from [2a00:1450:4864:20::531] (port=36565
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGe-0004UP-VJ
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:30 -0500
Received: by mail-ed1-x531.google.com with SMTP id q14so141738525edi.3
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o0Zb6eJUXBCzx/VoGiJ7pghz/EEZF15L9m16rQtFb94=;
 b=dXyVovMHs/liKPCnpvRWCLafVJ8jxNGptJde04XA/mnCpHLLUe+HBKUykMaXxs/1Bl
 y3gUAQ0q1qmud4r/vENT6UTKJIA9bq5xOWvmORBvH0aIbHDSflfBoacWvgna/D/reilZ
 Xy7C7yBuq7eSTFziqmCmXUhqDjbrlmiRCjmpw8EFn3d9ky0ZDrY4dUO3YuJ0A1pT84An
 oAKjQjfIDDe3mlVw9A4IL/dlzpZVFVEGvC6NWIYrDZyTQSf2hPal1mOPTPH1yXM1vY+/
 NVIMBf5UiNEPpQgK3AvjyTcNbH16lsCPyl617NgfnJOJnYCbxi1OHmPjQKtIcuIRxYxW
 LNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o0Zb6eJUXBCzx/VoGiJ7pghz/EEZF15L9m16rQtFb94=;
 b=foiao/LWOe30n2hEAQXDghJyeK6Ss5pgCWaAPGD/3Pv8WC/y2f8pEzKONUh2E40U6B
 T7IaZo+evK3PnLPwSHsn6DOdxpfaIlpjzCGLTVD9nJLVaEQO5QoMJznEmjVFkNf5FE8I
 EzdnHhYtU99nanreciBT8NVqp3xJLMHcCGWmCUU8nLsSAPBDd7qN63NB8arSzrmKzzMz
 rvGibwczi0YgtZVzr34wJjl3WaHJ7J4bNpgd9FRxzrweZG8VSsmRkerx1v1CKXyPk1yN
 sgEx9Z//IMaMtudATT9kUEH/SWiT3CoF83jkA6C0qVg1Kf+EaMzrLCrfLUpx+j6DCkMR
 EFYw==
X-Gm-Message-State: AOAM532PdC6WqxoPCEzrv9fsMGr4eU4fMRvSAEEJ2kC6J++kjZ3NDFkW
 9EqFcumo8hDbKqtGymA4jREHeUNk9v4=
X-Google-Smtp-Source: ABdhPJyMvu57i3k1TikZKlt/p/lDY0l2Jlh8o9DUJitqSGZY3gUVGq8EIaMlWiUer1yJ7VAPj+0ENA==
X-Received: by 2002:a17:906:1996:: with SMTP id
 g22mr39601384ejd.661.1641308307480; 
 Tue, 04 Jan 2022 06:58:27 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j21sm11475964ejj.133.2022.01.04.06.58.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:58:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/15] KVM: x86: ignore interrupt_bitmap field of
 KVM_GET/SET_SREGS
Date: Tue,  4 Jan 2022 15:57:48 +0100
Message-Id: <20220104145749.417387-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104145749.417387-1-pbonzini@redhat.com>
References: <20220104145749.417387-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This is unnecessary, because the interrupt would be retrieved and queued
anyway by KVM_GET_VCPU_EVENTS and KVM_SET_VCPU_EVENTS respectively,
and it makes the flow more similar to the one for KVM_GET/SET_SREGS2.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index d81745620b..2c8feb4a6f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2607,11 +2607,11 @@ static int kvm_put_sregs(X86CPU *cpu)
     CPUX86State *env = &cpu->env;
     struct kvm_sregs sregs;
 
+    /*
+     * The interrupt_bitmap is ignored because KVM_SET_SREGS is
+     * always followed by KVM_SET_VCPU_EVENTS.
+     */
     memset(sregs.interrupt_bitmap, 0, sizeof(sregs.interrupt_bitmap));
-    if (env->interrupt_injected >= 0) {
-        sregs.interrupt_bitmap[env->interrupt_injected / 64] |=
-                (uint64_t)1 << (env->interrupt_injected % 64);
-    }
 
     if ((env->eflags & VM_MASK)) {
         set_v8086_seg(&sregs.cs, &env->segs[R_CS]);
@@ -3341,23 +3341,17 @@ static int kvm_get_sregs(X86CPU *cpu)
 {
     CPUX86State *env = &cpu->env;
     struct kvm_sregs sregs;
-    int bit, i, ret;
+    int ret;
 
     ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_SREGS, &sregs);
     if (ret < 0) {
         return ret;
     }
 
-    /* There can only be one pending IRQ set in the bitmap at a time, so try
-       to find it and save its number instead (-1 for none). */
-    env->interrupt_injected = -1;
-    for (i = 0; i < ARRAY_SIZE(sregs.interrupt_bitmap); i++) {
-        if (sregs.interrupt_bitmap[i]) {
-            bit = ctz64(sregs.interrupt_bitmap[i]);
-            env->interrupt_injected = i * 64 + bit;
-            break;
-        }
-    }
+    /*
+     * The interrupt_bitmap is ignored because KVM_GET_SREGS is
+     * always preceded by KVM_GET_VCPU_EVENTS.
+     */
 
     get_seg(&env->segs[R_CS], &sregs.cs);
     get_seg(&env->segs[R_DS], &sregs.ds);
-- 
2.33.1



