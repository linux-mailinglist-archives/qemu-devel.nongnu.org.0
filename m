Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAD8478C14
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 14:19:05 +0100 (CET)
Received: from localhost ([::1]:60572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myD8a-0005q8-8W
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 08:19:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1myD7A-0004sm-Iy
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:17:36 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:16822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1myD71-0008Q0-Al
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:17:34 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 06EFC453B4;
 Fri, 17 Dec 2021 14:17:14 +0100 (CET)
From: Fabian Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] scripts/qemu-guest-agent/fsfreeze-hook: improve script
 description
Date: Fri, 17 Dec 2021 14:16:56 +0100
Message-Id: <20211217131656.92244-1-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
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
Cc: michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the current wording, users might think that the -F option is not
required as long as the script is placed in the default path[0]. Be
clear that the option is always required.

[0]: https://forum.proxmox.com/threads/82680/post-437608

Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
---

I also tried to improve the surrounding text as it sounded a bit off
to me, but English is not my native language, so hoping that I didn't
actually make it worse.

 scripts/qemu-guest-agent/fsfreeze-hook | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/qemu-guest-agent/fsfreeze-hook b/scripts/qemu-guest-agent/fsfreeze-hook
index 13aafd4845..df9af05e3b 100755
--- a/scripts/qemu-guest-agent/fsfreeze-hook
+++ b/scripts/qemu-guest-agent/fsfreeze-hook
@@ -1,11 +1,12 @@
 #!/bin/sh
 
 # This script is executed when a guest agent receives fsfreeze-freeze and
-# fsfreeze-thaw command, if it is specified in --fsfreeze-hook (-F)
-# option of qemu-ga or placed in default path (/etc/qemu/fsfreeze-hook).
-# When the agent receives fsfreeze-freeze request, this script is issued with
-# "freeze" argument before the filesystem is frozen. And for fsfreeze-thaw
-# request, it is issued with "thaw" argument after filesystem is thawed.
+# fsfreeze-thaw commands, provided that the --fsfreeze-hook (-F) option of
+# qemu-ga is specified and the script is placed in /etc/qemu/fsfreeze-hook
+# (or the custom path specified together with -F). When the agent receives
+# fsfreeze-freeze requests, this script is called with "freeze" as its argument
+# before the filesystem is frozen. And for fsfreeze-thaw requests, it is called
+# with "thaw" as its argument after the filesystem is thawed.
 
 LOGFILE=/var/log/qga-fsfreeze-hook.log
 FSFREEZE_D=$(dirname -- "$0")/fsfreeze-hook.d
-- 
2.30.2



