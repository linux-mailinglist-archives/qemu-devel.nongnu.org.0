Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E274015AA78
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 14:54:44 +0100 (CET)
Received: from localhost ([::1]:38230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1sTT-00015C-Up
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 08:54:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39357)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j1sIt-0007OG-9f
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:43:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j1sIs-0004DM-5T
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:43:47 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25859
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j1sIs-0004D3-1R
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581515025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3rvnuT51cs0LPxsa94uLPi5fmCSxlFI0oHScm/fHqA=;
 b=i+AtvvCwxCDk4t5aYpSHp1TyxWPl0ZB7P0Bztq70xRkzWiCftzxY/+aI7MNgDELQ8ZZTFT
 XuQk60FWx7PH3/nDnVOOL7AGpMm7uRhlTkFe92HRdArPVu+Sq1nst8zoRStobJ0fDZpxa0
 B9FxE3GgPFAi1bKeFlIwkpdtO1YbN7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-aSDbROOIMWGF7INZVsGtsw-1; Wed, 12 Feb 2020 08:43:44 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF272801E78;
 Wed, 12 Feb 2020 13:43:42 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-92.ams2.redhat.com [10.36.117.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A71AF1001B08;
 Wed, 12 Feb 2020 13:43:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 fixed 07/16] exec: Drop "shared" parameter from
 ram_block_add()
Date: Wed, 12 Feb 2020 14:42:45 +0100
Message-Id: <20200212134254.11073-8-david@redhat.com>
In-Reply-To: <20200212134254.11073-1-david@redhat.com>
References: <20200212134254.11073-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: aSDbROOIMWGF7INZVsGtsw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Properly store it in the flags of the ram block instead (and the flag
even already exists and is used).

E.g., qemu_ram_is_shared() now properly succeeds on all ram blocks that are
actually shared.

Reviewed-by: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
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


