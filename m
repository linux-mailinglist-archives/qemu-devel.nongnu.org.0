Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710D6407F06
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:43:03 +0200 (CEST)
Received: from localhost ([::1]:40006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTVO-0008NT-Fk
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHd-00087M-Lp
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:49 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHb-0004w9-ST
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:49 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q11so10906058wrr.9
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2wVO/8lNTdglwVP+4rQ9px8jTQizKXJBfsXgcLc7jls=;
 b=fk8js6rljmNl63pwjiyIZJmNlEtO/htODXoB9slo3HLWAN5H0sWg8B0az60bKq8ObU
 kRJvXK9aSoVVhVCS7hRBs8QStH4lwq6FI4S0AIBTRRgNLF0CPbDzeZIA7WTkcIwupwis
 4pkvxgIAQRoIIWye9OjM5HraDPDHcGVCrECSxOOryd+8dHuxzhhbOsWdSRAdunz88clH
 oCAod/IBTjMkYtHVpqQE74naYT3nFNSjYz6zgyhuDV3Pxz+fk2pIhRZr2xMkzi0mL6YV
 74TWIO9cqQtNN2rCEoFhWddwTecFHEyB37ApfqGrnlm5Dtgh5ce9n/EjDmUZPFKeqEjn
 P1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2wVO/8lNTdglwVP+4rQ9px8jTQizKXJBfsXgcLc7jls=;
 b=v/N++j+oIURpzEOjTh2qA6+sk5Iw320kdmhM2J0gow0eDXgcroTI3V6YdHtIcR4qdB
 ap6O8lUtlJcl/VQ+qzdp/rAdpwP2S6WRaI+hPuOhPNl/CGX6N9QR5ea0+YpOs6tm+mo4
 nd6HYBlwWlnpQbYyJBbHM3owBh39RGrLk02zFcVO14300momvEAqsHoJ5B4eB06nna5N
 72fYB3OQy9GU1NxiRJ8RqIDN1TIJ/TnjYv3n7J3XoVU5L083+0o//B1A8ZG1kO4ogO5L
 ZZ2NrK/RlFFCiMdF8+qj9ncZGdI85adIxJgDlt77WoC53puUUANinbjxT9vW2DfYWDSs
 bdhg==
X-Gm-Message-State: AOAM531HlMTdlzoaMuCOxnPXs6+b49SUH7KrCJy1LhxFbasu8Z3ZvaYu
 qRFKnDyGUALyzdAdfp2JmNk+zKwNq88=
X-Google-Smtp-Source: ABdhPJy2CXx8CB75h25X6SOA9jN+WgGOjA6dBm/Pmezc/OJBaQtJzVOtluvffAsMvbDCa4eHv2AM+w==
X-Received: by 2002:a5d:6292:: with SMTP id k18mr2986706wru.110.1631467726417; 
 Sun, 12 Sep 2021 10:28:46 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id q11sm4731955wmc.41.2021.09.12.10.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:28:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/30] target/m68k: Restrict has_work() handler to sysemu
Date: Sun, 12 Sep 2021 19:27:16 +0200
Message-Id: <20210912172731.789788-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
 target/m68k/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 66d22d11895..ad5d26b5c9e 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -31,10 +31,12 @@ static void m68k_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool m68k_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void m68k_set_feature(CPUM68KState *env, int feature)
 {
@@ -518,6 +520,7 @@ static const struct TCGCPUOps m68k_tcg_ops = {
     .tlb_fill = m68k_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = m68k_cpu_has_work,
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .do_interrupt = m68k_cpu_do_interrupt,
     .do_transaction_failed = m68k_cpu_transaction_failed,
@@ -535,7 +538,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, m68k_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = m68k_cpu_class_by_name;
-    cc->has_work = m68k_cpu_has_work;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
-- 
2.31.1


