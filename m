Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044FD55D454
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:13:51 +0200 (CEST)
Received: from localhost ([::1]:35008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6B2M-0007Zv-3D
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzM-00044g-3z
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzK-0008BV-EC
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656421841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ew9mKjSSH3EowRkFq72Y/Qt0H0QM5UcRk+KvVEAkYQc=;
 b=IKYL6AePqZAohCgV1TV8ej0iIl+9t46UlMKoRRPANh+qJaw4e3uVp3av9Y/cHs2D6Kf09A
 7NWJTw1ENgU7LdIWFMRaUZI6vw9qrNCisFJfvaxqi+J8xWvR03IRuI0nOgvYz34vuiahwv
 o8bRmNs0k7CcQm74+23JG295kFCS5hk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-PC3sC37-PNKWfXAlM7dtxg-1; Tue, 28 Jun 2022 09:10:38 -0400
X-MC-Unique: PC3sC37-PNKWfXAlM7dtxg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 434E41C08968;
 Tue, 28 Jun 2022 13:10:38 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62376492C3B;
 Tue, 28 Jun 2022 13:10:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PATCH 03/12] pc-bios/s390-ccw/bootmap: Improve the guessing logic in
 zipl_load_vblk()
Date: Tue, 28 Jun 2022 15:10:23 +0200
Message-Id: <20220628131032.213986-4-thuth@redhat.com>
In-Reply-To: <20220628131032.213986-1-thuth@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 pc-bios/s390-ccw/bootmap.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/pc-bios/s390-ccw/bootmap.c b/pc-bios/s390-ccw/bootmap.c
index 56411ab3b6..3181b05382 100644
--- a/pc-bios/s390-ccw/bootmap.c
+++ b/pc-bios/s390-ccw/bootmap.c
@@ -780,18 +780,35 @@ static void ipl_iso_el_torito(void)
     }
 }
 
+/**
+ * Detect whether we're trying to boot from an .ISO image.
+ * These always have a signature string "CD001" at offset 0x8001.
+ */
+static bool has_iso_signature(void)
+{
+    if (virtio_read(0x8000 / virtio_get_block_size(), sec)) {
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
+    if (blksize != VIRTIO_DASD_BLOCK_SIZE) {
         sclp_print("Using guessed DASD geometry.\n");
         virtio_assume_eckd();
     }
-- 
2.31.1


