Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E999713B224
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 19:31:06 +0100 (CET)
Received: from localhost ([::1]:44532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irQy1-0007dE-HH
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 13:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54379)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1irQv2-0005II-HI
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 13:28:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1irQv1-0004sm-IF
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 13:28:00 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30848
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1irQv1-0004sS-EK
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 13:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579026478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=svotTECI5zrSZmuvFDCvoQ7OyS3LuOvNA4K0YneyOdQ=;
 b=GgpfRqWjM/Wxrnh2THLQi4u81aBuTUwu9RzqBkFfnYzifLnFazFN3ojVR6lzNsLih4kMRG
 AU9PwJYoXABfWK+4nMf7SGGgPnOl1gzt2bcer8Z8Q2Uu04VnqF9ER9Pg34F3EEAfEbIEsL
 vO/GxNifEAj8W8vDV1K6G8Ey+woc8Aw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-uBHbR-HYN7eBQFW9h_1r2g-1; Tue, 14 Jan 2020 13:27:55 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE36C477;
 Tue, 14 Jan 2020 18:27:54 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-253.ams2.redhat.com
 [10.36.116.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52E615C1D6;
 Tue, 14 Jan 2020 18:27:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] block: Mark 'block_resize' as coroutine
Date: Tue, 14 Jan 2020 19:27:35 +0100
Message-Id: <20200114182735.5553-5-kwolf@redhat.com>
In-Reply-To: <20200114182735.5553-1-kwolf@redhat.com>
References: <20200114182735.5553-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: uBHbR-HYN7eBQFW9h_1r2g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, armbru@redhat.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

block_resize is safe to run in a coroutine, so use it as an example for
the new 'coroutine': true annotation in the QAPI schema.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 qapi/block-core.json | 3 ++-
 blockdev.c           | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 7ff5e5edaf..1dbb2a9901 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1341,7 +1341,8 @@
 { 'command': 'block_resize',
   'data': { '*device': 'str',
             '*node-name': 'str',
-            'size': 'int' } }
+            'size': 'int' },
+  'coroutine': true }
=20
 ##
 # @NewImageMode:
diff --git a/blockdev.c b/blockdev.c
index 8e029e9c01..b5e5d1e072 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3161,9 +3161,9 @@ void hmp_drive_del(Monitor *mon, const QDict *qdict)
     aio_context_release(aio_context);
 }
=20
-void qmp_block_resize(bool has_device, const char *device,
-                      bool has_node_name, const char *node_name,
-                      int64_t size, Error **errp)
+void coroutine_fn qmp_block_resize(bool has_device, const char *device,
+                                   bool has_node_name, const char *node_na=
me,
+                                   int64_t size, Error **errp)
 {
     Error *local_err =3D NULL;
     BlockBackend *blk =3D NULL;
--=20
2.20.1


