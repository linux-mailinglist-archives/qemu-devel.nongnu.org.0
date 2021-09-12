Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6229D407F04
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:40:35 +0200 (CEST)
Received: from localhost ([::1]:34906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTT0-0004ta-FI
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHw-0000FS-JI
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:09 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHv-00059U-5B
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:08 -0400
Received: by mail-wm1-x331.google.com with SMTP id e26so4964535wmk.2
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h26pMLEnUsWrxMoqQtHQ2NCzZkcdqUGqN4k/9eCW+zM=;
 b=mDwvemDqNjnAHuB724c0AejrQuo6kTdlRXE2SqJWLfP0AmCFzXXlSw+mFcVh0tl49D
 wE76FuNKglfc4l6iAcZ599+iXl4w6I4xQe+e8f40ab1ZCMZTdKU8TnRD2SrgKcZDUQ5S
 EWYOiSBm3U98SIAiSl3PvcgHmwDCKGFI3YI+FVNKPKYp8ZBzOgYR8lDThZcTHDbGfKZ4
 nIvI4rgFCLswt9xIcQnDTr4sZ/7GONdjYTd4fVluE7kKfw6W4Poxi+fu7Ob1+lSD3lt9
 E4sBQsXDOGCJe705EQuECDa+aUi9UONArj756pxCxLkaFigUCY/Kgfg/6YT1udx2mf50
 UN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h26pMLEnUsWrxMoqQtHQ2NCzZkcdqUGqN4k/9eCW+zM=;
 b=f8bX2M1UrVf5tE3VN6jrHvrsGGtcLr2zwuGWnR9rg4cS/7q5LrzPSZ9wpnOd1fduzh
 bTQV9uzfOlL/tshOSoyiRhV2vbMA83Hpq4od8qu5n57YnMTZrMctkZFhDWJtD2GVajhP
 2fww8Ihxl+k5o07FvZaLJifadeOY/inkeSyyO3Wnh7ZmAX4vmLXoBylcPd5DkxwNEkaq
 dYxb+lCVjdDfeoolPMcImkPNnMdVvQQ/UAqmI+FPwwRUmRwe7r7iYi+73m6OXxl7q9Hm
 0ajnPKzVrH4X/Oct4S+vpSTW0df0766rT7qoi+E4CZs1L7TFcUKT3op/1Og7j4uTsal+
 /QQw==
X-Gm-Message-State: AOAM532zT0BN5S+6U2t89RjGm6MpdYgjJKXm6idSWat1v/oY1+zJaNp3
 tUTZZK6zCYjkG8toz7ZCOVqMyIy0j3I=
X-Google-Smtp-Source: ABdhPJzp7/usDBFIJ9Xm+r21I9TtSDFv0PburdBInlCIpVOPo4PLtle4fGZuvkjpSiGeGd+4LnmQhA==
X-Received: by 2002:a05:600c:35c4:: with SMTP id
 r4mr7708165wmq.194.1631467745684; 
 Sun, 12 Sep 2021 10:29:05 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id m29sm5259384wrb.89.2021.09.12.10.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:29:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/30] target/openrisc: Restrict has_work() handler to
 sysemu
Date: Sun, 12 Sep 2021 19:27:20 +0200
Message-Id: <20210912172731.789788-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
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


