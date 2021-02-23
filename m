Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47344322D17
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:06:12 +0100 (CET)
Received: from localhost ([::1]:38792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZGN-0007BH-8D
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1lEZE9-0005Y2-W2
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:03:54 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:60548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1lEZE7-00014L-RV
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:03:53 -0500
Received: from 2.general.paelzer.uk.vpn ([10.172.196.173]
 helo=Keschdeichel.fritz.box) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.ehrhardt@canonical.com>)
 id 1lEZE4-0005Jz-Qg; Tue, 23 Feb 2021 15:03:48 +0000
From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] disas: Fix build with glib2.0 >=2.67.3
Date: Tue, 23 Feb 2021 15:56:46 +0100
Message-Id: <20210223145646.4129643-1-christian.ehrhardt@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=christian.ehrhardt@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

glib2.0 introduced a change in 2.67.3 and later which triggers an
issue [1] for anyone including it's headers in a "extern C" context
which a few files in disas/* do. An example of such an include chain
and error look like:

../../disas/arm-a64.cc
In file included from /usr/include/glib-2.0/glib/gmacros.h:241,
                 from /usr/lib/x86_64-linux-gnu/glib-2.0/include/glibconfig.h:9,
                 from /usr/include/glib-2.0/glib/gtypes.h:32,
                 from /usr/include/glib-2.0/glib/galloca.h:32,
                 from /usr/include/glib-2.0/glib.h:30,
                 from /<<BUILDDIR>>/qemu-5.2+dfsg/include/glib-compat.h:32,
                 from /<<BUILDDIR>>/qemu-5.2+dfsg/include/qemu/osdep.h:126,
                 from ../../disas/arm-a64.cc:21:
/usr/include/c++/10/type_traits:56:3: error: template with C linkage
   56 |   template<typename _Tp, _Tp __v>
      |   ^~~~~~~~
../../disas/arm-a64.cc:20:1: note: ‘extern "C"’ linkage started here
   20 | extern "C" {
      | ^~~~~~~~~~

To fix that move the include of osdep.h out of that section. It was added
already as C++ fixup by e78490c44: "disas/arm-a64.cc: Include osdep.h first".

[1]: https://gitlab.gnome.org/GNOME/glib/-/issues/2331

Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
---
 disas/arm-a64.cc   | 2 +-
 disas/nanomips.cpp | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/disas/arm-a64.cc b/disas/arm-a64.cc
index 9fa779e175..27613d4b25 100644
--- a/disas/arm-a64.cc
+++ b/disas/arm-a64.cc
@@ -17,8 +17,8 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-extern "C" {
 #include "qemu/osdep.h"
+extern "C" {
 #include "disas/dis-asm.h"
 }
 
diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 90e63b8367..3c202075cc 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -27,8 +27,8 @@
  *      Reference Manual", Revision 01.01, April 27, 2018
  */
 
-extern "C" {
 #include "qemu/osdep.h"
+extern "C" {
 #include "disas/dis-asm.h"
 }
 
-- 
2.30.0


