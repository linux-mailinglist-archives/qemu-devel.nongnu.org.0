Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2327A132A00
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:26:30 +0100 (CET)
Received: from localhost ([::1]:51435 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqkW-0000Vc-Mb
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54785)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqR0-0000PM-BP
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:06:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqQz-0003PQ-6p
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:06:18 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25308
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ioqQz-0003Ou-3G
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:06:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578409576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sy498CCSZFG73WzTylAVMt95zMKPnxFBTVB1SeHxZ1Q=;
 b=S79wJ5tVILKkmo78AqyXRoOUtpMeUWLqzsqo/Bjjxu6yaMykaiBHlBOPTITA+n1l5V23rp
 jL9YFwMVREAk3Q2kKXIAWhLN9+83nc5fmYL1Aqay21MSqIeLgDsawlVrtbL0I8kT+HEYF+
 hPaPveK8VoJFO6nkRUZfDe9aBRLYZzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-3sq-UK34PhmyTOikkB3ENQ-1; Tue, 07 Jan 2020 10:06:13 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B0CF10054E3;
 Tue,  7 Jan 2020 15:06:12 +0000 (UTC)
Received: from localhost (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0001A85F13;
 Tue,  7 Jan 2020 15:06:05 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/37] serial: register vmsd with DeviceClass
Date: Tue,  7 Jan 2020 19:04:12 +0400
Message-Id: <20200107150442.1727958-8-marcandre.lureau@redhat.com>
In-Reply-To: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
References: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 3sq-UK34PhmyTOikkB3ENQ-1
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Migration from old to new code works, however the other way fails for
devices that use serial_init/serial_mm_init with "base", used as
instance_id previously.

(with qdev_set_legacy_instance_id, the alias_id is only used in
savevm.c:find_se(), and thus can only be used to match against
"legacy" instance id values. On new code, instance_id is generated
incrementally from 0 with calculate_new_instance_id(), based on
"qdev-path/vmsd-name")

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/char/serial.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 233a9e2076..e926845843 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -990,8 +990,7 @@ SerialState *serial_init(int base, qemu_irq irq, int ba=
udbase,
     s->baudbase =3D baudbase;
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
     serial_realize_core(s, &error_fatal);
-
-    vmstate_register(NULL, base, &vmstate_serial, s);
+    qdev_set_legacy_instance_id(dev, base, 2);
     qdev_init_nofail(dev);
=20
     memory_region_init_io(&s->io, NULL, &serial_io_ops, s, "serial", 8);
@@ -1006,6 +1005,7 @@ static void serial_class_init(ObjectClass *klass, voi=
d *data)
=20
     /* internal device for serialio/serialmm, not user-creatable */
     dc->user_creatable =3D false;
+    dc->vmsd =3D &vmstate_serial;
 }
=20
 static const TypeInfo serial_info =3D {
@@ -1069,7 +1069,7 @@ SerialState *serial_mm_init(MemoryRegion *address_spa=
ce,
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
=20
     serial_realize_core(s, &error_fatal);
-    vmstate_register(NULL, base, &vmstate_serial, s);
+    qdev_set_legacy_instance_id(dev, base, 2);
     qdev_init_nofail(dev);
=20
     memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], s,
--=20
2.25.0.rc1.20.g2443f3f80d


