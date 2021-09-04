Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FB2400D9F
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:02:42 +0200 (CEST)
Received: from localhost ([::1]:39296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfcP-0002Cc-Mi
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWF-0005ev-3U
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWC-0007f9-FP
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:18 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u9so4041988wrg.8
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KL1Kqw8poO/L4JKKXeGzPnOl81Q/NwCgyvh1EIRZFV8=;
 b=QJYJWXh1iPxPSpnG1LK/9/fjkrfbfOnaDhfQeY/YcriQW1O730RH1c10LmwQcn1IKg
 fP3N6vfNWwiewC8zvIHAR+SSldzqnTfLjI4Hb/i6Ryp9ADliNtQLDOSMJOWcdeZbMi+M
 DZWYCInxQuDl99LwFxWANmQjGtzByZis+s1LQZ3ntFzE0Y6g30qroED9c95NOT6meaIG
 5QfBNpMYOvqOv428viHafjZnSlMG020krExsiY4qK67JfDWF6/iDJ3sTKNERr/pHk+O9
 iqAjtWa5022g/nTzbzet+9cpvQiEPL6zW8POdrI5zG2tr5/2WPXRJDX6fwLDAc4OoP7u
 /L9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KL1Kqw8poO/L4JKKXeGzPnOl81Q/NwCgyvh1EIRZFV8=;
 b=EnrJeyHJLZj0gFl3iCWrp9RiRELrnKFOtt7ABS8Pkdxc6FTjX1I9pwiGFUN9aLiarh
 DqycGQDA0rHLkfqY8zP9xwr8+/9Mm6ptV9yPfpOe9/MnVX6BlTpbz0HQzyzkSlqW44SE
 OzUye4lxFpTekUB28A5YVotNSLxvyuuK5oNntm+VrSetzbu0wzZ3FYdkNUzPwNuvh3jk
 OC9xmOUp8yHLT0WrmNEJRR9Nsb+FNCZxxMsESx5toigP5+Do96udt6KwXuxtPd4xEQL2
 op22DXlGalObjf/8I1/ZmP2JVfuTRddFziq/RbeRL9iq87smG0S9siqPa2D+BJC3ZYd1
 7b3g==
X-Gm-Message-State: AOAM532inWtptlPVdJNucWwU589BtH4iiK9S4CTyj6Yd6nUf/PE9nIK9
 UUmopAzAn266ieYB5ecSjm4FETR5/Lo=
X-Google-Smtp-Source: ABdhPJwX/Ro6pFfZPwJNZ4YRxwhikYZ86I9A0xVl8Ig6N5iopb7FMxWps5yrASl7f8D/UezeO+OO6g==
X-Received: by 2002:a5d:5441:: with SMTP id w1mr5781218wrv.280.1630799774963; 
 Sat, 04 Sep 2021 16:56:14 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id a133sm3188581wme.5.2021.09.04.16.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:56:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/24] target/alpha: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sun,  5 Sep 2021 01:55:24 +0200
Message-Id: <20210904235542.1092641-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
 target/alpha/cpu.h    | 2 +-
 target/alpha/cpu.c    | 2 +-
 target/alpha/helper.c | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 82df108967b..4e993bd15bd 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -274,10 +274,10 @@ struct AlphaCPU {
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_alpha_cpu;
-#endif
 
 void alpha_cpu_do_interrupt(CPUState *cpu);
 bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 4871ad0c0a6..93e16a2ffb4 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -218,10 +218,10 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 
 static const struct TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
-    .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .tlb_fill = alpha_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .do_interrupt = alpha_cpu_do_interrupt,
     .do_transaction_failed = alpha_cpu_do_transaction_failed,
     .do_unaligned_access = alpha_cpu_do_unaligned_access,
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 4f56fe4d231..81550d9e2ff 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -293,7 +293,6 @@ bool alpha_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
                  prot, mmu_idx, TARGET_PAGE_SIZE);
     return true;
 }
-#endif /* USER_ONLY */
 
 void alpha_cpu_do_interrupt(CPUState *cs)
 {
@@ -348,7 +347,6 @@ void alpha_cpu_do_interrupt(CPUState *cs)
 
     cs->exception_index = -1;
 
-#if !defined(CONFIG_USER_ONLY)
     switch (i) {
     case EXCP_RESET:
         i = 0x0000;
@@ -404,7 +402,6 @@ void alpha_cpu_do_interrupt(CPUState *cs)
 
     /* Switch to PALmode.  */
     env->flags |= ENV_FLAG_PAL_MODE;
-#endif /* !USER_ONLY */
 }
 
 bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
@@ -451,6 +448,8 @@ bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     static const char linux_reg_names[31][4] = {
-- 
2.31.1


