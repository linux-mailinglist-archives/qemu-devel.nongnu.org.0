Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5506710EC4D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 16:29:37 +0100 (CET)
Received: from localhost ([::1]:37445 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibndn-00082q-Uy
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 10:29:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46283)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ibncJ-0006cy-Mb
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:28:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ibncH-0002Hc-Ky
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:28:03 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60924
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ibncF-0002Ex-Of
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575300477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNuI1Lg6PUcU0g7g48qRrIfBTSi72AXKORyODJL3r7w=;
 b=NNkLy9qDz8gYvbY/Z8CPR3BJUPQutvpuEwbiAb5wRE545DOX7qBZTcwZWu3hLSZt3zEvLM
 Gt0joCSgHFVmREeebX6rsOcCz6T/ITWSQHtKO2ViGexbBlOpIZvxt4SXtf/55xUqmndCho
 Sp9muESskKFPJaN6b/LMYnFu4KenDI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-zJoXIhVWPNe4VFAjnwyjZg-1; Mon, 02 Dec 2019 10:27:54 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C16B100F607;
 Mon,  2 Dec 2019 15:27:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96DA35DA32;
 Mon,  2 Dec 2019 15:27:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 279EC11366CF; Mon,  2 Dec 2019 16:27:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-4.2 3/3] block/file-posix: Fix laio_init() error handling
 crash bug
Date: Mon,  2 Dec 2019 16:27:46 +0100
Message-Id: <20191202152746.32292-4-armbru@redhat.com>
In-Reply-To: <20191202152746.32292-1-armbru@redhat.com>
References: <20191202152746.32292-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: zJoXIhVWPNe4VFAjnwyjZg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Nishanth Aravamudan <naravamudan@digitalocean.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

raw_aio_attach_aio_context() passes uninitialized Error *local_err by
reference to laio_init() via aio_setup_linux_aio().  When laio_init()
fails, it passes it on to error_setg_errno(), tripping error_setv()'s
assertion unless @local_err is null by dumb luck.

Fix by initializing @local_err properly.

Fixes: ed6e2161715c527330f936d44af4c547f25f687e
Cc: Nishanth Aravamudan <naravamudan@digitalocean.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20191130194240.10517-4-armbru@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 1f0f61a02b..1b805bd938 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1973,7 +1973,7 @@ static void raw_aio_attach_aio_context(BlockDriverSta=
te *bs,
 #ifdef CONFIG_LINUX_AIO
     BDRVRawState *s =3D bs->opaque;
     if (s->use_linux_aio) {
-        Error *local_err;
+        Error *local_err =3D NULL;
         if (!aio_setup_linux_aio(new_context, &local_err)) {
             error_reportf_err(local_err, "Unable to use native AIO, "
                                          "falling back to thread pool: ");
--=20
2.21.0


