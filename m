Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29F813A8D3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 12:57:23 +0100 (CET)
Received: from localhost ([::1]:38014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irKp0-0000S1-9s
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 06:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56110)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKZz-0006zb-7G
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:41:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKZv-0003Tr-9j
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:41:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28261
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKZu-0003Tg-W6
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDvHDxz9hAL4AO2gd4dbSYpFgNTjSG2GxTAeEZIJRq0=;
 b=etEZdhE+cBUaKf+h4Jm2hEXrAfI5ZSEzzFui9jSQp+xK5LPiuzjeM/tWR5pp03v+CPw+6f
 qQh5fhXoznuAto8zRYYkvk66ogJy5NQdD5Tc99vmV8tE6OiXYaCi8OOx/82iuDxk6bX4a3
 EFlsAOrV0cEtErI3+4T2HsOhJ6ysrJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-MINm3X9iNre70dwy4tpiew-1; Tue, 14 Jan 2020 06:41:45 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5D53DB60;
 Tue, 14 Jan 2020 11:41:40 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F4455DA70;
 Tue, 14 Jan 2020 11:41:36 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/30] migration/postcopy: count target page number to decide
 the place_needed
Date: Tue, 14 Jan 2020 12:39:13 +0100
Message-Id: <20200114113926.3556-18-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: MINm3X9iNre70dwy4tpiew-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

In postcopy, it requires to place whole host page instead of target
page.

Currently, it relies on the page offset to decide whether this is the
last target page. We also can count the target page number during the
iteration. When the number of target page equals
(host page size / target page size), this means it is the last target
page in the host page.

This is a preparation for non-ordered target page transmission.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index c13b44b4d9..8ebaea255e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4052,6 +4052,7 @@ static int ram_load_postcopy(QEMUFile *f)
     void *postcopy_host_page =3D mis->postcopy_tmp_page;
     void *last_host =3D NULL;
     bool all_zero =3D false;
+    int target_pages =3D 0;
=20
     while (!ret && !(flags & RAM_SAVE_FLAG_EOS)) {
         ram_addr_t addr;
@@ -4086,6 +4087,7 @@ static int ram_load_postcopy(QEMUFile *f)
                 ret =3D -EINVAL;
                 break;
             }
+            target_pages++;
             matches_target_page_size =3D block->page_size =3D=3D TARGET_PA=
GE_SIZE;
             /*
              * Postcopy requires that we place whole host pages atomically=
;
@@ -4117,8 +4119,10 @@ static int ram_load_postcopy(QEMUFile *f)
              * If it's the last part of a host page then we place the host
              * page
              */
-            place_needed =3D (((uintptr_t)host + TARGET_PAGE_SIZE) &
-                                     (block->page_size - 1)) =3D=3D 0;
+            if (target_pages =3D=3D (block->page_size / TARGET_PAGE_SIZE))=
 {
+                place_needed =3D true;
+                target_pages =3D 0;
+            }
             place_source =3D postcopy_host_page;
         }
         last_host =3D host;
--=20
2.24.1


