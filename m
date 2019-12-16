Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3131C11F420
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Dec 2019 22:05:06 +0100 (CET)
Received: from localhost ([::1]:32930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igEb3-00055u-4d
	for lists+qemu-devel@lfdr.de; Sat, 14 Dec 2019 16:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36095)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1igEZU-00045O-1u
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 16:03:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1igEZT-0003GY-33
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 16:03:27 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43191
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1igEZS-0003E8-Up
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 16:03:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576357406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pT4WM40LU/MvM0flyFNYVRGgCmto08Bw6WjOatMkYRQ=;
 b=N4j6UZnA8R6o1g7WA7O1gDjFlX1KMpZCYrhkzQe+aYKUl7IkiZ0O495ghKbIspcpBPkhMX
 OAsnNPPcRj5b/p46qnlAQIgpdqG1rkngO8Cniox268j54EaFY7QAxk74cAsBUdTG/5poXU
 A7KXl27ToJGhA71FmSpHbmo4naekx30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-LB-qO6-fN0OEfYRAM1n8AA-1; Sat, 14 Dec 2019 11:02:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84590800D41;
 Sat, 14 Dec 2019 16:02:30 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78A6660BF3;
 Sat, 14 Dec 2019 16:02:26 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] memory: Do not allow subregion out of the parent region range
Date: Sat, 14 Dec 2019 17:02:23 +0100
Message-Id: <20191214160223.20012-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: LB-qO6-fN0OEfYRAM1n8AA-1
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a subregion is mapped out of the parent region range, it
will never get accessed. Since this is a bug, abort to help
the developer notice the mistake.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 memory.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/memory.c b/memory.c
index 06484c2bff..61f355dcd5 100644
--- a/memory.c
+++ b/memory.c
@@ -2390,6 +2390,7 @@ static void memory_region_add_subregion_common(Memory=
Region *mr,
 {
     assert(!subregion->container);
     subregion->container =3D mr;
+    assert(offset + memory_region_size(subregion) <=3D memory_region_size(=
mr));
     subregion->addr =3D offset;
     memory_region_update_container_subregions(subregion);
 }
--=20
2.21.0


