Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A5C61D97E
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 11:42:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orGc9-0004W7-UM; Sat, 05 Nov 2022 06:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stweil@bss11.bib.uni-mannheim.de>)
 id 1orGc6-0004UE-KX; Sat, 05 Nov 2022 06:41:22 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stweil@bss11.bib.uni-mannheim.de>)
 id 1orGbq-00036g-3l; Sat, 05 Nov 2022 06:41:22 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 1750A100CEE;
 Sat,  5 Nov 2022 11:25:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
 by localhost (mail-r83.rz.uni-mannheim.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id vwk6p0GHZo8h; Sat,  5 Nov 2022 11:25:19 +0100 (CET)
Received: from bss11.bib.uni-mannheim.de (unknown
 [IPv6:2001:7c0:2900:8024::869b:24a1])
 by smtp.mail.uni-mannheim.de (Postfix) with ESMTPS id F2448100C07;
 Sat,  5 Nov 2022 11:25:18 +0100 (CET)
Received: from stweil by bss11.bib.uni-mannheim.de with local (Exim 4.94.2)
 (envelope-from <stweil@bss11.bib.uni-mannheim.de>)
 id 1orGMY-001pc7-NC; Sat, 05 Nov 2022 11:25:18 +0100
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH v2 3/4] libvhost-user: Fix two more format strings
Date: Sat,  5 Nov 2022 11:24:47 +0100
Message-Id: <20221105102448.436469-4-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221105102448.436469-1-sw@weilnetz.de>
References: <20221105102448.436469-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.155.96.80;
 envelope-from=stweil@bss11.bib.uni-mannheim.de; helo=smtp.mail.uni-mannheim.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This fix is required for 32 bit host. The bug was detected by CI
for arm-linux, but is also relevant for i386-linux.

Reported-by: Stefan Hajnoczi <stefanha@gmail.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 subprojects/libvhost-user/libvhost-user.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index d67953a1c3..80f9952e71 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -651,7 +651,8 @@ generate_faults(VuDev *dev) {
 
         if (ioctl(dev->postcopy_ufd, UFFDIO_REGISTER, &reg_struct)) {
             vu_panic(dev, "%s: Failed to userfault region %d "
-                          "@%" PRIx64 " + size:%zx offset: %zx: (ufd=%d)%s\n",
+                          "@%" PRIx64 " + size:%" PRIx64 " offset: %" PRIx64
+                          ": (ufd=%d)%s\n",
                      __func__, i,
                      dev_region->mmap_addr,
                      dev_region->size, dev_region->mmap_offset,
-- 
2.30.2


