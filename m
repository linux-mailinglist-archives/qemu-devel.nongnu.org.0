Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E6E1232CB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 17:44:21 +0100 (CET)
Received: from localhost ([::1]:43172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihFxM-0003Bo-E6
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 11:44:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihFtU-00079d-2s
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 11:40:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihFtS-00023J-Pc
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 11:40:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54078
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihFtS-0001zs-LQ
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 11:40:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576600815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyNiSII4bECQvnQNLsrJWX7wCLrL6i3l3plxAAkIibg=;
 b=FvSrI5jNcjscxO87wz5nSL9+5BF+au2w3g7N+VM9pleU5g0say2m65rOv3ODiOyCPH5/mC
 cVbkJgRvJXJzlqx1EerMd3oXyQVzXjfh8Fodi8jkZqz8b/D1u5SqpSA1koMpA1dtqslWNB
 zIyFj6ZCcTBPKxiOzB1oJnBqgcWcVsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-XjCk825XO-Sq4YcNnMKgDA-1; Tue, 17 Dec 2019 11:40:13 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA5E8800EBF;
 Tue, 17 Dec 2019 16:40:08 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22850675B0;
 Tue, 17 Dec 2019 16:39:41 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Subject: [RFC PATCH 03/14] vhost-user: Explicit we ignore some QEMUChrEvent in
 IOEventHandler
Date: Tue, 17 Dec 2019 17:37:57 +0100
Message-Id: <20191217163808.20068-4-philmd@redhat.com>
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
References: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: XjCk825XO-Sq4YcNnMKgDA-1
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Paul Burton <pburton@wavecomp.com>,
 Jason Wang <jasowang@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alberto Garcia <berto@igalia.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Joel Stanley <joel@jms.id.au>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-riscv@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit when frontends ignore some events, to silent GCC the
following warnings:

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
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
---
 backends/cryptodev-vhost-user.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-use=
r.c
index b344283940..d700934a0e 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -171,6 +171,9 @@ static void cryptodev_vhost_user_event(void *opaque, in=
t event)
         b->ready =3D false;
         cryptodev_vhost_user_stop(queues, s);
         break;
+    default:
+        /* Ignore */
+        break;
     }
 }
=20
--=20
2.21.0


