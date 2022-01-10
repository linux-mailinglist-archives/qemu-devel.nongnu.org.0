Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5C4489C14
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:21:57 +0100 (CET)
Received: from localhost ([::1]:44356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wUe-0004E9-MK
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:21:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vrL-0002ha-W1
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:41:20 -0500
Received: from [2a00:1450:4864:20::533] (port=38642
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vr6-0000Wj-O7
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:41:08 -0500
Received: by mail-ed1-x533.google.com with SMTP id u21so31872332edd.5
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o0Zb6eJUXBCzx/VoGiJ7pghz/EEZF15L9m16rQtFb94=;
 b=b+yIlU2vro7qRStLrKkw5s74hp2TGmjK5RBQM7UKCh9rDRD93xy8MRGkkwEbkvSo0i
 EjGn9eeu5ImPrZ+FlkXx0FLY0ET6eWczyT2+AkRyfOMXgeHmJLQbE/i9U9S+qcsC95d4
 Z5seo6zKYOXRS9pZa0oGAzOH6M2uEq5daPUdnYyEYqZWm+eL8xtm2ShlLLbX+t89hEkO
 /r/TbvWM/k2o82olCH7y1S/6l9OyFdjXhmwfwUqhELstGj+2HLLeKFh3Gy1dGkm1mzBG
 h0bBuPPVNhIW+yoiCJTH2110fKngNsXDhkNRExk7b+qQukvH89KHalp3tEpwHCFhTdKB
 /07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o0Zb6eJUXBCzx/VoGiJ7pghz/EEZF15L9m16rQtFb94=;
 b=C9RT2KTax0nfom+HVu4+U/IEzEbY6+qiOV3L9mgdJpqHWyvJqIaEYXM5gKG9fVNysT
 8UWKYeonXMrKlUK3t9DJtOxev0Rl4ddZcFUpYN2mq3vlyyAMJ9YfX9MgEr8KNzv5Wuax
 rUdxVtY6pdjo0OkNRl/wxpUkpC5xRCfGo5lhmVQb3UQA+HvkpT5qaidGfWpCf3dH70Dk
 o6XbWkaxWOtRx9Cunol3fgQMyrK31CZD6kz9REzmDqBw625e+NwY8TevxkWBcAuMrIhc
 Q6R58WMPI7oxzxjAQlAuleBJZXh7Zp1lh9fyW31SB/NPzGirwNfsLnw137EGmWyHvOIB
 ACLw==
X-Gm-Message-State: AOAM533AkmACMkS1WPY+HTOug7cM4Z3QttkadUO3zv3OkSAt80TD8uyf
 tau6zLjw+2ePUEs+ZyjcFgR1aIAh0Ow=
X-Google-Smtp-Source: ABdhPJyei0FUDVekI4z98+RgnlloPBD7nazFAZLNs0CMwpZ0FAd62OvboGW0/6B/gcHiQkbV/itOGw==
X-Received: by 2002:aa7:df18:: with SMTP id c24mr10626811edy.164.1641825660954; 
 Mon, 10 Jan 2022 06:41:00 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.41.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:41:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/18] KVM: x86: ignore interrupt_bitmap field of
 KVM_GET/SET_SREGS
Date: Mon, 10 Jan 2022 15:40:30 +0100
Message-Id: <20220110144034.67410-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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



