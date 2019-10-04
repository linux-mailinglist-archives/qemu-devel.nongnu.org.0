Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B2BCB391
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 05:47:30 +0200 (CEST)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGEYy-0005GV-LL
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 23:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iGEVv-0003mv-6C
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 23:44:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iGEVt-0001kK-Jh
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 23:44:18 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:3893)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iGEVs-0001i3-W3
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 23:44:17 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1]) by
 rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee65d96c006b7a-b2957;
 Fri, 04 Oct 2019 11:44:07 +0800 (CST)
X-RM-TRANSID: 2ee65d96c006b7a-b2957
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.lan (unknown[180.108.8.156])
 by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee15d96bff81ac-a1b01;
 Fri, 04 Oct 2019 11:44:06 +0800 (CST)
X-RM-TRANSID: 2ee15d96bff81ac-a1b01
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] tests/migration: mem leak fix
Date: Fri,  4 Oct 2019 11:43:46 +0800
Message-Id: <bcf225d9b90600b10951ac0a87569344e150ef51.1570159624.git.maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1570159624.git.maozhongyi@cmss.chinamobile.com>
References: <cover.1570159624.git.maozhongyi@cmss.chinamobile.com>
In-Reply-To: <cover.1570159624.git.maozhongyi@cmss.chinamobile.com>
References: <cover.1570159624.git.maozhongyi@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.80
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
Cc: tony.nguyen@bt.com, alex.bennee@linaro.org, armbru@redhat.com,
 Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

‘data’ has the possibility of memory leaks， so use the
glib macros g_autofree recommended by CODING_STYLE.rst
to automatically release the memory that returned from
g_malloc().

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/migration/stress.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tests/migration/stress.c b/tests/migration/stress.c
index d9aa4afe92..9e128eef50 100644
--- a/tests/migration/stress.c
+++ b/tests/migration/stress.c
@@ -170,10 +170,10 @@ static unsigned long long now(void)
 static int stressone(unsigned long long ramsizeMB)
 {
     size_t pagesPerMB = 1024 * 1024 / PAGE_SIZE;
-    char *ram = malloc(ramsizeMB * 1024 * 1024);
+    g_autofree char *ram = g_malloc(ramsizeMB * 1024 * 1024);
     char *ramptr;
     size_t i, j, k;
-    char *data = malloc(PAGE_SIZE);
+    g_autofree char *data = g_malloc(PAGE_SIZE);
     char *dataptr;
     size_t nMB = 0;
     unsigned long long before, after;
@@ -186,7 +186,6 @@ static int stressone(unsigned long long ramsizeMB)
     if (!data) {
         fprintf(stderr, "%s (%d): ERROR: cannot allocate %d bytes of RAM: %s\n",
                 argv0, gettid(), PAGE_SIZE, strerror(errno));
-        free(ram);
         return -1;
     }
 
@@ -198,8 +197,6 @@ static int stressone(unsigned long long ramsizeMB)
     memset(ram, 0xfe, ramsizeMB * 1024 * 1024);
 
     if (random_bytes(data, PAGE_SIZE) < 0) {
-        free(ram);
-        free(data);
         return -1;
     }
 
@@ -227,9 +224,6 @@ static int stressone(unsigned long long ramsizeMB)
             }
         }
     }
-
-    free(data);
-    free(ram);
 }
 
 
-- 
2.17.1




