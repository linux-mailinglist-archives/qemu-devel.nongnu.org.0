Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311C72FCD47
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:14:02 +0100 (CET)
Received: from localhost ([::1]:47026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l29Yv-0000t4-6S
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l29XN-0008NW-Ko
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:12:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l29XE-0007uv-4w
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611133934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IT0N/adDtZethcpXugOwi+ignahrpU/pPnxEwGs/cLU=;
 b=bT2UX5b06eFEhTVoGAxfIJ35z8U6RzqU0vLMM7ZBRlsTn7gzYf/TQTqRw6y8Skfnoa/66T
 4+jlbcf+nP+UxjT4cPSvSXiM50MZ80iII4GrKn+duE6Mu/qKz8r1MGaSZzYZn2v3edRtJ0
 0aif83qS28OXMsEF/FAJRarq1WGKLuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-KkMEuRQpPSCUCJ2aG9rLSQ-1; Wed, 20 Jan 2021 04:12:11 -0500
X-MC-Unique: KkMEuRQpPSCUCJ2aG9rLSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D502F10052FE;
 Wed, 20 Jan 2021 09:12:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.74.9.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45CFF5C8AB;
 Wed, 20 Jan 2021 09:12:07 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2] ide: set an upper limit to nb_sectors
Date: Wed, 20 Jan 2021 14:40:02 +0530
Message-Id: <20210120091002.521931-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
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
 hw/ide/core.c             | 27 ++++++++++++++++-----------
 include/hw/ide/internal.h |  1 +
 2 files changed, 17 insertions(+), 11 deletions(-)

Update v2: add explanatory comment, define macro
  -> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04610.html

Update v1: limit s->nb_sectors count
  -> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04270.html
  -> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04173.html

diff --git a/hw/ide/core.c b/hw/ide/core.c
index b49e4cfbc6..902f51423d 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1161,15 +1161,25 @@ static void ide_cfata_metadata_write(IDEState *s)
                                     s->nsector << 9), 0x200 - 2));
 }

+static void ide_set_nb_sectors(IDEState *s)
+{
+    uint64_t nb_sectors;
+    blk_get_geometry(s->blk, &nb_sectors);
+
+    /*
+     * Restrict total number of addressable sectors to (INT_MAX << 2),
+     * so that logical addresses (LBA) stay within INT_MAX limit.
+     */
+    s->nb_sectors = MIN(nb_sectors, IDE_MAX_NB_SECTORS);
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
@@ -2475,14 +2485,12 @@ static bool ide_cd_is_medium_locked(void *opaque)
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
@@ -2511,17 +2519,14 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
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
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 2d09162eeb..7c436def5b 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -219,6 +219,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(IDEBus, IDE_BUS)
 /* set to 1 set disable mult support */
 #define MAX_MULT_SECTORS 16

+#define IDE_MAX_NB_SECTORS  ((uint64_t)INT_MAX << 2)
 #define IDE_DMA_BUF_SECTORS 256

 /* feature values for Data Set Management */
--
2.29.2


