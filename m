Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD1F2D43A1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 14:59:56 +0100 (CET)
Received: from localhost ([::1]:48248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn00a-0003OV-1I
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 08:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmzw8-0008Js-Jm
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 08:55:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmzw6-0000jf-VE
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 08:55:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607522118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J46+PPyCTK2yhjp28m0CSBLVIgBZJPKkIaKnWxzYYp0=;
 b=XV3krnR5H1PszdfaUdhBQ3T811j0p+rI9Iwl89rZKtgVvyh3/a18jsoCeyLckmlfKGBiK8
 sD7rH9TMd+XpvpFBP691qEnKlfSNdt70dH6qLwookAkhcXB+9e3KEkbxWJsVEYWqzIjvf5
 YT7L6uwKmiu80/VqyV+Bsp5P/j2UTqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-SPYUiWCdMJ-st3EhLcEZiQ-1; Wed, 09 Dec 2020 08:55:16 -0500
X-MC-Unique: SPYUiWCdMJ-st3EhLcEZiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFC6D180DE11;
 Wed,  9 Dec 2020 13:54:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDA9A5D74C;
 Wed,  9 Dec 2020 13:54:51 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] block/scsi: correctly emulate the VPD block limits page
Date: Wed,  9 Dec 2020 15:53:55 +0200
Message-Id: <20201209135355.561745-6-mlevitsk@redhat.com>
In-Reply-To: <20201209135355.561745-1-mlevitsk@redhat.com>
References: <20201209135355.561745-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
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
 hw/scsi/scsi-generic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 6df67bf889..4354469841 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -134,7 +134,7 @@ static int execute_command(BlockBackend *blk,
     return 0;
 }
 
-static void scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s)
+static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
 {
     uint8_t page, page_idx;
 
@@ -200,8 +200,12 @@ static void scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s)
                 r->buf[page_idx] = 0xb0;
             }
             stw_be_p(r->buf + 2, lduw_be_p(r->buf + 2) + 1);
+
+            if (len < r->buflen)
+                len++;
         }
     }
+    return len;
 }
 
 static int scsi_generic_emulate_block_limits(SCSIGenericReq *r, SCSIDevice *s)
@@ -316,7 +320,7 @@ static void scsi_read_complete(void * opaque, int ret)
         }
     }
     if (r->req.cmd.buf[0] == INQUIRY) {
-        scsi_handle_inquiry_reply(r, s);
+        len = scsi_handle_inquiry_reply(r, s, len);
     }
 
 req_complete:
-- 
2.26.2


