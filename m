Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12C6124187
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 09:22:20 +0100 (CET)
Received: from localhost ([::1]:50952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihUb5-00035A-BB
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 03:22:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35460)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ihUWR-0005wf-G0
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:17:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ihUWP-0002RT-Nw
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:17:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21728
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ihUWP-0002PS-Gb
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576657047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZJeOEY4eRF6InDe+J/5KZHJUaDHGpLvvRpZ4QkLj2o=;
 b=VgD8SM+CT5qUU7x3ZrRX14wMO9tg1NdxubNxW66xoKoVWQxPm1/uwuPNDmkh3bZeZdF4qc
 R4Krk/TbZRBzyNDdTGDmPwTiiQV3e7zxxUFs0h0lGrsBbUYIlAVt6tymb8uDwR7fbHGIIP
 c6RurhdWAUEL78BwFgifAo60hlnNmO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-090fOCR_M5GJXuvH9cJS-Q-1; Wed, 18 Dec 2019 03:17:23 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 049FB801E6C;
 Wed, 18 Dec 2019 08:17:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
 [10.36.116.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7ED05DA32;
 Wed, 18 Dec 2019 08:17:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5765011385FD; Wed, 18 Dec 2019 09:17:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/35] crypto: Fix certificate file error handling crash bug
Date: Wed, 18 Dec 2019 09:16:48 +0100
Message-Id: <20191218081721.23520-3-armbru@redhat.com>
In-Reply-To: <20191218081721.23520-1-armbru@redhat.com>
References: <20191218081721.23520-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 090fOCR_M5GJXuvH9cJS-Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qcrypto_tls_creds_load_cert() passes uninitialized GError *gerr by
reference to g_file_get_contents().  When g_file_get_contents() fails,
it'll try to set a GError.  Unless @gerr is null by dumb luck, this
logs a ERROR_OVERWRITTEN_WARNING warning message and leaves @gerr
unchanged.  qcrypto_tls_creds_load_cert() then dereferences the
uninitialized @gerr.

Fix by initializing @gerr properly.

Fixes: 9a2fd4347c40321f5cbb4ab4220e759fcbf87d03
Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20191204093625.14836-2-armbru@redhat.com>
Acked-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 crypto/tlscredsx509.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index 01fc304e5d..53a4368f49 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -380,7 +380,7 @@ qcrypto_tls_creds_load_cert(QCryptoTLSCredsX509 *creds,
     gnutls_x509_crt_t cert =3D NULL;
     g_autofree char *buf =3D NULL;
     gsize buflen;
-    GError *gerr;
+    GError *gerr =3D NULL;
     int ret =3D -1;
     int err;
=20
--=20
2.21.0


