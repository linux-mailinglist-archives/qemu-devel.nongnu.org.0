Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF7BD486A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 21:26:52 +0200 (CEST)
Received: from localhost ([::1]:56230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJ0Yt-0003Le-9j
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 15:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37739)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iJ0Pz-0000y6-Tt
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iJ0Pz-00046r-0U
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37770)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iJ0Py-00045Y-OL
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:38 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F19D9801661;
 Fri, 11 Oct 2019 19:17:37 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-210.ams2.redhat.com
 [10.36.117.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7B685D6C8;
 Fri, 11 Oct 2019 19:17:36 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, eric.auger@redhat.com,
 richardw.yang@linux.intel.com
Subject: [PULL 20/21] migration/multifd: pages->used would be cleared when
 attach to multifd_send_state
Date: Fri, 11 Oct 2019 20:16:45 +0100
Message-Id: <20191011191646.226814-21-dgilbert@redhat.com>
In-Reply-To: <20191011191646.226814-1-dgilbert@redhat.com>
References: <20191011191646.226814-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 11 Oct 2019 19:17:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

When we found an available channel in multifd_send_pages(), its
pages->used is cleared and then attached to multifd_send_state.

It is not necessary to do this twice.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20191011085050.17622-5-richardw.yang@linux.intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 963e795ed0..5078f94490 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1129,7 +1129,6 @@ static void *multifd_send_thread(void *opaque)
             p->flags =3D 0;
             p->num_packets++;
             p->num_pages +=3D used;
-            p->pages->used =3D 0;
             qemu_mutex_unlock(&p->mutex);
=20
             trace_multifd_send(p->id, packet_num, used, flags,
--=20
2.23.0


