Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9114663784
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 16:12:11 +0200 (CEST)
Received: from localhost ([::1]:50334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkqqo-0000KK-QS
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 10:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54502)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hkqon-0007MR-Vv
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:10:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hkqon-0008Dp-1W
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:10:05 -0400
Received: from mga02.intel.com ([134.134.136.20]:42710)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hkqom-0008DN-PZ
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:10:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jul 2019 07:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="176507503"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2019 07:10:00 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 22:09:22 +0800
Message-Id: <20190709140924.13291-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709140924.13291-1-richardw.yang@linux.intel.com>
References: <20190709140924.13291-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH 1/3] migration/savevm: flush file for
 iterable_only case
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

It would be proper to flush file even for iterable_only case.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/savevm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index c0e557b4c2..becedcc1c6 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1292,7 +1292,7 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
     }
 
     if (iterable_only) {
-        return 0;
+        goto flush;
     }
 
     vmdesc = qjson_new();
@@ -1353,6 +1353,7 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
     }
     qjson_destroy(vmdesc);
 
+flush:
     qemu_fflush(f);
     return 0;
 }
-- 
2.17.1


