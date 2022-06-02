Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1E753B8E3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:20:18 +0200 (CEST)
Received: from localhost ([::1]:50612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjoH-0007eB-UT
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTU-0000ca-PM
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:48 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:59465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTT-0001ET-47
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:48 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MvsR7-1ngzAp1dg7-00szRP; Thu, 02
 Jun 2022 13:58:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/19] target/m68k: Fix stack frame for EXCP_ILLEGAL
Date: Thu,  2 Jun 2022 13:58:29 +0200
Message-Id: <20220602115837.2013918-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:u4GDy3CSL4HtG1XGhMv0X9GfHFZt16h8rO3u/h4KWxlTJnU42np
 bZDIGs0kybqGk9IerBf4YU2SVUrULVWr8UYX5Cf8W1hqkwivGNYbEIInuL4S5kHAXeMYmuI
 rnSEAzX4v91hHLSXIARehFjnH5xYyi5Ls36A4S+K7U2MK06gmhKklEz7OW8np3OAjhQo3O7
 Vv/Z/9S4kBAYcv9E1dK1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j2MNrR6jPFw=:m8/3baLnwBX76LkVb4A+2/
 wSYzO3SHUrEQMVx3jAkxxoZY0UyVo8bpteOAyKJycVToL6hc8n17UBPtKlCsicPgWsfkT9aje
 Aq1eGw2bpDVUvForNfK34uCrJ7cpZqapeKOT1VQWItTykf79w6aUmwHXDw4mZpjBEkBFToMoC
 0mm16M5bCCAwN+0FHO8eK/3DklwYcQLzVOLiQsuDorpYC0BpsnWSzx7aL+l7OYT6tM4uRVIIr
 Bo7eADi4rkv8+eEgjrFvb+0rC9RDAvbQk5h3jIOCkNKk8XvIfIu020fx79xFGhhukIfISkksf
 44Qs4ac+sf1yqpDFQfGgMLd4+sUywIaQdnvES+3vVgpmAdEKvzJ4f4+fgZYPeXpjCZWKiwNBL
 YdHc0y3H7Vv0SHsGZAjLqNCUInUc/e6IC9PtauvX9JbCDaiysy8o64fG3aIIZssHkoabCbg3w
 swxZ2xaoAe/73CL1bRTXrZ1/dq9PHeG3QxBBJ8gBa4jdVTUzoUPj0ZwtU1JE1VWJE4ffr0IcT
 iy8DwzAKznaVwQpRLAdDw4y0uiik4T2ZBqdi7YFcH5Y4zfTfZDQQSJq6HDJD7nMcQEqFQdxAr
 q/heqQw40jakwA7EizJ3p8eiVjgZy1TL0EdwccrIy4BLjuuogHyMAiySHGfuxX2Ogk567wESc
 +C0LOz2oEPMWWMOSiekWmMJi2o9yk8ha4FRyUkR5gu//IXZ9nzevzKFluXdYIB6eoKM92xTUP
 0FRSSbXWYwe7d/WWRHJsQwhbXkY7+eA1lhAD5w==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

According to the M68040 Users Manual, section 8.4.1, Four word
stack frame (format 0), includes Illegal Instruction.  Use the
correct frame format, which does not use the ADDR argument.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-10-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/op_helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 3cb71c914003..aa62158eb97b 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -391,11 +391,14 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         }
         break;
 
+    case EXCP_ILLEGAL:
+        do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
+        break;
+
     case EXCP_ADDRESS:
         do_stack_frame(env, &sp, 2, oldsr, 0, env->pc);
         break;
 
-    case EXCP_ILLEGAL:
     case EXCP_TRAPCC:
         /* FIXME: addr is not only env->pc */
         do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
-- 
2.36.1


