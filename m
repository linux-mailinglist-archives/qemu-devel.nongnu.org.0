Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C26CCD06
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Oct 2019 00:13:33 +0200 (CEST)
Received: from localhost ([::1]:59124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGsIt-0000Mw-K8
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 18:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48536)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGsBg-0001z6-1E
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 18:06:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGsBe-0007AX-VO
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 18:06:03 -0400
Received: from mga03.intel.com ([134.134.136.65]:4371)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iGsBe-0007AF-OI
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 18:06:02 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Oct 2019 15:06:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,261,1566889200"; d="scan'208";a="195906813"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga003.jf.intel.com with ESMTP; 05 Oct 2019 15:06:00 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 1/4] migration/ram: only possible bit set in invalid_flags is
 RAM_SAVE_FLAG_COMPRESS_PAGE
Date: Sun,  6 Oct 2019 06:05:14 +0800
Message-Id: <20191005220517.24029-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191005220517.24029-1-richardw.yang@linux.intel.com>
References: <20191005220517.24029-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
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

The only possible bit set in invalid_flags is
RAM_SAVE_FLAG_COMPRESS_PAGE at the beginning of function
ram_load_precopy(), which means it is not necessary to do
another check for RAM_SAVE_FLAG_COMPRESS_PAGE bit.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 31051935c8..769d3f6454 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4263,10 +4263,7 @@ static int ram_load_precopy(QEMUFile *f)
         addr &= TARGET_PAGE_MASK;
 
         if (flags & invalid_flags) {
-            if (flags & invalid_flags & RAM_SAVE_FLAG_COMPRESS_PAGE) {
-                error_report("Received an unexpected compressed page");
-            }
-
+            error_report("Received an unexpected compressed page");
             ret = -EINVAL;
             break;
         }
-- 
2.17.1


