Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4440AE57A5
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Oct 2019 02:48:30 +0200 (CEST)
Received: from localhost ([::1]:37626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOAFo-0004xc-VE
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 20:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54975)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iOADB-0002aS-SJ
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 20:45:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iOADA-0004kv-Ra
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 20:45:45 -0400
Received: from mga01.intel.com ([192.55.52.88]:5552)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iOADA-0004k9-Jt
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 20:45:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 17:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="204705109"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Oct 2019 17:45:43 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v2 2/6] migration/multifd: notify channels_ready when send
 thread starts
Date: Sat, 26 Oct 2019 08:45:16 +0800
Message-Id: <20191026004520.5515-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191026004520.5515-1-richardw.yang@linux.intel.com>
References: <20191026004520.5515-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
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

multifd_send_state->channels_ready is initialized to 0. It is proper to
let main thread know we are ready when thread start running.

Current implementation works since ram_save_setup() calls
multifd_send_sync_main() which wake up send thread and posts
channels_ready. This behavior will introduce some unpredictable
situation and disturb the semaphore value.

This is a preparation patch to use another mechanism to do send thread
synchronization to avoid post channels_ready in this case. So this patch
posts channels_ready when send threads start running.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 35f147388b..25d477796e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1107,6 +1107,8 @@ static void *multifd_send_thread(void *opaque)
     }
     /* initial packet */
     p->num_packets = 1;
+    /* let main thread know we are ready */
+    qemu_sem_post(&multifd_send_state->channels_ready);
 
     while (true) {
         qemu_sem_wait(&p->sem);
-- 
2.17.1


