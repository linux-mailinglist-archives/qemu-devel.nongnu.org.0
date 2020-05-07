Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC62A1C9C45
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 22:26:02 +0200 (CEST)
Received: from localhost ([::1]:38828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWn5l-0000Zy-GO
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 16:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amanieu@gmail.com>)
 id 1jWn4w-0008Cb-38; Thu, 07 May 2020 16:25:10 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <amanieu@gmail.com>)
 id 1jWn4v-0002q3-Dl; Thu, 07 May 2020 16:25:09 -0400
Received: by mail-wr1-x444.google.com with SMTP id i15so7537202wrx.10;
 Thu, 07 May 2020 13:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UkQ2SXUns6F/5PObSbNi0PU9ulwYNF013AWTnOJW1V0=;
 b=UC43ZlZjow+N6/LNlQek8nn4jbXnTe9OjaVzN1CFkpenoeUsrAm7KzfNF3+65zNiSW
 b201ttBFquhdnpUs4KS2/I2Q8QCGKaDJaKN4AwZ9sNKbdWsMJmA55VccRGhhPlOXKpRU
 i1Z/xRKFiD6s26tObIt4q+QAJJtbu/Twr1yoxelFqlp489qko7b9UAe+F8O4hX1y2uvm
 IWMqMG+DByH7c8OyIEFFcR/s0zAfFjBpyC5PXhm0NXIgSDu/bKLfKFjKqPfeeNf3clDa
 58FOwtw2yN688MO8t3TuzG4Lok23KVdQZkxx9eZO09Cz97Ge/986+WJtDxe3nAFqCKGW
 qIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UkQ2SXUns6F/5PObSbNi0PU9ulwYNF013AWTnOJW1V0=;
 b=G+D2X36XIXxsjzQb89SW8/4no9WLSo70Cz08Ri12TErle658Dy4XMbXx6k0M2XCCXx
 9lPv9ZeQYnKsvuZnWHGCS2I5tZ8mysv/ywLIgoBj2xsAsVkvWigjZV2hZI0+vCXS1Cah
 xIAnbZ2XJBe8sDbD6HK/sLF8jWq7oYQr3NTEQP7okz8d1+j0KxUgJwJGpmKxMSkbmaXg
 3aML8gYcNegX3YIyqWFGkqib+2eBCaw51Ph7NURsqn13i+1gnF34z+MPvtv3LatW6nQJ
 hv6rfgTBXrNHMmI8qcl4R5rFRsSzNucFETfWAZBTxmREh6LOnAlZXd+qv7jy6VQBxSHO
 YlGw==
X-Gm-Message-State: AGi0PubzyWkIgZBxRyc9hqbYABAN/LHYq+yK2GZR+fRBW7xx/8EfyV12
 wLHRrDY72YxTZ/oNvyqK4420qfshZGXOZw==
X-Google-Smtp-Source: APiQypIbgdMiM49HcDQ7OZvkb4703UIUSaznP2UAr1B8wuqY/qpvthAxIETHVP5mobow1kIwSqw5vg==
X-Received: by 2002:adf:afd9:: with SMTP id y25mr17515023wrd.421.1588883107194; 
 Thu, 07 May 2020 13:25:07 -0700 (PDT)
Received: from amanieu-laptop.home ([2a00:23c6:f081:f801:76b2:7504:9791:6959])
 by smtp.gmail.com with ESMTPSA id
 c25sm9516522wmb.44.2020.05.07.13.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 13:25:06 -0700 (PDT)
From: Amanieu d'Antras <amanieu@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user/arm: Reset CPSR_E when entering a signal handler
Date: Thu,  7 May 2020 21:24:29 +0100
Message-Id: <20200507202429.1643202-1-amanieu@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=amanieu@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-arm@nongnu.org, Amanieu d'Antras <amanieu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes signal handlers running with the wrong endianness if the
interrupted code used SETEND to dynamically switch endianness.

Signed-off-by: Amanieu d'Antras <amanieu@gmail.com>
---
 linux-user/arm/signal.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index d96fc27ce1..8aca5f61b7 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -244,6 +244,12 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
     } else {
         cpsr &= ~CPSR_T;
     }
+    cpsr &= ~CPSR_E;
+#ifdef TARGET_WORDS_BIGENDIAN
+    if (env->cp15.sctlr_el[1] & SCTLR_E0E) {
+        cpsr |= CPSR_E;
+    }
+#endif
 
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         if (is_fdpic) {
@@ -287,7 +293,8 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
     env->regs[13] = frame_addr;
     env->regs[14] = retcode;
     env->regs[15] = handler & (thumb ? ~1 : ~3);
-    cpsr_write(env, cpsr, CPSR_IT | CPSR_T, CPSRWriteByInstr);
+    cpsr_write(env, cpsr, CPSR_IT | CPSR_T | CPSR_E, CPSRWriteByInstr);
+    arm_rebuild_hflags(env);
 
     return 0;
 }
-- 
2.26.2


