Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D73CCD5D
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Oct 2019 02:06:11 +0200 (CEST)
Received: from localhost ([::1]:59440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGu3u-0007s1-9Q
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 20:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57780)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGu1A-0006HR-27
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 20:03:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGu18-0001kR-VJ
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 20:03:19 -0400
Received: from mga09.intel.com ([134.134.136.24]:11792)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iGu18-0001kC-OQ
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 20:03:18 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Oct 2019 17:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,261,1566889200"; d="scan'208";a="191929239"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga008.fm.intel.com with ESMTP; 05 Oct 2019 17:03:16 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 1/3] migration/postcopy: mis->have_listen_thread check will
 never be touched
Date: Sun,  6 Oct 2019 08:02:47 +0800
Message-Id: <20191006000249.29926-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191006000249.29926-1-richardw.yang@linux.intel.com>
References: <20191006000249.29926-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
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
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If mis->have_listen_thread is true, this means current PostcopyState
must be LISTENING or RUNNING. While the check at the beginning of the
function makes sure the state transaction happens when its previous
PostcopyState is ADVISE or DISCARD.

This means we would never touch this check.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/savevm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index feb757de79..eaa4cf58ef 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1878,11 +1878,6 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
         return -1;
     }
 
-    if (mis->have_listen_thread) {
-        error_report("CMD_POSTCOPY_RAM_LISTEN already has a listen thread");
-        return -1;
-    }
-
     mis->have_listen_thread = true;
     /* Start up the listening thread and wait for it to signal ready */
     qemu_sem_init(&mis->listen_thread_sem, 0);
-- 
2.17.1


