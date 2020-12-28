Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 115252E644E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:52:09 +0100 (CET)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktuoY-0005Qs-Lk
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zeha@debian.org>) id 1ktuGg-0003P4-L8
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 10:17:10 -0500
Received: from ns1.namespace.at ([213.208.148.230]:42730
 helo=nlay-fle-service01.in.namespace.at)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zeha@debian.org>) id 1ktuGe-0003w2-J3
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 10:17:06 -0500
Received: from [10.100.0.62] (helo=debbuild.in.namespace.at)
 by nlay-fle-service01.in.namespace.at with smtp (Exim 4.92)
 (envelope-from <zeha@debian.org>)
 id 1ktuGb-00E1TW-SH; Mon, 28 Dec 2020 16:17:01 +0100
Received: (nullmailer pid 235619 invoked by uid 1000);
 Mon, 28 Dec 2020 15:17:01 -0000
From: Chris Hofstaedtler <chris@hofstaedtler.name>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: fix ncurses detection on macOS
Date: Mon, 28 Dec 2020 15:16:52 +0000
Message-Id: <20201228151652.235542-1-chris@hofstaedtler.name>
X-Mailer: git-send-email 2.30.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=213.208.148.230; envelope-from=zeha@debian.org;
 helo=nlay-fle-service01.in.namespace.at
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Dec 2020 10:50:32 -0500
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this, meson fails with "curses package not usable"
when using ncurses 6.2. Apparently the wide functions
(addwstr, etc) are hidden behind the extra define, and
meson does not define it at that detection stage.

Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 9c152a85bd..7b9d92c14a 100644
--- a/meson.build
+++ b/meson.build
@@ -510,7 +510,7 @@ if have_system and not get_option('curses').disabled()
   endforeach
   msg = get_option('curses').enabled() ? 'curses library not found' : ''
   if curses.found()
-    if cc.links(curses_test, dependencies: [curses])
+    if cc.links(curses_test, args: '-DNCURSES_WIDECHAR', dependencies: [curses])
       curses = declare_dependency(compile_args: '-DNCURSES_WIDECHAR', dependencies: [curses])
     else
       msg = 'curses package not usable'
-- 
2.29.2


