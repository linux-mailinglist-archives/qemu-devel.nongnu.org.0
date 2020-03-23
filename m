Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AEC18F412
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 13:09:22 +0100 (CET)
Received: from localhost ([::1]:32904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGLtR-0007tu-Vw
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 08:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47372)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jGLsf-0007U4-Tr
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 08:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1jGLse-0006Kc-Ac
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 08:08:33 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:51133)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1jGLse-0006K9-76
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 08:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584965311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tn0YDO6s5fzaR91a6zAUH+06bx8vCyLORsBUbR5pXik=;
 b=RqKVZ5zeK8Rx1SE3pt4q9PYcUwwWMVBH4XrG32wT/wKgvc5sdCuLMdvvsAeWYGespq1qzz
 UaUtCmAJhhz6S2RA7/pLOTYZbyOXOckpd/WyKYh1lKH0bLrUPurfLQFOEtzI6BR6ekkM8q
 Ydog5FESUW2xOeWNrgNVkUIllPsKllo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-OAQxxPWhNwa1AYnX5oyNdA-1; Mon, 23 Mar 2020 08:08:29 -0400
X-MC-Unique: OAQxxPWhNwa1AYnX5oyNdA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75FDE8017CE;
 Mon, 23 Mar 2020 12:08:28 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-29.ams2.redhat.com
 [10.36.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 240A55C1B2;
 Mon, 23 Mar 2020 12:08:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH] hmp/vnc: Fix info vnc list leak
Date: Mon, 23 Mar 2020 12:08:22 +0000
Message-Id: <20200323120822.51266-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

We're iterating the list, and then freeing the iteration pointer rather
than the list head.

Fixes: 0a9667ecdb6d ("hmp: Update info vnc")
Reported-by: Coverity (CID 1421932)
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor/hmp-cmds.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index a00248527c..1d473e809c 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -527,10 +527,11 @@ static void hmp_info_vnc_servers(Monitor *mon, VncSer=
verInfo2List *server)
=20
 void hmp_info_vnc(Monitor *mon, const QDict *qdict)
 {
-    VncInfo2List *info2l;
+    VncInfo2List *info2l, *info2l_head;
     Error *err =3D NULL;
=20
     info2l =3D qmp_query_vnc_servers(&err);
+    info2l_head =3D info2l;
     if (err) {
         hmp_handle_error(mon, err);
         return;
@@ -559,7 +560,7 @@ void hmp_info_vnc(Monitor *mon, const QDict *qdict)
         info2l =3D info2l->next;
     }
=20
-    qapi_free_VncInfo2List(info2l);
+    qapi_free_VncInfo2List(info2l_head);
=20
 }
 #endif
--=20
2.25.1


