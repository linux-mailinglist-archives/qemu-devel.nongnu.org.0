Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCCC308718
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:39:24 +0100 (CET)
Received: from localhost ([::1]:49340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PJL-0002nK-DE
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l5PD7-00056k-OL; Fri, 29 Jan 2021 03:32:57 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:55899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l5PD5-0002Uo-K5; Fri, 29 Jan 2021 03:32:57 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MavF5-1lfpsu1tNb-00cSb4; Fri, 29 Jan 2021 09:32:43 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] target/rx: Fix compiler errors for build with sanitizers
Date: Fri, 29 Jan 2021 09:32:36 +0100
Message-Id: <20210129083236.584238-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129083236.584238-1-laurent@vivier.eu>
References: <20210129083236.584238-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BaYDGEebk0Ib9T0dj5uodmqiGbdl9jH8EHL4EwWBwwXZyKzxuRA
 +nZsdSrhKjt92nft9HurvGIQqVEvxpe6ZOiJqWAAfs5BQTqFyMqiHWrdfTC6VG+KT5evcwD
 cjtI46wRiLwIVmioQiJYuyzrQocmuY/l/Wh6CAwAnVIHMYVq9UrWVkDtNBMXlrS/fS2h38Y
 3RgMhOZiSnOBq5FRSbXDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oBVT3JliVDs=:11x6MepuolRwEqMxtP0sXE
 w7lDhGdb+Qnp9CMTWc6FWZXs13X80ax9odc/qT5pTyYrX3vnEbRq6kLBNHw/6oIFtQ/+V1eCe
 PNhZdpP8+XuJ+1wu3qqUH+5hZk/fS6CxFf6DAH5X/RmhaMrGM410+6vvccx6qHliVXACqd2Ik
 7BD295U8YuJjFlzenZnYRr1C8oHPIXZJ8i5azsVw2RuXvevqn6qOAKr324EZ+AZ27xtO2ioVr
 zJzKlxCR7D8rHbiIjoZ4bnaV96Ymjsk1XnrMULylXed3NsTlHsC+n0JTDbuW8ml6y2S6oX8HU
 8Srxb0u5ClxQnBvJrglLOt2hc1+afcA0C4pwdfAV8C9YtvHjcZwSZf+arfzj9ChcSwi4Kurxb
 4CQ1Cicme5I0PE8nUFT2a6jT0tqYpNB8cGZtgn4vdrR4WQHHuGfSGhExBqGZR
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210128172127.46041-1-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/rx/op_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 59389f49921f..4d315b44492f 100644
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
2.29.2


