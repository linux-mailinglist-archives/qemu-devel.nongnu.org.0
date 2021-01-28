Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C959307C6B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:29:04 +0100 (CET)
Received: from localhost ([::1]:59760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5B6N-0003pT-2t
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@mini.fritz.box>)
 id 1l5Az7-0006N3-LD
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:21:33 -0500
Received: from p200300c3873ab300042f31d82bb10f72.dip0.t-ipconnect.de
 ([2003:c3:873a:b300:42f:31d8:2bb1:f72]:51066 helo=mini.fritz.box)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefan@mini.fritz.box>) id 1l5Az5-0000Yy-9X
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:21:33 -0500
Received: by mini.fritz.box (Postfix, from userid 502)
 id 37DBC92CB3B; Thu, 28 Jan 2021 18:21:28 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH] target/rx: Fix compiler errors for build with sanitizers
Date: Thu, 28 Jan 2021 18:21:27 +0100
Message-Id: <20210128172127.46041-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2003:c3:873a:b300:42f:31d8:2bb1:f72;
 envelope-from=stefan@mini.fritz.box; helo=mini.fritz.box
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, KHOP_HELO_FCRDNS=0.399,
 NO_DNS_FOR_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gcc (Debian 10.2.1-6) 10.2.1 20210110 aborts builds with enabled sanitizers:

../../../target/rx/op_helper.c: In function ‘helper_scmpu’:
../../../target/rx/op_helper.c:213:24: error: ‘tmp1’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
  213 |     env->psw_c = (tmp0 >= tmp1);
      |                  ~~~~~~^~~~~~~~
../../../target/rx/op_helper.c:213:24: error: ‘tmp0’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
../../../target/rx/op_helper.c: In function ‘helper_suntil’:
../../../target/rx/op_helper.c:299:23: error: ‘tmp’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
  299 |     env->psw_c = (tmp <= env->regs[2]);
      |                  ~~~~~^~~~~~~~~~~~~~~~
../../../target/rx/op_helper.c: In function ‘helper_swhile’:
../../../target/rx/op_helper.c:318:23: error: ‘tmp’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
  318 |     env->psw_c = (tmp <= env->regs[2]);
      |                  ~~~~~^~~~~~~~~~~~~~~~

Rewriting the code fixes those errors.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Those error are false positives, but simple code changes help the
compiler (and perhaps reviewers) to understand it better.

Stefan


 target/rx/op_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 59389f4992..4d315b4449 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -201,14 +201,14 @@ void helper_scmpu(CPURXState *env)
     if (env->regs[3] == 0) {
         return;
     }
-    while (env->regs[3] != 0) {
+    do {
         tmp0 = cpu_ldub_data_ra(env, env->regs[1]++, GETPC());
         tmp1 = cpu_ldub_data_ra(env, env->regs[2]++, GETPC());
         env->regs[3]--;
         if (tmp0 != tmp1 || tmp0 == '\0') {
             break;
         }
-    }
+    } while (env->regs[3] != 0);
     env->psw_z = tmp0 - tmp1;
     env->psw_c = (tmp0 >= tmp1);
 }
@@ -287,14 +287,14 @@ void helper_suntil(CPURXState *env, uint32_t sz)
     if (env->regs[3] == 0) {
         return ;
     }
-    while (env->regs[3] != 0) {
+    do {
         tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
         env->regs[1] += 1 << sz;
         env->regs[3]--;
         if (tmp == env->regs[2]) {
             break;
         }
-    }
+    } while (env->regs[3] != 0);
     env->psw_z = tmp - env->regs[2];
     env->psw_c = (tmp <= env->regs[2]);
 }
@@ -306,14 +306,14 @@ void helper_swhile(CPURXState *env, uint32_t sz)
     if (env->regs[3] == 0) {
         return ;
     }
-    while (env->regs[3] != 0) {
+    do {
         tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
         env->regs[1] += 1 << sz;
         env->regs[3]--;
         if (tmp != env->regs[2]) {
             break;
         }
-    }
+    } while (env->regs[3] != 0);
     env->psw_z = env->regs[3];
     env->psw_c = (tmp <= env->regs[2]);
 }
-- 
2.24.3 (Apple Git-128)


