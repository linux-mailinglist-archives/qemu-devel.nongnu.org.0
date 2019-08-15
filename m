Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675668F149
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 18:54:50 +0200 (CEST)
Received: from localhost ([::1]:44500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyJ1V-0007dg-0w
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 12:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47570)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hyIkF-0003Wl-2B
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:37:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hyIkA-0003bc-UL
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:36:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33036)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hyIkA-0003bD-N9
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:36:54 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F0A675AFF8;
 Thu, 15 Aug 2019 16:36:53 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-19.ams2.redhat.com
 [10.36.117.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76DE1BAAC;
 Thu, 15 Aug 2019 16:36:52 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Aug 2019 17:35:04 +0100
Message-Id: <20190815163504.18937-34-dgilbert@redhat.com>
In-Reply-To: <20190815163504.18937-1-dgilbert@redhat.com>
References: <20190815163504.18937-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 15 Aug 2019 16:36:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 33/33] migration: add some multifd traces
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
Cc: quintela@redhat.com, yury-kotov@yandex-team.ru,
 richardw.yang@linux.intel.com, marcandre.lureau@redhat.com,
 ivanren@tencent.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20190814020218.1868-6-quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c        | 3 +++
 migration/trace-events | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index c7aa3d9a2c..35552c090b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1170,6 +1170,7 @@ static void *multifd_send_thread(void *opaque)
=20
 out:
     if (local_err) {
+        trace_multifd_send_error(p->id);
         multifd_send_terminate_threads(local_err);
     }
=20
@@ -1200,6 +1201,7 @@ static void multifd_new_send_channel_async(QIOTask =
*task, gpointer opaque)
     QIOChannel *sioc =3D QIO_CHANNEL(qio_task_get_source(task));
     Error *local_err =3D NULL;
=20
+    trace_multifd_new_send_channel_async(p->id);
     if (qio_task_propagate_error(task, &local_err)) {
         migrate_set_error(migrate_get_current(), local_err);
         multifd_save_cleanup();
@@ -1486,6 +1488,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Erro=
r **errp)
                                 atomic_read(&multifd_recv_state->count))=
;
         return false;
     }
+    trace_multifd_recv_new_channel(id);
=20
     p =3D &multifd_recv_state->params[id];
     if (p->c !=3D NULL) {
diff --git a/migration/trace-events b/migration/trace-events
index 886ce70ca0..00ffcd5930 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -81,14 +81,18 @@ migration_bitmap_sync_start(void) ""
 migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
 migration_bitmap_clear_dirty(char *str, uint64_t start, uint64_t size, u=
nsigned long page) "rb %s start 0x%"PRIx64" size 0x%"PRIx64" page 0x%lx"
 migration_throttle(void) ""
+multifd_new_send_channel_async(uint8_t id) "channel %d"
 multifd_recv(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t fl=
ags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " pages =
%d flags 0x%x next packet size %d"
+multifd_recv_new_channel(uint8_t id) "channel %d"
 multifd_recv_sync_main(long packet_num) "packet num %ld"
 multifd_recv_sync_main_signal(uint8_t id) "channel %d"
 multifd_recv_sync_main_wait(uint8_t id) "channel %d"
 multifd_recv_terminate_threads(bool error) "error %d"
 multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "c=
hannel %d packets %" PRIu64 " pages %" PRIu64
 multifd_recv_thread_start(uint8_t id) "%d"
+multifd_save_setup_wait(uint8_t id) "%d"
 multifd_send(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t fl=
ags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " pages =
%d flags 0x%x next packet size %d"
+multifd_send_error(uint8_t id) "channel %d"
 multifd_send_sync_main(long packet_num) "packet num %ld"
 multifd_send_sync_main_signal(uint8_t id) "channel %d"
 multifd_send_sync_main_wait(uint8_t id) "channel %d"
--=20
2.21.0


