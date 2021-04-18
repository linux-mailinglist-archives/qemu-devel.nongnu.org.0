Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905DA36386E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:04:48 +0200 (CEST)
Received: from localhost ([::1]:33236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGT9-0000E2-Lq
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGHJ-00040Y-U0
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:52:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGHI-0000y0-HI
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:52:33 -0400
Received: by mail-wm1-x334.google.com with SMTP id y204so15758048wmg.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0RTWbP4MmlnppIWfa0PRIL4VrYTBFtlHQvR22xPFBSg=;
 b=ghKd8DfPOOGJNDSa6uPiKOKKbh1tiINtd7eUpl23wEoKPhu2mNV/kUbepxJPtZ5rmt
 Y7BDc11t2Vsu2nU9B7/9yErqsWRLE6oR/PG3PBHQcELa6Yy3RHSRp9DGPaU91REJe8Za
 q6IYgTm1Z5cA3HHBPh8cE5uaYfqJX27Udpyd39gbiypCpz/824DHp1CLBMPN4WheLRuF
 B/pHN6c0mX0tgXXNVUZ55Z+VGOzweh6MyFlDIUm8wyUZtHEai29nCVBSG4LArsw5u7c5
 BqGMa2aWY10uOEeF53lZ1BZtEuNr93GlT/0iyuhY4YPTUvaz4r69PWXw8wm49OMtrwOX
 PlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0RTWbP4MmlnppIWfa0PRIL4VrYTBFtlHQvR22xPFBSg=;
 b=CyWFxAaqLGkyC31XGkkeeucmC6P+B3+76GAUDcvpmIOs6R0l44+4LpFrk5JXrU296Z
 4oTlkZyFRk0M+Xa/z3cyKekjLv6nxWTNIiFR5rtUtjO5ShmyUDXFt/IfxlKYIzn1Swzo
 1IdtCvdt7ijSOzN7au+bVA7HbTYvN81v1nvwRZUaHeHQ28JsDQKiJGIc6GlqIDluttw/
 oLkNAYFcLiGkC+XXtwgM5u8K52A6sbYnPx/xwimD8y6Sz0H/lnZoqljCPCp57eEcsHOR
 hECUjg60OKg1IwL/s+b7ViNYk+A0HYVOzMTOgPnAsUPu/itBmcYMF828x48XWg/j2aJ+
 NFtQ==
X-Gm-Message-State: AOAM533c4pCIZ27QT/vZbHIZEWSeuosr1oObYD8rYtpUtW4/Ncq5J+lx
 54i1uxme+lJNVfD2qChUMYDO7QALYMqVAg==
X-Google-Smtp-Source: ABdhPJykJCH7zuiWqXWwE5JjOOWpN/WSfI4RoaZ62b6Q228eS3xsw9DCJf1aRh2Sn6VZENtv3ZARog==
X-Received: by 2002:a1c:7f4a:: with SMTP id a71mr18680917wmd.1.1618786351062; 
 Sun, 18 Apr 2021 15:52:31 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l25sm12908901wmi.17.2021.04.18.15.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:52:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/29] target/mips: Restrict mmu_init() to TCG
Date: Mon, 19 Apr 2021 00:50:48 +0200
Message-Id: <20210418225058.1257014-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mmu_init() is only required by TCG accelerator.
Restrict its declaration and call to TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h         | 3 ---
 target/mips/tcg/tcg-internal.h | 2 ++
 target/mips/cpu.c              | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index d7980ba9a94..548fd73c7cc 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -233,9 +233,6 @@ void cpu_mips_store_compare(CPUMIPSState *env, uint32_t value);
 void cpu_mips_start_count(CPUMIPSState *env);
 void cpu_mips_stop_count(CPUMIPSState *env);
 
-/* helper.c */
-void mmu_init(CPUMIPSState *env, const mips_def_t *def);
-
 static inline void mips_cpu_set_error_pc(CPUMIPSState *env,
                                          target_ulong error_pc)
 {
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index b65580af211..70655bab45c 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -20,6 +20,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #if !defined(CONFIG_USER_ONLY)
 
+void mmu_init(CPUMIPSState *env, const mips_def_t *def);
+
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 
 uint32_t cpu_mips_get_random(CPUMIPSState *env);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index fcbf95c85b9..acc149aa573 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -708,7 +708,7 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
 
     env->exception_base = (int32_t)0xBFC00000;
 
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     mmu_init(env, env->cpu_model);
 #endif
     fpu_init(env, env->cpu_model);
-- 
2.26.3


