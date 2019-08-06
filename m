Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238EA828D3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 02:48:28 +0200 (CEST)
Received: from localhost ([::1]:57874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huneN-0000QS-Bp
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 20:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39758)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hundM-0007wJ-K6
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 20:47:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hundL-0002KL-KC
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 20:47:24 -0400
Received: from mga03.intel.com ([134.134.136.65]:38671)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hundL-0002Jy-Cw
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 20:47:23 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 17:47:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="202637806"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2019 17:47:21 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 08:46:47 +0800
Message-Id: <20190806004648.8659-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806004648.8659-1-richardw.yang@linux.intel.com>
References: <20190806004648.8659-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-devel] [PATCH 1/2] migration/postcopy: simplify calculation
 of run_start and fixup_start_addr
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

The purpose of the calculation is to find a HostPage which is partially
dirty.

  * fixup_start_addr points to the start of the HostPage to discard
  * run_start points to the next HostPage to check

While in the middle stage, there would two cases for run_start:

  * aligned with HostPage means this is not partially dirty
  * not aligned means this is partially dirty

When it is aligned, no work and calculation is necessary. run_start
already points to the start of next HostPage and is ready to continue.

When it is not aligned, the calculation could be simplified with:

  * fixup_start_addr = QEMU_ALIGN_DOWN(run_start, host_ratio)
  * run_start = QEMU_ALIGN_UP(run_start, host_ratio)

By doing so, run_start always points to the next HostPage to check.
fixup_start_addr always points to the HostPage to discard.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 34 +++++++---------------------------
 1 file changed, 7 insertions(+), 27 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index c9585487ac..d86661a015 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2956,7 +2956,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
     }
 
     while (run_start < pages) {
-        unsigned long fixup_start_addr;
         unsigned long host_offset;
 
         /*
@@ -2964,45 +2963,26 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
          * page, then we need to fixup this host page.
          */
         host_offset = run_start % host_ratio;
-        if (host_offset) {
-            fixup_start_addr = run_start - host_offset;
-            /*
-             * This host page has gone, the next loop iteration starts
-             * from after the fixup
-             */
-            run_start = fixup_start_addr + host_ratio;
-        } else {
+        if (!host_offset) {
             /* Find the end of this run */
-            unsigned long run_end;
             if (unsent_pass) {
-                run_end = find_next_bit(unsentmap, pages, run_start + 1);
+                run_start = find_next_bit(unsentmap, pages, run_start + 1);
             } else {
-                run_end = find_next_zero_bit(bitmap, pages, run_start + 1);
+                run_start = find_next_zero_bit(bitmap, pages, run_start + 1);
             }
             /*
              * If the end isn't at the start of a host page, then the
              * run doesn't finish at the end of a host page
              * and we need to discard.
              */
-            host_offset = run_end % host_ratio;
-            if (host_offset) {
-                fixup_start_addr = run_end - host_offset;
-                /*
-                 * This host page has gone, the next loop iteration starts
-                 * from after the fixup
-                 */
-                run_start = fixup_start_addr + host_ratio;
-            } else {
-                /*
-                 * No discards on this iteration, next loop starts from
-                 * next sent/dirty page
-                 */
-                run_start = run_end + 1;
-            }
+            host_offset = run_start % host_ratio;
         }
 
         if (host_offset) {
             unsigned long page;
+            unsigned long fixup_start_addr = QEMU_ALIGN_DOWN(run_start,
+                                                             host_ratio);
+            run_start = QEMU_ALIGN_UP(run_start, host_ratio);
 
             /* Tell the destination to discard this page */
             if (unsent_pass || !test_bit(fixup_start_addr, unsentmap)) {
-- 
2.17.1


