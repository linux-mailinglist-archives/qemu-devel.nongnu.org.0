Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5627831C98F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:20:02 +0100 (CET)
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lByOf-0007Rz-Bh
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lByNQ-0006ji-Jn
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:18:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lByNP-00032X-2S
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613474321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uDr4FTpvQisEb8hwxE8gmqBCD54211TI9LU+oF1Yyds=;
 b=aF0lT9FBfhYcqWlNT/8R9oJ8aeR3mtGKdSeb9X4yiO54Z6AfylcvKXP4paTeH8aYg3wsWj
 rRCGxADE5V1wnMN5B3W3najoItWM01xa6wirlWQ7bgG2dBDp3iOxICbOd072MAY85kzMSF
 PQUekFSl/Cr56/5Hg5Wvue5UAXEyw7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-8wpJeQoEOL6TjKNiCvEVNQ-1; Tue, 16 Feb 2021 06:18:39 -0500
X-MC-Unique: 8wpJeQoEOL6TjKNiCvEVNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 672D010CE782;
 Tue, 16 Feb 2021 11:18:38 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-145.ams2.redhat.com
 [10.36.113.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88B951970A;
 Tue, 16 Feb 2021 11:18:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: [PATCH] virtio-ccw: commands on revision-less devices
Date: Tue, 16 Feb 2021 12:18:30 +0100
Message-Id: <20210216111830.1087847-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtio standard specifies that any non-transitional device must
reject commands prior to revision setting (which we do) and else
assume revision 0 (legacy) if the driver sends a non-revision-setting
command first. We neglected to do the latter.

Fortunately, nearly everything worked as intended anyway; the only
problem was not properly rejecting revision setting after some other
command had been issued. Easy to fix by setting revision to 0 if
we see a non-revision command on a legacy-capable revision-less
device.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/virtio-ccw.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 4582e94ae7dc..06c06056814b 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -327,13 +327,20 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
                                    ccw.cmd_code);
     check_len = !((ccw.flags & CCW_FLAG_SLI) && !(ccw.flags & CCW_FLAG_DC));
 
-    if (dev->force_revision_1 && dev->revision < 0 &&
-        ccw.cmd_code != CCW_CMD_SET_VIRTIO_REV) {
-        /*
-         * virtio-1 drivers must start with negotiating to a revision >= 1,
-         * so post a command reject for all other commands
-         */
-        return -ENOSYS;
+    if (dev->revision < 0 && ccw.cmd_code != CCW_CMD_SET_VIRTIO_REV) {
+        if (dev->force_revision_1) {
+            /*
+             * virtio-1 drivers must start with negotiating to a revision >= 1,
+             * so post a command reject for all other commands
+             */
+            return -ENOSYS;
+        } else {
+            /*
+             * If the driver issues any command that is not SET_VIRTIO_REV,
+             * we'll have to operate the device in legacy mode.
+             */
+            dev->revision = 0;
+        }
     }
 
     /* Look at the command. */
-- 
2.26.2


