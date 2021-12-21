Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9454B47BCA4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 10:15:25 +0100 (CET)
Received: from localhost ([::1]:47952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzbEy-0001Uy-6A
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 04:15:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzbE7-0000os-EC
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 04:14:31 -0500
Received: from [2a00:1450:4864:20::436] (port=39684
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzbE5-0000JP-K2
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 04:14:31 -0500
Received: by mail-wr1-x436.google.com with SMTP id s1so20127027wra.6
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 01:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4FRp54t9bQSEeKpQ9loOcvzt93WgojNr8rM1EkJGSCc=;
 b=iKIY0K7HXXcN3pVUY0MFIgnjdA0+M3WYDpgSucQ1Ce3OKtY5rV+o42bQqJ0Vj3kCUy
 pxmsQrKTutAKsewxtlirp1IE8uHD4fNTtgQXfHLZOvfq3vjg1TRnWvsuRuLSQVJZgoWT
 bOKSeg3mNnLd7ZNEMU/THfWMXmO8+zGRW06sm/xYZr6Xj+lo4bHrbkQf97QRcuO7U4tA
 aNFkENQ6dtL53HUvxXuwrRMW25Ikb2rudXhVoHz4kAZm/LYnsnhJ4twk2WAgTHDm9MhN
 d2sPXRMpioqYFBbOFSNQJynGGyzpprQOw++VvHbil9m7SOJugUDlzwOkk6I/RYqABmAG
 uQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4FRp54t9bQSEeKpQ9loOcvzt93WgojNr8rM1EkJGSCc=;
 b=x6IBIXvD9rAksdlVT2K47ACkMbZRApXt7SgtmCdaD6N7Siw+hZBZUHfff+aN3h0Up3
 TCDL88VTEWs9Y878EJqHt9+AGcAFJU+JmHE7rhAR/mc6L0/1vLQKbr9IvQROQvCfvQtD
 obWqgKGOEU7l611HoYSyvsrNTVkS8t/awA+BQ989Z+6CGs3muQrvY2O90xj4vhztyQL6
 6hrWoPoWQLB/iqzapfNyAJdcxiYymrqGVuVcIj1BjG/6MTd0fgBcaQYKORqH8eESJxB4
 YpDTMHg+zydZiMEhdPv3AUYBk4jkqFIJm8cYLw2me3xUGdiOa6xD6T2X5KlUUzz6h+07
 OXkQ==
X-Gm-Message-State: AOAM533/l9mmEqE9WTq72iXX6fmnhY4XXzzld3yMCN45TJ4MSi4az8QK
 akK1WUNXGmUMwvyVkl4NBV9LWFGDSI4=
X-Google-Smtp-Source: ABdhPJzRuDETqDMXxNbFykKv+4P8oHxEVxzjHVsi5xqelAfKItd8/W/ujLKVaZyNAVQJpXUGOyfrpA==
X-Received: by 2002:a05:6000:1a8a:: with SMTP id
 f10mr1815194wry.246.1640078066131; 
 Tue, 21 Dec 2021 01:14:26 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id r62sm1732353wmr.35.2021.12.21.01.14.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 01:14:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] KVM: x86: ignore interrupt_bitmap field of KVM_GET/SET_SREGS
Date: Tue, 21 Dec 2021 10:14:21 +0100
Message-Id: <20211221091421.345864-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 target/i386/kvm/kvm.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index d81745620b..b42bcbc363 100644
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
@@ -3348,16 +3348,10 @@ static int kvm_get_sregs(X86CPU *cpu)
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


