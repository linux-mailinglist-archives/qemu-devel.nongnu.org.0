Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50543610044
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:33:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7g9-0001NA-Mh; Thu, 27 Oct 2022 14:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g6-0001Iq-9Y
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g2-0002PS-Vi
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTxmdF/UnCq0KhrR2mBACaUPeFcUxBEWt7nmkQ85UmE=;
 b=OBZSoW/WYz9xmcPbV62WyDs+VJmZxxBYiZk4PAseCCzI2cAAaKXjsjtBFoMMvFKpsTupTV
 WerX09B/kx5W3crN4vTjEkurgxRZt0rH35uWSa88rZU1tsFQIsOm/vdivP/h8IOkhTfbXh
 hxhCs6D0BkuULRGNHI5FF7hxA3a1aQ8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-Jnd-Y3QfMPW8P3fxXm-7yQ-1; Thu, 27 Oct 2022 14:32:21 -0400
X-MC-Unique: Jnd-Y3QfMPW8P3fxXm-7yQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1B8A1C07554;
 Thu, 27 Oct 2022 18:32:05 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C98261121320;
 Thu, 27 Oct 2022 18:32:01 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 04/58] vvfat: allow some writes to bootsector
Date: Thu, 27 Oct 2022 20:30:52 +0200
Message-Id: <20221027183146.463129-5-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hervé Poussineau <hpoussin@reactos.org>

'reserved1' field in bootsector is used to mark volume dirty, or need to verify.
Allow writes to bootsector which only changes the 'reserved1' field.

This fixes I/O errors on Windows guests.

Resolves: https://bugs.launchpad.net/qemu/+bug/1889421
Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
Message-Id: <20221010175511.3414357-2-hpoussin@reactos.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vvfat.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index f9bf8406d3..e76b42dbaf 100644
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
2.37.3


