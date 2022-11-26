Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9006396BF
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Nov 2022 16:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyx3y-0008Sk-Ii; Sat, 26 Nov 2022 10:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oyx3v-0008PG-8J
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 10:25:51 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oyx3t-0006uj-QJ
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 10:25:51 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id B131BDA1049;
 Sat, 26 Nov 2022 16:25:48 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id AE0A746000E; Sat, 26 Nov 2022 16:25:48 +0100 (CET)
To: qemu-devel@nongnu.org,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 for-7.2 4/6] libvhost-user: Add format attribute to local
 function vu_panic
Date: Sat, 26 Nov 2022 16:25:05 +0100
Message-Id: <20221126152507.283271-5-sw@weilnetz.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221126152507.283271-1-sw@weilnetz.de>
References: <20221126152507.283271-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220422070144.1043697-4-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 subprojects/libvhost-user/libvhost-user.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 80f9952e71..d6ee6e7d91 100644
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
2.35.1


