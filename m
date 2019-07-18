Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD9C6C963
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 08:43:40 +0200 (CEST)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho08h-0005Kv-33
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 02:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50941)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1ho08V-0004wY-2u
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 02:43:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1ho08U-0003ka-2J
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 02:43:27 -0400
Received: from mga06.intel.com ([134.134.136.31]:4794)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1ho08T-0003ef-QN
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 02:43:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 23:43:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="169768427"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2019 23:43:23 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 Jul 2019 14:42:57 +0800
Message-Id: <20190718064257.29218-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-devel] [PATCH] migration: equation is more proper than and to
 check LOADVM_QUIT
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

LOADVM_QUIT allows a command to quit all layers of nested loadvm loops,
while current return value check is not that proper even it works now.

Current return value check "ret & LOADVM_QUIT" would return true if
bit[0] is 1. This would be true when ret is -1 which is used to indicate
an error of handling a command.

Since there is only one place return LOADVM_QUIT and no other
combination of return value, use "ret == LOADVM_QUIT" would be more
proper.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/savevm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 1a9b1f411e..25fe7ea05a 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2429,7 +2429,7 @@ retry:
         case QEMU_VM_COMMAND:
             ret = loadvm_process_command(f);
             trace_qemu_loadvm_state_section_command(ret);
-            if ((ret < 0) || (ret & LOADVM_QUIT)) {
+            if ((ret < 0) || (ret == LOADVM_QUIT)) {
                 goto out;
             }
             break;
-- 
2.17.1


