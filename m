Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D60E6B0FDF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:10:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZxDd-0003P7-Dt; Wed, 08 Mar 2023 12:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZxDX-0002uN-Bf; Wed, 08 Mar 2023 12:04:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZxDU-0005XQ-B7; Wed, 08 Mar 2023 12:04:42 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E24BE400AF;
 Wed,  8 Mar 2023 19:58:16 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id A694913A;
 Wed,  8 Mar 2023 19:58:15 +0300 (MSK)
Received: (nullmailer pid 2098254 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 01/47] target/sh4: Mask restore of env->flags from tb->flags
Date: Wed,  8 Mar 2023 19:57:04 +0300
Message-Id: <20230308165815.2098148-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Guenter Roeck <linux@roeck-us.net>

The values in env->flags are a subset of tb->flags.
Restore only the bits that belong.

Cc: qemu-stable@nongnu.org
Fixes: ab419fd8a035 ("target/sh4: Fix TB_FLAG_UNALIGN")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20221212011345.GA2235238@roeck-us.net>
[rth: Reduce to only the the superh_cpu_synchronize_from_tb change]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
(cherry picked from commit bc2331635ce18ff068d2bb1e493bc546e1f786e1)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/sh4/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 453268392b..827cee25af 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -47,7 +47,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
     SuperHCPU *cpu = SUPERH_CPU(cs);
 
     cpu->env.pc = tb_pc(tb);
-    cpu->env.flags = tb->flags;
+    cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
 }
 
 static void superh_restore_state_to_opc(CPUState *cs,
-- 
2.30.2


