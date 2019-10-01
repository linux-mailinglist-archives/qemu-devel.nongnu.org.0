Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4D4C30E9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 12:08:19 +0200 (CEST)
Received: from localhost ([::1]:39968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFF4s-0004r6-CR
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 06:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41531)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iFEzr-0001OA-1p
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 06:03:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iFEzp-00061z-3x
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 06:03:06 -0400
Received: from mga12.intel.com ([192.55.52.136]:10068)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iFEzo-00060e-Rx
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 06:03:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 03:03:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; d="scan'208";a="195599673"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga006.jf.intel.com with ESMTP; 01 Oct 2019 03:03:01 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 2/3] migration/postcopy: not necessary to do
 postcopy_ram_incoming_cleanup when state is ADVISE
Date: Tue,  1 Oct 2019 18:01:21 +0800
Message-Id: <20191001100122.17730-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001100122.17730-1-richardw.yang@linux.intel.com>
References: <20191001100122.17730-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
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

postcopy_ram_incoming_cleanup() does cleanup for
postcopy_ram_incoming_setup(), while the setup happens only after
migration enters LISTEN state.

This means there is nothing to cleanup when migration is still ADVISE
state.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/migration.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 5f7e4d15e9..34d5e66f06 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -461,7 +461,6 @@ static void process_incoming_migration_co(void *opaque)
              * but managed to complete within the precopy period, we can use
              * the normal exit.
              */
-            postcopy_ram_incoming_cleanup(mis);
         } else if (ret >= 0) {
             /*
              * Postcopy was started, cleanup should happen at the end of the
-- 
2.17.1


