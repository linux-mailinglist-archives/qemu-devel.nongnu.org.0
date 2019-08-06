Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0394828D5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 02:49:15 +0200 (CEST)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hunf9-0001hJ-1e
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 20:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39775)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hundO-0007wU-Du
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 20:47:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hundN-0002LA-Ed
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 20:47:26 -0400
Received: from mga03.intel.com ([134.134.136.65]:38677)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hundM-0002Kk-Tw
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 20:47:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 17:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="202637815"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2019 17:47:23 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 08:46:48 +0800
Message-Id: <20190806004648.8659-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806004648.8659-1-richardw.yang@linux.intel.com>
References: <20190806004648.8659-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-devel] [PATCH 2/2] migration/postcopy: use QEMU_IS_ALIGNED to
 replace host_offset
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

Use QEMU_IS_ALIGNED for the check, it would be more consistent with
other align calculations.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index d86661a015..dfbf71c580 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2956,14 +2956,12 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
     }
 
     while (run_start < pages) {
-        unsigned long host_offset;
 
         /*
          * If the start of this run of pages is in the middle of a host
          * page, then we need to fixup this host page.
          */
-        host_offset = run_start % host_ratio;
-        if (!host_offset) {
+        if (QEMU_IS_ALIGNED(run_start, host_ratio)) {
             /* Find the end of this run */
             if (unsent_pass) {
                 run_start = find_next_bit(unsentmap, pages, run_start + 1);
@@ -2975,10 +2973,9 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
              * run doesn't finish at the end of a host page
              * and we need to discard.
              */
-            host_offset = run_start % host_ratio;
         }
 
-        if (host_offset) {
+        if (!QEMU_IS_ALIGNED(run_start, host_ratio)) {
             unsigned long page;
             unsigned long fixup_start_addr = QEMU_ALIGN_DOWN(run_start,
                                                              host_ratio);
-- 
2.17.1


