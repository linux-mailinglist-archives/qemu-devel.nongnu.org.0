Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51A54079C3
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:09:14 +0200 (CEST)
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6V7-00084f-VL
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Ii-0000Zg-8B
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:56:24 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Ig-0003ER-Gg
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:56:23 -0400
Received: by mail-wr1-x433.google.com with SMTP id q26so7485355wrc.7
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LgdMlt85/dxzemJRBccypcQeoOnrjCkyjoaKtxyctHU=;
 b=WjS0v/rxBHXUPYr5wth/E07YrNDAdjzyOoN4SIkxY89P7Rql/I2031v/UsWXEpSBdO
 D3Nwzd4B0HOrcFgIxf6TlVWczAuw6ewV0Xd6MO7bQfxJeVtyocs0ia8Rh9D1xbRsLHw1
 MFDaDIvW3Ypmk2VtvDw+czWR0HJc8PW6gAPO1L8s5eg3IrMMt8bHC6X6jEng6oLHbtmf
 PUvSxgut89KyQqWdgfCPAXrnPOfVU7YERIvAkwu09Zu57wghO7ipwq+UUfYB4i3bIBGt
 /EUi/BNvFnvBBg05nQoDZudUmU1OcqbSjnOJTjC+3AMbyqgaN3MKF90+X1Dbx9abLkJp
 d9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LgdMlt85/dxzemJRBccypcQeoOnrjCkyjoaKtxyctHU=;
 b=kO14j0zCyQsvYuTP7ohFKYmvS43NtTbcEF2Yyp61aUBpW9PuXJevV03qqUTZoCf43+
 gFz8qqqAHOUzpvmQtaZCOss7tE2DKAj+NWiHnHGuFGkezstWhHlShKk/4bNyaijrdrbr
 sNxXDQsz5h2iqwdkyIK5jf306uWrJY41y/G9IO68Q3jU+dtGafvOOG1dTwaFhRSupUJG
 CR3JG3MRxszipBUT000ghnwHW7F/yBVixy9HdmweDN2VLkxEfvltotaKTFULc10xOfmK
 rIBe9s467GBiVkAXXaGU+FTQiUoSTfKgz8KPP0BDQwYwKiTHPYygk3b2iotaqlW4Sj+d
 7rvw==
X-Gm-Message-State: AOAM530VQFPBRPxzM273EIaJyjyCKV4LQc0HyC28EJYC/sCW2y1jj2U2
 zcvYq6lRolyHst6Y5RQ0nciILWgNc/E=
X-Google-Smtp-Source: ABdhPJywD5PAv6XlZ8uXz9X/9boNg/g3aBR9udAqB8ATQ4FClYXNJ05s4ZY3yNtGfuf+WWV5c5QSww==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr1956926wrm.132.1631379380999; 
 Sat, 11 Sep 2021 09:56:20 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n1sm2087494wrp.49.2021.09.11.09.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:56:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/24] target/rx: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Sat, 11 Sep 2021 18:54:31 +0200
Message-Id: <20210911165434.531552-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/rx/cpu.h    | 2 ++
 target/rx/cpu.c    | 2 +-
 target/rx/helper.c | 4 ++++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 0b4b998c7be..faa3606f52f 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -124,8 +124,10 @@ typedef RXCPU ArchCPU;
 #define CPU_RESOLVING_TYPE TYPE_RX_CPU
 
 const char *rx_crname(uint8_t cr);
+#ifndef CONFIG_USER_ONLY
 void rx_cpu_do_interrupt(CPUState *cpu);
 bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 96cc96e514f..25a4aa2976d 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -186,10 +186,10 @@ static const struct SysemuCPUOps rx_sysemu_ops = {
 static const struct TCGCPUOps rx_tcg_ops = {
     .initialize = rx_translate_init,
     .synchronize_from_tb = rx_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = rx_cpu_exec_interrupt,
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = rx_cpu_exec_interrupt,
     .do_interrupt = rx_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/rx/helper.c b/target/rx/helper.c
index db6b07e3890..f34945e7e2c 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -40,6 +40,8 @@ void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte)
     env->psw_c = FIELD_EX32(psw, PSW, C);
 }
 
+#ifndef CONFIG_USER_ONLY
+
 #define INT_FLAGS (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR)
 void rx_cpu_do_interrupt(CPUState *cs)
 {
@@ -142,6 +144,8 @@ bool rx_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 hwaddr rx_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     return addr;
-- 
2.31.1


