Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245FA98A7F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 06:44:12 +0200 (CEST)
Received: from localhost ([::1]:38102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0exH-0005Ix-91
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 00:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i0evY-00047X-4l
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 00:42:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i0evX-0002co-0G
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 00:42:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58492)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i0evW-0002cE-Pm
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 00:42:22 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 029F2103EF49
 for <qemu-devel@nongnu.org>; Thu, 22 Aug 2019 04:42:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F1435C221;
 Thu, 22 Aug 2019 04:42:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5CC3F97A1; Thu, 22 Aug 2019 06:42:18 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 06:42:17 +0200
Message-Id: <20190822044218.9374-2-kraxel@redhat.com>
In-Reply-To: <20190822044218.9374-1-kraxel@redhat.com>
References: <20190822044218.9374-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 22 Aug 2019 04:42:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/2] curses: assert get_wch return value is okay
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

This prevents the compiler from reporting a possible uninitialized use
of maybe_keycode in function curses_refresh.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 1563451264-46176-1-git-send-email-pbonzini@redhat.com

[ kraxel: whitespace fixup ]

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/curses.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/curses.c b/ui/curses.c
index a6e260eb964d..ec281125acbd 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -225,6 +225,8 @@ static wint_t console_getch(enum maybe_keycode *maybe_keycode)
     case ERR:
         ret = -1;
         break;
+    default:
+        abort();
     }
     return ret;
 }
-- 
2.18.1


