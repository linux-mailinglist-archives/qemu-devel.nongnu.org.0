Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E724916B8
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Aug 2019 15:06:41 +0200 (CEST)
Received: from localhost ([::1]:41124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzKtM-0004Ha-AV
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 09:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nand@haasn.xyz>) id 1hzInJ-0001Lt-2K
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 06:52:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nand@haasn.xyz>) id 1hzImA-0007D4-CJ
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 06:51:07 -0400
Received: from haasn.xyz ([78.46.187.166]:43508)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <nand@haasn.xyz>) id 1hzImA-0007A3-48
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 06:51:06 -0400
Received: from haasn.xyz (unknown [10.30.0.2])
 by haasn.xyz (Postfix) with ESMTP id C38AA401EE;
 Sun, 18 Aug 2019 12:50:59 +0200 (CEST)
From: Niklas Haas <qemu@haasn.xyz>
To: qemu-devel@nongnu.org
Date: Sun, 18 Aug 2019 12:50:38 +0200
Message-Id: <20190818105038.19520-1-qemu@haasn.xyz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 78.46.187.166
X-Mailman-Approved-At: Sun, 18 Aug 2019 09:05:30 -0400
Subject: [Qemu-devel] [PATCH] input-linux: add shift+shift as a grab toggle
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
Cc: Niklas Haas <git@haasn.xyz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Niklas Haas <git@haasn.xyz>

We have ctrl-ctrl and alt-alt; why not shift-shift? That's my preferred
grab binding, personally.

Signed-off-by: Niklas Haas <git@haasn.xyz>
---
 qapi/ui.json     | 3 ++-
 ui/input-linux.c | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 59e412139a..e04525d8b4 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1025,7 +1025,8 @@
 #
 ##
 { 'enum': 'GrabToggleKeys',
-  'data': [ 'ctrl-ctrl', 'alt-alt', 'meta-meta', 'scrolllock', 'ctrl-scr=
olllock' ] }
+  'data': [ 'ctrl-ctrl', 'alt-alt', 'shift-shift','meta-meta', 'scrolllo=
ck',
+            'ctrl-scrolllock' ] }
=20
 ##
 # @DisplayGTK:
diff --git a/ui/input-linux.c b/ui/input-linux.c
index 59456fe765..a7b280b25b 100644
--- a/ui/input-linux.c
+++ b/ui/input-linux.c
@@ -113,6 +113,10 @@ static bool input_linux_check_toggle(InputLinux *il)
         return il->keydown[KEY_LEFTALT] &&
             il->keydown[KEY_RIGHTALT];
=20
+    case GRAB_TOGGLE_KEYS_SHIFT_SHIFT:
+        return il->keydown[KEY_LEFTSHIFT] &&
+            il->keydown[KEY_RIGHTSHIFT];
+
     case GRAB_TOGGLE_KEYS_META_META:
         return il->keydown[KEY_LEFTMETA] &&
             il->keydown[KEY_RIGHTMETA];
--=20
2.21.0


