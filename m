Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8276F31B9E9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:02:07 +0100 (CET)
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdVu-0002u5-IR
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdG9-0004A5-E9
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:49 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:50949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFw-0000iB-G9
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:47 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MQeDw-1lY7vB0R3m-00NkYY; Mon, 15 Feb 2021 13:45:23 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/13] linux-user/mips64: Restore setup_frame() for o32 ABI
Date: Mon, 15 Feb 2021 13:45:07 +0100
Message-Id: <20210215124519.720265-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215124519.720265-1-laurent@vivier.eu>
References: <20210215124519.720265-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oKph+Z028sM2OW4CDO33cAwK1ohB25Th/DDnAJOSbQEC6lPBU8+
 RkleIImUlrL8o+/CUN3I3Nj0zqq0My2XhVvIuvGBmgcuiOrmcmBh/G8SANbQuBRaSbeJ3ps
 iXYwfHhgm5jObKjcLAzRR7dVduflHkDW8JM5+k/RfPJnOSJP2Z9lQedncDdtN/H115TLN/D
 E9WczcHpFZYG8QOtS4gMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ugoxeImQXlI=:njLCyiAEdbiQzXxzQgYUvy
 crMOzAvB8P/b0rchL5QZDcKkud5A7sgNGjRWgUqQ5owQu1KylxXpJBxG5EM+RqhyeanN7gR+k
 5HXLBNviK2u7Tkzz9FWYbPrDwd0++92kXgHNF6E0l0JqyInS9ie8dDkUjqC0rGcdSNfgYsA6g
 ZywtoEPXZKb0qEex1ghSOUNuhST1+Be84j0t6H+0ED5x2gfqQFWgHzLwE4x4irGPShCX8pWkk
 Y69n0YD6zxRwqhMkh+nMU0sX+tx9EzuUMXLlpduCPo9UApHiDTWJyc36PfL4YFw8MdwissUUa
 u9BV6sc4mqC6sFa52Szw/Z+k3KfrZ9KN4es3UIzSO4mk5wbgTf2/bhGiKiX5L+dbER0vheBWj
 uDudfQx2AJjPS55uyy32wTrqUmUaUuQnIPN8bbnRzgbyfCdnbQOdVyqgnQSxm
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

64-bit MIPS targets lost setup_frame() during the refactor in commit
8949bef18b9. Restore it declaring TARGET_ARCH_HAS_SETUP_FRAME, to be
able to build the o32 ABI target.

Fixes: 8949bef18b9 ("linux-user: move mips/mips64 signal.c parts to mips directory")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201119161710.1985083-2-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mips64/target_signal.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
index 799f7a668cd0..f1f0ed7f7067 100644
--- a/linux-user/mips64/target_signal.h
+++ b/linux-user/mips64/target_signal.h
@@ -67,4 +67,8 @@ typedef struct target_sigaltstack {
 #define TARGET_MINSIGSTKSZ    2048
 #define TARGET_SIGSTKSZ       8192
 
+#if defined(TARGET_ABI_MIPSO32)
+/* compare linux/arch/mips/kernel/signal.c:setup_frame() */
+#define TARGET_ARCH_HAS_SETUP_FRAME
+#endif
 #endif /* MIPS64_TARGET_SIGNAL_H */
-- 
2.29.2


