Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19525ED8FD
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:31:52 +0200 (CEST)
Received: from localhost ([::1]:60366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTPz-0004WT-KI
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEC-0008E2-1y
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:36 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:48769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE9-0008C0-GL
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:35 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MJmCV-1oxbfi0dFB-00KBOg; Wed, 28
 Sep 2022 10:15:27 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 17/38] tests/tcg/linux-test: Add linux-madvise test
Date: Wed, 28 Sep 2022 10:14:56 +0200
Message-Id: <20220928081517.734954-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:d2Jg5mLWB36vBtez6hhiQ29KTnw5vHmZPZPTV4IiQpDPNFKSmve
 11w5PtzLwx0zOkoiq7OPaRC9AYwlcbfYmMr5Mrnf/sLwG/JUyYp5auyKIacrodR0rZFPpmo
 KqWV9l21/g7GJsVL2IgW/cz9sbsigJp87uHqOSFIg1zecd/OIidpK3CwCEg3RUVkrYmWYyM
 FxQrs/G4qT9uczZMAukqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6XwwXc7CQI0=:RBgrlJ1tv8VE+7hC/HLjd4
 5ZeFkOPs8tUxe2ne7fXblQSxc6hYLAcoZ+qq3Bzr7NrfPVr+jy+H8DM9wnHtIiOfvBLuoQF1b
 TVq2lFJfN+T+sczO0ZT9/nDNt8jo7TKai9fdSzQ0sf0IXGyaI4afMXNeKR+1p61SuoOV4hI+0
 qW24UXs8mHKkkMaCPdj997efEonmbLT/qc0E0elQTUc74nsujXHk0ViEFLv6+bOPA9xkKFteC
 uEcPkKFoqVXTuPzS3WJ4MrxzOAT3jl0fTIsVTbxdNeqRHueJOmVJl1Kbzeg/UzsxrKS9LvZ/G
 gtNjlzc4fOhcVqLHGHgdz+qt2ADo273k0mKSCD6lha1LHovvRasmZ/PLQKluOg4kafaeM4gfs
 O9RMSI4HV35N7zfCpxrBebABt98/edR6fA2okh9kye0V7p3dwMc/As16o2SAM/dS8n4uFSpBq
 8qflKol24hRq4CzdpNyV133bSvcr3lvzV5cwcctysdeZAatmB9aJDic03Lv4blIiwA+taQ/Y3
 792UEXt8TJskM1Djz8K3U5errVpTQMuge8eSHVvIwtQwZIJOqASm0U4s75KY1mvUvpCAD/nbS
 /paxcCFTUIZyq+y0UwCMpMsj1Vv/uCCM0dOuNpO30DAZZimHOaOANJTKS4gfZxLlf3xDP6O10
 Go1DWL2oC6O2exsP2IkAXFlmrC038KxDXyHZsuzWdf35f7jCZJr678CZjMMdOwIkw2HhLd9I+
 Fznt7K7r+83FO2gWUqgYYcPrEoSyj8hn+gKrucYKH8l/teGqHw6cuBBkGCWbwDU6AbnM852yY
 fSzyIS8
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a test that checks madvise(MADV_DONTNEED) behavior with anonymous
and file mappings in order to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220906000839.1672934-6-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/tcg/multiarch/linux/linux-madvise.c | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 tests/tcg/multiarch/linux/linux-madvise.c

diff --git a/tests/tcg/multiarch/linux/linux-madvise.c b/tests/tcg/multiarch/linux/linux-madvise.c
new file mode 100644
index 000000000000..29d0997e687c
--- /dev/null
+++ b/tests/tcg/multiarch/linux/linux-madvise.c
@@ -0,0 +1,70 @@
+#include <assert.h>
+#include <stdlib.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+static void test_anonymous(void)
+{
+    int pagesize = getpagesize();
+    char *page;
+    int ret;
+
+    page = mmap(NULL, pagesize, PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+    assert(page != MAP_FAILED);
+
+    /* Check that mprotect() does not interfere with MADV_DONTNEED. */
+    ret = mprotect(page, pagesize, PROT_READ | PROT_WRITE);
+    assert(ret == 0);
+
+    /* Check that MADV_DONTNEED clears the page. */
+    *page = 42;
+    ret = madvise(page, pagesize, MADV_DONTNEED);
+    assert(ret == 0);
+    assert(*page == 0);
+
+    ret = munmap(page, pagesize);
+    assert(ret == 0);
+}
+
+static void test_file(void)
+{
+    char tempname[] = "/tmp/.cmadviseXXXXXX";
+    int pagesize = getpagesize();
+    ssize_t written;
+    char c = 42;
+    char *page;
+    int ret;
+    int fd;
+
+    fd = mkstemp(tempname);
+    assert(fd != -1);
+    ret = unlink(tempname);
+    assert(ret == 0);
+    written = write(fd, &c, sizeof(c));
+    assert(written == sizeof(c));
+    page = mmap(NULL, pagesize, PROT_READ, MAP_PRIVATE, fd, 0);
+    assert(page != MAP_FAILED);
+
+    /* Check that mprotect() does not interfere with MADV_DONTNEED. */
+    ret = mprotect(page, pagesize, PROT_READ | PROT_WRITE);
+    assert(ret == 0);
+
+    /* Check that MADV_DONTNEED resets the page. */
+    *page = 0;
+    ret = madvise(page, pagesize, MADV_DONTNEED);
+    assert(ret == 0);
+    assert(*page == c);
+
+    ret = munmap(page, pagesize);
+    assert(ret == 0);
+    ret = close(fd);
+    assert(ret == 0);
+}
+
+int main(void)
+{
+    test_anonymous();
+    test_file();
+
+    return EXIT_SUCCESS;
+}
-- 
2.37.3


