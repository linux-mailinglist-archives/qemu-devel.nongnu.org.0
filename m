Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A283B31CA57
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 13:04:29 +0100 (CET)
Received: from localhost ([::1]:48470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBz5g-000318-Mp
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 07:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lBz4H-0002A0-W5
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 07:03:02 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:43792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lBz4G-0006JL-Iy
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 07:03:01 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-4-tW8xYxMr-7gO-S83uMew-1; Tue, 16 Feb 2021 07:02:50 -0500
X-MC-Unique: 4-tW8xYxMr-7gO-S83uMew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01AEB8030D5;
 Tue, 16 Feb 2021 12:02:49 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-115-143.ams2.redhat.com [10.36.115.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0E545D765;
 Tue, 16 Feb 2021 12:02:47 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] event_notifier: Set ->initialized earlier in
 event_notifier_init()
Date: Tue, 16 Feb 2021 13:02:47 +0100
Message-Id: <20210216120247.1293569-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise the call to event_notifier_set() is a nop, which causes
the SLOF firmware on POWER to hang when booting from a virtio-scsi
device:

virtio_scsi_dataplane_start()
 virtio_scsi_vring_init()
  virtio_bus_set_host_notifier() <- assign =3D=3D true
   event_notifier_init() <- active =3D=3D 1
    event_notifier_set() <- fails right away if !e->initialized

Fixes: e34e47eb28c0 ("event_notifier: handle initialization failure better"=
)
Cc: mlevitsk@redhat.com
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 util/event_notifier-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index 5b2110e86198..8307013c5df0 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -66,10 +66,10 @@ int event_notifier_init(EventNotifier *e, int active)
         e->rfd =3D fds[0];
         e->wfd =3D fds[1];
     }
+    e->initialized =3D true;
     if (active) {
         event_notifier_set(e);
     }
-    e->initialized =3D true;
     return 0;
=20
 fail:
--=20
2.26.2


