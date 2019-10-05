Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E285CCD16
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Oct 2019 00:23:29 +0200 (CEST)
Received: from localhost ([::1]:59190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGsSV-0001PY-KP
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 18:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGsBk-00024s-Jf
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 18:06:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGsBj-0007Bt-Jp
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 18:06:08 -0400
Received: from mga03.intel.com ([134.134.136.65]:4371)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iGsBj-0007AF-Ce
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 18:06:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Oct 2019 15:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,261,1566889200"; d="scan'208";a="195906835"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga003.jf.intel.com with ESMTP; 05 Oct 2019 15:06:05 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 4/4] migration: report SaveStateEntry id and name on failure
Date: Sun,  6 Oct 2019 06:05:17 +0800
Message-Id: <20191005220517.24029-5-richardw.yang@linux.intel.com>
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

This provides helpful information on which entry failed.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/savevm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index 9f0122583d..feb757de79 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1215,6 +1215,8 @@ int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy)
         save_section_footer(f, se);
 
         if (ret < 0) {
+            error_report("failed to save SaveStateEntry with id(name): %d(%s)",
+                         se->section_id, se->idstr);
             qemu_file_set_error(f, ret);
         }
         if (ret <= 0) {
-- 
2.17.1


