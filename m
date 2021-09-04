Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA889400DA4
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:05:56 +0200 (CEST)
Received: from localhost ([::1]:48108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMffX-00083q-Fj
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfXQ-0008Qh-DQ
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:32 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfXN-0008OR-Sp
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:32 -0400
Received: by mail-wr1-x429.google.com with SMTP id m9so4086658wrb.1
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HTLBpMUvcY2BxzZIjZoxS//8tbEgCAlf+xtbD3ElAZQ=;
 b=pq9aAglyW8MuUPlQwX3TauQrHMG8wTcyr4tl4LYnHZlPzEJZeZunnf6Wv8Dnq4Y70A
 QMO+NIreZwwP2sx0WLT13aqjma5LIBhfRK7ytp85B70tiB2IgeDo2wmFwWS4jzuDLzlw
 zhe39uLXac0nZ9AW82Y/Gc5ZE+PyrXZ638dbcjxnqRIDGV8ActIdZQJb1FfGtMVMotp9
 pmU+pwfqaub/D4tG70xGVX2PhGE1ri+0zT/YVkLIMp+Cn+yccovJKIKobeJY3N4zEMDC
 C+hzmiA7w+yU37OJoJ0P1JlTMkyhiWg9eo8BkljiXqDINUKEk7FA4XfOBeTDOgQGrZkq
 5ZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HTLBpMUvcY2BxzZIjZoxS//8tbEgCAlf+xtbD3ElAZQ=;
 b=sBp43+jKb5IRSdJ//U6/qby7vFgycCpC3ky2qyeM4Z188gqrGc0KPgMznrmekVqFsI
 MeGs6hLFAmztZkbTQ/jfm8wQ7eiNha6f/YgJz95+NbRGEuCSxjmaGcaJc01lJp5iA7tf
 KQpD/XTyf2oZykLZVx1NLnGoZswiViUC0btDKDC12InNO7U4dmmIDEiy8fc7KRWfZ7eS
 2WywYsmYLYfKwl2kdAas5XIDvPP12yCMfxIhylAQopcJRKyRTNjGuohdKKUVlPJl9xH8
 5WL1hFMNnZrgVMFoAlu2rrLnszvoVhTA2Wh/94tVZGLIDQzQYrtGV1vGEn4bmBP5AkGi
 QzqQ==
X-Gm-Message-State: AOAM532CGbjpm8FdbIspHcYXYncYN4or1dOGzVi/K1wnpQZKxWUTXXcm
 asGTlu0Z4iqpHCOUDPMy7nYTLbcQC+g=
X-Google-Smtp-Source: ABdhPJws4P0V5xn8NwD9CaJVpPAZ9rz7tmBAgiXsD12JJpoTpmeaX6Y2ftjzvxzXKWWoFC6boGaPiQ==
X-Received: by 2002:adf:8169:: with SMTP id 96mr5972995wrm.207.1630799848009; 
 Sat, 04 Sep 2021 16:57:28 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o5sm3375071wrw.17.2021.09.04.16.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:57:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/24] target/sparc: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sun,  5 Sep 2021 01:55:38 +0200
Message-Id: <20210904235542.1092641-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sparc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index da6b30ec747..5a8a4ce7506 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -77,6 +77,7 @@ static void sparc_cpu_reset(DeviceState *dev)
     env->cache_control = 0;
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     if (interrupt_request & CPU_INTERRUPT_HARD) {
@@ -96,6 +97,7 @@ static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void cpu_sparc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -863,10 +865,10 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 static const struct TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .tlb_fill = sparc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .do_interrupt = sparc_cpu_do_interrupt,
     .do_transaction_failed = sparc_cpu_do_transaction_failed,
     .do_unaligned_access = sparc_cpu_do_unaligned_access,
-- 
2.31.1


