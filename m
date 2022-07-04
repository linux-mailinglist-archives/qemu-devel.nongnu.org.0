Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD5C565345
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 13:25:40 +0200 (CEST)
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8KCx-0004bx-ET
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 07:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8K6q-0004jK-9u
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:19:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8K6o-00068s-MF
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656933558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ByMnW4l1k7X4SZBR6TXHkLPzBPkYHsoxMzTmlcqZgsw=;
 b=JCmisKqN5VcXSldBlQ+h9Oi6MIJmXyVb4YAs3taC4OVyWRhvU184ZVXwjVsCvh6foxrJkv
 QwsUPCFhZDUb8SWKhQl5Uqaoc9Sky+ESJfFaoMqOB8tGioRxhCuQSRFTyf5UHVXXAcndCb
 W/954GvAWLvS6JXnHJe5es4aCFyoLQM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-Y9X9KsUKOVyBsPwH-UvlTA-1; Mon, 04 Jul 2022 07:19:12 -0400
X-MC-Unique: Y9X9KsUKOVyBsPwH-UvlTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77062185A7A4;
 Mon,  4 Jul 2022 11:19:12 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33B4718EB7;
 Mon,  4 Jul 2022 11:19:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org,
	Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 03/12] pc-bios/s390-ccw/bootmap: Improve the guessing logic
 in zipl_load_vblk()
Date: Mon,  4 Jul 2022 13:18:54 +0200
Message-Id: <20220704111903.62400-4-thuth@redhat.com>
In-Reply-To: <20220704111903.62400-1-thuth@redhat.com>
References: <20220704111903.62400-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The logic of trying an final ISO or ECKD boot on virtio-block devices is
very weird: Since the geometry hardly ever matches in virtio_disk_is_scsi(),
virtio_blk_setup_device() always sets a "guessed" disk geometry via
virtio_assume_scsi() (which is certainly also wrong in a lot of cases).

zipl_load_vblk() then sees that there's been a "virtio_guessed_disk_nature"
and tries to fix up the geometry again via virtio_assume_iso9660() before
always trying to do ipl_iso_el_torito(). That's a very brain-twisting
way of attempting to boot from ISO images, which won't work anymore after
the following patches that will clean up the virtio_assume_scsi() mess
(and thus get rid of the "virtio_guessed_disk_nature" here).

Let's try a better approach instead: ISO files always have a magic
string "CD001" at offset 0x8001 (see e.g. the ECMA-119 specification)
which we can use to decide whether we should try to boot in ISO 9660
mode (which we should also try if we see a sector size of 2048).

And if we were not able to boot in ISO mode here, the final boot attempt
before panicking is to boot in ECKD mode. Since this is our last boot
attempt anyway, simply always assume the ECKD geometry here (if the sector
size was not 4096 yet), so that we also do not depend on the guessed disk
geometry from virtio_blk_setup_device() here anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/bootmap.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/pc-bios/s390-ccw/bootmap.c b/pc-bios/s390-ccw/bootmap.c
index 56411ab3b6..994e59c0b0 100644
--- a/pc-bios/s390-ccw/bootmap.c
+++ b/pc-bios/s390-ccw/bootmap.c
@@ -780,18 +780,37 @@ static void ipl_iso_el_torito(void)
     }
 }
 
+/**
+ * Detect whether we're trying to boot from an .ISO image.
+ * These always have a signature string "CD001" at offset 0x8001.
+ */
+static bool has_iso_signature(void)
+{
+    int blksize = virtio_get_block_size();
+
+    if (!blksize || virtio_read(0x8000 / blksize, sec)) {
+        return false;
+    }
+
+    return !memcmp("CD001", &sec[1], 5);
+}
+
 /***********************************************************************
  * Bus specific IPL sequences
  */
 
 static void zipl_load_vblk(void)
 {
-    if (virtio_guessed_disk_nature()) {
-        virtio_assume_iso9660();
+    int blksize = virtio_get_block_size();
+
+    if (blksize == VIRTIO_ISO_BLOCK_SIZE || has_iso_signature()) {
+        if (blksize != VIRTIO_ISO_BLOCK_SIZE) {
+            virtio_assume_iso9660();
+        }
+        ipl_iso_el_torito();
     }
-    ipl_iso_el_torito();
 
-    if (virtio_guessed_disk_nature()) {
+    if (blksize != VIRTIO_DASD_DEFAULT_BLOCK_SIZE) {
         sclp_print("Using guessed DASD geometry.\n");
         virtio_assume_eckd();
     }
-- 
2.31.1


