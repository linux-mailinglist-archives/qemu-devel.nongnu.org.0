Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952EC4128B6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:15:32 +0200 (CEST)
Received: from localhost ([::1]:50020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRZT-0001hk-85
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7e-0005d5-RV
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:46 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7d-00036q-Dg
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:46 -0400
Received: by mail-wr1-x429.google.com with SMTP id g16so33591894wrb.3
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oUBogEzePDVOMR5F40RC1OgAVa089kvAJx/8ALSm6vg=;
 b=AsKO1lWKSAt+JXw3uEUSzKsvnCBTst6cJjnyjM+4pCRiSBOnZJuBBV4pwpyR6Y/tuN
 GA5x51sU8ti4/GJc7p5olND9qG7itUZGnFTG6W3IETggE3YJWi/jY3pAyM7MQjBDNc5K
 7SifzAy4jaw4F93/dI+ZL2BNfeSudjl4C6sGHgQfSv5Y0pmS4qaY0/RkZ1Tmyur+lClP
 XgP9bqiJbmoF5KPLKmiD2eDMmgAM4GDD1WWRjJANQbN2P03P3OarAyCRJ1Xeq8+hkh6A
 Mdk/eO9mx/6rzl/4/GJhs50idgm+oC0uNEj+/CtHzI/dfJoLgUE7WJAeu4aIHJEbueaE
 tfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oUBogEzePDVOMR5F40RC1OgAVa089kvAJx/8ALSm6vg=;
 b=3mlgVS1Vv04iFOZVexaMoZrE/ou/hlDUYE4k2IDnOwk5xszwV8U82boPUVVZIJOzUy
 3XlqRRQsgYLv8XdY1H08Hbm4MLXzVsXPQs9NKQdQd24aMWCvrdx96BssjQwqwka+bJi4
 UY6UaJcmI3RZ6w01ozQ+43/e/3x8livZuRTckeIS5q7f7vcToqwbJaYrzP4N4WWxQpc4
 vTwF/oPsDJ7f+R2o7SVWgZCFjvEZGCYEStIDtMR3vPc5494Y6uA01CTS+GxpwuqXteaq
 IJunpnrYwoeckw3HR1+iaB5GvvbJu0Q7NxCZ1r6qn4CM5XhIic1DfpSlB5skVNfZ1dls
 MkQQ==
X-Gm-Message-State: AOAM532gBkpyJThfLYClo0XWo89Q5joa/crKuhyCwbD+YDzX25udZxL/
 8zu78HXq8TPZHGDXem6OxjwvrwuTWIA=
X-Google-Smtp-Source: ABdhPJw+QLWTUrTTo2c9xzsbcD4BWaAZHVPOqVtEu8OVjR9onqlFXDTC4tReXXPng5oZWcZPMPXkuA==
X-Received: by 2002:adf:fd92:: with SMTP id d18mr31401977wrr.28.1632174403041; 
 Mon, 20 Sep 2021 14:46:43 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i18sm17103448wrn.64.2021.09.20.14.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:46:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 25/31] target/s390x: Restrict has_work() handler to sysemu
 and TCG
Date: Mon, 20 Sep 2021 23:44:41 +0200
Message-Id: <20210920214447.2998623-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
 target/s390x/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b7b05f1d3a..df8ade9021d 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -88,6 +88,7 @@ static void s390_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.psw.addr = value;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool s390_cpu_has_work(CPUState *cs)
 {
     S390CPU *cpu = S390_CPU(cs);
@@ -104,6 +105,7 @@ static bool s390_cpu_has_work(CPUState *cs)
 
     return s390_cpu_has_int(cpu);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 /* S390CPUClass::reset() */
 static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
@@ -269,6 +271,7 @@ static const struct TCGCPUOps s390_tcg_ops = {
     .tlb_fill = s390_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = s390_cpu_has_work,
     .cpu_exec_interrupt = s390_cpu_exec_interrupt,
     .do_interrupt = s390_cpu_do_interrupt,
     .debug_excp_handler = s390x_cpu_debug_excp_handler,
@@ -292,7 +295,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
 
     scc->reset = s390_cpu_reset;
     cc->class_by_name = s390_cpu_class_by_name,
-    cc->has_work = s390_cpu_has_work;
     cc->dump_state = s390_cpu_dump_state;
     cc->set_pc = s390_cpu_set_pc;
     cc->gdb_read_register = s390_cpu_gdb_read_register;
-- 
2.31.1


