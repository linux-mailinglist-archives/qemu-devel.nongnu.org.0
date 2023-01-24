Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA78C6791B1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 08:13:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKDUh-0003kh-NV; Tue, 24 Jan 2023 02:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pKDUP-0003LM-EZ
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:13:06 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pKDUN-0002il-Aj
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:13:04 -0500
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 1D5BB44C101F;
 Tue, 24 Jan 2023 07:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 1D5BB44C101F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1674544360;
 bh=L2I13tbYa5Ch2qZ3iY2YZciKmcqbiZeNs3i8OALiDUg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Ecjn/or3FP/1HmPYN0CPybzXrf3G385ALVbmie4FeWiib8W1b8RmXuGhp/JkzB0VF
 zz755twWwFuHC21pDUdpotgXFYZ+InP0kKyCo/e1t1scWKeg1n9tToRxzDhhzGOdZr
 FrgvYvp0+X4Py+iXPV+7kVJ6gAsyhdbobxb240FU=
Subject: [PATCH v2 3/5] target/avr: fix avr features processing
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, mrolnik@gmail.com, philmd@linaro.org,
 richard.henderson@linaro.org
Date: Tue, 24 Jan 2023 10:12:39 +0300
Message-ID: <167454435991.3686700.16133135311878315725.stgit@pasha-ThinkPad-X280>
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

Bit vector for features has 64 bits. This patch fixes bit shifts in
avr_feature and set_avr_feature functions to be 64-bit too.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


