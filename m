Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9077613DF2C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 16:50:01 +0100 (CET)
Received: from localhost ([::1]:44096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is7PE-0006CR-AL
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 10:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35663)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1is7M9-0003jS-AD
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1is7M7-0004VU-Mj
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22964
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1is7M7-0004VG-Iv
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579189607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xDQ2F+CNNWhXYTBTpO6p2YNrFa9rPdWT7aJ/DLw9tE8=;
 b=iQ5MbBwLNcZKPe0LRU3+1Ip220bIk7Xn+9TLqvBnEawl49nwHWj/GmmHD86aU9BWpkHuNR
 nu+0rJqf1u8nLaTcSW4ID4C7F+u6MJCTnmUjApG65C1FteQtRyIjyjCk2Lhy2Pk8/iT+/1
 K866hVQeSU2wFK8zxLVBXoMOuPdChwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-RmL64FbqPuqBsCoUernnzQ-1; Thu, 16 Jan 2020 10:46:44 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0861A802B89
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 15:46:44 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D81165C578;
 Thu, 16 Jan 2020 15:46:36 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] migration: Don't wait in semaphore for thread we know
 has finished
Date: Thu, 16 Jan 2020 16:46:14 +0100
Message-Id: <20200116154616.11569-4-quintela@redhat.com>
In-Reply-To: <20200116154616.11569-1-quintela@redhat.com>
References: <20200116154616.11569-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: RmL64FbqPuqBsCoUernnzQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If p->quit is true for any channel, we know that it has finished for
any reason.  So don't wait for it, just continue.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

I could be convinced that the right thing to do in that case is to
just do a break instead of a continue.  Each option has its own
advantages/disadvantanges.
---
 migration/ram.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 44ca56e1ea..bc918ef28d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1118,6 +1118,12 @@ static void multifd_send_sync_main(RAMState *rs)
         MultiFDSendParams *p =3D &multifd_send_state->params[i];
=20
         trace_multifd_send_sync_main_wait(p->id);
+        qemu_mutex_lock(&p->mutex);
+        if (p->quit) {
+            qemu_mutex_unlock(&p->mutex);
+            continue;
+        }
+        qemu_mutex_unlock(&p->mutex);
         qemu_sem_wait(&p->sem_sync);
     }
     trace_multifd_send_sync_main(multifd_send_state->packet_num);
--=20
2.24.1


