Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C767914AC32
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 23:39:31 +0100 (CET)
Received: from localhost ([::1]:51812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwD2Y-0000Yt-Lc
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 17:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iwCxN-0000em-T2
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 17:34:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iwCxL-0003U1-0E
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 17:34:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59265
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iwCxK-0003Tc-RV
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 17:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580164446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MME6TgSV0RHAZv34MLeNAsm4siCsSWu4ch3j9XF0mMg=;
 b=NqmSPgesAiGK5HZ2gyErkMALkMswqPlj+kRDSfComs8VRcaDv0Q7vRw4W5E7zHt/lEumIZ
 OyRbGX+dBZ1NDGRYU5lfT1q5tMN2j/aAEKol75VtGx7E5pxtf/urc0qlkspOmGGISpCs1P
 RHbV4t26TVM7uTJ9dX79qHigQMEgMxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-2Z8pnJvkPAOxtLfZIP2mdw-1; Mon, 27 Jan 2020 17:34:02 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02B618017CC
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2020 22:34:02 +0000 (UTC)
Received: from secure.mitica (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD8CC165D3;
 Mon, 27 Jan 2020 22:33:59 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/19] multifd: multifd_send_sync_main only needs the qemufile
Date: Mon, 27 Jan 2020 23:33:13 +0100
Message-Id: <20200127223321.2742-12-quintela@redhat.com>
In-Reply-To: <20200127223321.2742-1-quintela@redhat.com>
References: <20200127223321.2742-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 2Z8pnJvkPAOxtLfZIP2mdw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index ad9cc3e7bd..152e9cf46d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1082,7 +1082,7 @@ void multifd_save_cleanup(void)
     multifd_send_state =3D NULL;
 }
=20
-static void multifd_send_sync_main(RAMState *rs)
+static void multifd_send_sync_main(QEMUFile *f)
 {
     int i;
=20
@@ -1090,7 +1090,7 @@ static void multifd_send_sync_main(RAMState *rs)
         return;
     }
     if (multifd_send_state->pages->used) {
-        if (multifd_send_pages(rs->f) < 0) {
+        if (multifd_send_pages(f) < 0) {
             error_report("%s: multifd_send_pages fail", __func__);
             return;
         }
@@ -1111,7 +1111,7 @@ static void multifd_send_sync_main(RAMState *rs)
         p->packet_num =3D multifd_send_state->packet_num++;
         p->flags |=3D MULTIFD_FLAG_SYNC;
         p->pending_job++;
-        qemu_file_update_transfer(rs->f, p->packet_len);
+        qemu_file_update_transfer(f, p->packet_len);
         ram_counters.multifd_bytes +=3D p->packet_len;
         ram_counters.transferred +=3D p->packet_len;
         qemu_mutex_unlock(&p->mutex);
@@ -3434,7 +3434,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
=20
-    multifd_send_sync_main(*rsp);
+    multifd_send_sync_main(f);
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
=20
@@ -3534,7 +3534,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque=
)
 out:
     if (ret >=3D 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        multifd_send_sync_main(rs);
+        multifd_send_sync_main(rs->f);
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
         qemu_fflush(f);
         ram_counters.transferred +=3D 8;
@@ -3593,7 +3593,7 @@ static int ram_save_complete(QEMUFile *f, void *opaqu=
e)
     }
=20
     if (ret >=3D 0) {
-        multifd_send_sync_main(rs);
+        multifd_send_sync_main(rs->f);
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
         qemu_fflush(f);
     }
--=20
2.24.1


