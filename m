Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA4E5EE6B6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:41:57 +0200 (CEST)
Received: from localhost ([::1]:47648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddsS-0001pO-M6
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddew-00008D-99
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:58 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:53401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddeu-0006Tm-0B
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:57 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MWiUg-1okHUc0XrU-00X5bk; Wed, 28
 Sep 2022 22:27:50 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 17/37] tests/tcg/linux-test: Add linux-madvise test
Date: Wed, 28 Sep 2022 22:27:17 +0200
Message-Id: <20220928202737.793171-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sLhE1jHBWhwzx9HMMIERxBXqUJ8/+Kl+2YQ75OD34bil9poM/Yd
 XMrzvgj8m5fGIUjZeivOc34eMlPl7XTKWkX0SwYzDiwOe4JY98dfxOXcHhQvdpPWsUHA/0C
 XqM6YMU5Gr0EB6Yns7RQwGoE4eZAxd+ALsSGG+ve/5wt/40hv9p5lWDRxJP4XQofRQfCLZC
 pKqIa0wzWMRBke0ZpvV5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jsivJO/CqeA=:NlN91AY+Q7qgGmQUxLfrAo
 H/R3nVrBziw0w/r8FOb09e2CtNhPSTZiChgxMKGKEl4XXSz8mmd4mREJ+625XK16CPl6SMEOz
 ZetM2QH0V6QvtvuxFUJjYIiLIwJ4IryWSBhOPJy9xURlNolAh/SufQYC/SutR9IpuXCLXhrrr
 U1VNUk2QQ0WIaaDQkxL4u3f/gX6qdfiVvNk830Sc+MnbJRvpoR6x2uNpMXWfh1ZJ/08A2f8H2
 aOBMosgWwn1WVFQ4Nplp1SCN1/WwFhj7AHc6Q0NdprJkTEAQHYGt5HEPLY82/lPnsbzEIPvkr
 P15wWD6rPoR0Qiv0KIxumsUaolv3QswVdsVNfhv0c842Lhn8zHrGc5ELWT7ZJ31GqsOcC4fLE
 mRj5PJd7uaUkiaZkKKgsc4AvssQLwvUua5S25Uy1Nre6E5Kn7A5e+T5ZZYONchJZUkqvttbGq
 /kuEdWwZTVx8cLfRn8lmUfKe6Z0NdlfImfEaPDpmnpDfXDk/MZu8iBQthZTvpBuIpejZF1V1e
 Ue4iRD8m98KTyfGs/6b4BGhK92zW2k3NdVztBs/HP35JpWekt+xl09nVdTsvBTTDZk9Nb2670
 4iIVcVQjbwtXcPRecyXOiPiRCP/Ij6sbd/yMUWmndUiKGxO+RJRWeCHQpdtjZ6U6+eL7a8vHQ
 gi9FP/U8hdDjB6Jguft6rFaDeEDxbtW0JjI8zLOD3sC4S4DIJU9iIHOXbYIXKgeiBqaBpbHUj
 d2fQwCCgEv/dfnAKzfqS6b1vyvplwF/tElSwUoM11SYtkqQa3lBxUm7swJIPytyW1f3l1ri8h
 t2DUDKv
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


