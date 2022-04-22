Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D23150B11C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 09:09:23 +0200 (CEST)
Received: from localhost ([::1]:42642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhnPu-0001tv-9c
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 03:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1nhnJJ-0003oZ-7I
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 03:02:34 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:50550
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1nhnJH-00006h-NV
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 03:02:32 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 9B9CDDA1932;
 Fri, 22 Apr 2022 09:02:30 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 9915F462074; Fri, 22 Apr 2022 09:02:30 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] libvhost-user: Add format attribute to local function
 vu_panic
Date: Fri, 22 Apr 2022 09:01:44 +0200
Message-Id: <20220422070144.1043697-4-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422070144.1043697-1-sw@weilnetz.de>
References: <20220422070144.1043697-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

It would be good to add format attributes to local functions, too (like
it is done here) to avoid future format bugs.

The changes here could be simplified by including a glib header,
but from the comments I assumed that is unwanted here?

 subprojects/libvhost-user/libvhost-user.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 94645f9154..29ab85fc9d 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -45,6 +45,17 @@
 #include "libvhost-user.h"
 
 /* usually provided by GLib */
+#if     __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ > 4)
+#if !defined(__clang__) && (__GNUC__ == 4 && __GNUC_MINOR__ == 4)
+#define G_GNUC_PRINTF(format_idx, arg_idx) \
+  __attribute__((__format__(gnu_printf, format_idx, arg_idx)))
+#else
+#define G_GNUC_PRINTF(format_idx, arg_idx) \
+  __attribute__((__format__(__printf__, format_idx, arg_idx)))
+#endif
+#else   /* !__GNUC__ */
+#define G_GNUC_PRINTF(format_idx, arg_idx)
+#endif  /* !__GNUC__ */
 #ifndef MIN
 #define MIN(x, y) ({                            \
             typeof(x) _min1 = (x);              \
@@ -151,7 +162,7 @@ vu_request_to_string(unsigned int req)
     }
 }
 
-static void
+static void G_GNUC_PRINTF(2, 3)
 vu_panic(VuDev *dev, const char *msg, ...)
 {
     char *buf = NULL;
-- 
2.30.2


