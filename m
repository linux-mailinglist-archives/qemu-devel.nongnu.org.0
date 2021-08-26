Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D9B3F8CD3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:18:32 +0200 (CEST)
Received: from localhost ([::1]:57560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJ1A-0002wi-Fn
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn7-0006J6-Ik
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:51 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:56243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn4-0000DU-Vn
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:49 -0400
Received: by mail-wm1-x32e.google.com with SMTP id g135so2229072wme.5
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=txe39M70WygZOjT/yHmjHImLKdjFIHC1BiWvrXKQ32U=;
 b=d3oil2KCpXkflnhJqi29DasjFxanUvuWZmgA5Z02D9YiFyZOQ+9v1cfO5EZNC+WOz9
 /vsxffFdGv/upWTNcdLbPG+IKubbLSYATZ3rnlKzaa+28dGB3FpPoqsOMgdx+Q+mh6K6
 tl5qhnrnYV6i7U6bInkFCrkB5nKTQSkcfI6dT+9hZsJ6exRfmq7UUZR3hH2fklUq2WI9
 CE1LA1eyorfHIqGV99dYZRmz6sOwOEClW6ynapNFkaXqy7KcbeOyNZmvSBGKL3E0dBCJ
 8q4P4fVC44+XXW5qFi9w/RpRB8lHoLHmgeMQ0bmd3CtQERvKcfi/bSUWYHoEsiac/zs5
 Mgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=txe39M70WygZOjT/yHmjHImLKdjFIHC1BiWvrXKQ32U=;
 b=sX/p6EEsCaYWyjuEQm61RIivKsnq9bcyKylOcl9Lu/oRojdfZXO3x1bpWW+6Fwi+B5
 cYL4h4exH4wasMwqWs0UliTnTQ0Q9ydhKIaAgq6mni/z9Yw4CsKy4tyd24NCCyqyNxWv
 NfUiqL6Vw/og7wfS2uf2M8HQ5MiurBKkm6rDOltcY9d6BTQ7D6D6kVaXzNASBojuIKVg
 7J0H8n+jK1K+9hMaqo9M9+iN2lm30i5snguFYXRxyX5CKM9zfJQCj/KutBEp9nBNi6q8
 pI/IIwJyfFQqnmFRodpO7OthJsus/7HmEf/tFqQjCUSvRNFj7Ay75ogePcioIlAs2NqI
 2MUA==
X-Gm-Message-State: AOAM532ELEb7bCTUTmwW2WnjiqTdTZ5Sz57nIjozL167VBsZEBWETVxh
 ay0gKPQGQNyUGs7sQEez5gtk/2k/A1ndFg==
X-Google-Smtp-Source: ABdhPJwRlBxBCeApWpfEfA3XyMMHSoxTqnvL9VM2MYxGihkIkfrWJpbPDiDZ0FTeB8WehQE5T4mqjw==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr15388303wmc.111.1629997425556; 
 Thu, 26 Aug 2021 10:03:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/37] target/arm: Do hflags rebuild in cpsr_write()
Date: Thu, 26 Aug 2021 18:03:05 +0100
Message-Id: <20210826170307.27733-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we rely on all the callsites of cpsr_write() to rebuild the
cached hflags if they change one of the CPSR bits which we use as a
TB flag and cache in hflags.  This is a bit awkward when we want to
change the set of CPSR bits that we cache, because it means we need
to re-audit all the cpsr_write() callsites to see which flags they
are writing and whether they now need to rebuild the hflags.

Switch instead to making cpsr_write() call arm_rebuild_hflags()
itself if one of the bits being changed is a cached bit.

We don't do the rebuild for the CPSRWriteRaw write type, because that
kind of write is generally doing something special anyway.  For the
CPSRWriteRaw callsites in the KVM code and inbound migration we
definitely don't want to recalculate the hflags; the callsites in
boot.c and arm-powerctl.c have to do a rebuild-hflags call themselves
anyway because of other CPU state changes they make.

This allows us to drop explicit arm_rebuild_hflags() calls in a
couple of places where the only reason we needed to call it was the
CPSR write.

This fixes a bug where we were incorrectly failing to rebuild hflags
in the code path for a gdbstub write to CPSR, which meant that you
could make QEMU assert by breaking into a running guest, altering the
CPSR to change the value of, for example, CPSR.E, and then
continuing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210817201843.3829-1-peter.maydell@linaro.org
---
 target/arm/cpu.h        | 10 ++++++++--
 linux-user/arm/signal.c |  2 --
 target/arm/helper.c     |  5 +++++
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 09760333ccd..6a987f65e41 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1398,11 +1398,17 @@ uint32_t cpsr_read(CPUARMState *env);
 typedef enum CPSRWriteType {
     CPSRWriteByInstr = 0,         /* from guest MSR or CPS */
     CPSRWriteExceptionReturn = 1, /* from guest exception return insn */
-    CPSRWriteRaw = 2,             /* trust values, do not switch reg banks */
+    CPSRWriteRaw = 2,
+        /* trust values, no reg bank switch, no hflags rebuild */
     CPSRWriteByGDBStub = 3,       /* from the GDB stub */
 } CPSRWriteType;
 
-/* Set the CPSR.  Note that some bits of mask must be all-set or all-clear.*/
+/*
+ * Set the CPSR.  Note that some bits of mask must be all-set or all-clear.
+ * This will do an arm_rebuild_hflags() if any of the bits in @mask
+ * correspond to TB flags bits cached in the hflags, unless @write_type
+ * is CPSRWriteRaw.
+ */
 void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
                 CPSRWriteType write_type);
 
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index 32b68ee302b..1dfcfd2d57b 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -289,7 +289,6 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
     env->regs[14] = retcode;
     env->regs[15] = handler & (thumb ? ~1 : ~3);
     cpsr_write(env, cpsr, CPSR_IT | CPSR_T | CPSR_E, CPSRWriteByInstr);
-    arm_rebuild_hflags(env);
 
     return 0;
 }
@@ -547,7 +546,6 @@ restore_sigcontext(CPUARMState *env, struct target_sigcontext *sc)
     __get_user(env->regs[15], &sc->arm_pc);
     __get_user(cpsr, &sc->arm_cpsr);
     cpsr_write(env, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
-    arm_rebuild_hflags(env);
 
     err |= !valid_user_regs(env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d2dd4aa0b80..a7ae78146d4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9246,6 +9246,8 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
                 CPSRWriteType write_type)
 {
     uint32_t changed_daif;
+    bool rebuild_hflags = (write_type != CPSRWriteRaw) &&
+        (mask & (CPSR_M | CPSR_E | CPSR_IL));
 
     if (mask & CPSR_NZCV) {
         env->ZF = (~val) & CPSR_Z;
@@ -9365,6 +9367,9 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     }
     mask &= ~CACHED_CPSR_BITS;
     env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
+    if (rebuild_hflags) {
+        arm_rebuild_hflags(env);
+    }
 }
 
 /* Sign/zero extend */
-- 
2.20.1


