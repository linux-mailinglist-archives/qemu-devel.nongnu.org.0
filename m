Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472D3015E7
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:34:04 +0100 (CET)
Received: from localhost ([::1]:55838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3JzH-0005N2-1g
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jx8-0003Tv-6r
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jwz-0005oj-B1
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVHbRRPXRN059GNBhCBcjW2T3ptK437u8Cxz29vbGAs=;
 b=ibbCzFNmUkeI28jZFMEwyz2nqLvlGcaysPhQMiV8gBiN7y5678ZTqbZu4GLO+kT3rzu9ar
 CPmlfcBskiRxXaSMeqWU/56Pv7/S5t/2sOotl/PgvKRwG0sPdOzwHPdtyOBjJWREvMNthf
 6skX2fiK6aaP8ZPWh9b+foht0ltRSpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-SQjN-TSENauk2zTO-WR80w-1; Sat, 23 Jan 2021 09:31:33 -0500
X-MC-Unique: SQjN-TSENauk2zTO-WR80w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBF2F180A098;
 Sat, 23 Jan 2021 14:31:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78C365D9CC;
 Sat, 23 Jan 2021 14:31:32 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/31] ide: atapi: check logical block address and read size
 (CVE-2020-29443)
Date: Sat, 23 Jan 2021 09:31:04 -0500
Message-Id: <20210123143128.1167797-8-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
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
Cc: Wenxiang Qian <leonwxqian@gmail.com>,
 Prasad J Pandit <pjp@fedoraproject.org>
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
Message-Id: <20210118115130.457044-1-ppandit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ide/atapi.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

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
 
-    nb_sectors = (buf[6] << 16) | (buf[7] << 8) | buf[8];
-    lba = ldl_be_p(buf + 2);
+    /* Total logical sectors of ATAPI_SECTOR_SIZE(=2048) bytes */
+    uint64_t total_sectors = s->nb_sectors >> 2;
 
+    nb_sectors = (buf[6] << 16) | (buf[7] << 8) | buf[8];
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
2.26.2



