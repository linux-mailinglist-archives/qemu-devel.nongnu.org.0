Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2D3FC8BE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 15:20:50 +0100 (CET)
Received: from localhost ([::1]:58170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVFzN-0000tn-IN
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 09:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43002)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iVFvG-0005uS-77
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 09:16:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iVFvE-0005ou-8s
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 09:16:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21874
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iVFv9-0005gJ-VE
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 09:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573740985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXLF/5v/Y0ulB8RgG6831J7A7kzz7pP2YMK7OORF2xs=;
 b=Fy1Dei1HaeC2W4upL8UelTddHTZ7xW20L13aMUOCzZ6ei+t+Wkne/SPuawtQ2fbhVOUSCC
 GgAvNc/PXriUowJCuFZzxXPaMM5oW1wGXAh3Vld6PZAbEuqZyj1PxWLJ+5g1NOevaLfmeB
 Lddefe3HZ+6fUgfkmW2Sgmdp6PjGyHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-1Zgee5QzPzSGV2xggSK86g-1; Thu, 14 Nov 2019 09:16:24 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41CD31802CE5;
 Thu, 14 Nov 2019 14:16:23 +0000 (UTC)
Received: from localhost (ovpn-117-54.ams2.redhat.com [10.36.117.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BDC010375DA;
 Thu, 14 Nov 2019 14:16:20 +0000 (UTC)
From: Jens Freimann <jfreimann@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] net/virtio: return early when failover primary alread
 added
Date: Thu, 14 Nov 2019 15:16:11 +0100
Message-Id: <20191114141613.15804-2-jfreimann@redhat.com>
In-Reply-To: <20191114141613.15804-1-jfreimann@redhat.com>
References: <20191114141613.15804-1-jfreimann@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 1Zgee5QzPzSGV2xggSK86g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: peter.maydell@linaro.org, jasowang@redhat.com, dgilbert@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bail out when primary device was already added before.
This avoids printing a wrong warning message during reboot.

Fixes: 9711cd0dfc3f ("net/virtio: add failover support")
Signed-off-by: Jens Freimann <jfreimann@redhat.com>
---
 hw/net/virtio-net.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 946039c0dc..ac4d19109e 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -759,6 +759,10 @@ static void failover_add_primary(VirtIONet *n, Error *=
*errp)
 {
     Error *err =3D NULL;
=20
+    if (n->primary_dev) {
+        return;
+    }
+
     n->primary_device_opts =3D qemu_opts_find(qemu_find_opts("device"),
             n->primary_device_id);
     if (n->primary_device_opts) {
--=20
2.21.0


