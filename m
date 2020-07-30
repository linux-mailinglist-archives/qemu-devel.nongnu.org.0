Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2612F23329D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 15:06:58 +0200 (CEST)
Received: from localhost ([::1]:48062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k18Gv-0005NT-90
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 09:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1k18FX-0004OD-JV
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 09:05:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:40490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1k18FV-0002yP-TS
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 09:05:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B06E5AAC7;
 Thu, 30 Jul 2020 13:05:40 +0000 (UTC)
From: Bruce Rogers <brogers@suse.com>
To: qemu-devel@nongnu.org,
	sgarzare@redhat.com
Subject: [PATCH] virtio-mem: Correct format specifier mismatch for RISC-V
Date: Thu, 30 Jul 2020 07:05:19 -0600
Message-Id: <20200730130519.168475-1-brogers@suse.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=brogers@suse.com;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 02:10:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Bruce Rogers <brogers@suse.com>, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This likely affects other, less popular host architectures as well.
Less common host architectures under linux get QEMU_VMALLOC_ALIGN (from
which VIRTIO_MEM_MIN_BLOCK_SIZE is derived) define to a variable of
type uintptr, which isn't compatible with the format specifier used to
print a user message. Since this particular usage of the underlying data
seems unique to this file, the simple fix is to just cast
QEMU_VMALLOC_ALIGN to uint32_t, which corresponds to the format specifier
used.

Signed-off-by: Bruce Rogers <brogers@suse.com>
---
 hw/virtio/virtio-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index c12e9f79b0..7740fc613f 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -36,7 +36,7 @@
  * Use QEMU_VMALLOC_ALIGN, so no THP will have to be split when unplugging
  * memory (e.g., 2MB on x86_64).
  */
-#define VIRTIO_MEM_MIN_BLOCK_SIZE QEMU_VMALLOC_ALIGN
+#define VIRTIO_MEM_MIN_BLOCK_SIZE ((uint32_t)QEMU_VMALLOC_ALIGN)
 /*
  * Size the usable region bigger than the requested size if possible. Esp.
  * Linux guests will only add (aligned) memory blocks in case they fully
-- 
2.27.0


