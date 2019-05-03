Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69361259C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 02:39:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMMEW-0000wd-R2
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 20:39:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <driver1998@foxmail.com>) id 1hMMCd-0008SZ-T4
	for qemu-devel@nongnu.org; Thu, 02 May 2019 20:37:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <driver1998@foxmail.com>) id 1hMMCc-00030R-Vr
	for qemu-devel@nongnu.org; Thu, 02 May 2019 20:37:27 -0400
Received: from smtpproxy19.qq.com ([184.105.206.84]:50156)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <driver1998@foxmail.com>)
	id 1hMMCc-0002zn-Ol
	for qemu-devel@nongnu.org; Thu, 02 May 2019 20:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1556843841;
	bh=fqx7px8aicw59s5wsPfWml96z0lJHa6tUbYs8uCbaaw=;
	h=From:To:Subject:Date:Message-Id;
	b=nwvxZV1sTGrrCUe0ikJ8Y9GfKTjFJhGZmzYLvTkNCgWihCid+LPT5kaDvtXR+FntW
	4XAOM9n9g1i/dXI7aXgchzUJswvPzobmqh1jcKMJDiPGP/J4+bYLlB2vohnI8SAUYJ
	z+OIS6s8ZziOTBDHIWaF2A6N5KJ8KAwH7xyIdLK4=
X-QQ-mid: esmtp2t1556843840tnjge6umc
Received: from localhost (unknown [183.63.119.3])
	by esmtp4.qq.com (ESMTP) with 
	id ; Fri, 03 May 2019 08:37:19 +0800 (CST)
X-QQ-SSF: B100000000000030F7F00F00000000O
X-QQ-FEAT: 0wsbT93u7eCMTn3b6RLI6G4Cws3/XlKIMI7VNta4wKG3NDZzzT0jiRgIu8x/k
	DAKSH8/mNV3lZptaGiI0/ua44BHTN+L5tjBKFJyjyqhw+BtHEmAHDDd7LldWSZyhCzBVc9H
	esAX0AnV/gKL/yfm+dXVGGJ2MgSLX1UnsjFNt/SkqOc/NEh9XQ4epcanuQf/GjQTFjdnjl0
	Ey4akzTs7WHqpepl9rJc483oKw5I/xE8vFFSukbP2BsUCbMWzF/Wbe11UhMokfS2RBdODxH
	IwFbfAtsaKyD+9zFJyvRLRpvGTXYJI+ZYkDx0gNzbTj7Qs
X-QQ-GoodBg: 0
From: Cao Jiaxi <driver1998@foxmail.com>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 08:37:19 +0800
Message-Id: <20190503003719.10233-1-driver1998@foxmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503002206.9751-1-driver1998@foxmail.com>
References: <20190503002206.9751-1-driver1998@foxmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtp:foxmail.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 184.105.206.84
Subject: [Qemu-devel] [PATCH v3 4/4] osdep: Fix mingw compilation regarding
 stdio formats
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Cao Jiaxi <driver1998@foxmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I encountered the following compilation error on mingw:

/mnt/d/qemu/include/qemu/osdep.h:97:9: error: '__USE_MINGW_ANSI_STDIO' macro redefined [-Werror,-Wmacro-redefined]
 #define __USE_MINGW_ANSI_STDIO 1
        ^
/mnt/d/llvm-mingw/aarch64-w64-mingw32/include/_mingw.h:433:9: note: previous definition is here
 #define __USE_MINGW_ANSI_STDIO 0      /* was not defined so it should be 0 */

It turns out that __USE_MINGW_ANSI_STDIO must be set before any
system headers are included, not just before stdio.h.

Signed-off-by: Cao Jiaxi <driver1998@foxmail.com>
---
 include/qemu/osdep.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 303d315c5d..af2b91f0b8 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -85,17 +85,17 @@ extern int daemon(int, int);
 #endif
 #endif
 
+/* enable C99/POSIX format strings (needs mingw32-runtime 3.15 or later) */
+#ifdef __MINGW32__
+#define __USE_MINGW_ANSI_STDIO 1
+#endif
+
 #include <stdarg.h>
 #include <stddef.h>
 #include <stdbool.h>
 #include <stdint.h>
 #include <sys/types.h>
 #include <stdlib.h>
-
-/* enable C99/POSIX format strings (needs mingw32-runtime 3.15 or later) */
-#ifdef __MINGW32__
-#define __USE_MINGW_ANSI_STDIO 1
-#endif
 #include <stdio.h>
 
 #include <string.h>
-- 
2.17.1




