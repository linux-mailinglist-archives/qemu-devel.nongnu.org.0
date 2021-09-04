Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4D2400DAD
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:15:42 +0200 (CEST)
Received: from localhost ([::1]:41038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfoz-0005US-6X
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfXU-000066-U3
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:36 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfXT-0008SR-Ba
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:36 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u16so4054433wrn.5
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LgdMlt85/dxzemJRBccypcQeoOnrjCkyjoaKtxyctHU=;
 b=bEB8PhQYz0yoAqCKy+emXqLGlOdHKvOxYZyJrTlWgDN1qAF4dRRdJuXswvdZ3jGmbh
 BcMTgIiydNgxClYAznD0wdP5Tkm0yk0wBEgcnI+krnBx0j75ExG9F5jv/WJTHHLG/Pj7
 zoSxA8vcrnHKoVyjUTiVpwvsITgZ5FTFaXGHcvipOeaoAjU3lTD24PSMBIQ0MW4Uz2V1
 JnLE76GfxVgXifUAVyWeS5ackvneKXC7GJf84t58y7IZA3NFMNTF896cv1tCAtPIrq4v
 QmhTVelcA79d76qODp1aDQ/mk7I8bswqmMpdMipnuCOg2XNlYA6RBQXT521cuUdsCh1j
 NZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LgdMlt85/dxzemJRBccypcQeoOnrjCkyjoaKtxyctHU=;
 b=K5g4JevMwAwAObIMy4iv9ADif+gG14R7/B9ARdQTPd6P0rTetfvK73aYoh2dOBsMfQ
 ldnEdNxXZy33Qljp7kIGSoxNmq+reF1yr96cvhfSR389bbf+L3qc+pJGHGBS6NX15C7m
 R7k/9gV4cmzXGodWExWECJ9N3lnjRo/ySp11FUhBGXHhEzkjnqLGt9fhv4Ko4Xc6ghhK
 PyC7VxD+MKusgHW85reE1vq/4f1mfXxDIiYwHi2DaFbqCm0Hx8wvtVew937egzOhKziF
 CtrJBIw8VdcJbe+gfqs0iL6lr2KIhNJr67GgVfIiy3nfVPVcUME6IXmFRX15qDvFIMHK
 4ZPg==
X-Gm-Message-State: AOAM531kna8bz4wGf/j/qUDVY4dbgAUnLPLCbT4u+zoTyK+oh3K/u4kp
 /HZYI3eupo8c40agEwEm6SKgqky1WK0=
X-Google-Smtp-Source: ABdhPJzB6qRcGAqkWAcMtB9YLX2hpHqleUXZsl6Qhq8Dl9pcbEuD6/dxCINlaDSYjnjk146fuLDVrg==
X-Received: by 2002:adf:9063:: with SMTP id h90mr5836113wrh.121.1630799853323; 
 Sat, 04 Sep 2021 16:57:33 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l17sm3506944wrz.35.2021.09.04.16.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:57:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/24] target/rx: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Sun,  5 Sep 2021 01:55:39 +0200
Message-Id: <20210904235542.1092641-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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


