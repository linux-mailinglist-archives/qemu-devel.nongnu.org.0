Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BBF14EF7B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:23:27 +0100 (CET)
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixY8j-0000NI-Py
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39013)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXy8-0003vo-1C
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXy5-0003gB-1R
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:26 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29594
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXy4-0003e5-Tp
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQAi5G78jzvJrL9FsaxZSHNniLb1H7wfVYtQAaKVaJo=;
 b=ik+SNl9Z+SjIMgQi5qpPuAeZ9wpvBYyVP4gZXoPvOwPvwS2bCIsO6ReKgJViMT/m1vJDWy
 r21trKCuGKWAqw7BJJmpuVP7MBe0dobIT09c8FjkWH2orsqL8Olbb7SON9AqNZMX/n8Wzn
 LC18QtCz9LE0Om6W+erU5eEwlbU9sN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-cYLIrVxHPbe9XkawuvtL2Q-1; Fri, 31 Jan 2020 10:12:21 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 630E9800D41;
 Fri, 31 Jan 2020 15:12:20 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EEAD86C4B;
 Fri, 31 Jan 2020 15:12:19 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/80] vl.c: ensure that ram_size matches size of
 machine.memory-backend
Date: Fri, 31 Jan 2020 16:08:37 +0100
Message-Id: <1580483390-131164-8-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: cYLIrVxHPbe9XkawuvtL2Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: pasic@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extend set_memory_options() to check that size specified by -m
matches the size of backend pointed by memory-backend.
And in case of -m was omitted adjust ram_size to match that
of explicitly provided backend.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: pasic@linux.ibm.com
CC: pbonzini@redhat.com
---
 vl.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/vl.c b/vl.c
index 1c0314d..4ce0799 100644
--- a/vl.c
+++ b/vl.c
@@ -2689,6 +2689,21 @@ static void set_memory_options(uint64_t *ram_slots, =
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
2.7.4


