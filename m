Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DE032EF8C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:03:37 +0100 (CET)
Received: from localhost ([::1]:52388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICvQ-0005EH-Ol
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lICno-00044W-8f
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:55:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lICnm-0003Q9-K1
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614959742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aufj7ko5nmEu95WbZy5r3t1B+AtfaF0ZPOk5zIttzIQ=;
 b=UgX3SAkhxXeVHgR/yekVAzdj/4/t7BSXa+bCK3OADYUTIH5NOV2YzWE8CsJUU8aeMaAY8F
 4Ge9wpCd9nDyRFBLW8jk9aJTDQx6Pzxj5UzcVA8Z7LNOLOiEu6HJ82HUY/tSPunuspqYXm
 BtHmixy6lPos9i4Y+LuBSuSc2xQj0Qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-2EK5Zcm8MtmGz9MqEWk6OQ-1; Fri, 05 Mar 2021 10:55:37 -0500
X-MC-Unique: 2EK5Zcm8MtmGz9MqEWk6OQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3EF4EC1A0;
 Fri,  5 Mar 2021 15:55:35 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 529346B8DA;
 Fri,  5 Mar 2021 15:55:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/8] virtio-ccw: commands on revision-less devices
Date: Fri,  5 Mar 2021 16:55:14 +0100
Message-Id: <20210305155517.1604547-6-cohuck@redhat.com>
In-Reply-To: <20210305155517.1604547-1-cohuck@redhat.com>
References: <20210305155517.1604547-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtio standard specifies that any non-transitional device must
reject commands prior to revision setting (which we do). Devices
that are transitional need to assume revision 0 (legacy) if the
driver sends a non-revision-setting command first in order to
support legacy drivers. We neglected to do the latter.

Fortunately, nearly everything worked as intended anyway; the only
problem was not properly rejecting revision setting after some other
command had been issued. Easy to fix by setting revision to 0 if
we see a non-revision command on a legacy-capable revision-less
device.

Found by code inspection, not observed in the wild.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Halil Pasic <pasic@linux.ibm.com>
Message-Id: <20210216111830.1087847-1-cohuck@redhat.com>
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


