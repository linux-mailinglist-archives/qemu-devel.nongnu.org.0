Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A5C124F39
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 18:27:15 +0100 (CET)
Received: from localhost ([::1]:58224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihd6Q-0005n7-Am
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 12:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39996)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihd0b-00086q-Cy
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:21:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihd0a-0001Pg-7P
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:21:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31975
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihd0Z-0001MV-Ph
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:21:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576689671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eNNR2GX+QGc0fgt9VdwTFNCLM6z7ykoh5rit7OIAM0=;
 b=RkcCWVcXyaK2wItDD8g+/CE/VZ/i5iPWf2oxNnxYLMJLemMakHWOPXFpFbkX5IcvjTsVrs
 iyz4GdlkqHQusrTAyDidcd+vBz/p7cpUHBELbwJyoVS9o6rRG0uAOQEqufeRMMrsdYFifW
 QrGAX64QP+pG1Zm5TLQsP591srABtwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-1U48ji7rNgOJjoWqoklmsw-1; Wed, 18 Dec 2019 12:21:10 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CA7A1083E44;
 Wed, 18 Dec 2019 17:21:09 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBAF81000322;
 Wed, 18 Dec 2019 17:21:07 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 07/14] vhost-user-crypto: Explicit we ignore some
 QEMUChrEvent in IOEventHandler
Date: Wed, 18 Dec 2019 18:20:02 +0100
Message-Id: <20191218172009.8868-8-philmd@redhat.com>
In-Reply-To: <20191218172009.8868-1-philmd@redhat.com>
References: <20191218172009.8868-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 1U48ji7rNgOJjoWqoklmsw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit all the events ignored by this frontend, to silent the
following GCC warning:

    CC      backends/cryptodev-vhost-user.o
  backends/cryptodev-vhost-user.c: In function =E2=80=98cryptodev_vhost_use=
r_event=E2=80=99:
  backends/cryptodev-vhost-user.c:163:5: error: enumeration value =E2=80=98=
CHR_EVENT_BREAK=E2=80=99 not handled in switch [-Werror=3Dswitch]
    163 |     switch (event) {
        |     ^~~~~~
  backends/cryptodev-vhost-user.c:163:5: error: enumeration value =E2=80=98=
CHR_EVENT_MUX_IN=E2=80=99 not handled in switch [-Werror=3Dswitch]
  backends/cryptodev-vhost-user.c:163:5: error: enumeration value =E2=80=98=
CHR_EVENT_MUX_OUT=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Add all missing enums

Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
---
 backends/cryptodev-vhost-user.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-use=
r.c
index b344283940..f1b407955f 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -171,6 +171,11 @@ static void cryptodev_vhost_user_event(void *opaque, i=
nt event)
         b->ready =3D false;
         cryptodev_vhost_user_stop(queues, s);
         break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
     }
 }
=20
--=20
2.21.0


