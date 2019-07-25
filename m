Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC0D74285
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 02:21:34 +0200 (CEST)
Received: from localhost ([::1]:55046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqRVl-0007Ts-8V
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 20:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40449)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hqRVD-00065k-7i
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 20:20:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hqRVB-0001aP-Eu
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 20:20:59 -0400
Received: from mga09.intel.com ([134.134.136.24]:54502)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hqRVB-0001aB-7Z
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 20:20:57 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jul 2019 17:20:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,304,1559545200"; d="scan'208";a="193634658"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga004.fm.intel.com with ESMTP; 24 Jul 2019 17:20:54 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 25 Jul 2019 08:20:22 +0800
Message-Id: <20190725002023.2335-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190725002023.2335-1-richardw.yang@linux.intel.com>
References: <20190725002023.2335-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-devel] [PATCH v2 1/2] migration: return -EINVAL directly when
 version_id mismatch
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

It is not reasonable to continue when version_id mismatch.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 66792568e2..69c8a6bb0f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4217,7 +4217,7 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
     seq_iter++;
 
     if (version_id != 4) {
-        ret = -EINVAL;
+        return -EINVAL;
     }
 
     if (!migrate_use_compression()) {
-- 
2.17.1


