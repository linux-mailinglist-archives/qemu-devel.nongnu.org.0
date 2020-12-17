Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75622DD5A8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 18:05:58 +0100 (CET)
Received: from localhost ([::1]:56772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpwiz-0008QK-Fq
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 12:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpwaH-0003GO-J0
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:56:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpwaC-00036k-FY
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608224210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=595zJLnzjD7+CDUTBj/Yg/a0T1xQ06mWxKOc8uzzRDY=;
 b=b1HojGH1MECcr/R+9ncEsn8PsJmNFvcLRtpU1TRDe01QJ1zKwV7U2fwCkZk+6gBK/el+RG
 YD/l8GLyMTJvj2CbDBO2eyPygVmI+2Ry+rApkAhOU/PtK1+O7HH/EgNPhM0yw37/oFrJ/I
 Gowr+M2MMoAPDiUgzSJxTDo4aGWtZ94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-7_9_vWBYMmqEHV-0WsVjXg-1; Thu, 17 Dec 2020 11:56:46 -0500
X-MC-Unique: 7_9_vWBYMmqEHV-0WsVjXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6515610766BA;
 Thu, 17 Dec 2020 16:56:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B4A8E734;
 Thu, 17 Dec 2020 16:56:41 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] block/scsi: correctly emulate the VPD block limits page
Date: Thu, 17 Dec 2020 18:56:12 +0200
Message-Id: <20201217165612.942849-6-mlevitsk@redhat.com>
In-Reply-To: <20201217165612.942849-1-mlevitsk@redhat.com>
References: <20201217165612.942849-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Tom Yan <tom.ty89@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the device doesn't support the VPD block limits page, we emulate it even
for SCSI passthrough.

As a part of the emulation we need to add it to the 'Supported VPD Pages'

The code that does this adds it to the page, but it doesn't increase the length
of the data to be copied to the guest, thus the guest never sees the VPD block
limits page as supported.

Bump the transfer size by 1 in this case.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/scsi/scsi-generic.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 6df67bf889..8f43979cbc 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -134,7 +134,7 @@ static int execute_command(BlockBackend *blk,
     return 0;
 }
 
-static void scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s)
+static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
 {
     uint8_t page, page_idx;
 
@@ -200,8 +200,13 @@ static void scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s)
                 r->buf[page_idx] = 0xb0;
             }
             stw_be_p(r->buf + 2, lduw_be_p(r->buf + 2) + 1);
+
+            if (len < r->buflen) {
+                len++;
+            }
         }
     }
+    return len;
 }
 
 static int scsi_generic_emulate_block_limits(SCSIGenericReq *r, SCSIDevice *s)
@@ -316,7 +321,7 @@ static void scsi_read_complete(void * opaque, int ret)
         }
     }
     if (r->req.cmd.buf[0] == INQUIRY) {
-        scsi_handle_inquiry_reply(r, s);
+        len = scsi_handle_inquiry_reply(r, s, len);
     }
 
 req_complete:
-- 
2.26.2


