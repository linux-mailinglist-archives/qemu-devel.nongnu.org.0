Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E691B3C67
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 12:05:50 +0200 (CEST)
Received: from localhost ([::1]:47110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRCGL-0005cc-4a
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 06:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jRCD3-0002OD-OE
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 06:02:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jRCD2-0004Qr-Rb
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 06:02:25 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31171
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jRCD2-0004HP-DT
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 06:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587549742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COLeT8C7dZdU7ueIahTw8R7I0fDiCeF7bAesFEK6p08=;
 b=aS4d/SZ2WAm4bvaMsY+LOe4AQ3XpQ2cYVApF/hWbDxBqYVdxl/ExTj0kmkOq0z3tXxU+tt
 eHGuobovJQSWC8lPT3/xO5tcmqRs1PA72MeNJYDP37ybuJv6OWOM3nQ4yBY2jD0UCDl/rW
 5o6wJVDZgDjnZXpWJXwIXWyERo3FJgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-eu3el2BHMBSmk3RpvPEDZg-1; Wed, 22 Apr 2020 06:02:20 -0400
X-MC-Unique: eu3el2BHMBSmk3RpvPEDZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A47FD8017F5;
 Wed, 22 Apr 2020 10:02:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05E63600D2;
 Wed, 22 Apr 2020 10:02:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E8E419D9D; Wed, 22 Apr 2020 12:02:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] ramfb: add sanity checks to ramfb_create_display_surface
Date: Wed, 22 Apr 2020 12:02:10 +0200
Message-Id: <20200422100211.30614-5-kraxel@redhat.com>
In-Reply-To: <20200422100211.30614-1-kraxel@redhat.com>
References: <20200422100211.30614-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:57:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, lersek@redhat.com,
 hqm03ster@gmail.com, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/ramfb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
index fbe959147dc9..d1b1cb9bb294 100644
--- a/hw/display/ramfb.c
+++ b/hw/display/ramfb.c
@@ -15,6 +15,7 @@
 #include "qapi/error.h"
 #include "hw/loader.h"
 #include "hw/display/ramfb.h"
+#include "hw/display/bochs-vbe.h" /* for limits */
 #include "ui/console.h"
 #include "sysemu/reset.h"
=20
@@ -49,6 +50,11 @@ static DisplaySurface *ramfb_create_display_surface(int =
width, int height,
     hwaddr size;
     void *data;
=20
+    if (width < 16 || width > VBE_DISPI_MAX_XRES ||
+        height < 16 || height > VBE_DISPI_MAX_YRES ||
+        format =3D=3D 0 /* unknown format */)
+        return NULL;
+
     if (linesize =3D=3D 0) {
         linesize =3D width * PIXMAN_FORMAT_BPP(format) / 8;
     }
--=20
2.18.2


