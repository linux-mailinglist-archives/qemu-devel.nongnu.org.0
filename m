Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BFD387190
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:03:03 +0200 (CEST)
Received: from localhost ([::1]:43812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisoo-0008JN-0w
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKf-0007SF-Hu
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:53 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:53775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKY-00073X-Tv
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:53 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MUpCz-1lrMdl3Asz-00Qfxd; Tue, 18
 May 2021 07:31:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 23/59] linux-user/sparc: Split out save_reg_win
Date: Tue, 18 May 2021 07:30:55 +0200
Message-Id: <20210518053131.87212-24-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:K2qmxzMh3jHMdE92C7fZj5Oufy+9Fm/bEJ+tQggSkWkjLNtx1r4
 m70N24jAF3GYddMuVcXMRoXsKiOzFBqA8vpgV2x/MRbhUsfYZ42zMBr84yI2e7QraTA33pZ
 63HOyA39oIPrpmFmeHFzzKA/3qXvv0lY5xFpyo1IxOstp7kWTskDhpWNGCnC/Dw9PsLtWt2
 a3wl9HazHPgdHh5pz47WQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3y1/3yzFB44=:qDynCUmxMyFaahYlWNakRa
 pQyYAZ05xiiBklRvzKK6PJa4d9NW+hxTgQNXjGewkqUvcAFZhaPqX6lzi0JAC22YVkzH8Tpdm
 egIkKPXKukdIVLAW/WZniHMc5xAvL9GDY8RmJQE3kQoyqu1Zuz8W0km16rA6MvrHSLB+g6pEh
 XV9e3vwm4ZyjSXwGHFQ1ZnJNu5y0hRs5mXnRwEr2cemAXy5jOTrDzRKIolw4K7W7sq7XSgaCe
 A2cYosF1kPyFDNQ7YnKuPyZIgjSQ7SuJaa/YuSt7MezvxdiEhg9+C41RYtNS8F9jt8m9OHPzU
 +o6+EBOsdO1U2ZK3YzbwrKlXoIeQOzMyo8RGHRXrPiS1/imA0/chzqOTEkHkEeGuiGR9D1gcM
 HJUrmKaZTFWS3p0ZCTvtHpOII6utiUwBpRvDUBWnkhqiOmYFGuQWCBh0XaGB2mTSBUo1o3Q4V
 CY5Zfjjm/5xNgTZ9+HAKvDMvjeRoLi5uoGgA8UTwhgWRER+L7qJCjAa7/zVdEY3ULwikewlzH
 pK+pCq+YsXlIGPJBTEHzfQ=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-17-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 0d9305818f8c..69fee5a76a8b 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -150,6 +150,18 @@ static void restore_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
     }
 }
 
+static void save_reg_win(struct target_reg_window *win, CPUSPARCState *env)
+{
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        __put_user(env->regwptr[i + WREG_L0], &win->locals[i]);
+    }
+    for (i = 0; i < 8; i++) {
+        __put_user(env->regwptr[i + WREG_I0], &win->ins[i]);
+    }
+}
+
 #define NF_ALIGNEDSZ  (((sizeof(struct target_signal_frame) + 7) & (~7)))
 
 void setup_frame(int sig, struct target_sigaction *ka,
@@ -183,12 +195,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
         __put_user(set->sig[i + 1], &sf->extramask[i]);
     }
 
-    for (i = 0; i < 8; i++) {
-        __put_user(env->regwptr[i + WREG_L0], &sf->ss.win.locals[i]);
-    }
-    for (i = 0; i < 8; i++) {
-        __put_user(env->regwptr[i + WREG_I0], &sf->ss.win.ins[i]);
-    }
+    save_reg_win(&sf->ss.win, env);
 
     /* 3. signal handler back-trampoline and parameters */
     env->regwptr[WREG_SP] = sf_addr;
-- 
2.31.1


