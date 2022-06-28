Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E168755D96C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:21:21 +0200 (CEST)
Received: from localhost ([::1]:51952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6B9c-0003du-UU
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzQ-0004HJ-CM
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzO-0008DN-SY
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656421846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RzhRCL/bB+mmwdkYsCac5p54biwxr1r5x5tA2eD5Zek=;
 b=SRf0RuXIrqQBGNB4h5ZZlc8KySfKeyjZJmE27oIC4ENmkXm6p2kQmf+g5cJU4rzPLtsU/M
 3bPA60YUX1QLesSx3LjaEkrOYW0sdFw3NOIAKeS0Mlhw6/7V2/mSQtE9j5ca5BOuYkXddx
 2UQGfu1+cBFZK1gxxn2GqEgEzOv9c0E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-F_6cdt6APsOEN5YpZ9f-fA-1; Tue, 28 Jun 2022 09:10:43 -0400
X-MC-Unique: F_6cdt6APsOEN5YpZ9f-fA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C2A6802C17;
 Tue, 28 Jun 2022 13:10:42 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABD5F492C3B;
 Tue, 28 Jun 2022 13:10:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PATCH 07/12] pc-bios/s390-ccw/virtio: Read device config after
 feature negotiation
Date: Tue, 28 Jun 2022 15:10:27 +0200
Message-Id: <20220628131032.213986-8-thuth@redhat.com>
In-Reply-To: <20220628131032.213986-1-thuth@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Feature negotiation should be done first, since some fields in the
config area can depend on the negotiated features and thus should
rather be read afterwards.

While we're at it, also adjust the error message here a little bit
(the code is nowadays used for non-block virtio devices, too).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/virtio.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
index 4e85a2eb82..d8c2b52710 100644
--- a/pc-bios/s390-ccw/virtio.c
+++ b/pc-bios/s390-ccw/virtio.c
@@ -262,10 +262,6 @@ void virtio_setup_ccw(VDev *vdev)
     rc = run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status, sizeof(status), false);
     IPL_assert(rc == 0, "Could not write DRIVER status to host");
 
-    IPL_assert(
-        run_ccw(vdev, CCW_CMD_READ_CONF, &vdev->config, cfg_size, false) == 0,
-       "Could not get block device configuration");
-
     /* Feature negotiation */
     for (i = 0; i < ARRAY_SIZE(vdev->guest_features); i++) {
         feats.features = 0;
@@ -278,6 +274,9 @@ void virtio_setup_ccw(VDev *vdev)
         IPL_assert(rc == 0, "Could not set features bits");
     }
 
+    rc = run_ccw(vdev, CCW_CMD_READ_CONF, &vdev->config, cfg_size, false);
+    IPL_assert(rc == 0, "Could not get virtio device configuration");
+
     for (i = 0; i < vdev->nr_vqs; i++) {
         VqInfo info = {
             .queue = (unsigned long long) ring_area + (i * VIRTIO_RING_SIZE),
-- 
2.31.1


