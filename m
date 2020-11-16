Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06BD2B51CA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 21:01:54 +0100 (CET)
Received: from localhost ([::1]:47264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekhF-0003jT-Ep
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 15:01:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keke5-0001wg-Ob
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:58:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keke3-0002BQ-ER
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:58:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605556714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BGbIfMBS9cNuyuZ2RI02GE0B9Mc/7KhKZv/nopjOmmA=;
 b=iHtrSA32lRSXtVpKv8iKH/yy1bSMAU3pUs2IE5l44iuMruAMc4SQFAyOCx2YKSp+aMkplt
 R/5sFcA3FAQRnhXOc5UHXEqeH2CiT5aq8xPd7VDhVkRIiW6NtXeSrccyd5fCo9Kj6Mt7Cm
 o6RhtCtRewRCFw3Mnod2QdmoQl8+saU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-_cW8W770PZqWV4JXq5n_hw-1; Mon, 16 Nov 2020 14:58:32 -0500
X-MC-Unique: _cW8W770PZqWV4JXq5n_hw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C33A2107466C;
 Mon, 16 Nov 2020 19:58:31 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8229B19482;
 Mon, 16 Nov 2020 19:58:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] scsi-disk: convert more errno values back to SCSI statuses
Date: Mon, 16 Nov 2020 14:58:13 -0500
Message-Id: <20201116195815.48264-4-pbonzini@redhat.com>
In-Reply-To: <20201116195815.48264-1-pbonzini@redhat.com>
References: <20201116195815.48264-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux has some OS-specific (and sometimes weird) mappings for various SCSI
statuses and sense codes.  The most important is probably RESERVATION
CONFLICT.  Add them so that they can be reported back to the guest
kernel.

Cc: Hannes Reinecke <hare@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index e859534eaf..90841ad791 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -461,6 +461,25 @@ static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
             }
             error = scsi_sense_buf_to_errno(r->req.sense, sizeof(r->req.sense));
             break;
+#ifdef CONFIG_LINUX
+            /* These errno mapping are specific to Linux.  For more information:
+             * - scsi_decide_disposition in drivers/scsi/scsi_error.c
+             * - scsi_result_to_blk_status in drivers/scsi/scsi_lib.c
+             * - blk_errors[] in block/blk-core.c
+             */
+        case EBADE:
+            /* DID_NEXUS_FAILURE -> BLK_STS_NEXUS.  */
+            scsi_req_complete(&r->req, RESERVATION_CONFLICT);
+            break;
+        case ENODATA:
+            /* DID_MEDIUM_ERROR -> BLK_STS_MEDIUM.  */
+            scsi_check_condition(r, SENSE_CODE(READ_ERROR));
+            break;
+        case EREMOTEIO:
+            /* DID_TARGET_FAILURE -> BLK_STS_TARGET.  */
+            scsi_req_complete(&r->req, HARDWARE_ERROR);
+            break;
+#endif
         case ENOMEDIUM:
             scsi_check_condition(r, SENSE_CODE(NO_MEDIUM));
             break;
-- 
2.26.2



