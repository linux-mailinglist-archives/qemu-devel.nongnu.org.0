Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421C26734F7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:01:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIR8n-0004Ht-NO; Thu, 19 Jan 2023 04:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pIR8l-0004He-QW
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:23:23 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pIR8k-0006E9-AT
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:23:23 -0500
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 8B24240737AB;
 Thu, 19 Jan 2023 09:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 8B24240737AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1674120179;
 bh=xpL7id23gSs1pJTLmHcwCsMeLdWH+Y9CY6RuXk6OO7U=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=jPJCMaPD9rsCZ9e2D8HFJkAprm1abYNKRJRCjNa0MG7yJ9IfIV3qiq8OzlCWhHImU
 QSHcizi6Sgkj79PnAW6B/xCJ0s0sbfKcnIk2PAnaRj/G2ZitCV10am7oVntG+WES+3
 JF8+pzvnNSI3QFCi8HR2t8VULky87G09tzrszcn0=
Subject: [PATCH v2 3/5] target/avr: fix avr features processing
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, mrolnik@gmail.com, philmd@linaro.org,
 richard.henderson@linaro.org
Date: Thu, 19 Jan 2023 12:22:59 +0300
Message-ID: <167412017939.3110454.772171621078654245.stgit@pasha-ThinkPad-X280>
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

Bit vector for features has 64 bits. This patch fixes bit shifts in
avr_feature and set_avr_feature functions to be 64-bit too.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
---
 target/avr/cpu.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 7c3895b65e..280edc495b 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -166,12 +166,12 @@ vaddr avr_cpu_gdb_adjust_breakpoint(CPUState *cpu, vaddr addr);
 
 static inline int avr_feature(CPUAVRState *env, AVRFeature feature)
 {
-    return (env->features & (1U << feature)) != 0;
+    return (env->features & (1ULL << feature)) != 0;
 }
 
 static inline void set_avr_feature(CPUAVRState *env, int feature)
 {
-    env->features |= (1U << feature);
+    env->features |= (1ULL << feature);
 }
 
 #define cpu_list avr_cpu_list


