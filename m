Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FE7243434
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Aug 2020 08:53:07 +0200 (CEST)
Received: from localhost ([::1]:53880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k676o-0001q4-US
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 02:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k673Q-0006Qf-AF
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 02:49:36 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:40691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k673K-0004bz-88
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 02:49:35 -0400
Received: from localhost.localdomain ([82.252.135.186]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MxEcg-1kuWsR03WC-00xYAE; Thu, 13 Aug 2020 08:49:27 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/14] linux-user: Adjust guest page protection for the host
Date: Thu, 13 Aug 2020 08:49:12 +0200
Message-Id: <20200813064923.263565-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200813064923.263565-1-laurent@vivier.eu>
References: <20200813064923.263565-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dak7xG3V4W0QKLOhjASDpYW82SzC8Qlh7wh9zzOo5iPO3aBNtV9
 Eqv/0+1EkMSD5+veXfO3ss+U+l4Nz2TXYnZY5zQEOaH/TgW47imod9zFmFtGsdQKXYqZH95
 ZWZWZFLtkwR0Qpp/o6M0Nh0igovvtZIee8LmM0IwU0kXVcyPSwuATr/kzczqDyUN/j6YCI7
 EtsTVsb/2Qfb0pQhcIqtw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kFJa+kebwxI=:v3fkdMtEbWQdwcCMXgFwyP
 xaRgl9UMaOeqC3P+k5g5zEzixWLIL5AB1lk4R1FcVEv8F8yf3zv+vDkbzJnTXfaCvz1BGzT6i
 UGUN4UeW8h1itVEavw7RPrNmKTfZ1BGTRe51F1wxENbUHKSBZwyfKmMBjKMUAjT2WOe1At34c
 sEF8U+SNdfZDE/gtPvaXhA8D5crwo3N1YY5zyIx1KvQhsg8Eh9JbwQav1VsAbPMBIvn6GluBV
 ujyY9XlGgg6LR9XyzOrXhJsHbG+VRVVARxHYM1sIjl8q/Re7B3J0aq9GlcHxMbYoDKUqpOrf1
 UGzM5/7QkPB4N6PWWzWEEoRcWRv5Y7hWEJxIeQnd3fegDkejPbsvOBnfdqv453xISFuhezNdh
 dAcWOCoMa71IfrRYEUPIe+KhlLkxewg3UUeCz9JbSQlRh75y3jLXnoY0tulIMaTfX5wCJADN/
 LF3TcEl56g4ISmK8zbubnFQspU3yiX3T6k/cCZecRFHs8Lr2J2vp0NupRfLXb7fyJwPh2ZqSM
 2LVtxHOVJ0JOKa4eGc0Y47eHLo8BHJ8hWXmXEx39owRoQr+u1KKrojcb7BBkElSNGNdA9L1oI
 cI6ttAzccfmTiXBsC+Q6swBDQwKkywg+abtFXUnO2RMtYqweRpKcqu61EpOceaeoGsroLU/OI
 De9ERNLEGTmWtvvnl3SnUIiwi1b2Fbi5IL1DC5+rnAbCmOIq6pw4QsvgFMYjuC6zXVKUlYNdc
 ZXD7Pzjs45x8KTOdtqMAUo3Gx8SjYLdqdNVesmlEFxaVfg4S/4OEFZQP2ebzxC34iSbUfT2y9
 a71RPCsG0QPIzCngMeqCSsKxmhEytN5LoiJpkCV1SNWHBR6ASs8sRWAq++GLYId5zqa342v
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 02:49:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Executable guest pages are never directly executed by
the host, but do need to be readable for translation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20200519185645.3915-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mmap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 46c7eeba9bd2..f2615634201d 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -76,8 +76,12 @@ static int validate_prot_to_pageflags(int *host_prot, int prot)
      * don't bother transforming guest bit to host bit.  Any other
      * target-specific prot bits will not be understood by the host
      * and will need to be encoded into page_flags for qemu emulation.
+     *
+     * Pages that are executable by the guest will never be executed
+     * by the host, but the host will need to be able to read them.
      */
-    *host_prot = prot & (PROT_READ | PROT_WRITE | PROT_EXEC);
+    *host_prot = (prot & (PROT_READ | PROT_WRITE))
+               | (prot & PROT_EXEC ? PROT_READ : 0);
 
     return prot & ~valid ? 0 : page_flags;
 }
-- 
2.26.2


