Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A20138717C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:56:09 +0200 (CEST)
Received: from localhost ([::1]:49496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisi8-0001Ef-GO
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKt-0007te-41
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:07 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:46027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKn-0007A5-2K
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:06 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M8k65-1lmywC3MeX-004hR9; Tue, 18
 May 2021 07:31:54 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 40/59] linux-user/s390x: Tidy save_sigregs
Date: Tue, 18 May 2021 07:31:12 +0200
Message-Id: <20210518053131.87212-41-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mtO72gX66+0XimLplwT1W5/HE7jjUbsxrl2E8lKI+YqVTh9Iw2L
 0zeaLDkqt/YPI3tGPveWtpr3gLQWVv++u5B83ONdmvqmcma7tRIjGdu5NCnMulppFhIvyqC
 HDiiLkKFfksJeVCim+EI3AkKuznIsGgv5kwfrfHtZIA2PLywquZqZyGXmtr1qW+Mhke/MTw
 tAza5L72ZVruRFFXBgfCw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tLfhggQq0AA=:2DNGyYFhsgwjzU4J+4LPDN
 ICT3ugzzQGxMXk9ClDLH664trttQo42kUzlhjuVuRqkBqvxcJRJbnvVVKFJiKRH0ENw5cr4Sa
 AZBWzYe5WRH93Iqz+HKS70orC3h7VMdc8ZQgdFopm60AkxQIzcavfzMg7cMoF9f5euz9Y2m9p
 CseafcVscyOZD/hwb6c0Zo7i3TNBWeX8vwRfOn91qBTNoPnAVuzKur1llbP+FJcGgfZJbMYT+
 5FFOZ+utMJA5zuOz8Ku2ILkiUZuW/R1MeQ4WWjcCX56CxqnT4d21CpTcijfF5J7uziymPmbm3
 HH+NnrekXOww4NEq63q1ciKJsqLcCkKdj22V7mHikECwWUgBfAep0S0tGOoCvKcN1XBKyNxsR
 gwkFSGWvyojz3UzWjOuNP3Ko5bWsnCl2NMVnVmvb21ZJbivQbmZgbgfjXbYxNmrddoYj0e8nD
 l+AzSQtzyxKyWLpXRILUsQustsUTi5fBU7SBZyr0sm96aXdvq5WmjmVAuzAeNpgpMpw6pODTw
 mA39RDIq8uCkyPfwv7k8Ac=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The "save" routines copied from the kernel, which are currently
commented out, are unnecessary in qemu.  We can copy from env
where the kernel needs special instructions.  Fix comment style.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-9-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 4dde55d4d518..eabfe4293f9f 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -104,23 +104,25 @@ get_sigframe(struct target_sigaction *ka, CPUS390XState *env, size_t frame_size)
 static void save_sigregs(CPUS390XState *env, target_sigregs *sregs)
 {
     int i;
-    //save_access_regs(current->thread.acrs); FIXME
 
-    /* Copy a 'clean' PSW mask to the user to avoid leaking
-       information about whether PER is currently on.  */
+    /*
+     * Copy a 'clean' PSW mask to the user to avoid leaking
+     * information about whether PER is currently on.
+     */
     __put_user(env->psw.mask, &sregs->regs.psw.mask);
     __put_user(env->psw.addr, &sregs->regs.psw.addr);
+
     for (i = 0; i < 16; i++) {
         __put_user(env->regs[i], &sregs->regs.gprs[i]);
     }
     for (i = 0; i < 16; i++) {
         __put_user(env->aregs[i], &sregs->regs.acrs[i]);
     }
+
     /*
      * We have to store the fp registers to current->thread.fp_regs
      * to merge them with the emulated registers.
      */
-    //save_fp_regs(&current->thread.fp_regs); FIXME
     for (i = 0; i < 16; i++) {
         __put_user(*get_freg(env, i), &sregs->fpregs.fprs[i]);
     }
-- 
2.31.1


