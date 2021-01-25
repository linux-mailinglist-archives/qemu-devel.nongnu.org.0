Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8A7302473
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 12:50:11 +0100 (CET)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40Nm-00044V-3U
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 06:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l40Ij-0007lc-6v
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:44:57 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:20631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l40Ig-0007KY-GL
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:44:56 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-NRf-jST9NBC8ds2bRiulcQ-1; Mon, 25 Jan 2021 06:44:49 -0500
X-MC-Unique: NRf-jST9NBC8ds2bRiulcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8178A107ACF6;
 Mon, 25 Jan 2021 11:44:48 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83A9F5D9D7;
 Mon, 25 Jan 2021 11:44:47 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] 9pfs: Convert V9fsFidState::clunked to bool
Date: Mon, 25 Jan 2021 12:44:40 +0100
Message-Id: <20210125114443.933857-3-groug@kaod.org>
In-Reply-To: <20210125114443.933857-1-groug@kaod.org>
References: <20210125114443.933857-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can only be 0 or 1.

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <20210118142300.801516-2-groug@kaod.org>
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


