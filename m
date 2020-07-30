Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6031232937
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 02:55:49 +0200 (CEST)
Received: from localhost ([::1]:59092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0wrK-0008U6-IP
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 20:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1k0wqV-000840-Qw
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 20:54:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:50836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1k0wqU-0005wY-4P
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 20:54:55 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BBD79AF37;
 Thu, 30 Jul 2020 00:55:02 +0000 (UTC)
From: Bruce Rogers <brogers@suse.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio-mem: Work around format specifier mismatch for RISC-V
Date: Wed, 29 Jul 2020 18:54:38 -0600
Message-Id: <20200730005438.138369-1-brogers@suse.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=brogers@suse.com;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 20:54:51
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
seems unique, the simple fix is to just cast it to the corresponding
format specifier.

Signed-off-by: Bruce Rogers <brogers@suse.com>
---
 hw/virtio/virtio-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index c12e9f79b0..fd01ffd83e 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -754,7 +754,7 @@ static void virtio_mem_set_block_size(Object *obj, Visitor *v, const char *name,
 
     if (value < VIRTIO_MEM_MIN_BLOCK_SIZE) {
         error_setg(errp, "'%s' property has to be at least 0x%" PRIx32, name,
-                   VIRTIO_MEM_MIN_BLOCK_SIZE);
+                   (unsigned int)VIRTIO_MEM_MIN_BLOCK_SIZE);
         return;
     } else if (!is_power_of_2(value)) {
         error_setg(errp, "'%s' property has to be a power of two", name);
-- 
2.27.0


