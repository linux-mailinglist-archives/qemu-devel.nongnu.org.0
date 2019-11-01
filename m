Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1184EBC1F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 03:58:42 +0100 (CET)
Received: from localhost ([::1]:55522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQN97-0006uN-PM
	for lists+qemu-devel@lfdr.de; Thu, 31 Oct 2019 22:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chen.zhang@intel.com>) id 1iQN6Q-0004uT-Lj
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 22:55:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1iQN6N-00015i-C4
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 22:55:52 -0400
Received: from mga09.intel.com ([134.134.136.24]:16107)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1iQN6N-0000gd-4G
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 22:55:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 19:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,253,1569308400"; d="scan'208";a="199216680"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008.fm.intel.com with ESMTP; 31 Oct 2019 19:55:46 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH V2 4/4] vl.c: Make Advanced Watch Dog delayed initialization
Date: Fri,  1 Nov 2019 10:48:50 +0800
Message-Id: <20191101024850.20808-5-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191101024850.20808-1-chen.zhang@intel.com>
References: <20191101024850.20808-1-chen.zhang@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
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

Because Advanced Watch Dog module needs chardev socket
to initialize properly before.

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


