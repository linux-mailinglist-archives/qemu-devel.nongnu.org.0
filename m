Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63EB684DE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 10:09:05 +0200 (CEST)
Received: from localhost ([::1]:35788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmw2i-00012C-UM
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 04:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33789)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hmw2X-0000d1-1p
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 04:08:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hmw2U-00032Q-Tp
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 04:08:52 -0400
Received: from mga03.intel.com ([134.134.136.65]:13803)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hmw2T-0002ze-25
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 04:08:50 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jul 2019 01:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,493,1557212400"; d="scan'208";a="168885653"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga007.fm.intel.com with ESMTP; 15 Jul 2019 01:08:45 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 16:07:51 +0800
Message-Id: <20190715080751.24304-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-devel] [PATCH] migration/postcopy: remove redundant
 cpu_synchronize_all_post_init
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

cpu_synchronize_all_post_init() is called twice in
loadvm_postcopy_handle_run_bh(), so remove one redundant call.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/savevm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 1d4fe7544d..863f5416ac 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1889,7 +1889,6 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
     }
 
     trace_loadvm_postcopy_handle_run_cpu_sync();
-    cpu_synchronize_all_post_init();
 
     trace_loadvm_postcopy_handle_run_vmstart();
 
-- 
2.17.1


