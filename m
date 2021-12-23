Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F0D47E2C0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:56:37 +0100 (CET)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Mi4-0004NL-CT
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:56:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdP-0004Kc-Sr
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:48 -0500
Received: from [2a00:1450:4864:20::430] (port=34746
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdN-0008QY-Uu
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:47 -0500
Received: by mail-wr1-x430.google.com with SMTP id s1so11008924wrg.1
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o0Zb6eJUXBCzx/VoGiJ7pghz/EEZF15L9m16rQtFb94=;
 b=WF/PZplkyoJ2bw//E1+Tx0G/PZPshNY7itGKR+TPKJ9tZsoLw3nN88MziLaskQJYyx
 mHlKvrVLz6kQiLaaAlnWOpJcrtvQkQrdEEDJovBy9YbBj6Yevbxtyr1OFGv4THm437Jt
 9ScUTOTkos2/m9Z+CfBJUCuqzjU46DUgoqBTI9F9wvDy0Gs5mqTrmPvYr36vyyvYtdrJ
 cugPcnt7OmZUzdfuY+w9C/1yhKDfa6bGRzBqWi54zpCcq7BWcYPyhFhXLvXmqgZsESej
 KBqVtOIUjT6wxwCPBOi/SDPz/sgT5Kzj1pfqfjz7/LHQSdLc+X3sad1AlSlxqskPVB+T
 3pqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o0Zb6eJUXBCzx/VoGiJ7pghz/EEZF15L9m16rQtFb94=;
 b=EEeL0UvJqrCdTqC3gwiaqoIze/QY4JFH/aUFXxmuLSgJjE3d5Z80H7Uzb3j6fy3zyG
 qMT9vAcAuo6BU6Rc2sHfUSNQOp3zC+A8dgzf8OGo5kxTwo1L39uyqCNnsapmuq8Kstd+
 JSArHD6u92bMgxQ+ipyfwBIcBVq7vlnxpDirC+E2cZ+q2+Lj430xQU1DeLrd8SlnsQaC
 7jP6Tfec6o5Bvh92PkeP2mpubz8QvyXBLz9NbOqGCLL3X57HOepU6iHNov5uBPZRcx1n
 +9wARfzUeZyhwJhFUG1KA6Pz5SGyzhlhfP/DJIWlFQx2OpCFYlESom68YGzc52n9mYxC
 KIVw==
X-Gm-Message-State: AOAM531EBAIv6Yb9Jh5/LNKCXSOQ6RfsU8mV4fUVdOCO7Ti5fDrkmOVz
 Dd+v9Vm+WZo1719iU0eLQYR0AHiC85c=
X-Google-Smtp-Source: ABdhPJwUDwUx7RQBTJlkE4vHpEY6lLsZpUfZ2UoqBXxuEqc/fL6qBS/JpoKNT4FecJlHiFMak50FmQ==
X-Received: by 2002:a5d:6dad:: with SMTP id u13mr1583237wrs.604.1640260304645; 
 Thu, 23 Dec 2021 03:51:44 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] KVM: x86: ignore interrupt_bitmap field of
 KVM_GET/SET_SREGS
Date: Thu, 23 Dec 2021 12:51:34 +0100
Message-Id: <20211223115134.579235-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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


