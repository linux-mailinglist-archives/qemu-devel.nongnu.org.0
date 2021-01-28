Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445C43078B9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:55:48 +0100 (CET)
Received: from localhost ([::1]:55678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58i3-0000xM-A6
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:55:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58V7-0001FC-H8
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:27 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58V6-0007UV-3r
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:25 -0500
Received: by mail-ej1-x62d.google.com with SMTP id gx5so8107777ejb.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XsxYNKQjHpshThFWLLVqysiRnDu3ltFMHigP65/X5BI=;
 b=UEImJVFjqEjnNLzas3rtV4Q39lD308R/PWSPu6jkIecdNmPhkgTSCaItk/c7h8326g
 RXLR0koU1BN0QhrItbQ4OBuhiiOpRhqK65KwRkFUkbjCaSc2ESk84dxfWxhz8Jzh9vd2
 MIffNsSGacDMgOqY72OqTJsAtVfEKzpNrKseKzFzlIvkos9TCSwPxVtCdJpOHypiL/iX
 mw0Aa5M2wexq/HgfuOkGvtlt3VijEFfb5F68jOsICTP6oqSmt4lI7HjMtHP7jcSVJsaP
 Z97fggmCiwzanjYHlMZd54KUemH6eQ2JmH7aoo5NHFn9MxLUj6PGM9RJMptx/jHAMrqS
 QNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XsxYNKQjHpshThFWLLVqysiRnDu3ltFMHigP65/X5BI=;
 b=eZyqg5fveloQQrzddp+8ggUsHv5GxvBakDUmWnB5XjYhxjNkHcjgQ/vC8FJiGqT77d
 077dg5Mk2SokNZ4Qu/bt40FWIoEWiGnG5u2TZEows8PQOJl1v+F8Xgpo4nyme2jR4Mqc
 oaP/tk0TD3WJmvbpo9LjNLGbnLudqDX3nRxMi1lvF0n5TmE4SYlc7a8gRNJqR/IsLitx
 Ngk87eQmPPtOKYmKdmvrMdhAtbZi+WM3wLvEG6qCHv4dQIuVoi2G7e5mR/PuZkwZLQ8a
 d/RXe+b2ynI8WnQa1v/lKPvjcbuMAZ4DKtVmZKOmO4FtKauXK5+MeW/HiWahWU3c0Ya1
 Oj0Q==
X-Gm-Message-State: AOAM5331eLDHC7NJhVKezoQA+nt6rgnDi7CdxLlGf6Hm/Lpb+ddfP0ry
 WiIMaCvWPpgU3sxH+vJL1bR8wxk2ylE=
X-Google-Smtp-Source: ABdhPJwHs+n6xv6iDpX5I4P8fzehOs+GOoiYB+BdrsJdsUr2BKAHUCWc3nXJNE6QXaiMpKO6YH2H9Q==
X-Received: by 2002:a17:906:4d08:: with SMTP id
 r8mr12121713eju.191.1611844942365; 
 Thu, 28 Jan 2021 06:42:22 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id de4sm3108822edb.38.2021.01.28.06.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:42:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/13] target/mips: Let raise_mmu_exception() take
 MMUAccessType argument
Date: Thu, 28 Jan 2021 15:41:22 +0100
Message-Id: <20210128144125.3696119-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128144125.3696119-1-f4bug@amsat.org>
References: <20210128144125.3696119-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both mips_cpu_tlb_fill() and cpu_mips_translate_address() pass
MMUAccessType to raise_mmu_exception(). Let the prototype use it
as argument, as it is stricter than an integer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tlb_helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index e9c3adeade6..21b7d38f11c 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -405,12 +405,12 @@ void cpu_mips_tlb_flush(CPUMIPSState *env)
 #endif /* !CONFIG_USER_ONLY */
 
 static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
-                                int rw, int tlb_error)
+                                MMUAccessType access_type, int tlb_error)
 {
     CPUState *cs = env_cpu(env);
     int exception = 0, error_code = 0;
 
-    if (rw == MMU_INST_FETCH) {
+    if (access_type == MMU_INST_FETCH) {
         error_code |= EXCP_INST_NOTAVAIL;
     }
 
@@ -419,7 +419,7 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
     case TLBRET_BADADDR:
         /* Reference to kernel address from user mode or supervisor mode */
         /* Reference to supervisor address from user mode */
-        if (rw == MMU_DATA_STORE) {
+        if (access_type == MMU_DATA_STORE) {
             exception = EXCP_AdES;
         } else {
             exception = EXCP_AdEL;
@@ -427,7 +427,7 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
         break;
     case TLBRET_NOMATCH:
         /* No TLB match for a mapped address */
-        if (rw == MMU_DATA_STORE) {
+        if (access_type == MMU_DATA_STORE) {
             exception = EXCP_TLBS;
         } else {
             exception = EXCP_TLBL;
@@ -436,7 +436,7 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
         break;
     case TLBRET_INVALID:
         /* TLB match with no valid bit */
-        if (rw == MMU_DATA_STORE) {
+        if (access_type == MMU_DATA_STORE) {
             exception = EXCP_TLBS;
         } else {
             exception = EXCP_TLBL;
-- 
2.26.2


