Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9175EE83B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:22:28 +0200 (CEST)
Received: from localhost ([::1]:55894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeVf-00016j-5I
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf5-0000eD-ET
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:07 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:53173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf3-0006YC-Ry
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:07 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MTzve-1on1JR2Pru-00QyN6; Wed, 28
 Sep 2022 22:28:03 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 34/37] linux-user: Implement PI futexes
Date: Wed, 28 Sep 2022 22:27:34 +0200
Message-Id: <20220928202737.793171-35-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZgvfdCGvrXdYFhC9TqX60aEUkAF5VzmrV0EUY4pGCK7Jn+si3LI
 oYNrom6aQ/3FjBTFpsRHD1CH2WDWU41lXCsOicOXyq+aapXYY6FyNml2akG8Y+PxRza5rUe
 htCvEW6IvqIgeO7ZlhAF8cMlq1WDdADskwKIn9t5J0Vi3L3OubN4lVOLQgK05W/sSMhUwH7
 cSFJrpqjEyVi7zlhY4/UQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dbf6zThDfDg=:WGnTVHEAs/DwGg8jGUYaqe
 kYO4mFBY4Uo23XB6UBxaIRhFOlGc+sao3vpguyhxeHHaI1LUnuZ9nVMtS4u5qc43dnQXM6d0v
 i5WFquLNKzfL75lcXu01xRSKW+Z3L0jyU5GonB2wU0jHWM26/jeSYgVDz8oeXt3xhPmT1RWfo
 4iMggATj97A8zrUiFI8611aOq+qyOQruW04FWwSt5bEYF1es0iXzza0r+Assd1HStsafa4MDi
 O2Fyio6bkRsDMsVM4LqKCfBXRcRa01MfZlC4aT0FBpI1CvT6agK/tFNhLDoK1JvzWPjwZhfhQ
 QRHrfxRUkfb/t2Pr4YljTaPdAtjH1IKReaEFNgl3BgNKyJ8smn1mKwhyL6VvY8OD5IMtVXShc
 XQsv/UxLBwBjtTpikeO4fZaYrU2f6xInRDMK8xS4HfsUeTYEd78HP8iqrgoUz2zHvs6ZJzuW4
 uiAMwkt9XrtnGn0PhmNXO2eF1YZY88zETsgjWkNclRt8YLTu0teXjIMFswER+HcJHZ9qBmUYu
 1GzimwWyZuzxg5Z3pmmQUUPylK2I+fztCiynU81WAzL1nBokHsAyk/ex4G6LglSQSZwR1bf5a
 bEUmhHE/ZAjYMotSBRiHU06qcHHtdov9m+W17FZZcf+huzWhZHesDa3xi+raA5Sxjeg1jwhLO
 owbriQpNlIcjEaRpfrsBgPT2ZwkLAlC3Zg5/S00en+YbwvlKfniBSwWIEbkMXYKcvS/ZajHWX
 iiK6fk+3T8MgmYSpbpvMP/1mII+XCr5bckoAd0MqAJNQHClBF/vfJi08wAEbYPWWYmQ3nXYl+
 ssFhHqz
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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


