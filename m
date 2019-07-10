Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B19062AE8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 23:21:33 +0200 (CEST)
Received: from localhost ([::1]:44810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkb4m-0006lE-4g
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 17:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33936)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <julio.montes@intel.com>) id 1hkb3B-0006FL-Vd
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 17:19:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <julio.montes@intel.com>) id 1hkb3B-0005yo-2M
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 17:19:53 -0400
Received: from mga04.intel.com ([192.55.52.120]:18941)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <julio.montes@intel.com>)
 id 1hkb3A-0005tP-Pe
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 17:19:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 14:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,468,1557212400"; d="scan'208";a="167228709"
Received: from unknown (HELO fedora.zpn.intel.com.) ([10.219.4.39])
 by fmsmga007.fm.intel.com with ESMTP; 08 Jul 2019 14:19:42 -0700
From: Julio Montes <julio.montes@intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  8 Jul 2019 21:19:36 +0000
Message-Id: <20190708211936.8037-1-julio.montes@intel.com>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-devel] [RFC] memory-backend-file/nvdimm: support read-only
 files as memory-backends
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
Cc: Julio Montes <julio.montes@intel.com>, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently is not possible to use a file that is part of a read-only
filesystem as memory backend for nvdimm devices, even if this is not modified
in the guest. In order to improve the security of Virtual Machines that share
and do not modify the memory-backend-file, QEMU should support
read-only memory-backeds.

Use case:
* Kata Containers use a memory-backed-file as read-only rootfs, and this
  file is used to start all the virtual machines in the node.
  It would be really bad if somehow a malicious container modified it.

Signed-off-by: Julio Montes <julio.montes@intel.com>
---
 exec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/exec.c b/exec.c
index 50ea9c5aaa..1eb170b55a 100644
--- a/exec.c
+++ b/exec.c
@@ -1852,6 +1852,12 @@ static int file_ram_open(const char *path,
                 break;
             }
             g_free(filename);
+        } else if (errno == EROFS) {
+            fd = open(path, O_RDONLY);
+            if (fd >= 0) {
+                /* @path names an existing read-only file, use it */
+                break;
+            }
         }
         if (errno != EEXIST && errno != EINTR) {
             error_setg_errno(errp, errno,
--
2.17.2

