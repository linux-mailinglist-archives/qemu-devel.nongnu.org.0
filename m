Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DD82C4A31
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 22:42:32 +0100 (CET)
Received: from localhost ([::1]:51932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki2YZ-0008Di-Tl
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 16:42:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1ki2Su-0002Ia-UD; Wed, 25 Nov 2020 16:36:40 -0500
Received: from home.keithp.com ([63.227.221.253]:37064 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1ki2St-0001D0-8Y; Wed, 25 Nov 2020 16:36:40 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 179693F2E28C;
 Wed, 25 Nov 2020 13:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1606340194; bh=X4hIM5LaBzi6bmbdhBPAXlHvcdNLVM4OJv26kvDk8og=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YO6+aZlRWsLi69HaWWeCe205Mqpf0zpt6SkYMFTzcJo18ObzuvESQ0N7EO64PAIKf
 eH4TC+FN/icNxTu9zM2pH1/9CmGzQhGVmrV7gPjaFy67Sv8yzuOHNUDliExlbcf/zr
 LogfOAwQdwH1AZjSlS9ho/07KBlrwqXGbz+6fUxD7zjoqlng37xEcFkcXAr91yfJH3
 gATVtIBsjP0nANTTTGDRQjhQsOax97CixK/vkwTiCIckzm6oMvYfz+mgI08uLuN2fO
 VG6tO2y6P1gVWR5Bwo4ueH91ohmXfIu0u/pgd7lY7ctngtnq+w+pXtwQR8MlqagR9O
 YN7gH7T1abybA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 1eugfL796m84; Wed, 25 Nov 2020 13:36:33 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id D7D113F2E28E;
 Wed, 25 Nov 2020 13:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1606340191; bh=X4hIM5LaBzi6bmbdhBPAXlHvcdNLVM4OJv26kvDk8og=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GXFg3FePa/UjrsJNhHi2cYnldYMPTkueZ0f3FnFWinzynk4LJURqsTVyt8okKKy7e
 fde9Wus8OFw3y5bq8vF+ND6tSRkqGqJ8ejrbWvBOzb7fNqBQLXaaqm34mBjeOY55VZ
 eEjB9q4eYCRnpgnWarC6/dwnNuBFGT4uhNDzjyD8L+x77fljcGANDqGl9DCa8mGHMo
 IoWJpjnqdMp3WmEydX0w2a8YlgFaimAxGX0NhNzInkig5FePgicvYImW+X6gIu8orb
 CagLmOqTcqafg6Y/CPNT6AH9YY0RA7L2PJSm4Ad3m0qVJeOFgjYnPBobg86KRBu2PZ
 YVAImv5yAJbUA==
Received: by keithp.com (Postfix, from userid 1000)
 id B199F15821C7; Wed, 25 Nov 2020 13:36:31 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH 7/8] semihosting: Implement SYS_TMPNAM
Date: Wed, 25 Nov 2020 13:36:16 -0800
Message-Id: <20201125213617.2496935-8-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125213617.2496935-1-keithp@keithp.com>
References: <20201125213617.2496935-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Keith Packard <keithp@keithp.com>
From: Keith Packard via <qemu-devel@nongnu.org>

Part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index c84b0d906b..9a04d98e4e 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -830,6 +830,7 @@ target_ulong do_common_semihosting(CPUState *cs)
     CPUArchState *env = cs->env_ptr;
     target_ulong args;
     target_ulong arg0, arg1, arg2, arg3;
+    target_ulong ul_ret;
     char * s;
     int nr;
     uint32_t ret;
@@ -993,8 +994,24 @@ target_ulong do_common_semihosting(CPUState *cs)
 
         return guestfd_fns[gf->type].flenfn(cs, gf);
     case TARGET_SYS_TMPNAM:
-        qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __func__);
-        return -1;
+        GET_ARG(0);
+        GET_ARG(1);
+        GET_ARG(2);
+        if (asprintf(&s, "/tmp/qemu-%x%02x", getpid(),
+                     (int) (arg1 & 0xff)) < 0) {
+            return -1;
+        }
+        ul_ret = (target_ulong) -1;
+
+        /* Make sure there's enough space in the buffer */
+        if (strlen(s) < arg2) {
+            char *output = lock_user(VERIFY_WRITE, arg0, arg2, 0);
+            strcpy(output, s);
+            unlock_user(output, arg0, arg2);
+            ul_ret = 0;
+        }
+        free(s);
+        return ul_ret;
     case TARGET_SYS_REMOVE:
         GET_ARG(0);
         GET_ARG(1);
-- 
2.29.2


