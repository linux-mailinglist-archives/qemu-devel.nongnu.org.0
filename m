Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C01B68AB1A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:11:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5t-0005D4-Dn; Sat, 04 Feb 2023 11:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5m-00054w-LE
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:42 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5j-0006uL-Pz
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:42 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M58SY-1pNFA13WJ2-001EhF; Sat, 04
 Feb 2023 17:08:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 07/22] linux-user: un-parent OBJECT(cpu) when closing thread
Date: Sat,  4 Feb 2023 17:08:15 +0100
Message-Id: <20230204160830.193093-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Owlqyx/EvkIoUWNRsGD4j+1tCD4Nki7NYcXG55uQHL7ZVWMbifu
 2AgzM+olSZVjAUb3g/wRaqopX1csaZ/3wS+CCoN7AZePULsy/LhICylAy51dg1IZDb/OJT5
 6yNzGjO8tJ2pOjYCqSACDI94s4q81Hjf19NPLr6E3uxfx6GjzhFmUagHeK/aB3YSa+2Loer
 EoseEHop/6SX3YKaf9ywA==
UI-OutboundReport: notjunk:1;M01:P0:PrJprO64Gww=;4oMAwbGPJHekz3HNgnTbk3NPld7
 yk5NYxI9dzEK+FwBmnLtPDec+Ifz/fGAHjso3v0KCG7EXncGWt8p2nSzPMga3MK2vFGN20ZMU
 2CFV4pR3FNbspeYIVSjR/C5JULPVsJDe4iGrcpXPLBZjWOYOATVAGkl8Hjf5+m6nVUc6IPXtb
 r7ssHKjKN6ZvIj1LXVxd5Ng2O9o3Sq9PQvE268W8aLwUv5KaJggZPO19BXUK1Ww01g0V5khlD
 NS2AbuQtaLUA0KVaPtD7f/EV6OP84crS2hPV8gLXRhtwLt7TlTN4GEFt6TkSKTgXiorP2MLNt
 be3Ojq7wuFYS1FuApW9pcG6g1HHmRn5RnweQuaJULuV1Qixzwb1jhmrm8nUSxIIlzEjLf/x1p
 8xjNo2gnJCRDvKNYEYtm6wNhcw9L/+SWqc7qNCTIOzF+Drq5Rt76qw8D9sO/eeDzghBnNhxTH
 FllDg21r3jJ8yjYPx17kvDBMIutImCxKpavz0D8nIdmblMWRZE02tmL9vKInrvBkPZPy7i9sG
 d5D4lqw0n16WZYResDFshfD3ILfvFywCCxdHqx3041kH1SbWFLXRaeN0JMvE6yM3yZOrE76vS
 Q3iN7Y5A2VOZ2Sb0XX2IRDMeUEprkrVcSx319/A/rwla+S1nq/UkpqFehEJgFQ8whHjNo0xn2
 AIK21Q04YxV6esUa37yTFwj48m50jlSHa+/BftSF/w==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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

This reinstates commit 52f0c1607671293afcdb2acc2f83e9bccbfa74bb:

While forcing the CPU to unrealize by hand does trigger the clean-up
code we never fully free resources because refcount never reaches
zero. This is because QOM automatically added objects without an
explicit parent to /unattached/, incrementing the refcount.

Instead of manually triggering unrealization just unparent the object
and let the device machinery deal with that for us.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/866
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220811151413.3350684-2-alex.bennee@linaro.org>

The original patch tickled a problem in target/arm, and was reverted.
But that problem is fixed as of commit 3b07a936d3bf.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230124201019.3935934-1-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 3e72bd333ede..dbf51e500b4f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8756,7 +8756,13 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         if (CPU_NEXT(first_cpu)) {
             TaskState *ts = cpu->opaque;
 
-            object_property_set_bool(OBJECT(cpu), "realized", false, NULL);
+            if (ts->child_tidptr) {
+                put_user_u32(0, ts->child_tidptr);
+                do_sys_futex(g2h(cpu, ts->child_tidptr),
+                             FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
+            }
+
+            object_unparent(OBJECT(cpu));
             object_unref(OBJECT(cpu));
             /*
              * At this point the CPU should be unrealized and removed
@@ -8766,11 +8772,6 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 
             pthread_mutex_unlock(&clone_lock);
 
-            if (ts->child_tidptr) {
-                put_user_u32(0, ts->child_tidptr);
-                do_sys_futex(g2h(cpu, ts->child_tidptr),
-                             FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
-            }
             thread_cpu = NULL;
             g_free(ts);
             rcu_unregister_thread();
-- 
2.39.1


