Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5AB124F58
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 18:31:47 +0100 (CET)
Received: from localhost ([::1]:58300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihdAo-000346-Jw
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 12:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihd0X-000803-9m
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:21:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihd0V-00013w-Tn
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:21:09 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:21209
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihd0V-00010O-MN
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576689667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDqio0xiAFXo/Gi21+yp1UJm9tLT+EmeqrNxy9ay1tU=;
 b=b1qGOmsl4vrexLXovRcgHDQSHpT2HVAQa5kQyDEzl37AGrPewsHsSS1Fpa22mWvoYtLiwT
 hdDdswiAWy00g2wolcxjvHrJQM/OG0aur2NDav5zWwFpbvKUndp7rWgEuK29td5yEX/b2R
 /rhH10i5sqErwX68nF2042D70syMlG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-aHFrzBwbNaGFNhbFEgkjGQ-1; Wed, 18 Dec 2019 12:21:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C058107ACC5
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 17:21:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EBE91001B00;
 Wed, 18 Dec 2019 17:21:01 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 05/14] hw/usb/redirect: Explicit we ignore few
 QEMUChrEvent in IOEventHandler
Date: Wed, 18 Dec 2019 18:20:00 +0100
Message-Id: <20191218172009.8868-6-philmd@redhat.com>
In-Reply-To: <20191218172009.8868-1-philmd@redhat.com>
References: <20191218172009.8868-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: aHFrzBwbNaGFNhbFEgkjGQ-1
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit all the events ignored by this frontend, to silent the
following GCC warning:

    CC      hw/usb/redirect.o
  hw/usb/redirect.c: In function =E2=80=98usbredir_chardev_event=E2=80=99:
  hw/usb/redirect.c:1361:5: error: enumeration value =E2=80=98CHR_EVENT_BRE=
AK=E2=80=99 not handled in switch [-Werror=3Dswitch]
   1361 |     switch (event) {
        |     ^~~~~~
  hw/usb/redirect.c:1361:5: error: enumeration value =E2=80=98CHR_EVENT_MUX=
_IN=E2=80=99 not handled in switch [-Werror=3Dswitch]
  hw/usb/redirect.c:1361:5: error: enumeration value =E2=80=98CHR_EVENT_MUX=
_OUT=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Add all missing enums

Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/redirect.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index e0f5ca6f81..ddc1a59cb4 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -1370,6 +1370,11 @@ static void usbredir_chardev_event(void *opaque, int=
 event)
         DPRINTF("chardev close\n");
         qemu_bh_schedule(dev->chardev_close_bh);
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


