Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CE79F07E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 18:42:11 +0200 (CEST)
Received: from localhost ([::1]:54040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2eXq-00020t-Tf
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 12:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35133)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i2eR1-0003n9-Ml
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:35:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i2eR0-0000RA-Jn
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:35:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5238)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i2eQw-0000Mk-Nm; Tue, 27 Aug 2019 12:35:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1237C107DD04;
 Tue, 27 Aug 2019 16:35:02 +0000 (UTC)
Received: from localhost (unknown [10.40.205.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B10AA5D6B0;
 Tue, 27 Aug 2019 16:34:57 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 27 Aug 2019 18:34:39 +0200
Message-Id: <20190827163439.16686-7-mreitz@redhat.com>
In-Reply-To: <20190827163439.16686-1-mreitz@redhat.com>
References: <20190827163439.16686-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Tue, 27 Aug 2019 16:35:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 6/6] curl: Check curl_multi_add_handle()'s
 return code
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we had done that all along, debugging would have been much simpler.
(Also, I/O errors are better than hangs.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/curl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/block/curl.c b/block/curl.c
index 5e0cca601d..4a7aff02a6 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -894,7 +894,13 @@ static void curl_setup_preadv(BlockDriverState *bs, =
CURLAIOCB *acb)
     trace_curl_setup_preadv(acb->bytes, start, state->range);
     curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range);
=20
-    curl_multi_add_handle(s->multi, state->curl);
+    if (curl_multi_add_handle(s->multi, state->curl) !=3D CURLM_OK) {
+        state->acb[0] =3D NULL;
+        acb->ret =3D -EIO;
+
+        curl_clean_state(state);
+        goto out;
+    }
=20
     /* Tell curl it needs to kick things off */
     curl_multi_socket_action(s->multi, CURL_SOCKET_TIMEOUT, 0, &running)=
;
--=20
2.21.0


