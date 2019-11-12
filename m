Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4503F872A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 04:53:03 +0100 (CET)
Received: from localhost ([::1]:58960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUNEk-0007XM-RC
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 22:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45078)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1iUNDU-0006WI-Qt
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 22:51:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1iUNDS-0003fs-6E
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 22:51:43 -0500
Received: from [107.174.27.60] (port=60824 helo=ozlabs.ru)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1iUNDR-0003f0-Oy; Mon, 11 Nov 2019 22:51:42 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id C5C73AE80382;
 Mon, 11 Nov 2019 22:44:40 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu] scripts: Detect git worktrees for get_maintainer.pl --git
Date: Tue, 12 Nov 2019 14:45:32 +1100
Message-Id: <20191112034532.69079-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 107.174.27.60
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recent git versions support worktrees where .git is not a directory but
a file with a path to the .git repository; however the get_maintainer.pl
script only recognises the .git directory, let's fix it.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 scripts/get_maintainer.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 71415e3c7061..27991eb1cfb4 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -81,7 +81,7 @@ my %VCS_cmds;
 
 my %VCS_cmds_git = (
     "execute_cmd" => \&git_execute_cmd,
-    "available" => '(which("git") ne "") && (-d ".git")',
+    "available" => '(which("git") ne "") && (-e ".git")',
     "find_signers_cmd" =>
 	"git log --no-color --follow --since=\$email_git_since " .
 	    '--format="GitCommit: %H%n' .
-- 
2.17.1


