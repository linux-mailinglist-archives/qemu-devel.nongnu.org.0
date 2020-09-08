Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE213260C3E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 09:41:38 +0200 (CEST)
Received: from localhost ([::1]:41504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFYG2-0004wf-2i
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 03:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slyfox@gentoo.org>) id 1kFYFF-0004Mp-S8
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 03:40:49 -0400
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4]:54983
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <slyfox@gentoo.org>) id 1kFYFD-0004zn-ID
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 03:40:49 -0400
Received: by sf.home (Postfix, from userid 1000)
 id 877265A22061; Tue,  8 Sep 2020 08:40:33 +0100 (BST)
From: Sergei Trofimovich <slyfox@gentoo.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson.build: tweak sdl-image error message
Date: Tue,  8 Sep 2020 08:40:16 +0100
Message-Id: <20200908074016.2593596-1-slyfox@gentoo.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4;
 envelope-from=slyfox@gentoo.org; helo=smtp.gentoo.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 03:40:37
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Rafael Kitover <rkitover@gmail.com>, Sergei Trofimovich <slyfox@gentoo.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before the change missing SDL was reported as:

    ../meson.build:253:4: ERROR: Expected 1 arguments, got 2.

After the error as:

    ../meson.build:258:4: ERROR: Problem encountered: sdl-image required, but SDL was not found

CC: Paolo Bonzini <pbonzini@redhat.com>
CC: "Marc-André Lureau" <marcandre.lureau@redhat.com>
CC: "Philippe Mathieu-Daudé" <philmd@redhat.com>
CC: Rafael Kitover <rkitover@gmail.com>
Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
---
 meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 04e070bb3b..7fd2a903c5 100644
--- a/meson.build
+++ b/meson.build
@@ -255,8 +255,8 @@ if sdl.found()
                          method: 'pkg-config', static: enable_static)
 else
   if get_option('sdl_image').enabled()
-    error('sdl-image required, but SDL was @0@',
-          get_option('sdl').disabled() ? 'disabled' : 'not found')
+    error('sdl-image required, but SDL was @0@'.format(
+          get_option('sdl').disabled() ? 'disabled' : 'not found'))
   endif
   sdl_image = not_found
 endif
-- 
2.28.0


