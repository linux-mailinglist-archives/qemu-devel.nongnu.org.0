Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2B513A8F3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 13:05:09 +0100 (CET)
Received: from localhost ([::1]:38130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irKwV-00015A-K6
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 07:05:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKaj-0008NE-8E
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:42:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKad-0003iK-Ut
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:42:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44596
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKad-0003hv-Qt
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:42:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sF9PT3VudShxE0wmWXTxFC1tzz8+9eCtUOBba9umQls=;
 b=dSjbeN6iHFJ54rYvZ8O2tBVVivVGcaesAKzEhZ5UIPHRfU+/p94V7GN+8knRK+kKzwtTpw
 CrOSDodQmt4RBeRlI8MMlTXMEKTrdAN1A/WGpaHPmkKYDDWG/9Dp9XdGyG1PwvONdj9IxD
 xG0fFO91ejyBWxuwq/qGxC76sDi8KJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-MID95cAlNzCqRU41hmnghQ-1; Tue, 14 Jan 2020 06:42:30 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3EFA800A02;
 Tue, 14 Jan 2020 11:42:27 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDCD55DA70;
 Tue, 14 Jan 2020 11:42:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/30] migration/multifd: fix destroyed mutex access in
 terminating multifd threads
Date: Tue, 14 Jan 2020 12:39:20 +0100
Message-Id: <20200114113926.3556-25-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: MID95cAlNzCqRU41hmnghQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Jason Wang <jasowang@redhat.com>,
 Jiahui Cen <cenjiahui@huawei.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ying Fang <fangying1@huawei.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiahui Cen <cenjiahui@huawei.com>

One multifd will lock all the other multifds' IOChannel mutex to inform the=
m
to quit by setting p->quit or shutting down p->c. In this senario, if some
multifds had already been terminated and multifd_load_cleanup/multifd_save_=
cleanup
had destroyed their mutex, it could cause destroyed mutex access when tryin=
g
lock their mutex.

Here is the coredump stack:
    #0  0x00007f81a2794437 in raise () from /usr/lib64/libc.so.6
    #1  0x00007f81a2795b28 in abort () from /usr/lib64/libc.so.6
    #2  0x00007f81a278d1b6 in __assert_fail_base () from /usr/lib64/libc.so=
.6
    #3  0x00007f81a278d262 in __assert_fail () from /usr/lib64/libc.so.6
    #4  0x000055eb1bfadbd3 in qemu_mutex_lock_impl (mutex=3D0x55eb1e2d1988,=
 file=3D<optimized out>, line=3D<optimized out>) at util/qemu-thread-posix.=
c:64
    #5  0x000055eb1bb4564a in multifd_send_terminate_threads (err=3D<optimi=
zed out>) at migration/ram.c:1015
    #6  0x000055eb1bb4bb7f in multifd_send_thread (opaque=3D0x55eb1e2d19f8)=
 at migration/ram.c:1171
    #7  0x000055eb1bfad628 in qemu_thread_start (args=3D0x55eb1e170450) at =
util/qemu-thread-posix.c:502
    #8  0x00007f81a2b36df5 in start_thread () from /usr/lib64/libpthread.so=
.0
    #9  0x00007f81a286048d in clone () from /usr/lib64/libc.so.6

To fix it up, let's destroy the mutex after all the other multifd threads h=
ad
been terminated.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 278b2ff87a..7221f54139 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1053,6 +1053,10 @@ void multifd_save_cleanup(void)
         if (p->running) {
             qemu_thread_join(&p->thread);
         }
+    }
+    for (i =3D 0; i < migrate_multifd_channels(); i++) {
+        MultiFDSendParams *p =3D &multifd_send_state->params[i];
+
         socket_send_channel_destroy(p->c);
         p->c =3D NULL;
         qemu_mutex_destroy(&p->mutex);
@@ -1336,6 +1340,10 @@ int multifd_load_cleanup(Error **errp)
             qemu_sem_post(&p->sem_sync);
             qemu_thread_join(&p->thread);
         }
+    }
+    for (i =3D 0; i < migrate_multifd_channels(); i++) {
+        MultiFDRecvParams *p =3D &multifd_recv_state->params[i];
+
         object_unref(OBJECT(p->c));
         p->c =3D NULL;
         qemu_mutex_destroy(&p->mutex);
--=20
2.24.1


