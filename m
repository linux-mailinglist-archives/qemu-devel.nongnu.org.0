Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D82F12D948
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Dec 2019 14:53:37 +0100 (CET)
Received: from localhost ([::1]:42802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imHxo-0000vK-5A
	for lists+qemu-devel@lfdr.de; Tue, 31 Dec 2019 08:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57549)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1imHCi-0006C6-De
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1imHCh-0005BK-4q
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:56 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22475
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1imHCg-00058w-Vt
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577797494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LMGc6OlKEr8+jw0USTCrPjZRkgbS/AJVOPVE5QUjHm8=;
 b=OSzuKu/NqhSJF5cMnh5LyuQB5De8vvCgKyd86IZEDBWifgOhcdpHh70WPU2O/RmNoavCQm
 z9lINvBg3lCdoI/dlJP3qmrFWlmSYR8H/jWydjmHzcQbv5oqQGVwaUCgDbHCshC7dp85Qe
 +RmybfCBem5tWrtB+GZb5HwNeRfWNmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-saGAYsgvPAufW0g84ggx_Q-1; Tue, 31 Dec 2019 08:04:53 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EDC6801E66
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:52 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAFD3620A6
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:51 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 78/86] exec: drop bogus mem_path from qemu_ram_alloc_from_fd()
Date: Tue, 31 Dec 2019 14:04:02 +0100
Message-Id: <1577797450-88458-79-git-send-email-imammedo@redhat.com>
In-Reply-To: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: saGAYsgvPAufW0g84ggx_Q-1
X-Mimecast-Spam-Score: 0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Function will report error that will mention global mem_path,
which was valid the only if legacy -mem-path was used and
only in case of main RAM.

However it doesn't work with hostmem backends
(for example:
"
  qemu: -object memory-backend-file,id=3Dram0,size=3D128M,mem-path=3Dfoo:
    backing store (null) size 0x200000 does not match 'size' option 0x80000=
00
")
and couldn't possibly work in general FD case the function
is supposed to handle.

Taking in account that main RAM was converted into
memory-backend-foo object, there is no point in printing
file name (from inappropriate place) as failing path is
a part of backend's error message.

Hence drop bogus mem_path usage from qemu_ram_alloc_from_fd(),
it's a job of its user to add file name to error message if applicable.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 exec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index 7b6e376..d0a7e7e 100644
--- a/exec.c
+++ b/exec.c
@@ -2308,9 +2308,9 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, Mem=
oryRegion *mr,
     size =3D HOST_PAGE_ALIGN(size);
     file_size =3D get_file_size(fd);
     if (file_size > 0 && file_size < size) {
-        error_setg(errp, "backing store %s size 0x%" PRIx64
+        error_setg(errp, "backing store size 0x%" PRIx64
                    " does not match 'size' option 0x" RAM_ADDR_FMT,
-                   mem_path, file_size, size);
+                   file_size, size);
         return NULL;
     }
=20
--=20
2.7.4


