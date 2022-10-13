Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07F45FD66E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 10:47:16 +0200 (CEST)
Received: from localhost ([::1]:41492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oits3-0001az-JA
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 04:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oitjG-0003V6-00
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:38:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oitjC-0005sF-Nw
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665650282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oYOKYuU7BAZmBdUsqHi/HMRW7MrW3YyzPAZXc2wqAy0=;
 b=Cy1hTmWuB9SktsuQFkHnzEMcB+o3Sl+F7YQqgTlAIqlKrZW3o4YCmlt8gIiylvVGSBfr/X
 8/YJe3u7v70+ycHWrO3vaFDZ7zaaRus/H5e0s5bNwqGKOhmafSVvCN9ke6hXX/ZlqYlYjO
 GZcItBOOI2ta1yqndXNsvQpjxjW8RN0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-4TS6AK1dMZaJ8MN5cxj3ug-1; Thu, 13 Oct 2022 04:38:01 -0400
X-MC-Unique: 4TS6AK1dMZaJ8MN5cxj3ug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44E7C101A58E
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 08:38:01 +0000 (UTC)
Received: from maggie.redhat.com (unknown [10.43.2.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E279540C2064
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 08:38:00 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Avoid using strings binary
Date: Thu, 13 Oct 2022 10:37:55 +0200
Message-Id: <83824abdddf124d76f9f265f77808e859dc094a8.1665650275.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When determining the endiandness of the target architecture we're
building for a small program is compiled, which in an obfuscated
way declares two strings. Then, we look which string is in
correct order (using strings binary) and deduct the endiandness.
But using the strings binary is problematic, because it's part of
toolchain (strings is just a symlink to
x86_64-pc-linux-gnu-strings or llvm-strings). And when
(cross-)compiling, it requires users to set the symlink to the
correct toolchain.

Fortunately, we have a better alternative anyways. Since we
require either clang or gcc we can rely on macros they declare.

Bug: https://bugs.gentoo.org/876933
Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 configure | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/configure b/configure
index 45ee6f4eb3..91e04635cb 100755
--- a/configure
+++ b/configure
@@ -1426,27 +1426,30 @@ fi
 # ---
 # big/little endian test
 cat > $TMPC << EOF
-#include <stdio.h>
-short big_endian[] = { 0x4269, 0x4765, 0x4e64, 0x4961, 0x4e00, 0, };
-short little_endian[] = { 0x694c, 0x7454, 0x654c, 0x6e45, 0x6944, 0x6e41, 0, };
-int main(int argc, char *argv[])
-{
-    return printf("%s %s\n", (char *)big_endian, (char *)little_endian);
-}
+#if defined(__BYTE_ORDER) && __BYTE_ORDER == __BIG_ENDIAN || \
+    defined(__BIG_ENDIAN__)
+# error BIG
+#endif
+int main(void) { return 0; }
 EOF
 
 if compile_prog ; then
-    if strings -a $TMPE | grep -q BiGeNdIaN ; then
-        bigendian="yes"
-    elif strings -a $TMPE | grep -q LiTtLeEnDiAn ; then
-        bigendian="no"
-    else
-        echo big/little test failed
-        exit 1
-    fi
+  bigendian="yes"
 else
+  cat > $TMPC << EOF
+#if defined(__BYTE_ORDER) && __BYTE_ORDER == __LITTLE_ENDIAN || \
+    defined(__LITTLE_ENDIAN__)
+# error LITTLE
+#endif
+int main(void) { return 0; }
+EOF
+
+  if compile_prog ; then
+    bigendian="no"
+  else
     echo big/little test failed
     exit 1
+  fi
 fi
 
 ##########################################
-- 
2.35.1


