Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3692C18751B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 22:49:33 +0100 (CET)
Received: from localhost ([::1]:49516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDxc4-0007yc-5L
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 17:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43154)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jDxIA-0004LL-VJ
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 17:28:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jDxI9-0007Cu-QK
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 17:28:58 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:53271)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jDxI9-00078F-JT
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 17:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584394137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EbuOfoB8s9Uca3voJAdFqyZsNughv+wIrC2AkjrMup4=;
 b=Wjtuvqad8vekbT1ysqsUZWGAF5neWMprPoTw2DfMVPQIJhm2FEXsoyH84fAAvq/GWtCURH
 wRT2SjOT4KQnSG9uojQxzdJAks5DgeV5J9S75oqakNO82zASgt0LBAsRlyUFWaOCdYL4AW
 dFMS/vYNVxAqdHoQ7UbXkwmfvdaJv/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-KZJGYFFVOOSzEmkOMqQ0pA-1; Mon, 16 Mar 2020 17:28:55 -0400
X-MC-Unique: KZJGYFFVOOSzEmkOMqQ0pA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 736C8801E53
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 21:28:54 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FBE819C4F;
 Mon, 16 Mar 2020 21:28:53 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 45/61] hw/pci-host: Use memory_region_init_rom() with read-only
 regions
Date: Mon, 16 Mar 2020 22:27:12 +0100
Message-Id: <1584394048-44994-46-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1584394048-44994-1-git-send-email-pbonzini@redhat.com>
References: <1584394048-44994-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/pci-host/prep.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 1aff72b..1a02e9a 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -325,9 +325,8 @@ static void raven_realize(PCIDevice *d, Error **errp)
     d->config[0x0D] =3D 0x10; // latency_timer
     d->config[0x34] =3D 0x00; // capabilities_pointer
=20
-    memory_region_init_ram_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_SIZ=
E,
-                           &error_fatal);
-    memory_region_set_readonly(&s->bios, true);
+    memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_SIZ=
E,
+                                     &error_fatal);
     memory_region_add_subregion(get_system_memory(), (uint32_t)(-BIOS_SIZE=
),
                                 &s->bios);
     if (s->bios_name) {
--=20
1.8.3.1



