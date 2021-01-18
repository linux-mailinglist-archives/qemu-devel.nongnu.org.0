Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848202FA2EF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 15:26:13 +0100 (CET)
Received: from localhost ([::1]:33644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1VTw-0004Th-Jp
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 09:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l1VR1-00026H-N4
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:23:13 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:59286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l1VR0-00021J-Ae
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:23:11 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-fAHfTI_hOyGCPcgwI0cYHg-1; Mon, 18 Jan 2021 09:23:05 -0500
X-MC-Unique: fAHfTI_hOyGCPcgwI0cYHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10AB68144E3;
 Mon, 18 Jan 2021 14:23:04 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2717260861;
 Mon, 18 Jan 2021 14:23:02 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] 9pfs: Convert V9fsFidState::clunked to bool
Date: Mon, 18 Jan 2021 15:22:58 +0100
Message-Id: <20210118142300.801516-2-groug@kaod.org>
In-Reply-To: <20210118142300.801516-1-groug@kaod.org>
References: <20210118142300.801516-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can only be 0 or 1.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/9pfs/9p.c | 4 ++--
 hw/9pfs/9p.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 6026b51a1c04..37c3379b7462 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -413,7 +413,7 @@ static V9fsFidState *clunk_fid(V9fsState *s, int32_t fi=
d)
     }
     fidp =3D *fidpp;
     *fidpp =3D fidp->next;
-    fidp->clunked =3D 1;
+    fidp->clunked =3D true;
     return fidp;
 }
=20
@@ -544,7 +544,7 @@ static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
=20
         /* Clunk fid */
         s->fid_list =3D fidp->next;
-        fidp->clunked =3D 1;
+        fidp->clunked =3D true;
=20
         put_fid(pdu, fidp);
     }
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 32df81f360ea..93656323d1d7 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -279,7 +279,7 @@ struct V9fsFidState {
     int open_flags;
     uid_t uid;
     int ref;
-    int clunked;
+    bool clunked;
     V9fsFidState *next;
     V9fsFidState *rclm_lst;
 };
--=20
2.26.2


