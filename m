Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A6568AB18
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:11:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL60-0005R6-CP; Sat, 04 Feb 2023 11:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5w-0005Kg-IP
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:52 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5u-0006zS-Ux
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:52 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MXYAj-1p7hCD28QZ-00YvX0; Sat, 04
 Feb 2023 17:08:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Mike Frysinger <vapier@gentoo.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 08/22] linux-user: fix strace build w/out munlockall
Date: Sat,  4 Feb 2023 17:08:16 +0100
Message-Id: <20230204160830.193093-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TXK4FqR9qjyFAonsH4M/OZWSVZH3r1jiO4ELpU4pNRZ72hBGDfg
 WiWFfUYdoo5icvJlrTDCTWfZOBbo1Gg/CERdn29uhUADyuLaKD0RUWZAXljZE2hFgpU4nEb
 YlJoMwwfX0T1Rg7qSUqtLXjP/vm6BKJZxhFyl8N4dUBMx6c4letndAte5ywnTxAV6bBlaZO
 1OiO/USqDcPZfYm9QsBXw==
UI-OutboundReport: notjunk:1;M01:P0:3NsjH6rPRBc=;5F8Ket0NJIN1Vwdt7DPbFKBLS7B
 mme9GZZCt9b/9n51o5jVkMqyIEnIi+f75tKUh0DBtn6OYuOofx65JtiCK1lmOh0P64iWqOYUt
 CeNJ2CABzFGSkqKpLWPJbxhYbUAW5147qyQTqQfT0OPL0vlOUzCAQvXCmM3RhhEeSQAfiSHOP
 dFv4ROfX7AJJnI+INabRJPDU+G/OlZ7XMbsvmwp3VnLIggeI0rYanjJi/LHJYx7To8Ysf2cp9
 aBR0KVxt6l6mz9gzU3fxpK+Ar3dgzzEN/5MxfDub8k3lAmSCxJm1l1m4cqf78g3hFdTprRpFT
 rnOC6luVfInXYqElJyutfDtm9u9+Rg9c3/gVmFR2d+dg06oqXz3LpJCdCBzZ94hmFsZokOBT1
 wGjkIt4bkXbKbU5CMKoCpy8ojUdiLSHTROnmBobTYYyfatj6ZPuSfEnR+aaDxpB2/jNfn8NtI
 9bc1NBH/mSi721ehIauS4ChBhqr4zeIEVbpXDkE9Y9SSeHJxs80Yfrp/631SZ/PtLcM2EfuWi
 KDhBkZFcSnb5JsicheDnmH1LS9O95hrvdd9/q1DHVsBDyfJKgVlUGD5YfhTX4QnO4lUOT5NDc
 BR7QrFqIofXLcySL7pzhodMhW2Zs9ivoDC5DCS+t4Iwr5pMZT/EGd/FASnGJ9ZosvoNIJZrR4
 jwYBTV8OVqAj2z6k5CmWBXaT1ocFdCnKeCuXSGJxRw==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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

From: Mike Frysinger <vapier@gentoo.org>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230118090144.31155-1-vapier@gentoo.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 5027289bdde4..081fc87344ca 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1360,7 +1360,8 @@ UNUSED static const struct flags termios_lflags[] = {
     FLAG_END,
 };
 
-UNUSED static const struct flags mlockall_flags[] = {
+#ifdef TARGET_NR_mlockall
+static const struct flags mlockall_flags[] = {
     FLAG_TARGET(MCL_CURRENT),
     FLAG_TARGET(MCL_FUTURE),
 #ifdef MCL_ONFAULT
@@ -1368,6 +1369,7 @@ UNUSED static const struct flags mlockall_flags[] = {
 #endif
     FLAG_END,
 };
+#endif
 
 /* IDs of the various system clocks */
 #define TARGET_CLOCK_REALTIME              0
-- 
2.39.1


