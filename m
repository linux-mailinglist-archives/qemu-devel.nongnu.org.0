Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D80453422
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:26:21 +0100 (CET)
Received: from localhost ([::1]:33400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmzPg-00016h-Bq
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:26:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonb@NetBSD.org>) id 1mmsxY-00082f-3S
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 02:32:53 -0500
Received: from thoreau.thistledown.com.au ([203.214.66.21]:60042)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <simonb@NetBSD.org>) id 1mmsxW-0006vC-9Z
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 02:32:51 -0500
Received: from thoreau.thistledown.com.au (localhost [127.0.0.1])
 by thoreau.thistledown.com.au (Postfix) with ESMTP id BE9C8A1856
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 18:26:06 +1100 (AEDT)
From: Simon Burge <simonb@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] MIPS - fix cycle counter timing calculations
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <12121.1637047566.1@thoreau.thistledown.com.au>
Date: Tue, 16 Nov 2021 18:26:06 +1100
Message-Id: <20211116072606.BE9C8A1856@thoreau.thistledown.com.au>
Received-SPF: neutral client-ip=203.214.66.21; envelope-from=simonb@NetBSD.org;
 helo=thoreau.thistledown.com.au
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 16 Nov 2021 09:19:49 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cp0_count_ns value is calculated from the CP0_COUNT_RATE_DEFAULT
constant in target/mips/cpu.c.  The cycle counter resolution is defined
per-CPU in target/mips/cpu-defs.c.inc; use this value for calculating
cp0_count_ns.  Fixings timing problems on guest OSs for the 20Kc CPU
which has a CCRes of 1.
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
 

