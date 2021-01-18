Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C032F9ECF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:55:27 +0100 (CET)
Received: from localhost ([::1]:37092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1T82-00067R-MI
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l1T6l-0005gd-GV
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:54:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l1T6g-0001YQ-SN
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610970841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t02qZHqElruEje9H2HUQ//DZ2O8BhzliustNfGhNgpA=;
 b=FJ/abliwzixxXwYLVVy2OJc4ctkGGzZXuweYO5GUb7oF9o8B28Hi30+/xhwy98H5/nFoZo
 zESk+UF+BOP9VHD1ZW4HJ8DulBX4GypgkEJkIVi+kxf+lrlY3JN8BGtWKxcYEydWg2gEta
 a2QHlVoNRM/mO38+PqPgf62osfjShTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-O2LGETIFN8yZicihVcQLZQ-1; Mon, 18 Jan 2021 06:53:45 -0500
X-MC-Unique: O2LGETIFN8yZicihVcQLZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADF7C10054FF;
 Mon, 18 Jan 2021 11:53:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 081B95D9D3;
 Mon, 18 Jan 2021 11:53:37 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3] ide: atapi: check logical block address and read size
 (CVE-2020-29443)
Date: Mon, 18 Jan 2021 17:21:30 +0530
Message-Id: <20210118115130.457044-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Wenxiang Qian <leonwxqian@gmail.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

While processing ATAPI cmd_read/cmd_read_cd commands,
Logical Block Address (LBA) maybe invalid OR closer to the last block,
leading to an OOB access issues. Add range check to avoid it.

Fixes: CVE-2020-29443
Reported-by: Wenxiang Qian <leonwxqian@gmail.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/ide/atapi.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

Update v3: Fix space typo/error, add Reviewed-by tag
  -> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04159.html
  -> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04173.html

diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index e79157863f..b626199e3d 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -322,6 +322,8 @@ static void ide_atapi_cmd_reply(IDEState *s, int size, int max_size)
 static void ide_atapi_cmd_read_pio(IDEState *s, int lba, int nb_sectors,
                                    int sector_size)
 {
+    assert(0 <= lba && lba < (s->nb_sectors >> 2));
+
     s->lba = lba;
     s->packet_transfer_size = nb_sectors * sector_size;
     s->elementary_transfer_size = 0;
@@ -420,6 +422,8 @@ eot:
 static void ide_atapi_cmd_read_dma(IDEState *s, int lba, int nb_sectors,
                                    int sector_size)
 {
+    assert(0 <= lba && lba < (s->nb_sectors >> 2));
+
     s->lba = lba;
     s->packet_transfer_size = nb_sectors * sector_size;
     s->io_buffer_size = 0;
@@ -973,35 +977,49 @@ static void cmd_prevent_allow_medium_removal(IDEState *s, uint8_t* buf)

 static void cmd_read(IDEState *s, uint8_t* buf)
 {
-    int nb_sectors, lba;
+    unsigned int nb_sectors, lba;
+
+    /* Total logical sectors of ATAPI_SECTOR_SIZE(=2048) bytes */
+    uint64_t total_sectors = s->nb_sectors >> 2;

     if (buf[0] == GPCMD_READ_10) {
         nb_sectors = lduw_be_p(buf + 7);
     } else {
         nb_sectors = ldl_be_p(buf + 6);
     }
-
-    lba = ldl_be_p(buf + 2);
     if (nb_sectors == 0) {
         ide_atapi_cmd_ok(s);
         return;
     }

+    lba = ldl_be_p(buf + 2);
+    if (lba >= total_sectors || lba + nb_sectors - 1 >= total_sectors) {
+        ide_atapi_cmd_error(s, ILLEGAL_REQUEST, ASC_LOGICAL_BLOCK_OOR);
+        return;
+    }
+
     ide_atapi_cmd_read(s, lba, nb_sectors, 2048);
 }

 static void cmd_read_cd(IDEState *s, uint8_t* buf)
 {
-    int nb_sectors, lba, transfer_request;
+    unsigned int nb_sectors, lba, transfer_request;
+
+    /* Total logical sectors of ATAPI_SECTOR_SIZE(=2048) bytes */
+    uint64_t total_sectors = s->nb_sectors >> 2;

     nb_sectors = (buf[6] << 16) | (buf[7] << 8) | buf[8];
-    lba = ldl_be_p(buf + 2);
-
     if (nb_sectors == 0) {
         ide_atapi_cmd_ok(s);
         return;
     }

+    lba = ldl_be_p(buf + 2);
+    if (lba >= total_sectors || lba + nb_sectors - 1 >= total_sectors) {
+        ide_atapi_cmd_error(s, ILLEGAL_REQUEST, ASC_LOGICAL_BLOCK_OOR);
+        return;
+    }
+
     transfer_request = buf[9] & 0xf8;
     if (transfer_request == 0x00) {
         /* nothing */
--
2.29.2


