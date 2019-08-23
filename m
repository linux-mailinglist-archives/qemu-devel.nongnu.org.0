Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9139B179
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 15:58:07 +0200 (CEST)
Received: from localhost ([::1]:56294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1A4s-0000rF-8C
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 09:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44520)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1i1A3X-0008Od-IS
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 09:56:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1i1A3W-0006jx-GD
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 09:56:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35058)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1i1A3W-0006jk-BS
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 09:56:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 939878D5BBB
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 13:56:41 +0000 (UTC)
Received: from localhost (ovpn-117-66.ams2.redhat.com [10.36.117.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B22D860606;
 Fri, 23 Aug 2019 13:56:33 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 14:56:32 +0100
Message-Id: <20190823135632.25010-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 23 Aug 2019 13:56:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hostmem-file: fix pmem file size check
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
Cc: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 314aec4a6e06844937f1677f6cba21981005f389 ("hostmem-file: reject
invalid pmem file sizes") added a file size check that verifies the
hostmem object's size parameter against the actual devdax pmem file.
This is useful because getting the size wrong results in confusing
errors inside the guest.

However, the code doesn't work properly for files where struct
stat::st_size is zero.  Hostmem-file's ->alloc() function returns early
without setting an Error, causing the following assertion failure:

  qemu/memory.c:2215: memory_region_get_ram_ptr: Assertion `mr->ram_block=
' failed.

This patch handles the case where qemu_get_pmem_size() returns 0 but
there is no error.

Fixes: 314aec4a6e06844937f1677f6cba21981005f389
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 backends/hostmem-file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 29e55c9195..ecc15e3eb0 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -67,12 +67,12 @@ file_backend_memory_alloc(HostMemoryBackend *backend,=
 Error **errp)
         uint64_t size;
=20
         size =3D qemu_get_pmem_size(fb->mem_path, &local_err);
-        if (!size) {
+        if (local_err) {
             error_propagate(errp, local_err);
             return;
         }
=20
-        if (backend->size > size) {
+        if (size && backend->size > size) {
             error_setg(errp, "size property %" PRIu64 " is larger than "
                        "pmem file \"%s\" size %" PRIu64, backend->size,
                        fb->mem_path, size);
--=20
2.21.0


