Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3879C122C57
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 13:55:39 +0100 (CET)
Received: from localhost ([::1]:39994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihCO2-0001iz-3d
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 07:55:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53979)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chen.zhang@intel.com>) id 1ihCMU-0000OS-17
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 07:54:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1ihCMT-0001Cc-3n
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 07:54:01 -0500
Received: from mga18.intel.com ([134.134.136.126]:49328)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1ihCMS-00018a-SY
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 07:54:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 04:53:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; d="scan'208";a="209689641"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008.jf.intel.com with ESMTP; 17 Dec 2019 04:53:58 -0800
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH V4 4/5] vl.c: Make Advanced Watch Dog delayed initialization
Date: Tue, 17 Dec 2019 20:45:53 +0800
Message-Id: <20191217124554.30818-5-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217124554.30818-1-chen.zhang@intel.com>
References: <20191217124554.30818-1-chen.zhang@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
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
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Advanced Watch Dog module needs chardev socket
to initialize properly before running.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 vl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/vl.c b/vl.c
index 6a65a64bfd..048fe458b9 100644
--- a/vl.c
+++ b/vl.c
@@ -2689,6 +2689,13 @@ static bool object_create_initial(const char *type, QemuOpts *opts)
         return false;
     }
 
+    /*
+     * Reason: Advanced Watch Dog property "chardev".
+     */
+    if (g_str_equal(type, "advanced-watchdog")) {
+        return false;
+    }
+
     /* Memory allocation by backends needs to be done
      * after configure_accelerator() (due to the tcg_enabled()
      * checks at memory_region_init_*()).
-- 
2.17.1


