Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C37124B39
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 16:14:24 +0100 (CET)
Received: from localhost ([::1]:55528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihb1r-0001am-ME
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 10:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34098)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <11a52f72d4a301518ad3fa3ec08080cf1d02e3d1@lizzy.crudebyte.com>)
 id 1ihb0F-0000HS-Hi
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 10:12:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <11a52f72d4a301518ad3fa3ec08080cf1d02e3d1@lizzy.crudebyte.com>)
 id 1ihb0D-0001Dp-M1
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 10:12:42 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:42473)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <11a52f72d4a301518ad3fa3ec08080cf1d02e3d1@lizzy.crudebyte.com>)
 id 1ihb0C-0004hl-TR
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 10:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Subject:Date:Cc:To:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=f75LCKXuW/82lh/Zq9Mk5ElCuMF9Qpgl+UzPHjR/EyQ=; b=P6rDk
 qBb8yW5GUiapZCxfjcgiI1kJIN880N8SYp4GX9LSjmYhgZQZEPGxSEwTLeMUxGk1qBTYSDR9oGmeO
 mt5v0WqBxSHY6zdQp0e2T7559x4l06flD0pKaJieA8NdjZ8pVFGqNLPNkR4M4iEj1OIznD55gaExh
 v75ZMEbRGLUGej7qtihQXQ8kABAe+xCGwycnefHeJMhjQ4bA4oiTS40QF/HyhKeLXDko46Sk3VNUR
 09H02VAlZYC3oGr776tPUvPISEldZ9P6fuygYEgdttipRz8pd8bWTkvAsUs3VxUSKh7AjJGAEA343
 7o7dRmIBwI4lWhPxruYmwBF2I5egA==;
Message-Id: <11a52f72d4a301518ad3fa3ec08080cf1d02e3d1.1576678644.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1576678644.git.qemu_oss@crudebyte.com>
References: <cover.1576678644.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Date: Wed, 18 Dec 2019 14:06:30 +0100
Subject: [PATCH v2 1/9] tests/virtio-9p: add terminating null in
 v9fs_string_read()
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.194.90.13
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

The 9p protocol sends strings in general without null termination
over the wire. However for future use of this functions it is
beneficial for the delivered string to be null terminated though
for being able to use the string with standard C functions which
often rely on strings being null terminated.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/virtio-9p-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/virtio-9p-test.c b/tests/virtio-9p-test.c
index e7b58e3a0c..06263edb53 100644
--- a/tests/virtio-9p-test.c
+++ b/tests/virtio-9p-test.c
@@ -130,8 +130,9 @@ static void v9fs_string_read(P9Req *req, uint16_t *len, char **string)
         *len = local_len;
     }
     if (string) {
-        *string = g_malloc(local_len);
+        *string = g_malloc(local_len + 1);
         v9fs_memread(req, *string, local_len);
+        (*string)[local_len] = 0;
     } else {
         v9fs_memskip(req, local_len);
     }
-- 
2.20.1


