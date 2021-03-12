Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E508F338891
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:25:47 +0100 (CET)
Received: from localhost ([::1]:37496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKe3G-0005iV-Qq
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKe0G-000090-4j
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:40 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:48430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKe0E-000409-F2
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:39 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-InTwP6w2OBag4EFlCAYI-g-1; Fri, 12 Mar 2021 04:22:29 -0500
X-MC-Unique: InTwP6w2OBag4EFlCAYI-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7089814256;
 Fri, 12 Mar 2021 09:22:27 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 480956A046;
 Fri, 12 Mar 2021 09:22:25 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] vhost-user: Fix double-close on slave_read() error path
Date: Fri, 12 Mar 2021 10:22:07 +0100
Message-Id: <20210312092212.782255-3-groug@kaod.org>
In-Reply-To: <20210312092212.782255-1-groug@kaod.org>
References: <20210312092212.782255-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some message types, e.g. VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG,
can convey file descriptors. These must be closed before returning
from slave_read() to avoid being leaked. This can currently be done
in two different places:

[1] just after the request has been processed

[2] on the error path, under the goto label err:

These path are supposed to be mutually exclusive but they are not
actually. If the VHOST_USER_NEED_REPLY_MASK flag was passed and the
sending of the reply fails, both [1] and [2] are performed with the
same descriptor values. This can potentially cause subtle bugs if one
of the descriptor was recycled by some other thread in the meantime.

This code duplication complicates rollback for no real good benefit.
Do the closing in a unique place, under a new fdcleanup: goto label
at the end of the function.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/virtio/vhost-user.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 6af9b43a7232..acde1d293684 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1475,13 +1475,6 @@ static void slave_read(void *opaque)
         ret =3D -EINVAL;
     }
=20
-    /* Close the remaining file descriptors. */
-    for (i =3D 0; i < fdsize; i++) {
-        if (fd[i] !=3D -1) {
-            close(fd[i]);
-        }
-    }
-
     /*
      * REPLY_ACK feature handling. Other reply types has to be managed
      * directly in their request handlers.
@@ -1511,12 +1504,14 @@ static void slave_read(void *opaque)
         }
     }
=20
-    return;
+    goto fdcleanup;
=20
 err:
     qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
     close(u->slave_fd);
     u->slave_fd =3D -1;
+
+fdcleanup:
     for (i =3D 0; i < fdsize; i++) {
         if (fd[i] !=3D -1) {
             close(fd[i]);
--=20
2.26.2


