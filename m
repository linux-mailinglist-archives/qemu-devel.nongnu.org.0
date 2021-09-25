Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED8D418311
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:11:39 +0200 (CEST)
Received: from localhost ([::1]:54532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9L0-0007CX-Ro
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93Y-0002CL-5L
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93W-0006gq-J2
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:35 -0400
Received: by mail-wr1-x42a.google.com with SMTP id g16so36522506wrb.3
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h26pMLEnUsWrxMoqQtHQ2NCzZkcdqUGqN4k/9eCW+zM=;
 b=jKfdvjWAZz0YCnsbrfN09vqrq3pNkI2lrUpS40//xHnxIw/oYbiBuR1M+ezk0ZCc0C
 586MjJQktIZHXqCtPCy42bO/ufoZ/J5wFywRm3cLM4VHJjXB64GY98hJeprHffsCMWlC
 VCsnqJk+JNHxHi4LG6QJ1kLcHUjslZjsudv0ZLKYGDLmr+qjcNrinIVe2BkgQosSeo0t
 +Buj3V7D2Wvp7eu9suCLinRtPFmWKtqJkybR7FLyQSnmOEGPZMpfu3Aa2M0ee7TDXyS4
 9suaBetq1lwOV3jhI3dF3jCjgljGUU9M2xBYp2U0ZLwPW3Ng1iNSZmACdn8E+IWHjlF+
 Neow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h26pMLEnUsWrxMoqQtHQ2NCzZkcdqUGqN4k/9eCW+zM=;
 b=X6Ke29jph5d9JPU3PS9V+f72CT9ZaWEx5+hfJhf9asK5wM8DxHZDqfrkkZDPzIkCaU
 pJpS0FIVivsndNa71U+6iVunnFdvgyIkFX0UgNWezoABFBhfYhDUsOZPDD0rw/7AH150
 P+a1v4WPxNKPYwSWpnBIoNiEehwRprRPQkSLLO97JL8K0qsgHvMl1sxJUWvwgvjZdxhT
 80c9YSD4GyMtORDFpfFYcArc2pYavh8uq6aeZDABU0P2dclP0PmJ9cTfhGbDLvVkIOTZ
 bqUW3zJEtb/ZcPvZM3q8OzlOoNm83eixhjpHJDTW6FqLm1EbEb3kzB+WfNSxJ1DDxits
 OaOw==
X-Gm-Message-State: AOAM532RExnZxP8HV2U3k3xHtPpmDRxuHpumS7axtXSztMZbVgDUsrou
 SJzNL8E5HOpr9J8hnxh87ucHds5gPNo=
X-Google-Smtp-Source: ABdhPJyi1xKJNp4X7lK8oP1DM1CyKIcblnLaMjCrR54fTG1lHkX0B1qvrju/5R6HDlGFj10SD7ei1A==
X-Received: by 2002:adf:db4a:: with SMTP id f10mr4007202wrj.140.1632581613184; 
 Sat, 25 Sep 2021 07:53:33 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 l21sm11545300wmh.31.2021.09.25.07.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:53:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 28/40] target/openrisc: Restrict has_work() handler to
 sysemu
Date: Sat, 25 Sep 2021 16:51:06 +0200
Message-Id: <20210925145118.1361230-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/openrisc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 27cb04152f9..3c368a1bde7 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -30,11 +30,13 @@ static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.dflag = 0;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool openrisc_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD |
                                     CPU_INTERRUPT_TIMER);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void openrisc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -189,6 +191,7 @@ static const struct TCGCPUOps openrisc_tcg_ops = {
     .tlb_fill = openrisc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = openrisc_cpu_has_work,
     .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .do_interrupt = openrisc_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -205,7 +208,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, openrisc_cpu_reset, &occ->parent_reset);
 
     cc->class_by_name = openrisc_cpu_class_by_name;
-    cc->has_work = openrisc_cpu_has_work;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
-- 
2.31.1


