Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8067472E9E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:12:35 +0100 (CET)
Received: from localhost ([::1]:46304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwm4A-0000hp-K5
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:12:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonb@thistledown.com.au>)
 id 1mwlko-0006Kr-Ox
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:52:34 -0500
Received: from thoreau.thistledown.com.au ([203.214.66.21]:53719)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <simonb@thistledown.com.au>) id 1mwlkm-0005a3-Pg
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:52:34 -0500
Received: by thoreau.thistledown.com.au (Postfix, from userid 7006)
 id 49D191F9F; Tue, 14 Dec 2021 00:52:28 +1100 (AEDT)
From: Simon Burge <simonb@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] MIPS - fix cycle counter timing calculations
Date: Tue, 14 Dec 2021 00:51:27 +1100
Message-Id: <20211213135125.18378-1-simonb@NetBSD.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <81f4fd87-a177-420b-d69d-45faa0eddb48@amsat.org>
References: <81f4fd87-a177-420b-d69d-45faa0eddb48@amsat.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=203.214.66.21;
 envelope-from=simonb@thistledown.com.au; helo=thoreau.thistledown.com.au
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Simon Burge <simonb@NetBSD.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cp0_count_ns value is calculated from the CP0_COUNT_RATE_DEFAULT
constant in target/mips/cpu.c.  The cycle counter resolution is defined
per-CPU in target/mips/cpu-defs.c.inc; use this value for calculating
cp0_count_ns.  Fixings timing problems on guest OSs for the 20Kc CPU
which has a CCRes of 1.

Signed-off-by: Simon Burge <simonb@NetBSD.org>
---
 target/mips/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 4aae23934b..0766e25693 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -440,8 +440,9 @@ static void mips_cp0_period_set(MIPSCPU *cpu)
 {
     CPUMIPSState *env = &cpu->env;
 
+    /* env->CCRes isn't initialised this early, use env->cpu_model->CCRes. */
     env->cp0_count_ns = clock_ticks_to_ns(MIPS_CPU(cpu)->clock,
-                                          cpu->cp0_count_rate);
+                                          env->cpu_model->CCRes);
     assert(env->cp0_count_ns);
 }
 
-- 
2.33.0


