Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA5433E085
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:30:43 +0100 (CET)
Received: from localhost ([::1]:54546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHH0-00085s-CV
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2j-0005ic-SP
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2e-0003XX-7t
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8ADA7f0balS7dN4pePZzfFw3zoFhhZFbYVG5icg2rM=;
 b=jUs+H8iZ7+GWf147aBGrQAadfvo2kPyj3s9GVSCFKWLKmjATqBguwDDN0mE4rY0KVI5s9I
 MlIWtwGUwNl4YUs2XuueerXYi4jBSpigP49IsXXt+WiIxyXDH9PPMHxfXjCzTtMBCeC2Dj
 5cV0igFe8NlRBLooW94SPcI0XNILEds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-fI-R5tJ-Mz6kJ6GBqLtsxw-1; Tue, 16 Mar 2021 17:15:49 -0400
X-MC-Unique: fI-R5tJ-Mz6kJ6GBqLtsxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A87B192D785
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 21:15:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E862B50329;
 Tue, 16 Mar 2021 21:15:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/16] scsi: fix sense code for EREMOTEIO
Date: Tue, 16 Mar 2021 17:15:29 -0400
Message-Id: <20210316211531.1649909-15-pbonzini@redhat.com>
In-Reply-To: <20210316211531.1649909-1-pbonzini@redhat.com>
References: <20210316211531.1649909-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SENSE_CODE(LUN_COMM_FAILURE) has an ABORTED COMMAND sense key,
so it results in a retry in Linux.  To ensure that EREMOTEIO
is forwarded to the guest, use a HARDWARE ERROR sense key
instead.  Note that the code before commit d7a84021d was incorrect
because it used HARDWARE_ERROR as a SCSI status, not as a sense
key.

Reported-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scsi/utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scsi/utils.c b/scsi/utils.c
index 873e05aeaf..357b036671 100644
--- a/scsi/utils.c
+++ b/scsi/utils.c
@@ -589,7 +589,7 @@ int scsi_sense_from_errno(int errno_value, SCSISense *sense)
         return TASK_SET_FULL;
 #ifdef CONFIG_LINUX
         /* These errno mapping are specific to Linux.  For more information:
-         * - scsi_decide_disposition in drivers/scsi/scsi_error.c
+         * - scsi_check_sense and scsi_decide_disposition in drivers/scsi/scsi_error.c
          * - scsi_result_to_blk_status in drivers/scsi/scsi_lib.c
          * - blk_errors[] in block/blk-core.c
          */
@@ -599,7 +599,7 @@ int scsi_sense_from_errno(int errno_value, SCSISense *sense)
         *sense = SENSE_CODE(READ_ERROR);
         return CHECK_CONDITION;
     case EREMOTEIO:
-        *sense = SENSE_CODE(LUN_COMM_FAILURE);
+        *sense = SENSE_CODE(TARGET_FAILURE);
         return CHECK_CONDITION;
 #endif
     case ENOMEDIUM:
-- 
2.26.2



