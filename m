Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF085ABFCD
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 18:26:14 +0200 (CEST)
Received: from localhost ([::1]:51608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUVyG-0006Wi-J8
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 12:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1oUVvQ-0003WY-P3; Sat, 03 Sep 2022 12:23:16 -0400
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:39072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1oUVvO-00064j-Lk; Sat, 03 Sep 2022 12:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WHv6pmGMYmsvVdtQ+Ffp1n10JkheWRlDlCVMBRmmniA=; b=PMXXDmBlD6TEOTIoQxM8r6ja9J
 9GHxv93VB2whbQQX/g0FzugEvmPw9TSITb80Zj+433oYHLqtd8VuQQptqsZbJXsWmr0ScEMpBhwgM
 AKqp47QiUKyTOprn7ntiBZU4OpVrBIUpkp/TYylaXI8/o58aMhcBuAZZ/OKxYJHSWOZQ=;
Received: by iserv.reactos.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hpoussin@reactos.org>)
 id 1oUVvK-0002VU-7U; Sat, 03 Sep 2022 16:23:10 +0000
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH 1/2] vvfat: allow some writes to bootsector
Date: Sat,  3 Sep 2022 18:23:01 +0200
Message-Id: <20220903162302.3176003-2-hpoussin@reactos.org>
X-Mailer: git-send-email 2.36.2
In-Reply-To: <20220903162302.3176003-1-hpoussin@reactos.org>
References: <20220903162302.3176003-1-hpoussin@reactos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:1c17:5ae1::1;
 envelope-from=hpoussin@reactos.org; helo=iserv.reactos.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'reserved1' field in bootsector is used to mark volume dirty, or need to verify.
Allow writes to bootsector which only changes the 'reserved1' field.

This fixes I/O errors on Windows guests.

Resolves: https://bugs.launchpad.net/qemu/+bug/1889421
Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
---
 block/vvfat.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index d6dd919683d..35057a51c67 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -2993,11 +2993,27 @@ DLOG(checkpoint());
 
     vvfat_close_current_file(s);
 
+    if (sector_num == s->offset_to_bootsector && nb_sectors == 1) {
+        /*
+         * Write on bootsector. Allow only changing the reserved1 field,
+         * used to mark volume dirtiness
+         */
+        const unsigned char *initial = s->first_sectors
+                                       + s->offset_to_bootsector * 0x200;
+        for (i = 0; i < 0x200; i++) {
+            if (i != offsetof(bootsector_t, u.fat16.reserved1) &&
+                initial[i] != buf[i]) {
+                fprintf(stderr, "Tried to write to protected bootsector\n");
+                return -1;
+            }
+        }
+        return 0;
+    }
+
     /*
      * Some sanity checks:
      * - do not allow writing to the boot sector
      */
-
     if (sector_num < s->offset_to_fat)
         return -1;
 
-- 
2.36.2


