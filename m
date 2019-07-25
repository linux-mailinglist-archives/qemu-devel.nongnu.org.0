Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A549F74C4D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 12:58:13 +0200 (CEST)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqbRs-0000dK-OI
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 06:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41181)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hqbRO-0007fe-Gn
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 06:57:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hqbRN-0006Ht-ES
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 06:57:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32894)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hqbRN-0006Hd-7U
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 06:57:41 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7B16781DF0;
 Thu, 25 Jul 2019 10:57:40 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-190.ams2.redhat.com
 [10.36.117.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32ACD19D70;
 Thu, 25 Jul 2019 10:57:38 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 25 Jul 2019 12:57:24 +0200
Message-Id: <20190725105724.2562-5-quintela@redhat.com>
In-Reply-To: <20190725105724.2562-1-quintela@redhat.com>
References: <20190725105724.2562-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 25 Jul 2019 10:57:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/4] migration: fix migrate_cancel multifd
 migration leads destination hung forever
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Ivan Ren <renyime@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ivan Ren <ivanren@tencent.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ivan Ren <renyime@gmail.com>

When migrate_cancel a multifd migration, if run sequence like this:

        [source]                              [destination]

multifd_send_sync_main[finish]
                                    multifd_recv_thread wait &p->sem_sync
shutdown to_dst_file
                                    detect error from_src_file
send  RAM_SAVE_FLAG_EOS[fail]       [no chance to run multifd_recv_sync_m=
ain]
                                    multifd_load_cleanup
                                    join multifd receive thread forever

will lead destination qemu hung at following stack:

pthread_join
qemu_thread_join
multifd_load_cleanup
process_incoming_migration_co
coroutine_trampoline

Signed-off-by: Ivan Ren <ivanren@tencent.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <1561468699-9819-4-git-send-email-ivanren@tencent.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index eb6716710e..889148dd84 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1292,6 +1292,11 @@ int multifd_load_cleanup(Error **errp)
=20
         if (p->running) {
             p->quit =3D true;
+            /*
+             * multifd_recv_thread may hung at MULTIFD_FLAG_SYNC handle =
code,
+             * however try to wakeup it without harm in cleanup phase.
+             */
+            qemu_sem_post(&p->sem_sync);
             qemu_thread_join(&p->thread);
         }
         object_unref(OBJECT(p->c));
--=20
2.21.0


