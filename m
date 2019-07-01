Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 1101738B95
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 15:24:52 +0200 (CEST)
Received: from localhost ([::1]:51098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZErT-000435-8V
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 09:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34462)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hZEm5-0007R2-4G
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:19:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hZEm4-0005R3-4D
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:19:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58198)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hZEm3-0005KK-U7
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:19:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 409E1CA36F
 for <qemu-devel@nongnu.org>; Fri,  7 Jun 2019 13:19:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-25.ams2.redhat.com
 [10.36.117.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E17F97DDF9;
 Fri,  7 Jun 2019 13:19:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 08F0F17534; Fri,  7 Jun 2019 15:19:02 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jun 2019 15:18:58 +0200
Message-Id: <20190607131901.20107-3-kraxel@redhat.com>
In-Reply-To: <20190607131901.20107-1-kraxel@redhat.com>
References: <20190607131901.20107-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 07 Jun 2019 13:19:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 2/5] console: add dmabuf modifier field.
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dmabufs can have a format modifier (DRM_FORMAT_MOD_*) which is used for
tiled layouts for example.  Add a field to QemuDmaBuf so we can carry
around that information.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-id: 20190529072144.26737-2-kraxel@redhat.com
---
 include/ui/console.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index fef900db76a5..f9816968487c 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -175,6 +175,7 @@ typedef struct QemuDmaBuf {
     uint32_t  height;
     uint32_t  stride;
     uint32_t  fourcc;
+    uint64_t  modifier;
     uint32_t  texture;
     bool      y0_top;
 } QemuDmaBuf;
--=20
2.18.1


