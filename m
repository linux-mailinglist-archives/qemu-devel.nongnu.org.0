Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4732257950
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 04:10:50 +0200 (CEST)
Received: from localhost ([::1]:45786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgJs9-00047x-GX
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 22:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51512)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hgJqQ-0002Pw-MT
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 22:09:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hgJqO-0004EP-Qi
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 22:09:02 -0400
Received: from mga11.intel.com ([192.55.52.93]:6494)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hgJqN-0004CJ-U3
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 22:09:00 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 19:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,422,1557212400"; d="scan'208";a="188879923"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2019 19:08:53 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 27 Jun 2019 10:08:22 +0800
Message-Id: <20190627020822.15485-4-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190627020822.15485-1-richardw.yang@linux.intel.com>
References: <20190627020822.15485-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH 3/3] migration/postcopy: discard_length must
 not be 0
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
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we break the loop when there is no more page to discard, we are
sure the following process would find some page to discard.

It is not necessary to check it again.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b41b58ee54..246efe6939 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2789,9 +2789,7 @@ static int postcopy_send_discard_bm_ram(MigrationState *ms,
         } else {
             discard_length = zero - one;
         }
-        if (discard_length) {
-            postcopy_discard_send_range(ms, pds, one, discard_length);
-        }
+        postcopy_discard_send_range(ms, pds, one, discard_length);
         current = one + discard_length;
     }
 
-- 
2.19.1


