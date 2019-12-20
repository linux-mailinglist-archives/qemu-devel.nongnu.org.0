Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B956127C2B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 15:02:34 +0100 (CET)
Received: from localhost ([::1]:56374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiIrQ-0001JG-Vy
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 09:02:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35183)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIgH-0001JZ-If
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:51:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIgG-0002oR-F5
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:51:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20374
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iiIgG-0002m8-57
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:51:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576849858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dfuYN8YWmN5oz0foLzHhOai8L2U2g3A3C5ZN+e389jI=;
 b=PYP1iREkNgLQDDEtyNZ44sZXo3PZUnkuDLOIULBsl5uGyxC8oFdnMOFhow3cWFOgJuu2aR
 c6M0GPQA4LDaFRDLlW1kz2DPwASuQORihXTti9QnF34/UJKY/nv4M4+0Ga0Zb1uEOEcGai
 AaJmUR13/S21eCxnqIrB4jvsldYxtqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-nc_6oMnWNSKUdnTHjFVr8g-1; Fri, 20 Dec 2019 08:50:55 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 258C9113787B;
 Fri, 20 Dec 2019 13:50:54 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C5C16B566;
 Fri, 20 Dec 2019 13:50:50 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 28/37] qdev: use g_strcmp0() instead of open-coding it
Date: Fri, 20 Dec 2019 17:45:52 +0400
Message-Id: <20191220134601.571905-29-marcandre.lureau@redhat.com>
In-Reply-To: <20191220134601.571905-1-marcandre.lureau@redhat.com>
References: <20191220134601.571905-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: nc_6oMnWNSKUdnTHjFVr8g-1
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Minor code simplification.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/core/qdev.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 82d3ee590a..98e786c50f 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -394,11 +394,8 @@ static NamedGPIOList *qdev_get_named_gpio_list(DeviceS=
tate *dev,
     NamedGPIOList *ngl;
=20
     QLIST_FOREACH(ngl, &dev->gpios, node) {
-        /* NULL is a valid and matchable name, otherwise do a normal
-         * strcmp match.
-         */
-        if ((!ngl->name && !name) ||
-                (name && ngl->name && strcmp(name, ngl->name) =3D=3D 0)) {
+        /* NULL is a valid and matchable name. */
+        if (g_strcmp0(name, ngl->name) =3D=3D 0) {
             return ngl;
         }
     }
--=20
2.24.0.308.g228f53135a


