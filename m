Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B211B13A473
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 10:53:43 +0100 (CET)
Received: from localhost ([::1]:35590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irItK-0006xD-IG
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 04:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irIVI-000820-Ut
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:28:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irIVH-0006oQ-OR
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:28:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47152
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irIVH-0006o7-Kx
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Um/ZPRrwSgEty2GoCR0h//BX2713mBeYZe2pvS7jfVI=;
 b=TlJpu9cIABZ4gMkFo11H7WmwvA9lghbxEH0vYrEA/Tf10SlqhtUnPmnzXWELlaDQrCFiCV
 W5DIK3re/glLpGtdug7BJDx6IDwF64QbG1iEUvsZx0pcFGAtgRPfGILl5hFrGH+n6XMzSH
 L14dCiPzvW3X4HZsMUuEqbK73VEzGdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-LHF_uLpOP86BrHrZ4b1_BQ-1; Tue, 14 Jan 2020 04:28:50 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2FFB10054E3;
 Tue, 14 Jan 2020 09:28:47 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63FBF384;
 Tue, 14 Jan 2020 09:28:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/29] migration/multifd: clean pages after filling packet
Date: Tue, 14 Jan 2020 10:25:58 +0100
Message-Id: <20200114092606.1761-22-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: LHF_uLpOP86BrHrZ4b1_BQ-1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

This is a preparation for the next patch:

    not use multifd during postcopy.

Without enabling postcopy, everything looks good. While after enabling
postcopy, migration may fail even not use multifd during postcopy. The
reason is the pages is not properly cleared and *old* target page will
continue to be transferred.

After clean pages, migration succeeds.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5f20c3d15d..a05448c0c9 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -955,10 +955,10 @@ static int multifd_send_pages(RAMState *rs)
         }
         qemu_mutex_unlock(&p->mutex);
     }
-    p->pages->used =3D 0;
+    assert(!p->pages->used);
+    assert(!p->pages->block);
=20
     p->packet_num =3D multifd_send_state->packet_num++;
-    p->pages->block =3D NULL;
     multifd_send_state->pages =3D p->pages;
     p->pages =3D pages;
     transferred =3D ((uint64_t) pages->used) * TARGET_PAGE_SIZE + p->packe=
t_len;
@@ -1154,6 +1154,8 @@ static void *multifd_send_thread(void *opaque)
             p->flags =3D 0;
             p->num_packets++;
             p->num_pages +=3D used;
+            p->pages->used =3D 0;
+            p->pages->block =3D NULL;
             qemu_mutex_unlock(&p->mutex);
=20
             trace_multifd_send(p->id, packet_num, used, flags,
--=20
2.24.1


