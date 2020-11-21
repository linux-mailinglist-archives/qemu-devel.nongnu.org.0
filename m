Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38E62BC27E
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 23:45:43 +0100 (CET)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgbdW-0007pq-6i
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 17:45:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgbci-0007OJ-7f
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 17:44:52 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgbcg-0001CS-6T
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 17:44:51 -0500
Received: by mail-wm1-x335.google.com with SMTP id s13so13796808wmh.4
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 14:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jl0ScwVL1CL+bbYKTbCqBOii5J7OJ/KLsn3JJvPYF+k=;
 b=ejviALGU99hatXA+K2AaGjy/jMWNZi9zfQDle9pVToKe6OT5pqhL86T0hk5P/j29Zn
 owej4PxRjwp7uJ4eUClk2MG0C/lzyOa/y3GYK76jqqIP4o0ZwYW1XAX2+zntMaZ+NLAn
 NNa4/c+DjxPmUocA2vAseWgGV+Pa0kYUdEOc/5DKm/wMn5neYv4qG459F4FuPCWZC+sx
 AbGmoTG/Qn0DcVN0wzcOgWOxJZgEiPi39v3hATF8Cp56J0X4ei9kVVYhHaVZlQAsHMfK
 7TszlFbyjXIJ0gnh5kmXvKvnyaYiqiCQGsHUNw2sbEaWkc3fR1k6zT2fB7swR6vVIwKm
 MyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jl0ScwVL1CL+bbYKTbCqBOii5J7OJ/KLsn3JJvPYF+k=;
 b=S4ca17JU7xIsNJkpxAMh6J0e252L2Wno/8I9KsPiT3icrGJTO6l5Wf66uExGlIGIna
 HiVIkvJt9okc0w5SF2BU/Y7EFXrmsL2bE1jVKJjIdq+eHzsdlTtgaRCYTSSmL+AwLz5n
 xI9cqU4vI3gGbEDlPfX8BoC/UX3YApWQq1xL39BF4Ft1LwhHH4/gvmEl2fA1ETGSEqWN
 TDh7rN5YhmHhCKRgMkydSu4INPDWvWjvtJ8uP8nhGylnBQI1oeP8DW3LBuphwADwqZhK
 ZoyW131N6kSbWzvfVqOyb0E6DZGw02Kx4lOJRkCYdn20fyn6CItYX+10KeA0DAIfS1ug
 yESA==
X-Gm-Message-State: AOAM532w6AO4iIfOs8OU5FHFHbMGL6eD1XassvM/oSPRrPk/5pDER/1L
 67CRU858gBdfBXjMx3G/He4p3y2Pf3QFWw==
X-Google-Smtp-Source: ABdhPJx35cF9MSLpHTX0SydG+Hfv6n/q3HQdRd9BEy/oitjhl5e/DlquExJO6zX1YKwhazB4quxlDQ==
X-Received: by 2002:a1c:7fd7:: with SMTP id
 a206mr16967332wmd.135.1605998688170; 
 Sat, 21 Nov 2020 14:44:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a18sm8537550wme.18.2020.11.21.14.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 14:44:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Check privilege level for protected mode 'int N'
 task gate
Date: Sat, 21 Nov 2020 22:44:45 +0000
Message-Id: <20201121224445.16236-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the 'int N' instruction is executed in protected mode, the
pseudocode in the architecture manual specifies that we need to check:

 * vector number within IDT limits
 * selected IDT descriptor is a valid type (interrupt, trap or task gate)
 * if this was a software interrupt then gate DPL < CPL

The way we had structured the code meant that the privilege check for
software interrupts ended up not in the code path taken for task gate
handling, because all of the task gate handling code was in the 'case 5'
of the switch which was checking "is this descriptor a valid type".

Move the task gate handling code out of that switch (so that it is now
purely doing the "valid type?" check) and below the software interrupt
privilege check.

The effect of this missing check was that in a guest userspace binary
executing 'int 8' would cause a guest kernel panic rather than the
userspace binary being handed a SEGV.

This is essentially the same bug fixed in VirtualBox in 2012:
https://www.halfdog.net/Security/2012/VirtualBoxSoftwareInterrupt0x8GuestCrash/

Note that for QEMU this is not a security issue because it is only
present when using TCG.

Fixes: https://bugs.launchpad.net/qemu/+bug/1813201
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/i386/seg_helper.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/target/i386/seg_helper.c b/target/i386/seg_helper.c
index 09b6554660..5c8b8652f5 100644
--- a/target/i386/seg_helper.c
+++ b/target/i386/seg_helper.c
@@ -633,6 +633,24 @@ static void do_interrupt_protected(CPUX86State *env, int intno, int is_int,
     type = (e2 >> DESC_TYPE_SHIFT) & 0x1f;
     switch (type) {
     case 5: /* task gate */
+    case 6: /* 286 interrupt gate */
+    case 7: /* 286 trap gate */
+    case 14: /* 386 interrupt gate */
+    case 15: /* 386 trap gate */
+        break;
+    default:
+        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
+        break;
+    }
+    dpl = (e2 >> DESC_DPL_SHIFT) & 3;
+    cpl = env->hflags & HF_CPL_MASK;
+    /* check privilege if software int */
+    if (is_int && dpl < cpl) {
+        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
+    }
+
+    if (type == 5) {
+        /* task gate */
         /* must do that check here to return the correct error code */
         if (!(e2 & DESC_P_MASK)) {
             raise_exception_err(env, EXCP0B_NOSEG, intno * 8 + 2);
@@ -660,21 +678,10 @@ static void do_interrupt_protected(CPUX86State *env, int intno, int is_int,
             SET_ESP(esp, mask);
         }
         return;
-    case 6: /* 286 interrupt gate */
-    case 7: /* 286 trap gate */
-    case 14: /* 386 interrupt gate */
-    case 15: /* 386 trap gate */
-        break;
-    default:
-        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
-        break;
-    }
-    dpl = (e2 >> DESC_DPL_SHIFT) & 3;
-    cpl = env->hflags & HF_CPL_MASK;
-    /* check privilege if software int */
-    if (is_int && dpl < cpl) {
-        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
     }
+
+    /* Otherwise, trap or interrupt gate */
+
     /* check valid bit */
     if (!(e2 & DESC_P_MASK)) {
         raise_exception_err(env, EXCP0B_NOSEG, intno * 8 + 2);
-- 
2.20.1


