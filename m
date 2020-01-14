Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9855C13AA58
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 14:10:10 +0100 (CET)
Received: from localhost ([::1]:39110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irLxR-00045z-M0
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 08:10:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41356)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irLjR-0003M5-Rv
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:55:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irLjO-00020R-8I
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:55:41 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49963
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irLjO-0001wo-4E
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:55:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579006534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJSMz5QW+0OSt4n+d/miL7pbnhHIR5QQ1bSr8mrk7S8=;
 b=eppj9m6Yu9sXxGFhi3S2Tc5HH/91C0jPUwq1YpVdpSrw7zOr/zBqKqcLdpMwSWeARwrSkh
 eQtl0xDlurLmj4FzVW+OOZFhO86I911iodDgFDHi/DiCpG5/2zGLJtgYSXpW76T5DRer+b
 4kbt38O/tokEoegqwbtj+9zn3aQw5D0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-EBaYeIXxN92H62z_qsN30A-1; Tue, 14 Jan 2020 07:55:33 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 753BF107ACE6;
 Tue, 14 Jan 2020 12:55:31 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA1935D9E5;
 Tue, 14 Jan 2020 12:55:24 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/30] migration/postcopy: count target page number to decide
 the place_needed
Date: Tue, 14 Jan 2020 13:52:42 +0100
Message-Id: <20200114125254.4515-19-quintela@redhat.com>
In-Reply-To: <20200114125254.4515-1-quintela@redhat.com>
References: <20200114125254.4515-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: EBaYeIXxN92H62z_qsN30A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
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
index 1cd845b9a7..391fe6e0e4 100644
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


