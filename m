Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FD2170340
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 16:55:19 +0100 (CET)
Received: from localhost ([::1]:46202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6z1q-0004QO-8h
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 10:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j6z0M-0002gM-HZ
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:53:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j6z0L-0002oG-F5
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:53:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48494
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j6z0L-0002mc-Aj
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:53:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582732424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5SAil29C2B/8RRVuO+5knjn0nj8iH/o7OggV0iKssVQ=;
 b=GobRxe3BCNl9IfkhZU1LDg628fdnbLA+Vv/t7eso0+YV6XOCiKAT+VIWhk6qI+JYW75+RD
 glmlSHbjLaBkiKKRS8kDuRwwQh0+pZaUlbxnIeQgFncrNh8qiQFq+J9cVS6ClpnXj8kvey
 W23bXYPS8IKaBTQHbof7V4hoiNch8BM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-lpyoPsZ_PieWswSaBSDR9w-1; Wed, 26 Feb 2020 10:53:41 -0500
X-MC-Unique: lpyoPsZ_PieWswSaBSDR9w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 325DC1005513;
 Wed, 26 Feb 2020 15:53:40 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-196.ams2.redhat.com [10.36.117.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25728100EBAF;
 Wed, 26 Feb 2020 15:53:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/13] numa: Make all callbacks of ram block notifiers
 optional
Date: Wed, 26 Feb 2020 16:52:55 +0100
Message-Id: <20200226155304.60219-5-david@redhat.com>
In-Reply-To: <20200226155304.60219-1-david@redhat.com>
References: <20200226155304.60219-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's make add/remove optional. We want to introduce a RAM block
notifier for RAM migration, that's only interested in resizes.

Reviewed-by: Peter Xu <peterx@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/core/numa.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index fe6ca5c50d..37ce175e13 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -870,8 +870,11 @@ static int ram_block_notify_add_single(RAMBlock *rb, v=
oid *opaque)
 void ram_block_notifier_add(RAMBlockNotifier *n)
 {
     QLIST_INSERT_HEAD(&ram_list.ramblock_notifiers, n, next);
+
     /* Notify about all existing ram blocks. */
-    qemu_ram_foreach_block(ram_block_notify_add_single, n);
+    if (n->ram_block_added) {
+        qemu_ram_foreach_block(ram_block_notify_add_single, n);
+    }
 }
=20
 void ram_block_notifier_remove(RAMBlockNotifier *n)
@@ -884,7 +887,9 @@ void ram_block_notify_add(void *host, size_t size, size=
_t max_size)
     RAMBlockNotifier *notifier;
=20
     QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
-        notifier->ram_block_added(notifier, host, size, max_size);
+        if (notifier->ram_block_added) {
+            notifier->ram_block_added(notifier, host, size, max_size);
+        }
     }
 }
=20
@@ -893,7 +898,9 @@ void ram_block_notify_remove(void *host, size_t size, s=
ize_t max_size)
     RAMBlockNotifier *notifier;
=20
     QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
-        notifier->ram_block_removed(notifier, host, size, max_size);
+        if (notifier->ram_block_removed) {
+            notifier->ram_block_removed(notifier, host, size, max_size);
+        }
     }
 }
=20
--=20
2.24.1


