Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE83DBB18
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 02:51:16 +0200 (CEST)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLGU7-0005uM-A9
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 20:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49251)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iLGSJ-0004Px-Fs
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 20:49:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iLGSI-00017m-IU
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 20:49:23 -0400
Received: from mga06.intel.com ([134.134.136.31]:15620)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iLGSI-00010g-B2
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 20:49:22 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 17:49:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,309,1566889200"; d="scan'208";a="199552630"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga003.jf.intel.com with ESMTP; 17 Oct 2019 17:49:20 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 4/6] migration/postcopy: set all_zero to true on the first
 target page
Date: Fri, 18 Oct 2019 08:48:48 +0800
Message-Id: <20191018004850.9888-5-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018004850.9888-1-richardw.yang@linux.intel.com>
References: <20191018004850.9888-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
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

For the first target page, all_zero is set to true for this round check.

After target_pages introduced, we could leverage this variable instead
of checking the address offset.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5c05376d8d..b5759793a9 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4067,7 +4067,7 @@ static int ram_load_postcopy(QEMUFile *f)
             page_buffer = postcopy_host_page +
                           ((uintptr_t)host & (block->page_size - 1));
             /* If all TP are zero then we can optimise the place */
-            if (!((uintptr_t)host & (block->page_size - 1))) {
+            if (target_pages == 1) {
                 all_zero = true;
             } else {
                 /* not the 1st TP within the HP */
-- 
2.17.1


