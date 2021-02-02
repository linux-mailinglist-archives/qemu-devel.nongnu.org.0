Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5797F30BF48
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:24:56 +0100 (CET)
Received: from localhost ([::1]:48904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vfr-00058w-Du
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l6veg-0004iO-TC
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:23:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l6ved-0007rK-JO
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612272217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rpOffXP0hkEbeM+Mwn8LgrFhCB3xptKBDFYAWseahZc=;
 b=XmxP5ql4HrFUwiReblHjfEdFHFPeksuglS5E+oMwWIsalnbXF6U6XJ+ciXjfXiA4LJQCod
 gV6f9dz3rkf1VMO+9INbzxrlolGb3G2Hcxy5X+4MvYYxcc9OWO+hyxTWoNlMLld4jCqNzM
 Bgptfca9yhfLczNnNTkkU2PQNmGnZjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-7o_RkinzNteieh4cjq6Bww-1; Tue, 02 Feb 2021 08:23:34 -0500
X-MC-Unique: 7o_RkinzNteieh4cjq6Bww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D62A107ACE3;
 Tue,  2 Feb 2021 13:23:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-201.sin2.redhat.com
 [10.67.116.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D8EF60C5F;
 Tue,  2 Feb 2021 13:23:28 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] scsi: mptsas: dequeue request object in case of an error
 (CVE-2021-3392)
Date: Tue,  2 Feb 2021 18:51:03 +0530
Message-Id: <20210202132103.1096654-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Fam Zheng <fam@euphon.net>, Cheolwoo Myung <cwmyung@snu.ac.kr>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
the Megaraid emulator appends new MPTSASRequest object 'req' to
the 's->pending' queue. In case of an error, this same object gets
dequeued in mptsas_free_request() only if SCSIRequest object
'req->sreq' is initialised. This may lead to a use-after-free issue.
Unconditionally dequeue 'req' object from 's->pending' to avoid it.

Fixes: CVE-2021-3392
Buglink: https://bugs.launchpad.net/qemu/+bug/1914236
Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/scsi/mptsas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index f86616544b..adff5b0bf2 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -257,8 +257,8 @@ static void mptsas_free_request(MPTSASRequest *req)
         req->sreq->hba_private = NULL;
         scsi_req_unref(req->sreq);
         req->sreq = NULL;
-        QTAILQ_REMOVE(&s->pending, req, next);
     }
+    QTAILQ_REMOVE(&s->pending, req, next);
     qemu_sglist_destroy(&req->qsg);
     g_free(req);
 }
-- 
2.29.2


