Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBA265271A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 20:34:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7iH0-0004bn-Vm; Tue, 20 Dec 2022 14:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p7iGz-0004a5-8G
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 14:27:33 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p7iGx-0002Za-Bb
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 14:27:32 -0500
Received: from fedora.. (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id 9A831CED0F;
 Tue, 20 Dec 2022 20:27:26 +0100 (CET)
From: Marcel Holtmann <marcel@holtmann.org>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	xieyongji@bytedance.com
Cc: marcel@holtmann.org
Subject: [PATCH v2 05/10] libvhost-user: Declare uffdio_register early to make
 it C90 compliant
Date: Tue, 20 Dec 2022 20:27:17 +0100
Message-Id: <13655a4dab546b6df5f2d2622f57c6063cf8b6b6.1671563795.git.marcel@holtmann.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671563795.git.marcel@holtmann.org>
References: <cover.1671563795.git.marcel@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.227.132.17; envelope-from=marcel@holtmann.org;
 helo=mail.holtmann.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When using libvhost-user source in an external project that wants to
comply with the C90 standard, it is best to declare variables before
code.

  CC       libvhost-user.o
libvhost-user.c: In function ‘generate_faults’:
libvhost-user.c:683:9: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
  683 |         struct uffdio_register reg_struct;
      |         ^~~~~~

In this case, it is also simple enough and doesn't cause any extra
ifdef additions.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 subprojects/libvhost-user/libvhost-user.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 211d31a4cc88..bf92cc85c086 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -626,6 +626,8 @@ generate_faults(VuDev *dev) {
         VuDevRegion *dev_region = &dev->regions[i];
         int ret;
 #ifdef UFFDIO_REGISTER
+        struct uffdio_register reg_struct;
+
         /*
          * We should already have an open ufd. Mark each memory
          * range as ufd.
@@ -659,7 +661,7 @@ generate_faults(VuDev *dev) {
                     "%s: Failed to madvise(NOHUGEPAGE) region %d: %s\n",
                     __func__, i, strerror(errno));
         }
-        struct uffdio_register reg_struct;
+
         reg_struct.range.start = (uintptr_t)dev_region->mmap_addr;
         reg_struct.range.len = dev_region->size + dev_region->mmap_offset;
         reg_struct.mode = UFFDIO_REGISTER_MODE_MISSING;
-- 
2.38.1


