Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ABE5ED9A1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:59:56 +0200 (CEST)
Received: from localhost ([::1]:45808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTr9-00063k-C8
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEL-0008FE-MK
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:52 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:39337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEE-0008G4-Ak
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:43 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mrxjf-1oyp0n0Lcj-00nwjH; Wed, 28
 Sep 2022 10:15:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 34/38] linux-user: Implement PI futexes
Date: Wed, 28 Sep 2022 10:15:13 +0200
Message-Id: <20220928081517.734954-35-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4K+CKP9O1oEKj0MYZ5BWZFjbTXYYxV6lfFCtK1/B14hG+wbPrBA
 6Le1oaOcKMted6Kg34LUoShfzbk1TvC8FZRuggEEaMXJOyLyYiKHjv3sBm9of/6qXX/QbRN
 DNONK5nsUpHN+sJkflElwR/r0Sa/uHSJCymwqAtv7I3TpuKd2R1EpvUWaouiANybIZw+e9b
 wUov5ysbGMJN8pvhUH1qw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0opjmy1l9dk=:cc/gPryyzukaOuyM5fTJ61
 MN4FB0s0PtCWxsLr/4tC3YMBUXq+hNC/y/Ls8aTR/6UgpCLIijbUp/R/u0cHJRJ6OYy8X1w2H
 6lzihdZH+5kxfU3KiJNwUfXCVl8QoCrTJ6aVxajdClh5z5dhabqvQWq460N0SacAR9LuV3PB/
 puscwuX4WXvFP7jcyzDJP0h9S1XnlHSbOcyIqgxFSXPRYq9TScwSeYkF6kPabs5cchHLPVGn4
 eURoKzHHrb4LzAAC0vCkEI9w7Wgk6kdmMO/gB7XnPddc1uDsuSaiclgXCIvJpyBVM1HcLd5+V
 /eoQqSeRSDno/DKKCmT3F8MgTqeVI6sIFEM4UW6XtAULI6OVmAqpXJHnGaQSUVVfFf5y5ueMP
 7t9d5w2DH1vShRx1yyX+2kNpVNTqlsAGvZ6KLY0bmwUqnGL2Oi3Kj4IxcDi/q60Lr3QTWjrZ1
 cdvStH+b5i5WIcCqSbZbpOsA4jVe+XKBOgKzJQfh7kHc6hurFcdNkD5cI8v56Wth0UuNY1wID
 dzRRNrKtXTUczPMl73ypqfg++V7N0X8tsHiBxrXjNwIPZHLOn2MoHUiAr7oZlinIFXOMW3IuR
 TwElnZe8zvr7lsMMAcnH+qE0Piu7289QopH110RqoMhB/pSE2BDBC8fw8qQsFOVtw0yuAayuK
 kAOxcqbaq/pm6pIlzFfH3NIRzuhxJ2XEfj1SFSLJgiypWRFoa5sPY83Ge9sLLtgXGyLP/6Tz8
 EWTXE80zZUK/XtoafrW/rGnTObrmXpdXjQTelvdWnkklmoAHUnYeYB34530qV0AONKYp2h9Xm
 UsGEbQ9
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Define the missing FUTEX_* constants in syscall_defs.h

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220829021006.67305-6-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c      | 10 ++++++++++
 linux-user/syscall_defs.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 3f144e3c1f5d..2e954d8dbd9e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7788,8 +7788,17 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
     case FUTEX_WAIT_BITSET:
         val = tswap32(val);
         break;
+    case FUTEX_WAIT_REQUEUE_PI:
+        val = tswap32(val);
+        haddr2 = g2h(cpu, uaddr2);
+        break;
+    case FUTEX_LOCK_PI:
+    case FUTEX_LOCK_PI2:
+        break;
     case FUTEX_WAKE:
     case FUTEX_WAKE_BITSET:
+    case FUTEX_TRYLOCK_PI:
+    case FUTEX_UNLOCK_PI:
         timeout = 0;
         break;
     case FUTEX_FD:
@@ -7797,6 +7806,7 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
         timeout = 0;
         break;
     case FUTEX_CMP_REQUEUE:
+    case FUTEX_CMP_REQUEUE_PI:
         val3 = tswap32(val3);
         /* fall through */
     case FUTEX_REQUEUE:
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 1e3577bfa56f..01ee10a88fe0 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2699,6 +2699,9 @@ struct target_drm_i915_getparam {
 #define FUTEX_TRYLOCK_PI        8
 #define FUTEX_WAIT_BITSET       9
 #define FUTEX_WAKE_BITSET       10
+#define FUTEX_WAIT_REQUEUE_PI   11
+#define FUTEX_CMP_REQUEUE_PI    12
+#define FUTEX_LOCK_PI2          13
 
 #define FUTEX_PRIVATE_FLAG      128
 #define FUTEX_CLOCK_REALTIME    256
-- 
2.37.3


