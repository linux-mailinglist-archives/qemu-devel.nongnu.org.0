Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B8314F002
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:46:52 +0100 (CET)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYVP-0008OG-4g
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXzH-0006JS-T4
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXzG-00076x-Oj
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28044
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXzG-00075c-Kv
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4yeJ9YeREyuFJXglzTpaDhwRAhnNJf43VPlN8rTv7J8=;
 b=D3u5hS2V5ldLZmymmnfb14knwMSSz0XS/cG45G+T84TZiQxYTVV5+/+Hj9zbP4Jx28Koy0
 jGZbFG45xu7W0/DyjqT58rhkTjKPOQMqG19i+IE7yvEmyetqqJyU0dqwZ42EYq1T9Twnyi
 Ui7sLGuds1/rpqV74OY33vOSMfkT2Ks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-cLHnCsBWMhilrvSvxu1xUw-1; Fri, 31 Jan 2020 10:13:36 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64FCF8017CC;
 Fri, 31 Jan 2020 15:13:35 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90A6F89E87;
 Fri, 31 Jan 2020 15:13:34 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 75/80] exec: drop bogus mem_path from
 qemu_ram_alloc_from_fd()
Date: Fri, 31 Jan 2020 16:09:45 +0100
Message-Id: <1580483390-131164-76-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: cLHnCsBWMhilrvSvxu1xUw-1
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
Cc: pbonzini@redhat.com, rth@twiddle.net
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
CC: pbonzini@redhat.com
CC: rth@twiddle.net
---
 exec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index 9f5421c..d827fac 100644
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


