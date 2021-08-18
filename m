Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79253F0BB0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:22:30 +0200 (CEST)
Received: from localhost ([::1]:39492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGR8v-0003Ml-M8
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6B-0000H2-Oc
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:39 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR69-0008Qn-Lj
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:39 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 17so3297746pgp.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PTIVNXrj+6ZFES39V3xoSjwTXUTWsIJ8Fp1D3zgJaAU=;
 b=WP6lgxjEirHvv0TjKYPyVURcUdFY+s5JFQeCRAc4i5MQc+3wDdVXRrBU2MeCAxGH5d
 ODfrdo5IbyKIuA8hPna4XY6hlCLTyrJ6ITwgFodsijhLorCD5SZ9zdWEjWBfDmXh0fFS
 5i9vR8YFqkQFjhQoDXCqba3T/8F9qqdvjlDYLIlQzGZFW+XAZnkdlWerAgdYmqmQw9As
 i15+UC86nzLRKGyigkXhq1Bt2a4q+1OLZ7FylVHi8wuEKCHnQMWgwMY+Qcf2yQgUZTXF
 ZomZyc0vxpW0iRJLuYzb6UlvF541ufRWDTwUVMqarutreCVinLzzmp+OtmZ8r8JsCTfr
 wxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PTIVNXrj+6ZFES39V3xoSjwTXUTWsIJ8Fp1D3zgJaAU=;
 b=P5zcSwG/0p1txjoyI02/IfJBwnITB8TYYMvzP/ntIGIgu9Cg5qQEbJ2y47fETTeQVU
 sKRV5UWgDnzSYCRGL50ZZzQ2gAGy+7AVoc24mFowt6hrnDDCBxNZ7B7l9e+Mgf7CNbAp
 aT73eI/2SzNV6Uoe9/21P2DSL9dm56e0TA+dTA27rdT5/1KVkjQK7KeTstLi8VEo9itx
 VbnQiNIwtc87bLVk0XMrb0tw6vDiAm3SgSUT/U8oqqwZoaHh2ehlym8L4wNOBUj3jQNv
 /bQfGdd9Gl/fu7Kzjxj0f/aYeAXmdXjYThMFmxFqP4Sw6gEZxHamuftjeo9dinuxBeCf
 Sufg==
X-Gm-Message-State: AOAM5305/erv1gf2F9YCuZtRSA9oENoQx4QhWvuwWxGWGmxTeDA0o4Vg
 EIZ7fkGLl8ki6gDk+ZaimaOAy9IRRSMzEA==
X-Google-Smtp-Source: ABdhPJxTshba9C1CptxcEKJNguchlIufLGrPdnfBz8ejabFZRhlkMgd5/P5BJ2bZItj2x2O+FoyvIg==
X-Received: by 2002:a63:62c7:: with SMTP id w190mr10272110pgb.55.1629314376470; 
 Wed, 18 Aug 2021 12:19:36 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/66] target/ppc: Implement do_unaligned_access for
 user-only
Date: Wed, 18 Aug 2021 09:18:25 -1000
Message-Id: <20210818191920.390759-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For simplicity on the linux-user side, always use SPR_DAR.

Cc: qemu-ppc@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/cpu_loop.c | 2 +-
 target/ppc/cpu_init.c     | 2 +-
 target/ppc/excp_helper.c  | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index fa91ea0eed..d72d30248b 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -165,7 +165,7 @@ void cpu_loop(CPUPPCState *env)
             info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
             info.si_code = TARGET_BUS_ADRALN;
-            info._sifields._sigfault._addr = env->nip;
+            info._sifields._sigfault._addr = env->spr[SPR_DAR];
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case POWERPC_EXCP_PROGRAM:  /* Program exception                     */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 505a0ed6ac..84fb6bbb83 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9014,12 +9014,12 @@ static const struct TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .tlb_fill = ppc_cpu_tlb_fill,
+  .do_unaligned_access = ppc_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
   .do_interrupt = ppc_cpu_do_interrupt,
   .cpu_exec_enter = ppc_cpu_exec_enter,
   .cpu_exec_exit = ppc_cpu_exec_exit,
-  .do_unaligned_access = ppc_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index d7743704ac..08cc474340 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1505,6 +1505,7 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     CPUPPCState *env = cs->env_ptr;
 
     switch (env->mmu_model) {
+#ifndef CONFIG_USER_ONLY
     case POWERPC_MMU_SOFT_4xx:
     case POWERPC_MMU_SOFT_4xx_Z:
         env->spr[SPR_40x_DEAR] = vaddr;
@@ -1513,6 +1514,7 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     case POWERPC_MMU_BOOKE206:
         env->spr[SPR_BOOKE_DEAR] = vaddr;
         break;
+#endif
     default:
         env->spr[SPR_DAR] = vaddr;
         break;
-- 
2.25.1


