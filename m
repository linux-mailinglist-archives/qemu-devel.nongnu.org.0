Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BF53998BC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 05:55:17 +0200 (CEST)
Received: from localhost ([::1]:45352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loeRv-0002Bg-TZ
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 23:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQM-0008Bi-Kt
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:38 -0400
Received: from mr85p00im-ztdg06011101.me.com ([17.58.23.185]:49043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQK-0004TV-JO
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1622692414; bh=EbNMzVw3vepneA/DE3G4SKL1cFt4MHiKmcOsX+NpZNM=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=Vjpnaic0qpvTTZsmx41Lf7zkrkNBcyKaK9u32LwcGudAdd7uN+/z4zDaOpW6Rjg19
 jUffq3l2j26jfugwa5dgdNxRyOLssu4KYSxnIGNAie96AnRMWk9iVx3gC4JqhhlkGG
 cyhFQPuspjT7PpAVotzsmi8dCUrl0lTqbh83SqXihzU3HR6IYKhhEZdvBCOCRJuUGi
 /khwqaMmDyDYsX0MNvhdnE0gVK2JfPxsSScMNgJKHGyKjsw/15rvlzDw1mBjdqP8fQ
 r+RNHjsgdbBAhT2QWDWvCpWwgVuO18GhYTyFl+hKxBF1nyMIHbhFphY9CkiMfG4JZv
 1cV5l3GCELzzQ==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id 89F394A0101;
 Thu,  3 Jun 2021 03:53:33 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>
Subject: [PATCH 1/8] Make qemu-palcode build environment standalone. NFC.
Date: Wed,  2 Jun 2021 20:53:10 -0700
Message-Id: <20210603035317.6814-2-thorpej@me.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210603035317.6814-1-thorpej@me.com>
References: <20210603035317.6814-1-thorpej@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.761,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-06-03=5F01:2021-06-02=5F03,2021-06-03=5F01,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2106030024
Received-SPF: pass client-ip=17.58.23.185; envelope-from=thorpej@me.com;
 helo=mr85p00im-ztdg06011101.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Don't include system headers.  Instead, provide standalone definitions
and declarations of types needed and functions used by the PALcode that
are compatible with the standard Alpha / GCC ABI.

Signed-off-by: Jason Thorpe <thorpej@me.com>
---
 init.c   |  2 --
 memcpy.c |  2 +-
 memset.c |  2 +-
 printf.c |  4 +---
 protos.h | 30 +++++++++++++++++++++++++-----
 5 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/init.c b/init.c
index b53bab6..429a9ad 100644
--- a/init.c
+++ b/init.c
@@ -18,8 +18,6 @@
    along with this program; see the file COPYING.  If not see
    <http://www.gnu.org/licenses/>.  */
 
-#include <string.h>
-#include <stddef.h>
 #include "hwrpb.h"
 #include "osf.h"
 #include "ioport.h"
diff --git a/memcpy.c b/memcpy.c
index b6bbb74..9e1e913 100644
--- a/memcpy.c
+++ b/memcpy.c
@@ -8,7 +8,7 @@
  * This is a reasonably optimized memcpy() routine.
  */
 
-#include <string.h>
+#include "protos.h"
 
 /*
  * Note that the C code is written to be optimized into good assembly. However,
diff --git a/memset.c b/memset.c
index e8481dc..f9b0a6d 100644
--- a/memset.c
+++ b/memset.c
@@ -19,7 +19,7 @@
    <http://www.gnu.org/licenses/>.  */
 
 
-#include <string.h>
+#include "protos.h"
 
 void *memset(void *optr, int ival, unsigned long size)
 {
diff --git a/printf.c b/printf.c
index 469b82c..0e1e128 100644
--- a/printf.c
+++ b/printf.c
@@ -18,10 +18,8 @@
    along with this program; see the file COPYING.  If not see
    <http://www.gnu.org/licenses/>.  */
 
-#include <stdarg.h>
-#include <stdbool.h>
-#include <string.h>
 #include "console.h"
+#include "protos.h"
 
 static int print_buf_pad(char *buf, int buflen, char *p, int width, int pad)
 {
diff --git a/protos.h b/protos.h
index 3ed1381..0d90be8 100644
--- a/protos.h
+++ b/protos.h
@@ -21,11 +21,31 @@
 #ifndef PROTOS_H
 #define PROTOS_H 1
 
-#include <stdint.h>
-#include <stdbool.h>
-#include <stddef.h>
-#include <string.h>
-
+/* Stand-alone definitions for various types, compatible with
+   the Alpha Linux ABI and GCC.  This eliminates dependencies
+   on external headers.  */
+typedef unsigned char  uint8_t;
+typedef unsigned short uint16_t;
+typedef unsigned int   uint32_t;
+typedef unsigned long  uint64_t;
+typedef unsigned long  size_t;
+
+#define bool           _Bool
+#define true           1
+#define false          0
+
+#define offsetof(type, member) __builtin_offsetof(type, member)
+
+typedef __builtin_va_list va_list;
+#define va_start(ap, last)     __builtin_va_start((ap), (last))
+#define va_arg                 __builtin_va_arg
+#define va_end(ap)             __builtin_va_end(ap)
+
+#define NULL                   ((void *)0)
+
+extern void *memset(void *, int, size_t);
+extern void *memcpy(void *, const void *, size_t);
+extern size_t strlen(const char *);
 
 /*
  * Call_Pal functions.
-- 
2.30.2


