Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDBD1649A1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:15:19 +0100 (CET)
Received: from localhost ([::1]:55474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4S0M-0002bU-D0
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:15:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37047)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j4RvP-00021K-K1
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:10:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j4RvO-0000W0-K3
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:10:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21105
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j4RvO-0000Vl-GN
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582128610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=taO8DJfgU5ryirOgf3V6YjzMHvm173m6ABaPAEwtAjU=;
 b=IrflyGJbIvtZKxdJPj8L/WzVMetv+vGn9eLOeBbX0beAID0ArREslJio7ZWZn+e9QDH0WR
 J3SkPOUaql+q8HOJB/55xqlmFxa4490rwhSbkl8vsIAmTDJJyk0NDCwT2xC7vKRyHCmP60
 d0cL/oZCEj/tBMW7VvOqTwohrqsGA3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-0RXmWo2xOba3StRaXmoDow-1; Wed, 19 Feb 2020 11:10:06 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC778108597F
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 16:10:05 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 328A390064;
 Wed, 19 Feb 2020 16:10:05 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/79] vl.c: ensure that ram_size matches size of
 machine.memory-backend
Date: Wed, 19 Feb 2020 11:08:41 -0500
Message-Id: <20200219160953.13771-8-imammedo@redhat.com>
In-Reply-To: <20200219160953.13771-1-imammedo@redhat.com>
References: <20200219160953.13771-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 0RXmWo2xOba3StRaXmoDow-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extend set_memory_options() to check that size specified by -m
matches the size of backend pointed by memory-backend.
And in case of -m was omitted adjust ram_size to match that
of explicitly provided backend.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: pbonzini@redhat.com
---
 vl.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/vl.c b/vl.c
index 72ffc06f2f..a7edcba094 100644
--- a/vl.c
+++ b/vl.c
@@ -2655,6 +2655,21 @@ static void set_memory_options(uint64_t *ram_slots, =
ram_addr_t *maxram_size,
         exit(EXIT_FAILURE);
     }
=20
+    if (current_machine->ram_memdev_id) {
+        Object *backend;
+        ram_addr_t backend_size;
+
+        backend =3D object_resolve_path_type(current_machine->ram_memdev_i=
d,
+                                           TYPE_MEMORY_BACKEND, NULL);
+        backend_size =3D object_property_get_uint(backend, "size",  &error=
_abort);
+        if (mem_str && backend_size !=3D ram_size) {
+                error_report("Size specified by -m option must match size =
of "
+                             "explicitly specified 'memory-backend' proper=
ty");
+                exit(EXIT_FAILURE);
+        }
+        ram_size =3D backend_size;
+    }
+
     if (!xen_enabled()) {
         /* On 32-bit hosts, QEMU is limited by virtual address space */
         if (ram_size > (2047 << 20) && HOST_LONG_BITS =3D=3D 32) {
--=20
2.18.1


