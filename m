Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683B511293E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 11:25:32 +0100 (CET)
Received: from localhost ([::1]:36516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icRqb-0007g4-GR
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 05:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38825)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1icR5T-0007El-8q
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:36:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1icR5M-0000bA-4z
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:36:43 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35094
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1icR5L-0000Ie-W5
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575452195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Td6VxE5zTmUsHVwy0M3hGHsHlUZ8X6ahEXJQ6lgxe2c=;
 b=d8b4wE+hq7Y3Hrnu3CD9qxjovRlBhQ3kJHf2N0uxDFxEyrLm6p+G0x46kiaBHsVdGy+uBq
 5zsY2Wv8e4RuS6qw9Syds7i1HvHcXg80FuBKqDfrJ417/AsqFDAhHzOvLfXuGVbRAsOfyh
 7PA7qP3QS1nfhF5F5EMqJN0Y4nXHRL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-O3QRq4KFMOqawDMg_zAnmA-1; Wed, 04 Dec 2019 04:36:34 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77357DC20
 for <qemu-devel@nongnu.org>; Wed,  4 Dec 2019 09:36:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 796FA5DA60;
 Wed,  4 Dec 2019 09:36:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A250911366F1; Wed,  4 Dec 2019 10:36:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/18] memory-device: Fix memory pre-plug error API
 violations
Date: Wed,  4 Dec 2019 10:36:17 +0100
Message-Id: <20191204093625.14836-11-armbru@redhat.com>
In-Reply-To: <20191204093625.14836-1-armbru@redhat.com>
References: <20191204093625.14836-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: O3QRq4KFMOqawDMg_zAnmA-1
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_device_get_free_addr() dereferences @errp when
memory_device_check_addable() fails.  That's wrong; see the big
comment in error.h.  Introduced in commit 1b6d6af21b "pc-dimm: factor
out capacity and slot checks into MemoryDevice".

No caller actually passes null.

Fix anyway: splice in a local Error *err, and error_propagate().

Cc: David Hildenbrand <david@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 hw/mem/memory-device.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index aef148c1d7..4bc9cf0917 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -99,6 +99,7 @@ static uint64_t memory_device_get_free_addr(MachineState =
*ms,
                                             uint64_t align, uint64_t size,
                                             Error **errp)
 {
+    Error *err =3D NULL;
     GSList *list =3D NULL, *item;
     Range as, new =3D range_empty;
=20
@@ -123,8 +124,9 @@ static uint64_t memory_device_get_free_addr(MachineStat=
e *ms,
         return 0;
     }
=20
-    memory_device_check_addable(ms, size, errp);
-    if (*errp) {
+    memory_device_check_addable(ms, size, &err);
+    if (err) {
+        error_propagate(errp, err);
         return 0;
     }
=20
--=20
2.21.0


