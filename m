Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847F96B5405
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:13:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvr-0008I8-3r; Fri, 10 Mar 2023 17:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvn-0008FP-NQ
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:43 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvl-00033Z-Jw
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:43 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MMGAg-1psyZR2eFK-00JGYq; Fri, 10
 Mar 2023 23:09:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 22/28] linux-user/sparc: Handle priviledged opcode trap
Date: Fri, 10 Mar 2023 23:09:21 +0100
Message-Id: <20230310220927.326606-23-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:P4ONyuy7N0jy4CWnfH799ipb6/iB8eLiOxaqw5I/3U0l8KdcpMB
 MLP7pf/taNgSwnLq1zhXx3YTrqm6j6r50T0NG0l/KFc1CXgdaOE61SSxClimcFMVt/sHYpu
 oCe56XVJj6X9/XuG1ZO7h4M8fjFaDGXWQxjeUDd9hAx0+5l2weljiKVoLwFyj+rFmR+BlDs
 t4y7JL/m2VlYyflIilkZw==
UI-OutboundReport: notjunk:1;M01:P0:+348JhsZYXg=;m3VI980DQbhz2WEZJ7A+hs6emRy
 l/h8YK4c1UU1Y0XPxUe2796kOheZCxiJImTIDktRY0VnjjKSgaiYfrZ4bsECtDrAAp7qBvCEI
 CPiOuKjrcCTSFw4vZO1z2RoCQC1m8NRdNQFwaHs4BrjRt7PiIxmRHJaA9EKfGEsuvdR4yUU1n
 UZjTwvyp6JMMxJ6zEoQ2OKIS67gl6Ux78ribOuVN7TJSC9KLGTy6NsYTOYv/BlYJjuHsvXq6M
 1g+cVLuzwsrbVeAPABvTIvflwIthvf/TschlODbWeYryAHTa04EpBcHGsrhafWtqRBvTELW8U
 dSfNO97SHjGHFBQokYYRjdno4Qn54K3QnYh7tfSQBTF07UHgsHIVmxuWiwH/o/kIYYsPyfqIv
 M5jx7Tkn3Ozuq/jMx0uyivk08kAgodpzCEFYGmsTa9kP2FAoum+UgaKlyrO54z6zvsa4xIGoe
 wiwqkIGFub2U3bnxbtlNIn8BK2W0JtRH6SfesJwKQj3feNZ/up5RZTdOCg1tBKOXwF9VuEsGv
 TPx08kGXCaT9p3efiXgmj+cvAJ3pD1apzXUTFetJGazvtp+0DNNOmPykmmXgQhUq/OeTbnqym
 UYTesNyzaCyvHLelrRhZPIYXlej+NXrT1d0RW8w/Hc1SWV9s/bnL1alDTqEJ7LUwoArVfasQ9
 BLr76MiDQ9KQ5n1FVYSJ2k6b3mKpvGUvEjAcem8PGQ==
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

For the most part priviledged opcodes are ifdefed out of the
user-only sparc translator, which will then incorrectly produce
illegal opcode traps.  But there are some code paths that
properly raise TT_PRIV_INSN, so we must handle it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-11-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index a3edb353f6fd..61b6e81459be 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -303,6 +303,9 @@ void cpu_loop (CPUSPARCState *env)
         case TT_ILL_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
+        case TT_PRIV_INSN:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
+            break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
-- 
2.39.2


