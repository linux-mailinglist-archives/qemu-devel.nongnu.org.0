Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA62614AC30
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 23:39:19 +0100 (CET)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwD2M-0008SJ-Qp
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 17:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iwCxR-0000hQ-En
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 17:34:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iwCxP-0003Z4-K2
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 17:34:13 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21669
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iwCxO-0003Xm-VD
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 17:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580164449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZWLZ/9Drl1Ndf6wNDAF0nVVo0eWBKeNc0DHpOneHn/Q=;
 b=IvEOfLk3kwiDFG1shPgmpNrpv4gj5wJKJJA+P3p9dJRozX6ptVAoBu0x+LhBxJNrYnMUAW
 ohvYd3KXHp2Ge4FLd8lwzW3CdKT2Hfp3pHADEaDosOmb/pGwr87UEV2d6YWH8juDmD3XVa
 2rQnfE8nM9T3O+k/5qJM6PY+JUqJ5KE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-vVxrwen_Oj-j9zV3FqDcGA-1; Mon, 27 Jan 2020 17:34:07 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FB5BDB20
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2020 22:34:07 +0000 (UTC)
Received: from secure.mitica (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59165451D;
 Mon, 27 Jan 2020 22:34:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/19] multifd: Use qemu_target_page_size()
Date: Mon, 27 Jan 2020 23:33:14 +0100
Message-Id: <20200127223321.2742-13-quintela@redhat.com>
In-Reply-To: <20200127223321.2742-1-quintela@redhat.com>
References: <20200127223321.2742-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: vVxrwen_Oj-j9zV3FqDcGA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 152e9cf46d..8f04b5ab3a 100644
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


