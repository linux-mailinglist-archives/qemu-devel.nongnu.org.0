Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDAD64072
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 07:11:19 +0200 (CEST)
Received: from localhost ([::1]:57976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl4sw-0003gs-FJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 01:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44297)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hl4qm-0002QY-9a
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 01:09:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hl4qk-0000Pu-G1
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 01:09:04 -0400
Received: from mga02.intel.com ([134.134.136.20]:6071)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hl4qi-0000AM-IN
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 01:09:02 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jul 2019 22:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,473,1557212400"; d="scan'208";a="364360413"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga005.fm.intel.com with ESMTP; 09 Jul 2019 22:08:57 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 Jul 2019 13:08:14 +0800
Message-Id: <20190710050814.31344-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190710050814.31344-1-richardw.yang@linux.intel.com>
References: <20190710050814.31344-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH 2/2] migration/postcopy: do_fixup is true when
 host_offset is non-zero
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

This means it is not necessary to spare an extra variable to hold this
condition. Use host_offset directly is fine.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index c4dc36e525..b0ca0059c4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2873,7 +2873,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
     }
 
     while (run_start < pages) {
-        bool do_fixup = false;
         unsigned long fixup_start_addr;
         unsigned long host_offset;
 
@@ -2883,7 +2882,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
          */
         host_offset = run_start % host_ratio;
         if (host_offset) {
-            do_fixup = true;
             fixup_start_addr = run_start - host_offset;
             /*
              * This host page has gone, the next loop iteration starts
@@ -2905,7 +2903,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
              */
             host_offset = run_end % host_ratio;
             if (host_offset) {
-                do_fixup = true;
                 fixup_start_addr = run_end - host_offset;
                 /*
                  * This host page has gone, the next loop iteration starts
@@ -2921,7 +2918,7 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
             }
         }
 
-        if (do_fixup) {
+        if (host_offset) {
             unsigned long page;
 
             /* Tell the destination to discard this page */
-- 
2.17.1


