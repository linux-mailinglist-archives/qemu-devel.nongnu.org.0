Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB35140BDB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 14:58:37 +0100 (CET)
Received: from localhost ([::1]:57838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isS8y-0004zR-SW
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 08:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52461)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1isS7G-0003YV-1g
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:56:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1isS7E-0003DV-0E
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:56:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38920
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1isS7A-0003Ah-BU
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579269404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+bKyPIQWhOO71KKh1bT7OXMYY9Ybu7q8EmMYgaLJQc4=;
 b=d5510p+os1h3Teesd1xeSJQBqwFC7H6FXlplVPS6iWcMTY9DNoJv+66UJB/9k/jcD98ixz
 SfwUuzT9Z0O9/qVW5jGdC33EfmbhW1mhMpOfVpsoPok1UmiYdVEtBajdfTN93G/DfX6rs1
 c7K8XLIs14cZdMDoqSnB1yvHGn8sYJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-go508V8tNEuVf7CD2vFKbQ-1; Fri, 17 Jan 2020 08:56:42 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78F69DBA5
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 13:56:41 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 865BF60F82;
 Fri, 17 Jan 2020 13:56:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] multifd: Be consistente about using uint64_t
Date: Fri, 17 Jan 2020 14:56:39 +0100
Message-Id: <20200117135639.14602-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: go508V8tNEuVf7CD2vFKbQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We transmit ram_addr_t always as uint64_t.  Be consistent in its
use (on 64bit system, it is always uint64_t problem is 32bits).

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 96feb4062c..f7482b1b35 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -803,7 +803,10 @@ static void multifd_send_fill_packet(MultiFDSendParams=
 *p)
     }
=20
     for (i =3D 0; i < p->pages->used; i++) {
-        packet->offset[i] =3D cpu_to_be64(p->pages->offset[i]);
+        /* there are architectures where ram_addr_t is 32 bit */
+        uint64_t temp =3D p->pages->offset[i];
+
+        packet->offset[i] =3D cpu_to_be64(temp);
     }
 }
=20
@@ -877,10 +880,10 @@ static int multifd_recv_unfill_packet(MultiFDRecvPara=
ms *p, Error **errp)
     }
=20
     for (i =3D 0; i < p->pages->used; i++) {
-        ram_addr_t offset =3D be64_to_cpu(packet->offset[i]);
+        uint64_t offset =3D be64_to_cpu(packet->offset[i]);
=20
         if (offset > (block->used_length - TARGET_PAGE_SIZE)) {
-            error_setg(errp, "multifd: offset too long " RAM_ADDR_FMT
+            error_setg(errp, "multifd: offset too long %" PRId64
                        " (max " RAM_ADDR_FMT ")",
                        offset, block->max_length);
             return -1;
@@ -1236,7 +1239,7 @@ int multifd_save_setup(void)
         p->id =3D i;
         p->pages =3D multifd_pages_init(page_count);
         p->packet_len =3D sizeof(MultiFDPacket_t)
-                      + sizeof(ram_addr_t) * page_count;
+                      + sizeof(uint64_t) * page_count;
         p->packet =3D g_malloc0(p->packet_len);
         p->packet->magic =3D cpu_to_be32(MULTIFD_MAGIC);
         p->packet->version =3D cpu_to_be32(MULTIFD_VERSION);
@@ -1447,7 +1450,7 @@ int multifd_load_setup(void)
         p->id =3D i;
         p->pages =3D multifd_pages_init(page_count);
         p->packet_len =3D sizeof(MultiFDPacket_t)
-                      + sizeof(ram_addr_t) * page_count;
+                      + sizeof(uint64_t) * page_count;
         p->packet =3D g_malloc0(p->packet_len);
         p->name =3D g_strdup_printf("multifdrecv_%d", i);
     }
--=20
2.24.1


