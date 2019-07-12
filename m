Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB12D664EF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 05:28:16 +0200 (CEST)
Received: from localhost ([::1]:46434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlmEJ-0007af-1x
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 23:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hlmE4-00073H-Cj
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 23:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hlmE3-0007WJ-FA
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 23:28:00 -0400
Received: from mga14.intel.com ([192.55.52.115]:47307)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hlmE3-0007UP-75
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 23:27:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jul 2019 20:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,480,1557212400"; d="scan'208";a="157018697"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga007.jf.intel.com with ESMTP; 11 Jul 2019 20:27:54 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 11:27:04 +0800
Message-Id: <20190712032704.7826-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [PATCH] migration: check length directly to make sure
 the range is aligned
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
Cc: pbonzini@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 rth@twiddle.net, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the start addr is already checked, to make sure the range is
aligned, checking the length is enough.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 exec.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/exec.c b/exec.c
index 50ea9c5aaa..8fa980baae 100644
--- a/exec.c
+++ b/exec.c
@@ -4067,10 +4067,9 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
 
     if ((start + length) <= rb->used_length) {
         bool need_madvise, need_fallocate;
-        uint8_t *host_endaddr = host_startaddr + length;
-        if ((uintptr_t)host_endaddr & (rb->page_size - 1)) {
-            error_report("ram_block_discard_range: Unaligned end address: %p",
-                         host_endaddr);
+        if (length & (rb->page_size - 1)) {
+            error_report("ram_block_discard_range: Unaligned length: %lx",
+                         length);
             goto err;
         }
 
-- 
2.17.1


