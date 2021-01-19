Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096732FB68F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:59:25 +0100 (CET)
Received: from localhost ([::1]:53960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rXY-0006gI-2X
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l1rJ4-0006xX-16
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:44:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l1rJ1-00046T-Vw
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:44:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611063862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uKZSfYPDamc5qkghmJlQyIL2Vd8/5EXDq0NcqeIeZP8=;
 b=BMArtHkfulIImTmd4U+RVg58pFA771+yXlZNvROJFzUxIgMvwCxc076GNPe1tHuANdoFHC
 b/tqIphyA0ZxJF1zZKWykfFKCFPqforre63be0I2nW5RV1lZDjP6ofuUbwE29S/ejTSpza
 H5tvoCr/HSjehNkzXpHmNniLUNm3g90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-wANvM2nnNJq7U0CteR-NYQ-1; Tue, 19 Jan 2021 08:44:20 -0500
X-MC-Unique: wANvM2nnNJq7U0CteR-NYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2832A1075649;
 Tue, 19 Jan 2021 13:44:19 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-126.sin2.redhat.com
 [10.67.117.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20CAD60BF1;
 Tue, 19 Jan 2021 13:44:15 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] ide: set an upper limit to nb_sectors
Date: Tue, 19 Jan 2021 19:12:11 +0530
Message-Id: <20210119134211.494133-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Set an upper limit to number of sectors on an IDE disk media.
This is to ensure that logical block addresses (LBA) and
nb_sector arguments remain within INT_MAX range.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/ide/core.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

Update: limit s->nb_sectors count
  -> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04270.html
  -> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04173.html

diff --git a/hw/ide/core.c b/hw/ide/core.c
index b49e4cfbc6..064998804a 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1161,15 +1161,21 @@ static void ide_cfata_metadata_write(IDEState *s)
                                     s->nsector << 9), 0x200 - 2));
 }

+static void ide_set_nb_sectors(IDEState *s)
+{
+    uint64_t nb_sectors;
+
+    blk_get_geometry(s->blk, &nb_sectors);
+    s->nb_sectors = MIN(nb_sectors, (uint64_t)INT_MAX << 2);
+}
+
 /* called when the inserted state of the media has changed */
 static void ide_cd_change_cb(void *opaque, bool load, Error **errp)
 {
     IDEState *s = opaque;
-    uint64_t nb_sectors;

     s->tray_open = !load;
-    blk_get_geometry(s->blk, &nb_sectors);
-    s->nb_sectors = nb_sectors;
+    ide_set_nb_sectors(s);

     /*
      * First indicate to the guest that a CD has been removed.  That's
@@ -2475,14 +2481,12 @@ static bool ide_cd_is_medium_locked(void *opaque)
 static void ide_resize_cb(void *opaque)
 {
     IDEState *s = opaque;
-    uint64_t nb_sectors;

     if (!s->identify_set) {
         return;
     }

-    blk_get_geometry(s->blk, &nb_sectors);
-    s->nb_sectors = nb_sectors;
+    ide_set_nb_sectors(s);

     /* Update the identify data buffer. */
     if (s->drive_kind == IDE_CFATA) {
@@ -2511,17 +2515,14 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    uint32_t cylinders, uint32_t heads, uint32_t secs,
                    int chs_trans, Error **errp)
 {
-    uint64_t nb_sectors;
-
     s->blk = blk;
     s->drive_kind = kind;
-
-    blk_get_geometry(blk, &nb_sectors);
     s->cylinders = cylinders;
     s->heads = heads;
     s->sectors = secs;
     s->chs_trans = chs_trans;
-    s->nb_sectors = nb_sectors;
+    ide_set_nb_sectors(s);
+
     s->wwn = wwn;
     /* The SMART values should be preserved across power cycles
        but they aren't.  */
--
2.29.2


