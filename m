Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2445C616E8D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 21:24:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqKGS-0000dx-KB; Wed, 02 Nov 2022 16:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oqKGP-0000dO-R7; Wed, 02 Nov 2022 16:23:05 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oqKGO-00013C-0v; Wed, 02 Nov 2022 16:23:05 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 0E150DA0277;
 Wed,  2 Nov 2022 21:23:00 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 04F264621B3; Wed,  2 Nov 2022 21:23:00 +0100 (CET)
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [PATCH for 7.2] Fix broken configure with -Wunused-parameter
Date: Wed,  2 Nov 2022 21:22:58 +0100
Message-Id: <20221102202258.456359-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The configure script fails because it tries to compile small C programs
with a main function which is declared with arguments argc and argv
although those arguments are unused.

Running `configure -extra-cflags=-Wunused-parameter` triggers the problem.
configure for a native build does abort but shows the error in config.log.
A cross build configure for Windows with Debian stable aborts with an
error.

Avoiding unused arguments fixes this.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

See https://gitlab.com/qemu-project/qemu/-/issues/1295.

I noticed the problem because I often compile with -Wextra.

Stefan

 configure | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 4275f5419f..1106c04fea 100755
--- a/configure
+++ b/configure
@@ -1258,6 +1258,7 @@ if test "$stack_protector" != "no"; then
   cat > $TMPC << EOF
 int main(int argc, char *argv[])
 {
+    (void)argc;
     char arr[64], *p = arr, *c = argv[0];
     while (*c) {
         *p++ = *c++;
@@ -1607,7 +1608,7 @@ fi
 
 if test "$safe_stack" = "yes"; then
 cat > $TMPC << EOF
-int main(int argc, char *argv[])
+int main(void)
 {
 #if ! __has_feature(safe_stack)
 #error SafeStack Disabled
@@ -1629,7 +1630,7 @@ EOF
   fi
 else
 cat > $TMPC << EOF
-int main(int argc, char *argv[])
+int main(void)
 {
 #if defined(__has_feature)
 #if __has_feature(safe_stack)
@@ -1675,7 +1676,7 @@ static const int Z = 1;
 #define TAUT(X) ((X) == Z)
 #define PAREN(X, Y) (X == Y)
 #define ID(X) (X)
-int main(int argc, char *argv[])
+int main(void)
 {
     int x = 0, y = 0;
     x = ID(x);
-- 
2.30.2


