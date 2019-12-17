Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525161224AC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 07:29:08 +0100 (CET)
Received: from localhost ([::1]:36600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih6Lz-0002Z3-1Q
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 01:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48755)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ih6Jv-0000hk-8f
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 01:27:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ih6Jt-0000dt-AA
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 01:26:58 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52274
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ih6Jt-0000ZG-6L
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 01:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576564016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZJeOEY4eRF6InDe+J/5KZHJUaDHGpLvvRpZ4QkLj2o=;
 b=LCIR6jyztGSJ2xY/QYQUUEr89odUi1YK7//xtXppR6msSitEGUlaorfqC5rp8Qn8yd1Vsy
 qDieg9pAGOzsn5A2Pk5Uo+eQFoK+2ePNVsZ8pRn7QPPFHrp7j2bF01r6oPv4qmMeaQQIdD
 5+Uw1G7RiKh8UEHCFgn+fCJTRBo6XwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-WRZoeqMqOtyIdMflYMRbsg-1; Tue, 17 Dec 2019 01:26:54 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36D40107ACC5;
 Tue, 17 Dec 2019 06:26:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
 [10.36.116.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7D3F10016DA;
 Tue, 17 Dec 2019 06:26:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 48C9E11385FD; Tue, 17 Dec 2019 07:26:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/34] crypto: Fix certificate file error handling crash bug
Date: Tue, 17 Dec 2019 07:26:19 +0100
Message-Id: <20191217062651.9687-3-armbru@redhat.com>
In-Reply-To: <20191217062651.9687-1-armbru@redhat.com>
References: <20191217062651.9687-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: WRZoeqMqOtyIdMflYMRbsg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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


