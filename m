Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E90150FBD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 19:39:31 +0100 (CET)
Received: from localhost ([::1]:45876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iygd8-0000pV-Ib
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 13:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iygW3-0007qD-J9
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 13:32:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iygW1-0001Lh-ET
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 13:32:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52486
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iygW0-0001Hk-VT
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 13:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580754721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ThkhX9ejOkX/i/BPydq3cIMSP9rpzdG3sVMxhKILgnk=;
 b=O7HtwPok8lySGOYLy5MMlmFL2TfvuP3nLDkzxDNP6yx3jh2W0aaBfcw2aU0bwjByi1O3K+
 +2OpabkvnHpaY26Bn8pprQs0mXlcbrpC0sPGw3+uxoj7pYya5+/SfbUUGNtbvAtXQsUP3J
 GP12Tq/paAsPRnjyJlJVH6tQS6pS0po=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-liybGsylMjarD6ZVlDWtbA-1; Mon, 03 Feb 2020 13:31:59 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F23CDB60;
 Mon,  3 Feb 2020 18:31:58 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-77.ams2.redhat.com [10.36.117.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A35D75D9CA;
 Mon,  3 Feb 2020 18:31:48 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 04/13] exec: Drop "shared" parameter from ram_block_add()
Date: Mon,  3 Feb 2020 19:31:16 +0100
Message-Id: <20200203183125.164879-5-david@redhat.com>
In-Reply-To: <20200203183125.164879-1-david@redhat.com>
References: <20200203183125.164879-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: liybGsylMjarD6ZVlDWtbA-1
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Properly store it in the flags of the ram block instead (and the flag
even already exists and is used).

E.g., qemu_ram_is_shared() now properly succeeds on all ram blocks that are
actually shared.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 exec.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/exec.c b/exec.c
index f7525867ec..fc65c4f7ca 100644
--- a/exec.c
+++ b/exec.c
@@ -2249,7 +2249,7 @@ static void dirty_memory_extend(ram_addr_t old_ram_si=
ze,
     }
 }
=20
-static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
+static void ram_block_add(RAMBlock *new_block, Error **errp)
 {
     RAMBlock *block;
     RAMBlock *last_block =3D NULL;
@@ -2272,7 +2272,8 @@ static void ram_block_add(RAMBlock *new_block, Error =
**errp, bool shared)
             }
         } else {
             new_block->host =3D phys_mem_alloc(new_block->max_length,
-                                             &new_block->mr->align, shared=
);
+                                             &new_block->mr->align,
+                                             qemu_ram_is_shared(new_block)=
);
             if (!new_block->host) {
                 error_setg_errno(errp, errno,
                                  "cannot set up guest memory '%s'",
@@ -2376,7 +2377,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, Mem=
oryRegion *mr,
         return NULL;
     }
=20
-    ram_block_add(new_block, &local_err, ram_flags & RAM_SHARED);
+    ram_block_add(new_block, &local_err);
     if (local_err) {
         g_free(new_block);
         error_propagate(errp, local_err);
@@ -2438,10 +2439,13 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, =
ram_addr_t max_size,
     if (host) {
         new_block->flags |=3D RAM_PREALLOC;
     }
+    if (share) {
+        new_block->flags |=3D RAM_SHARED;
+    }
     if (resizeable) {
         new_block->flags |=3D RAM_RESIZEABLE;
     }
-    ram_block_add(new_block, &local_err, share);
+    ram_block_add(new_block, &local_err);
     if (local_err) {
         g_free(new_block);
         error_propagate(errp, local_err);
--=20
2.24.1


