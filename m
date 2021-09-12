Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40876407EF5
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:31:11 +0200 (CEST)
Received: from localhost ([::1]:32832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTJu-0001FL-8y
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHK-0006tP-6L
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:30 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHI-0004kN-QC
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:29 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso5237991wme.4
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o1rGC7I7DdHZjeGxBZmAxhMDDlThtUPhoVzy+nV6/U4=;
 b=DbW/WXyLdRj70PYJ7ine47jUWFZn/K0wyT7TuAj4psPMdVlYcfio/xcAzsR2JF5NYl
 Ff+XIVwzTGVkAq4o8hxbgtJLRqPFOToGVviPLAm96uN+cgc9QpH5KSVCI6FfLKn9Mf5j
 oDExiXQZwhzD8jsRY7s8yl2htzcZRC/RR+JveYDCmMdutwrSxsNcUOlrZObSo55dIkb9
 fYbxqRdEYXKpv5snH1rQTBTi+mmLd6B2N9yhGlZyYyzOZ5vqbETnD9zE1AE6QTMsc5yn
 24+g8DV20IPnApnzHEzox03PrfZC8z/1M+Fz1HC8WEwKt92XcybobxofgZIIO9mrOueq
 U2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o1rGC7I7DdHZjeGxBZmAxhMDDlThtUPhoVzy+nV6/U4=;
 b=Y55+RXXzJN+qDT3QIycgjCmJsTOzz0F/bQUQmpC14Tq2GVycwPzkxVwzwrF7AwtcFb
 qPgtl7Y45StraDj+4xQrtPPEmDUfAcywloyO+vy3dgC4xY3eAym6DjwzakI1czPaZuXS
 yNhrL7B1XzXvmoaHWiOIHtAyXreWxTejwSy7cKtOxikO213z6c88u9uq+c21CPFMocJu
 osykK6gH1y0vbL7feMNJAdVbPCIQWumBNXXKDpCZ5EZajSnlw36LdpsAxmesxaQ4UWCl
 cVSG69ZsHIfnNY9NPMEB7k0AX9qpO/LnOfAkJDM25AItkB+eyZA1+S6gOWL++i5E/fr9
 sEzg==
X-Gm-Message-State: AOAM530DGE7uDX8MfPtsr4FSfJlNZD0mgXndll3OQ7+4oJkoFk9XKEUZ
 XjW77eSgsBg7FVChJG0RaXw/p0kOmpA=
X-Google-Smtp-Source: ABdhPJzoXHV76QSRzL6XYqwHM3iMhFPCd1tZaLZoB9ZsePJ9S7+mo06t6qwMkX4vcn/V80YWd77jYQ==
X-Received: by 2002:a7b:cc96:: with SMTP id p22mr7561389wma.67.1631467707100; 
 Sun, 12 Sep 2021 10:28:27 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id h16sm4993738wre.52.2021.09.12.10.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:28:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/30] target/cris: Restrict has_work() handler to sysemu
Date: Sun, 12 Sep 2021 19:27:12 +0200
Message-Id: <20210912172731.789788-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
 target/cris/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index c2e7483f5bd..b9f30ba58fa 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -35,10 +35,12 @@ static void cris_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool cris_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void cris_cpu_reset(DeviceState *dev)
 {
@@ -208,6 +210,7 @@ static const struct TCGCPUOps crisv10_tcg_ops = {
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = cris_cpu_has_work,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = crisv10_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -294,7 +297,6 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, cris_cpu_reset, &ccc->parent_reset);
 
     cc->class_by_name = cris_cpu_class_by_name;
-    cc->has_work = cris_cpu_has_work;
     cc->dump_state = cris_cpu_dump_state;
     cc->set_pc = cris_cpu_set_pc;
     cc->gdb_read_register = cris_cpu_gdb_read_register;
-- 
2.31.1


