Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313394128DF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:29:07 +0200 (CEST)
Received: from localhost ([::1]:56022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRmc-0007wB-6x
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR78-0004us-5c
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR76-0002eD-L3
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id w17so25445165wrv.10
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iR+hhecIhVQbqLgRtJRf7TAYJMYyVJckrOxOor2tvDk=;
 b=GZ5/xyZtnFFYBVUznjjJPl4Hx8GySmnlujofeyE8OYJxDOq1NeNPUQdvtwg9CtxgiD
 qPiUwESjrkgjRgtgGU27K1FT6e2ArP1aXec9fLRozsolWWV7gjDbgRLhlu9pnIJ5nVwl
 vWeAV/mYYFDB4ATtmmWPBQ3zCCTkTG7SzMtx0NwJWjp5H1oexDyrU/NDVJGz1EbAFkPL
 vfcPBrKp9YzDAldU8lxZrP2C6imTfSN95VMBwkxF2MzjvSX1h2oSwBzgoch+tNAGE74E
 MFYaDSoMfPQjyhcESojMdMHjNALW4+aJZyIGoInokk8zDjI2tgRypM3OaZq5mirc3mMo
 At/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iR+hhecIhVQbqLgRtJRf7TAYJMYyVJckrOxOor2tvDk=;
 b=v7y/dgTbr1/a4Sc/Dx1nVE0e3D7S4oa1WsBKBMrxol55iRnQe4mvxDIOvm+4GxKhLd
 QxTBmfL6TkPyxZoAkb7+eqs4/zyS7JpF+ul62owuOEjzZdJ2H4SUOHwoic3GKR8sYibJ
 +AheqsDokJVUo45KbbaheySh4qWByz8R78b+MkvZ/uEvKP2L5jQxfVl+YlqCo75gHEnL
 k9yx7pNT1XBLGqbq5oAepNMdMj7HjacrwCN2qGsUj+Q1JN1fSmpc5zoeC401P48rHni3
 /d6ngUdX/eXMjwf1fb4XO9Mo9RsmAzaet7aB53O1x//nCL3UDHSBlWj6VxSvQsz+7c04
 Zfyw==
X-Gm-Message-State: AOAM533u0p7CrCr/AdwOdSHYhX53E6RkbSrXV0W8OV9aIMTprmIJE2db
 WapAIDQoMTSsEoP0Wh/31GobEQIAZ7g=
X-Google-Smtp-Source: ABdhPJx1ERoOIA9jusdg714l6s8vF+98Eoq8aNnCT2JiKHW9awb77LqNp7+MVHkqGja+IdugXYNkWQ==
X-Received: by 2002:adf:9e0b:: with SMTP id u11mr31320130wre.85.1632174371048; 
 Mon, 20 Sep 2021 14:46:11 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 h18sm16852001wrb.33.2021.09.20.14.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:46:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/31] target/mips: Restrict has_work() handler to sysemu
 and TCG
Date: Mon, 20 Sep 2021 23:44:34 +0200
Message-Id: <20210920214447.2998623-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 00e0c55d0e4..3639c03f8ea 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -128,6 +128,7 @@ static void mips_cpu_set_pc(CPUState *cs, vaddr value)
     mips_env_set_pc(&cpu->env, value);
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool mips_cpu_has_work(CPUState *cs)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
@@ -172,6 +173,7 @@ static bool mips_cpu_has_work(CPUState *cs)
     }
     return has_work;
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 #include "cpu-defs.c.inc"
 
@@ -542,6 +544,7 @@ static const struct TCGCPUOps mips_tcg_ops = {
     .tlb_fill = mips_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = mips_cpu_has_work,
     .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
@@ -563,7 +566,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, mips_cpu_properties);
 
     cc->class_by_name = mips_cpu_class_by_name;
-    cc->has_work = mips_cpu_has_work;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
     cc->gdb_read_register = mips_cpu_gdb_read_register;
-- 
2.31.1


