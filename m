Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3017C41F14F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:35:27 +0200 (CEST)
Received: from localhost ([::1]:34002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKZJ-0005tj-Rj
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nia@netbsd.org>) id 1mWKUD-0003R0-NU
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:30:09 -0400
Received: from mail.netbsd.org ([2001:470:a085:999::25]:50238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nia@netbsd.org>) id 1mWKUA-0004Ry-PL
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:30:09 -0400
Received: by mail.netbsd.org (Postfix, from userid 1524)
 id BF78184D25; Fri,  1 Oct 2021 15:30:03 +0000 (UTC)
Date: Fri, 1 Oct 2021 15:30:03 +0000
From: nia <nia@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] configure: Loosen GCC requirement from 7.5.0 to 7.4.0
Message-ID: <YVcpe79I0rly1HJh@homeworld.netbsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2001:470:a085:999::25;
 envelope-from=nia@netbsd.org; helo=mail.netbsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As discussed in issue 614, we're shipping GCC 7.4.0 as the
system compiler in NetBSD 9, the most recent stable branch,
and are still actively interested in QEMU on this platform.

The differences between GCC 7.5.0 and 7.4.0 are trivial.

Signed-off-by: Nia Alarie <nia@NetBSD.org>
---
 configure | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 1043ccce4f..b0b1a1cc25 100755
--- a/configure
+++ b/configure
@@ -2094,8 +2094,8 @@ cat > $TMPC << EOF
 #  endif
 # endif
 #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
-# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 5)
-#  error You need at least GCC v7.5.0 to compile QEMU
+# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 4)
+#  error You need at least GCC v7.4.0 to compile QEMU
 # endif
 #else
 # error You either need GCC or Clang to compiler QEMU
@@ -2103,7 +2103,7 @@ cat > $TMPC << EOF
 int main (void) { return 0; }
 EOF
 if ! compile_prog "" "" ; then
-    error_exit "You need at least GCC v7.5 or Clang v6.0 (or XCode Clang v10.0)"
+    error_exit "You need at least GCC v7.4 or Clang v6.0 (or XCode Clang v10.0)"
 fi
 
 # Accumulate -Wfoo and -Wno-bar separately.
-- 
2.33.0


