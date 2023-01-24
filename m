Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A373E6791B2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 08:13:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKDUl-0004A0-Sj; Tue, 24 Jan 2023 02:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pKDUV-0003So-ID
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:13:12 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pKDUQ-0002m4-TP
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:13:08 -0500
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id BF89344C1020;
 Tue, 24 Jan 2023 07:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru BF89344C1020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1674544365;
 bh=guAH/cOw0v56m2IcaCamWVCWxD+lBjmVEFeXkfrEF64=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=rwOFMEM/6oO06EgHGfLwXSp/tUyuejnas6mChNgNcqLvQ8X+7lDOf5wFauihSqvaP
 E5uZOwKsp0jTKClQsSBX/B1oztuL7by01/XdivLi2IaqzkoicFzFq6ZvzvQBPpDvQ3
 fn0FB8SCTyIxjTMJ9u2yRcgxZQpyuDH+bqIxotB4=
Subject: [PATCH v2 4/5] target/avr: fix interrupt processing
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, mrolnik@gmail.com, philmd@linaro.org,
 richard.henderson@linaro.org
Date: Tue, 24 Jan 2023 10:12:45 +0300
Message-ID: <167454436558.3686700.7820951378493451968.stgit@pasha-ThinkPad-X280>
In-Reply-To: <167454434356.3686700.6888237867240722060.stgit@pasha-ThinkPad-X280>
References: <167454434356.3686700.6888237867240722060.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Interrupt bit vector has 64 bits, but interrupt vector is found with ctz32
function. This patch replaces it with ctz64.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/helper.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 156dde4e92..61ab6feb25 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -51,7 +51,7 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     if (interrupt_request & CPU_INTERRUPT_HARD) {
         if (cpu_interrupts_enabled(env) && env->intsrc != 0) {
-            int index = ctz32(env->intsrc);
+            int index = ctz64(env->intsrc);
             cs->exception_index = EXCP_INT(index);
             avr_cpu_do_interrupt(cs);
 
@@ -78,7 +78,7 @@ void avr_cpu_do_interrupt(CPUState *cs)
     if (cs->exception_index == EXCP_RESET) {
         vector = 0;
     } else if (env->intsrc != 0) {
-        vector = ctz32(env->intsrc) + 1;
+        vector = ctz64(env->intsrc) + 1;
     }
 
     if (avr_feature(env, AVR_FEATURE_3_BYTE_PC)) {


