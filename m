Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6A4124F3B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 18:27:28 +0100 (CET)
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihd6d-0006Ad-Bf
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 12:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihd0i-0008Hf-0G
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:21:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihd0g-0001wg-8R
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:21:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48034
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihd0f-0001si-PI
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576689677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y5I5yjLi2lqLk5dGu6+jKIx4tIcuciKPF591w+XQAxw=;
 b=Gt+qurFu8vFETOwj1r9Ftw7IIddjJyGwwfI56nrbrL8RrG5e59IwM+54HGtZvRNKr8QwXP
 ZLp3qtsGE6vFtiz26A8OKQ/ZhiEPhdZ7Dbe90tW/dzbZ0SGv8rrcYmkFblQZiPP0m0xK2G
 lS8D4QIiU096veJxvNIiVN+BL+nv/eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-M7NVhF5oM9qtt7xfwx7OeA-1; Wed, 18 Dec 2019 12:21:13 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EF001005510
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 17:21:13 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75A631001281;
 Wed, 18 Dec 2019 17:21:09 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 08/14] vhost-user-net: Explicit we ignore few
 QEMUChrEvent in IOEventHandler
Date: Wed, 18 Dec 2019 18:20:03 +0100
Message-Id: <20191218172009.8868-9-philmd@redhat.com>
In-Reply-To: <20191218172009.8868-1-philmd@redhat.com>
References: <20191218172009.8868-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: M7NVhF5oM9qtt7xfwx7OeA-1
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
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit all the events ignored by this frontend, to silent the
following GCC warning:

    CC      net/vhost-user.o
  net/vhost-user.c: In function =E2=80=98net_vhost_user_event=E2=80=99:
  net/vhost-user.c:269:5: error: enumeration value =E2=80=98CHR_EVENT_BREAK=
=E2=80=99 not handled in switch [-Werror=3Dswitch]
    269 |     switch (event) {
        |     ^~~~~~
  net/vhost-user.c:269:5: error: enumeration value =E2=80=98CHR_EVENT_MUX_I=
N=E2=80=99 not handled in switch [-Werror=3Dswitch]
  net/vhost-user.c:269:5: error: enumeration value =E2=80=98CHR_EVENT_MUX_O=
UT=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Add all missing enums

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
---
 net/vhost-user.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/vhost-user.c b/net/vhost-user.c
index 014199d600..c54c9c7d4c 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -294,6 +294,11 @@ static void net_vhost_user_event(void *opaque, int eve=
nt)
             aio_bh_schedule_oneshot(ctx, chr_closed_bh, opaque);
         }
         break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
     }
=20
     if (err) {
--=20
2.21.0


