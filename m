Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5C3673471
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 10:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIR8p-0004IU-MN; Thu, 19 Jan 2023 04:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pIR8n-0004I9-JZ
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:23:25 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pIR8m-0006F4-4z
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:23:25 -0500
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 05D9840737AF;
 Thu, 19 Jan 2023 09:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 05D9840737AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1674120185;
 bh=7bAqsqrVbTWaQc+AhA/m5Q6ztD9STpF91vF/3tnrKbs=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=fzUzvuaoGL5609cerAyV94YPboYmFMIeso0DcELBwFXRyS8yrOyWY/g05fUYUsKY9
 66RDSajMQhudBepxoGhVqWObNcVU8Ij30/UohVRd1utlPPukbwA/mqe4eW6+sL3iww
 6i3C/1WzU2y0romDs6/yZdz0H/j4rTIHzPM2UBkQ=
Subject: [PATCH v2 4/5] target/avr: fix interrupt processing
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, mrolnik@gmail.com, philmd@linaro.org,
 richard.henderson@linaro.org
Date: Thu, 19 Jan 2023 12:23:04 +0300
Message-ID: <167412018478.3110454.5407396471034616682.stgit@pasha-ThinkPad-X280>
In-Reply-To: <167412016297.3110454.15240516964339531097.stgit@pasha-ThinkPad-X280>
References: <167412016297.3110454.15240516964339531097.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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


