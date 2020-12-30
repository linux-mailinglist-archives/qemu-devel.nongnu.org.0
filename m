Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D8B2E7CF3
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 23:19:40 +0100 (CET)
Received: from localhost ([::1]:44692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kujoh-0008L5-VF
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 17:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@hofstaedtler.name>)
 id 1kujmm-0007cx-BE
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 17:17:43 -0500
Received: from mail.namespace.at ([2a01:190:1801:100::235]:40368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@hofstaedtler.name>)
 id 1kujmk-00027w-LM; Wed, 30 Dec 2020 17:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=hofstaedtler.name; s=a; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CZM6X1HG2XgdbArzslYvL7Ro945zOiEzB64apMgKPyo=; b=lYkqNHIiGHSurdCbz8h8ntSAnQ
 LeADRDyws7lTW4ePf7aU2llhbuoWLqaXMLvYv94N2binnW3c0nEAg6OoPoDqYEgT/Rgq9Bp5KZcP7
 ghM8G+KIiHseCCCwWVTPe0+Ez5B6waQzlXWRnL50GJjxGbwv234xLJTBQ6bGB4J485abhXs0j19l7
 09Q1Dz/czI0KP30FD/leLvTuJA8Hd++1fE33+P+AAwXirnESOsZBpLZde7v1Sv2drDeOj/RyR9qsZ
 1/tjv/lzocHB+yubXqJkGpqvqMvbFn3OGRqqzZt7dOEvR/3Be4UU1678bjNBQnjzrfVtqdry9rnpy
 z4iv9GUw==;
From: Chris Hofstaedtler <chris@hofstaedtler.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] meson: fix ncurses detection on macOS
Date: Wed, 30 Dec 2020 23:17:27 +0100
Message-Id: <20201230221727.60579-1-chris@hofstaedtler.name>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:190:1801:100::235;
 envelope-from=chris@hofstaedtler.name; helo=mail.namespace.at
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Samuel Thibault <samuel.thibault@gnu.org>,
 Chris Hofstaedtler <chris@hofstaedtler.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this, meson fails with "curses package not usable" when using ncurses
6.2. Apparently the wide functions (addwstr, etc) are hidden behind the extra
define, and meson does not define it at that detection stage.

Regression from b01a4fd3bd7d6f2 ("configure: Define NCURSES_WIDECHAR if we're
using curses"). The meson conversion has seen many iterations of the curses
check, so pinpointing the exact commit breaking this is not so easy.

Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Samuel Thibault <samuel.thibault@gnu.org>
Cc: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 372576f82c..fd74728674 100644
--- a/meson.build
+++ b/meson.build
@@ -500,16 +500,16 @@ if have_system and not get_option('curses').disabled()
     endif
   endforeach
   msg = get_option('curses').enabled() ? 'curses library not found' : ''
+  curses_compile_args = ['-DNCURSES_WIDECHAR']
   if curses.found()
-    if cc.links(curses_test, dependencies: [curses])
-      curses = declare_dependency(compile_args: '-DNCURSES_WIDECHAR', dependencies: [curses])
+    if cc.links(curses_test, args: curses_compile_args, dependencies: [curses])
+      curses = declare_dependency(compile_args: curses_compile_args, dependencies: [curses])
     else
       msg = 'curses package not usable'
       curses = not_found
     endif
   endif
   if not curses.found()
-    curses_compile_args = ['-DNCURSES_WIDECHAR']
     has_curses_h = cc.has_header('curses.h', args: curses_compile_args)
     if targetos != 'windows' and not has_curses_h
       message('Trying with /usr/include/ncursesw')
-- 
2.29.2


