Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381FEF38B3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 20:35:14 +0100 (CET)
Received: from localhost ([::1]:47646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSnYn-000635-3S
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 14:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49973)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iSnS9-0001TM-K5
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 14:28:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iSnS8-0000DR-N2
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 14:28:21 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56868
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iSnS8-0000D3-Ja
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 14:28:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573154899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=beU4vFS75DQxJnwJWlGlrCxUCCfEj1fKrvK5Zq90pnU=;
 b=fte1GIoFtvs1Lk4hFMgn7AfdvnjjGob/0E1r6H+OFhBKVUC3jLzNZ11qv9aNl2JklKiV+7
 EQYuUokr5Rf7jR9+c145cr+kyo35eDCrwnR//TiIuAMKpvIAuvf7Fn3i6OaMm1fiipp+Zs
 E/aaD6xYmL+9Vpe8KpFyQz8a0mkdHpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-qWX8aI3bO-OIsLAgEVei-g-1; Thu, 07 Nov 2019 14:28:17 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80820107ACC3
 for <qemu-devel@nongnu.org>; Thu,  7 Nov 2019 19:28:16 +0000 (UTC)
Received: from localhost (ovpn-112-60.ams2.redhat.com [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07CAD608B4;
 Thu,  7 Nov 2019 19:28:04 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] qtest: fix qtest_qmp_device_add leak
Date: Thu,  7 Nov 2019 23:27:30 +0400
Message-Id: <20191107192731.17330-3-marcandre.lureau@redhat.com>
In-Reply-To: <20191107192731.17330-1-marcandre.lureau@redhat.com>
References: <20191107192731.17330-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: qWX8aI3bO-OIsLAgEVei-g-1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Spotted by ASAN.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 tests/libqtest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/libqtest.c b/tests/libqtest.c
index 3706bccd8d..91e9cb220c 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -1274,6 +1274,7 @@ void qtest_qmp_device_add(QTestState *qts, const char=
 *driver, const char *id,
     qdict_put_str(args, "id", id);
=20
     qtest_qmp_device_add_qdict(qts, driver, args);
+    qobject_unref(args);
 }
=20
 static void device_deleted_cb(void *opaque, const char *name, QDict *data)
--=20
2.24.0.rc0.20.gd81542e6f3


