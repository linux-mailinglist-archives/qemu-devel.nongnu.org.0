Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57F1146946
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 14:38:24 +0100 (CET)
Received: from localhost ([::1]:57139 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iucgh-0005iF-EO
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 08:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40430)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iub8x-0002Cs-F4
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iub8w-000560-9z
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32306
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iub8w-00055w-76
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XaY15sZsWneq0IGhoUPBI3NEwwpuSCn+u24CtPksQRw=;
 b=HrXF8eVNwL7VI0BvMnbIi7NiJL7H4k1sJt2dzqsscbWdYAzpqLCQ4Dc+j+DoBNX4+95IOW
 plLRZF2RmVu/AEIMVraDprOM3msm8R5f/t1CHWVtQFOSIgm5aZL8lxveucwRw7MVgSaIMo
 1LbE5UaJyPseYBQDwiTlKJpp/ZiY4fI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-Jtf0GKvFOIuHK4OvH41Blg-1; Thu, 23 Jan 2020 06:59:24 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ADDE1800D48
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:59:23 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3425D19C69;
 Thu, 23 Jan 2020 11:59:21 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/21] multifd: Use qemu_target_page_size()
Date: Thu, 23 Jan 2020 12:58:24 +0100
Message-Id: <20200123115831.36842-15-quintela@redhat.com>
In-Reply-To: <20200123115831.36842-1-quintela@redhat.com>
References: <20200123115831.36842-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Jtf0GKvFOIuHK4OvH41Blg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will make it cpu independent.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 2783dc60f4..14b7cbdbc9 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -882,14 +882,14 @@ static int multifd_recv_unfill_packet(MultiFDRecvPara=
ms *p, Error **errp)
     for (i =3D 0; i < p->pages->used; i++) {
         uint64_t offset =3D be64_to_cpu(packet->offset[i]);
=20
-        if (offset > (block->used_length - TARGET_PAGE_SIZE)) {
+        if (offset > (block->used_length - qemu_target_page_size())) {
             error_setg(errp, "multifd: offset too long %" PRIu64
                        " (max " RAM_ADDR_FMT ")",
                        offset, block->max_length);
             return -1;
         }
         p->pages->iov[i].iov_base =3D block->host + offset;
-        p->pages->iov[i].iov_len =3D TARGET_PAGE_SIZE;
+        p->pages->iov[i].iov_len =3D qemu_target_page_size();
     }
=20
     return 0;
@@ -964,7 +964,8 @@ static int multifd_send_pages(QEMUFile *f)
     p->packet_num =3D multifd_send_state->packet_num++;
     multifd_send_state->pages =3D p->pages;
     p->pages =3D pages;
-    transferred =3D ((uint64_t) pages->used) * TARGET_PAGE_SIZE + p->packe=
t_len;
+    transferred =3D ((uint64_t) pages->used) * qemu_target_page_size()
+                + p->packet_len;
     qemu_file_update_transfer(f, transferred);
     ram_counters.multifd_bytes +=3D transferred;
     ram_counters.transferred +=3D transferred;;
@@ -985,7 +986,7 @@ static int multifd_queue_page(QEMUFile *f, RAMBlock *bl=
ock, ram_addr_t offset)
     if (pages->block =3D=3D block) {
         pages->offset[pages->used] =3D offset;
         pages->iov[pages->used].iov_base =3D block->host + offset;
-        pages->iov[pages->used].iov_len =3D TARGET_PAGE_SIZE;
+        pages->iov[pages->used].iov_len =3D qemu_target_page_size();
         pages->used++;
=20
         if (pages->used < pages->allocated) {
--=20
2.24.1


