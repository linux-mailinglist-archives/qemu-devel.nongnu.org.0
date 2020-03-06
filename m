Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E7117BC7A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 13:14:38 +0100 (CET)
Received: from localhost ([::1]:35782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jABsC-0003fG-VR
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 07:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38384)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jingqi.liu@intel.com>) id 1jABq0-0000gY-Cp
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 07:12:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jingqi.liu@intel.com>) id 1jABpy-0001go-PL
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 07:12:19 -0500
Received: from mga14.intel.com ([192.55.52.115]:37225)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jingqi.liu@intel.com>)
 id 1jABpy-0001eN-HB
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 07:12:18 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2020 04:12:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,522,1574150400"; d="scan'208";a="275519233"
Received: from dazhang1-mobile.sh.intel.com ([10.239.48.70])
 by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2020 04:12:12 -0800
From: Jingqi Liu <jingqi.liu@intel.com>
To: jtomko@redhat.com, peter.maydell@linaro.org, mst@redhat.com,
 ehabkost@redhat.com
Subject: [PATCH] util: fix to check if target OS is linux in util/mmap-alloc.c
Date: Fri,  6 Mar 2020 20:07:35 +0800
Message-Id: <20200306120735.24457-1-jingqi.liu@intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
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
Cc: Jingqi Liu <jingqi.liu@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CONFIG_LINUX symbol is always undefined before including "qemu/osdep.h".
Use __linux__ to check if target OS is linux instead of CONFIG_LINUX.

Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
---
 util/mmap-alloc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 27dcccd8ec..8340540292 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -10,12 +10,12 @@
  * later.  See the COPYING file in the top-level directory.
  */
 
-#ifdef CONFIG_LINUX
+#ifdef __linux__
 #include <linux/mman.h>
-#else  /* !CONFIG_LINUX */
+#else
 #define MAP_SYNC              0x0
 #define MAP_SHARED_VALIDATE   0x0
-#endif /* CONFIG_LINUX */
+#endif
 
 #include "qemu/osdep.h"
 #include "qemu/mmap-alloc.h"
-- 
2.17.1


