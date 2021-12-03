Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA3D46806C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:32:20 +0100 (CET)
Received: from localhost ([::1]:34972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtI2N-0005h2-8g
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:32:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoV-0001zR-Mm
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:17:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoU-0003IT-2C
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:17:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtQ90zIvtT7vjgUKqvVxgxVAJNYsdYUVCo8erl8jhHw=;
 b=Xyj2OTn+85yVpIzS/NqTBXGuGCXOp7TwnjxZLlyzlI8ZJJbH7MviBNrvhHIbGo8qoWQrBY
 ehzQisraLBN2qctDySuanAZMzXtUkM08FO4pvgLq4bbR/LC9x05zIVzbUvTwMUAZnYATjp
 P/Jnu9XXdzetogZzP5ojsFKYvoyJdEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-B7zXogTbM7qLs3NROohhtA-1; Fri, 03 Dec 2021 18:17:54 -0500
X-MC-Unique: B7zXogTbM7qLs3NROohhtA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 663158042E1;
 Fri,  3 Dec 2021 23:17:53 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 834694EC7F;
 Fri,  3 Dec 2021 23:17:52 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Subject: [libnbd PATCH 01/13] golang: Simplify nbd_block_status callback array
 copy
Date: Fri,  3 Dec 2021 17:17:29 -0600
Message-Id: <20211203231741.3901263-2-eblake@redhat.com>
In-Reply-To: <20211203231741.3901263-1-eblake@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231741.3901263-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, nbd@other.debian.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the block status callback glue code, we need to copy a C uint32_t[]
into a golang []uint32.  The copy is necessary since the lifetime of
the C array is not guaranteed to outlive whatever the Go callback may
have done with what it was handed; copying ensures that the user's Go
code doesn't have to worry about lifetime issues.  But we don't have
to have quite so many casts and pointer additions: since we can assume
C.uint32_t and uint32 occupy the same amount of memory (even though
they are different types), we can exploit Go's ability to treat an
unsafe pointer as if it were an oversized array, take a slice of that
array, and then use idiomatic Go to copy from the slice.

https://github.com/golang/go/wiki/cgo#turning-c-arrays-into-go-slices
---
 generator/GoLang.ml | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/generator/GoLang.ml b/generator/GoLang.ml
index eb3aa263..d3b7dc79 100644
--- a/generator/GoLang.ml
+++ b/generator/GoLang.ml
@@ -1,6 +1,6 @@
 (* hey emacs, this is OCaml code: -*- tuareg -*- *)
 (* nbd client library in userspace: generator
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -514,11 +514,14 @@ let
 /* Closures. */

 func copy_uint32_array (entries *C.uint32_t, count C.size_t) []uint32 {
-    ret := make([]uint32, int (count))
-    for i := 0; i < int (count); i++ {
-       entry := (*C.uint32_t) (unsafe.Pointer(uintptr(unsafe.Pointer(entries)) + (unsafe.Sizeof(*entries) * uintptr(i))))
-       ret[i] = uint32 (*entry)
-    }
+    /* https://github.com/golang/go/wiki/cgo#turning-c-arrays-into-go-slices */
+    unsafePtr := unsafe.Pointer(entries)
+    /* Max structured reply payload is 64M, so this array size is more than
+     * sufficient for the underlying slice we want to access.
+     */
+    arrayPtr := (*[1 << 20]uint32)(unsafePtr)
+    ret := make([]uint32, count)
+    copy(ret, arrayPtr[:count:count])
     return ret
 }
 ";
-- 
2.33.1


