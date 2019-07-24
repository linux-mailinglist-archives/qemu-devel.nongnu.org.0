Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329EF72BDD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 11:56:41 +0200 (CEST)
Received: from localhost ([::1]:50188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqE0m-0000BU-Ar
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 05:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53962)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hqDzu-00050d-6m
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 05:55:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hqDzt-0004Oi-1S
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 05:55:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60040)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hqDzs-0004Ne-Qk
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 05:55:44 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0A9603082138;
 Wed, 24 Jul 2019 09:55:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-189.ams2.redhat.com
 [10.36.116.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2391360BEC;
 Wed, 24 Jul 2019 09:55:41 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 24 Jul 2019 11:55:22 +0200
Message-Id: <20190724095523.1527-4-quintela@redhat.com>
In-Reply-To: <20190724095523.1527-1-quintela@redhat.com>
References: <20190724095523.1527-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 24 Jul 2019 09:55:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/4] migration: Make explicit that we are
 quitting multifd
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 kvm@vger.kernel.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We add a bool to indicate that.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 87bb7da8e2..eb6716710e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -677,6 +677,8 @@ typedef struct {
     QemuMutex mutex;
     /* is this channel thread running */
     bool running;
+    /* should this thread finish */
+    bool quit;
     /* array of pages to receive */
     MultiFDPages_t *pages;
     /* packet allocated len */
@@ -1266,6 +1268,7 @@ static void multifd_recv_terminate_threads(Error *e=
rr)
         MultiFDRecvParams *p =3D &multifd_recv_state->params[i];
=20
         qemu_mutex_lock(&p->mutex);
+        p->quit =3D true;
         /* We could arrive here for two reasons:
            - normal quit, i.e. everything went fine, just finished
            - error quit: We close the channels so the channel threads
@@ -1288,6 +1291,7 @@ int multifd_load_cleanup(Error **errp)
         MultiFDRecvParams *p =3D &multifd_recv_state->params[i];
=20
         if (p->running) {
+            p->quit =3D true;
             qemu_thread_join(&p->thread);
         }
         object_unref(OBJECT(p->c));
@@ -1351,6 +1355,10 @@ static void *multifd_recv_thread(void *opaque)
         uint32_t used;
         uint32_t flags;
=20
+        if (p->quit) {
+            break;
+        }
+
         ret =3D qio_channel_read_all_eof(p->c, (void *)p->packet,
                                        p->packet_len, &local_err);
         if (ret =3D=3D 0) {   /* EOF */
@@ -1422,6 +1430,7 @@ int multifd_load_setup(void)
=20
         qemu_mutex_init(&p->mutex);
         qemu_sem_init(&p->sem_sync, 0);
+        p->quit =3D false;
         p->id =3D i;
         p->pages =3D multifd_pages_init(page_count);
         p->packet_len =3D sizeof(MultiFDPacket_t)
--=20
2.21.0


