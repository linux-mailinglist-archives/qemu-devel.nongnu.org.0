Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236305FA42C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 21:27:01 +0200 (CEST)
Received: from localhost ([::1]:45084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohyQW-0007J7-7D
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 15:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1ohx0D-0006Si-Hq; Mon, 10 Oct 2022 13:55:46 -0400
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:43272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1ohx0A-0003sj-78; Mon, 10 Oct 2022 13:55:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7oValN6Lat5aa5YBbgXxYSJfdKDsubCuBjYcfTSaqRI=; b=t8cH2xYG1MZK/C/P04mnfTMBHy
 IWcqEkjea2+0BeOs4kYayK2eKtSJCOuM+udBk0vSza5FZD0RVCrStisL8F7K8iXfNRsNvvHCr6Hka
 hq8fRMeBwUI1woQupp3HnB+nVGiCpEZgLzgyaBoeWciHIJ9T/QbpXGAIsioWTNy8MaJc=;
Received: by iserv.reactos.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hpoussin@reactos.org>)
 id 1ohx02-00015P-9A; Mon, 10 Oct 2022 17:55:34 +0000
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: kwolf@redhat.com,
	hreitz@redhat.com,
	qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH v2 1/2] vvfat: allow some writes to bootsector
Date: Mon, 10 Oct 2022 19:55:10 +0200
Message-Id: <20221010175511.3414357-2-hpoussin@reactos.org>
X-Mailer: git-send-email 2.36.2
In-Reply-To: <20221010175511.3414357-1-hpoussin@reactos.org>
References: <20221010175511.3414357-1-hpoussin@reactos.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'reserved1' field in bootsector is used to mark volume dirty, or need to verify.
Allow writes to bootsector which only changes the 'reserved1' field.

This fixes I/O errors on Windows guests.

Resolves: https://bugs.launchpad.net/qemu/+bug/1889421
Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
---
 block/vvfat.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index d6dd919683d..ae53f0d7283 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -2993,11 +2993,35 @@ DLOG(checkpoint());
 
     vvfat_close_current_file(s);
 
+    if (sector_num == s->offset_to_bootsector && nb_sectors == 1) {
+        /*
+         * Write on bootsector. Allow only changing the reserved1 field,
+         * used to mark volume dirtiness
+         */
+        unsigned char *bootsector = s->first_sectors
+                                    + s->offset_to_bootsector * 0x200;
+        /*
+         * LATER TODO: if FAT32, this is wrong (see init_directories(),
+         * which always creates a FAT16 bootsector)
+         */
+        const int reserved1_offset = offsetof(bootsector_t, u.fat16.reserved1);
+
+        for (i = 0; i < 0x200; i++) {
+            if (i != reserved1_offset && bootsector[i] != buf[i]) {
+                fprintf(stderr, "Tried to write to protected bootsector\n");
+                return -1;
+            }
+        }
+
+        /* Update bootsector with the only updatable byte, and return success */
+        bootsector[reserved1_offset] = buf[reserved1_offset];
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


