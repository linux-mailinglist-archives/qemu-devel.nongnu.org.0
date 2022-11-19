Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD7630C54
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 06:57:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owGqR-0007Cp-4z; Sat, 19 Nov 2022 00:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1owGq6-00070v-JK
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 00:56:31 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1owGq4-0003DA-MI
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 00:56:30 -0500
Received: from [127.0.1.1] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id 70C7E40737CB;
 Sat, 19 Nov 2022 05:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 70C7E40737CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1668837365;
 bh=yQAkQJtHjFZu7TmYoV6sC2gg5E0S7fZNsYpwZU15jdg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=s59hxGnm2rQZJ8nuUDI/2/DOmcz8p2DAgc3iqVWMqI2K8Qehz6f8EFcmliHPKDDI3
 xyevMRHYEZJhhEq+En2miIrd6t+fQtD6x9uSz3BmyBwkm9bT87Uo3aV4/xWGo0+jRi
 LOfa705UrZUuZg08JZxH8Fecun8l2zrQGVQSeWQw=
Subject: [PATCH 3/4] target/avr: fix avr features processing
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, mrolnik@gmail.com, philmd@linaro.org,
 richard.henderson@linaro.org
Date: Sat, 19 Nov 2022 08:56:05 +0300
Message-ID: <166883736523.1540909.13390410919692851470.stgit@pasha-ThinkPad-X280>
In-Reply-To: <166883734868.1540909.6779276759642478650.stgit@pasha-ThinkPad-X280>
References: <166883734868.1540909.6779276759642478650.stgit@pasha-ThinkPad-X280>
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
---
 target/avr/cpu.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index cfdc0ecb70..8295e50fa0 100644
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


