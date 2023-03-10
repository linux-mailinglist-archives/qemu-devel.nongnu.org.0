Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AE26B53F5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:12:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvt-0008JF-55; Fri, 10 Mar 2023 17:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvp-0008Gp-2I
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:45 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvm-00034E-RY
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:44 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MZCrZ-1q5KdR3Q0X-00V74J; Fri, 10
 Mar 2023 23:09:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 25/28] linux-user/sparc: Handle unimplemented flush trap
Date: Fri, 10 Mar 2023 23:09:24 +0100
Message-Id: <20230310220927.326606-26-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qBqa4sXS9ldltBNv57y74uGX6DZK3Y4mUJFJkHx4S5tYcPav4Kb
 z0tykp8ghHjv2pKPOtGi02uko6sAV9afc/+cLEJZq5GrwOHFGij1I3sl6sLjIk9vrnZlxw2
 248VA2d+ZQMJO1SZQODd8gJ+uhlqxG0ymvCfIncRb5XXYBQ3U0lIHjLmGm3nzudlm7ZcGnY
 yZPY3zcpBA51/HmqDvopw==
UI-OutboundReport: notjunk:1;M01:P0:9jYbuyek/ew=;X+RIAcT83fDjR9narXVEUlQ6uoj
 q5VNhwwGtPWjaf9NeoqObJH4CNHPFLuYPC95w/qHFNJ9S6gn0LGOSm1+7G1JFvQUx1l6L3G9j
 BLwnyX/drFgw8g6aSa39aP8zvWj91mi9d4bOzVyC0KwiLfYTQtsQ0ZtHvdJ7azB1h07hYwLTS
 x4r1aqNOhWT4KsJ5LN7jfWCnYnCXKzAddWuRm8U5oeJwHYIRKcayHGhYgTW5PBmt0y3UtpvaF
 lM+K82OH6Ghg3GF+tpRN7SvHWkwiBkvVxT3pyk5fXfZwRShoBtjE4SJUkQ2ZJB+xx3DVOQ3Jb
 VE/aMeE+bAjIgJkZstE4oPN4H4N6o4xWDYirHdFPeVWDszNMBMyiSuJZfDxbi9CrOlcEIBLvv
 sbp39K8AGw38wEy8vHsBGtzqTp5rrE6iVabqTv8trHZZKHBIRrMmTW1ldOzK4jDeABBrDggOe
 TAZqmiciBGR5o69u1eVHFKDT80wUWdM/8m4uGq6w7rsl6SDbDyoVeq0H6g3HWg5bJdO9uGvC7
 u0max07kYx+1G+I/KgqUSwUIRUBru3/h5SIazwJsWjYaghJMUfFFmtmoZz6OFPEKHgDAV8Y5Z
 wE8/KIjlCghv37gCcy7QOcUIDECDIR+V33OB6ix4ST8R210gxetQDcLr++WJYaKgBhOcgn302
 idn2jOBmUaUwiS4wd3gU2oDJTRVF+wbZytvGfiYEpg==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

For sparc64, TT_UNIMP_FLUSH == TT_ILL_INSN, so this is
already handled.  For sparc32, the kernel uses SKIP_TRAP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-14-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index bf7e10216fe1..093358a39a4a 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -315,6 +315,9 @@ void cpu_loop (CPUSPARCState *env)
         case TT_NCP_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_COPROC, env->pc);
             break;
+        case TT_UNIMP_FLUSH:
+            next_instruction(env);
+            break;
 #endif
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.39.2


