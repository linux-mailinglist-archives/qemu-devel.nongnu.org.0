Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29D928E8B6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 00:21:03 +0200 (CEST)
Received: from localhost ([::1]:55830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSp8o-0002FN-Bv
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 18:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kSp7h-0001iG-8C
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 18:19:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:36474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kSp7e-0007AC-Vw
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 18:19:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1602713989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=a3DWtcxXaYqEcWM479S+n7SxpXPhW9zzQIM70mXI4H8=;
 b=RFYk8mDT8d9WVbPGZIuzj6p7kROX/THQP6B4FcPfNgwwjsT+AbcdrevIjUhG5OihPtVCFz
 f/mQNFSz/JxVPP4rIvZOA6S/IPIpnbfLX9a7v7WM645+TTIn8iZy9EFq4Bg3RY1GfNBOLT
 CZS/jlV3GZKhQO3AAoW8nJwujjy1PMA=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09628ABD1;
 Wed, 14 Oct 2020 22:19:49 +0000 (UTC)
From: Bruce Rogers <brogers@suse.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson.build: don't condition iconv detection on library
 detection
Date: Wed, 14 Oct 2020 16:19:39 -0600
Message-Id: <20201014221939.196958-1-brogers@suse.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=brogers@suse.com;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 01:21:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: luoyonggang@gmail.com, kraxel@redhat.com, Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It isn't necessarily the case that use of iconv requires an additional
library. For that reason we shouldn't conditionalize iconv detection on
libiconv.found.

Fixes: 5285e593c33 (configure: Fixes ncursesw detection under msys2/mingw by convert them to meson)

Signed-off-by: Bruce Rogers <brogers@suse.com>
---
 meson.build | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index 1a4a482492..84c8ec9541 100644
--- a/meson.build
+++ b/meson.build
@@ -431,15 +431,13 @@ if not get_option('iconv').disabled()
   libiconv = cc.find_library('iconv',
                              required: false,
                              static: enable_static)
-  if libiconv.found()
-    if cc.links('''
-      #include <iconv.h>
-      int main(void) {
-        iconv_t conv = iconv_open("WCHAR_T", "UCS-2");
-        return conv != (iconv_t) -1;
-      }''', dependencies: [libiconv])
-      iconv = declare_dependency(dependencies: [libiconv])
-    endif
+  if cc.links('''
+    #include <iconv.h>
+    int main(void) {
+      iconv_t conv = iconv_open("WCHAR_T", "UCS-2");
+      return conv != (iconv_t) -1;
+    }''', dependencies: [libiconv])
+    iconv = declare_dependency(dependencies: [libiconv])
   endif
 endif
 if get_option('iconv').enabled() and not iconv.found()
-- 
2.28.0


