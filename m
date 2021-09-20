Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83984128A9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:08:31 +0200 (CEST)
Received: from localhost ([::1]:33522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRSg-00075N-NW
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7D-00057S-RH
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:19 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7C-0002hx-4D
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:19 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t8so33593253wrq.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=acgjCaHCdDvDEO6aQNdNA165wsQFWfR3HbCbuPW+vnw=;
 b=Dq/9m1UI7ZUreo5GB+WPahxegkwjbXPjm5++zNmmFOLJ01mKkh8rwRVGuN2+5TrozZ
 Xa5D5n45AWNKvHBizoYhaFVytPHYSzucHbm1GVzcBdjwVTXB1EyfOA3iCfACB/IO/kVG
 qkNHGYJTpRycgIBtPN8j1c9vJDUETT1/RLmBXZbQGFGvbmBp4xn/vyOnT8HMdxp9YKQq
 DDQetBAFMht0K5j8w3nGZx2hy6emtH4B4jrj+3T0i4pDiNpJiTr3nYPZ5qsOhYwpzTza
 YNTz//2VXTrO+yYel9lZZrRpcxstfs3wSZnua9HoZnAMFctrVRAgjnbxtXAY9WtlzYXs
 C4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=acgjCaHCdDvDEO6aQNdNA165wsQFWfR3HbCbuPW+vnw=;
 b=fUFZb0b7coO8rlLAMYMF2UV/5vnmUhboRwXyUdtnjLjpZQdns/sihqQtzLuRkeuAwt
 UBGXNjwbvX4h735VpeC531xR4kUdNOYePmf9L+uJbIIpZ0rTzzkt7SF3VbeyNVjGu0EP
 0jz2hz2XCwww3k4fzslcvPzPfGXuG6Myvs/naGTWpKEgj38Q7aMpPoTEKR2iNbbfh1/v
 /UF2WECQ3tajmpci4j6cuReLDvEQKItgRU5GBFxxbT2sV9UyGhItRE/m6LerG738LpG3
 h5S79v6RVQZK+Lt/e4y1CFA7ByLhbGcDlzhe0h5OVq0G/ySy5w+hSZMPKS1TUcfmLIhW
 D2yw==
X-Gm-Message-State: AOAM5333RWaEo9ZgPArytg9mSc7zs9fwGhPCG0+yqQg6MSeejaBqLWcG
 Rj8pnXvH8ehF8EgHY3zSlqE/cWC0nuY=
X-Google-Smtp-Source: ABdhPJzymiYa1/8HTCrUCYZbmEagQPdIKXhVnLC/PQpwFHBAeemeCiPPMfKEkS0DN2kTxBYDd9o5Dw==
X-Received: by 2002:a5d:6841:: with SMTP id o1mr31113066wrw.39.1632174375533; 
 Mon, 20 Sep 2021 14:46:15 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 w14sm17056505wro.8.2021.09.20.14.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:46:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/31] target/nios2: Restrict has_work() handler to sysemu
Date: Mon, 20 Sep 2021 23:44:35 +0200
Message-Id: <20210920214447.2998623-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 947bb09bc1e..9938d7c2919 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -34,10 +34,12 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
     env->regs[R_PC] = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool nios2_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void nios2_cpu_reset(DeviceState *dev)
 {
@@ -223,6 +225,7 @@ static const struct TCGCPUOps nios2_tcg_ops = {
     .tlb_fill = nios2_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = nios2_cpu_has_work,
     .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
     .do_unaligned_access = nios2_cpu_do_unaligned_access,
@@ -241,7 +244,6 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, nios2_cpu_reset, &ncc->parent_reset);
 
     cc->class_by_name = nios2_cpu_class_by_name;
-    cc->has_work = nios2_cpu_has_work;
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
-- 
2.31.1


