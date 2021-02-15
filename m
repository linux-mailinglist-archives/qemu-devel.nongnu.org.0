Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EDC31BA64
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:32:27 +0100 (CET)
Received: from localhost ([::1]:51116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdzG-0001IO-6Y
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdk1-0005gI-Cu
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:41 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjz-0005YO-R3
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:41 -0500
Received: by mail-ej1-x62a.google.com with SMTP id jj19so11089310ejc.4
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UXgcd0FI6AOswc8vxaoBN+OEtL7F7rxrjG3WEvBYSR0=;
 b=U8kU37l6HTUwHsuDqb6REtQ4sjM26+JA6VgWqZjLfvpzLCT0ybcBY2HIxSWgb37wqC
 6jS2mAJb3QXUzMvYJ6oXy0EsrA5T8dxbUguriLtUD4uUyorK1IrU2pfR5FM8PxCm/xNz
 88KUuxKZ6DFIGoJxK5dIyv4LHeZYTzvJicGwEHPtBxwOZbL5wybcrWdax8UagbBw51bV
 v3tQcNOXHK8kGVkhN6cWmaOeKP7FX5xOw4wP+Iouruq8c7+pcr0m6Cjr6P8OW/jW6FXa
 AUnMczQHrYV1tu3c59NMfZoRuYu94dakfhFBySVgC5ooYi/UJMa7WcdQuaXcekcKt7W8
 EIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UXgcd0FI6AOswc8vxaoBN+OEtL7F7rxrjG3WEvBYSR0=;
 b=M8yF9neT1QjGObftqBtQcrjnPjkW0jKggKUiDeDcvPttCmJKO6jcAJlCB6trFQZ49d
 +t2dXFmFpjIJ0ro1RK8hUo4P3SGEfD5/Ey0aAru2uwz0cE8OIrEyIxj/YSi5e8pJF7rv
 SAfn/ae4DHywjJjcVCCZ/TWoq9PBQLsSjja2pE42yPYVVezdUXYIIZj6gtk39jhgH+IN
 5Pq64mGjQaISRwYac9YcVT/nHmFfwM055JmgL+M8edz6YqLCKVkNlqHWa3Yx3XEqFbAh
 Ysxk+7V/96IgGnc7ytmx0iAZ4TZtj1AFj2zBmunCGWc7+WVSaHHN20hSTEop5gzE6tpQ
 0b3g==
X-Gm-Message-State: AOAM5302Ke7DoBdbCxjOuREvjJ67dJ5TMPKAFceCyA082wbAXVDuySRl
 KZhFg6QxKQSSWfc6FC4gzKdSXVyroLw=
X-Google-Smtp-Source: ABdhPJy0GtZd+diJKpkF7bpd67n5EgzWd5f3+MEwR6qpIFxyembbJczoXRg+qwJSeGBCJadi/285EA==
X-Received: by 2002:a17:907:da9:: with SMTP id
 go41mr15668611ejc.326.1613394998529; 
 Mon, 15 Feb 2021 05:16:38 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/19] hvf: Guard xgetbv call
Date: Mon, 15 Feb 2021 14:16:22 +0100
Message-Id: <20210215131626.65640-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Hill Ma <maahiuzeon@gmail.com>,
 Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hill Ma <maahiuzeon@gmail.com>

This prevents illegal instruction on cpus that do not support xgetbv.

Buglink: https://bugs.launchpad.net/qemu/+bug/1758819
Reviewed-by: Cameron Esfahani <dirty@apple.com>
Signed-off-by: Hill Ma <maahiuzeon@gmail.com>
Message-Id: <X/6OJ7qk0W6bHkHQ@Hills-Mac-Pro.local>
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/hvf/x86_cpuid.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
index a6842912f5..32b0d131df 100644
--- a/target/i386/hvf/x86_cpuid.c
+++ b/target/i386/hvf/x86_cpuid.c
@@ -27,15 +27,22 @@
 #include "vmx.h"
 #include "sysemu/hvf.h"
 
-static uint64_t xgetbv(uint32_t xcr)
+static bool xgetbv(uint32_t cpuid_ecx, uint32_t idx, uint64_t *xcr)
 {
-    uint32_t eax, edx;
+    uint32_t xcrl, xcrh;
 
-    __asm__ volatile ("xgetbv"
-                      : "=a" (eax), "=d" (edx)
-                      : "c" (xcr));
+    if (cpuid_ecx & CPUID_EXT_OSXSAVE) {
+        /*
+         * The xgetbv instruction is not available to older versions of
+         * the assembler, so we encode the instruction manually.
+         */
+        asm(".byte 0x0f, 0x01, 0xd0" : "=a" (xcrl), "=d" (xcrh) : "c" (idx));
 
-    return (((uint64_t)edx) << 32) | eax;
+        *xcr = (((uint64_t)xcrh) << 32) | xcrl;
+        return true;
+    }
+
+    return false;
 }
 
 uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
@@ -100,12 +107,15 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
         break;
     case 0xD:
         if (idx == 0) {
-            uint64_t host_xcr0 = xgetbv(0);
-            uint64_t supp_xcr0 = host_xcr0 & (XSTATE_FP_MASK | XSTATE_SSE_MASK |
-                                  XSTATE_YMM_MASK | XSTATE_BNDREGS_MASK |
-                                  XSTATE_BNDCSR_MASK | XSTATE_OPMASK_MASK |
-                                  XSTATE_ZMM_Hi256_MASK | XSTATE_Hi16_ZMM_MASK);
-            eax &= supp_xcr0;
+            uint64_t host_xcr0;
+            if (xgetbv(ecx, 0, &host_xcr0)) {
+                uint64_t supp_xcr0 = host_xcr0 & (XSTATE_FP_MASK |
+                                  XSTATE_SSE_MASK | XSTATE_YMM_MASK |
+                                  XSTATE_BNDREGS_MASK | XSTATE_BNDCSR_MASK |
+                                  XSTATE_OPMASK_MASK | XSTATE_ZMM_Hi256_MASK |
+                                  XSTATE_Hi16_ZMM_MASK);
+                eax &= supp_xcr0;
+            }
         } else if (idx == 1) {
             hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
             eax &= CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XGETBV1;
-- 
2.29.2



