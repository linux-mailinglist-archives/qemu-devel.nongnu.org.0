Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A8AF4B1
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 05:33:58 +0200 (CEST)
Received: from localhost ([::1]:46268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7tOF-0000Kt-Vg
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 23:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42221)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7tM9-0007IU-0N
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 23:31:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7tM8-00040r-12
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 23:31:44 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:4344)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7tM7-0003yP-F2
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 23:31:43 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1]) by
 rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee25d786a81340-ebd09;
 Wed, 11 Sep 2019 11:31:14 +0800 (CST)
X-RM-TRANSID: 2ee25d786a81340-ebd09
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.148])
 by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee15d786a7b269-ac9a7;
 Wed, 11 Sep 2019 11:31:14 +0800 (CST)
X-RM-TRANSID: 2ee15d786a7b269-ac9a7
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Wed, 11 Sep 2019 11:31:02 +0800
Message-Id: <9b8662b94d89030b1f33193246c645baac2eedd7.1568170994.git.maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
References: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
In-Reply-To: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
References: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.79
Subject: [Qemu-devel] [PATCH v2 1/3] tests/migration: mem leak fix
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
glic macros g_autofree recommended by CODING_STYLE.rst
to automatically release the memory that returned from
g_malloc().

Cc: armbru@redhat.com
Cc: laurent@vivier.eu
Cc: tony.nguyen@bt.com
Cc: alex.bennee@linaro.org

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 tests/migration/stress.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tests/migration/stress.c b/tests/migration/stress.c
index d9aa4afe92..6cbb2d49d3 100644
--- a/tests/migration/stress.c
+++ b/tests/migration/stress.c
@@ -170,10 +170,10 @@ static unsigned long long now(void)
 static int stressone(unsigned long long ramsizeMB)
 {
     size_t pagesPerMB = 1024 * 1024 / PAGE_SIZE;
-    char *ram = malloc(ramsizeMB * 1024 * 1024);
+    g_autofree char *ram = malloc(ramsizeMB * 1024 * 1024);
     char *ramptr;
     size_t i, j, k;
-    char *data = malloc(PAGE_SIZE);
+    g_autofree char *data = malloc(PAGE_SIZE);
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




