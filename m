Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0177B354DA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 03:10:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYKRJ-000120-KX
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 21:10:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hYKQG-0000jV-VH
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 21:09:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hYKQG-0001Gu-0y
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 21:09:00 -0400
Received: from mga12.intel.com ([192.55.52.136]:38830)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hYKQF-0001Dl-OX
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 21:08:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jun 2019 18:08:55 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga004.fm.intel.com with ESMTP; 04 Jun 2019 18:08:55 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 09:08:28 +0800
Message-Id: <20190605010828.6969-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.136
Subject: [Qemu-devel] [PATCH] migratioin/ram.c: reset complete_round when we
 gets a queued page
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
	quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In case we gets a queued page, the order of block is interrupted. We may
not rely on the complete_round flag to say we have already searched the
whole blocks on the list.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index d881981876..e9b40d636d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2290,6 +2290,12 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
          */
         pss->block = block;
         pss->page = offset >> TARGET_PAGE_BITS;
+
+        /*
+         * This unqueued page would break the "one round" check, even is
+         * really rare.
+         */
+        pss->complete_round = false;
     }
 
     return !!block;
-- 
2.19.1


