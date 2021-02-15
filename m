Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C07231B9EF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:05:32 +0100 (CET)
Received: from localhost ([::1]:33428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdZC-0005Gf-VC
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdG9-00049m-Bi
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:49 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:47651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFu-0000hz-GS
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:43 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mate1-1liUES2L19-00cMUN; Mon, 15 Feb 2021 13:45:23 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] linux-user/mips64: Support o32 ABI syscalls
Date: Mon, 15 Feb 2021 13:45:08 +0100
Message-Id: <20210215124519.720265-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215124519.720265-1-laurent@vivier.eu>
References: <20210215124519.720265-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:md/47WpyKCdM6dnnVw2++Cs81+LfKx1pKur4U3C+wz3zUK3DAuC
 BJLfAqVTSFt6V3US61lIQ0AB/Kj/1tK+3nIi/IeIXCY+1oN6scqVr2rKg1lCdAiwqFIRv6x
 qn0eO5auHrZjKHl7lDOEo14if+ngRVhyDbMwevRMsgyytFi+fVUeM+gkiEj58BHhN0bxtZH
 wzQG8pgcvAYHam0Lejgjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eKVbUzaUxqE=:GGC3PvovuVTO5TaTqCA3xV
 /PnuqLVuqpAbKKyJemTGkC8G3sNUzcDCuCAQ6I9O4SoT/Xa+wlccFBt4mZpIn58nU83QefFoe
 ZiCMlp21cSS8vA5Pk4GEDKMm/xSG3wUMpnMillZtglRv9/a3T8ZbFuOXrrhfCTTJTQAE3ApUe
 i9bAzaoAOuozwxEBtCwcYEsIxARuG/0CWL69fxO2b5fi5oLssAebp3aJOMx5ySDgFIcGi06Gx
 5w5vEsvggqL9c8ePqp8FhHbLfdUWhKkkYA6/4xDfRsUEO2lsvVpEVcFqw+xe3NZlWnI2c5enf
 f+/T1JmHYR0mA7qCyKQZYcuS/PUspQFnAd67dnYfSQ/yG0QGpIfTbiX6qAuvM8vQpWrYY6spj
 TAHgA7cdpZM19vCCtkmZtDZbDfOVToobiLbNM2jWRZTeYFnByq3P+Qbpa3BX37DwSFFz9uD9t
 phm6+56ITw==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

o32 ABI syscalls start at offset 4000.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201119161710.1985083-3-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mips64/syscall_nr.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/mips64/syscall_nr.h b/linux-user/mips64/syscall_nr.h
index 672f2fa51cba..6579421fa639 100644
--- a/linux-user/mips64/syscall_nr.h
+++ b/linux-user/mips64/syscall_nr.h
@@ -1,4 +1,7 @@
-#ifdef TARGET_ABI_MIPSN32
+#if defined(TARGET_ABI_MIPSO32)
+#define TARGET_SYSCALL_OFFSET 4000
+#include "syscall_o32_nr.h"
+#elif defined(TARGET_ABI_MIPSN32)
 #define TARGET_SYSCALL_OFFSET 6000
 #include "syscall_n32_nr.h"
 #else
-- 
2.29.2


