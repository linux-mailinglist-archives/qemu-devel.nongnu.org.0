Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB94168416
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 17:51:13 +0100 (CET)
Received: from localhost ([::1]:33214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5BWC-0003un-FT
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 11:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j5BOw-0000By-9u
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:43:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j5BOv-00078R-CE
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:43:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26051
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j5BOu-00077w-GH
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582303420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w/z7m5Qm4HaPOtKr9rMP0YxTInrel2WDYqHS0dY6eVE=;
 b=QTO9gQs8cpOKNDO8W+tpyzVQ1ClOnL7xF9RDo1eZsVZxZ+PtRvziVdnWxHHI5X1TS//C72
 0dlBKUL/bKHmcksE5VKDS86reUrfDXroaVF+YawOgUoWA2RYSNuSKxqSllIruLg48cSRCq
 MxQO+b5T0EU48kiOQHP4cuNka7QjGJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-7QGlWqnBN1agfDJ6E-k7vg-1; Fri, 21 Feb 2020 11:43:38 -0500
X-MC-Unique: 7QGlWqnBN1agfDJ6E-k7vg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF7061005510;
 Fri, 21 Feb 2020 16:43:37 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-197.ams2.redhat.com [10.36.117.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 586C190F7C;
 Fri, 21 Feb 2020 16:43:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/13] migration/multifd: Print used_length of memory block
Date: Fri, 21 Feb 2020 17:42:02 +0100
Message-Id: <20200221164204.105570-12-david@redhat.com>
In-Reply-To: <20200221164204.105570-1-david@redhat.com>
References: <20200221164204.105570-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

We actually want to print the used_length, against which we check.

Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/multifd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index b3e8ae9bcc..dd9e88c5f1 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -222,7 +222,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams=
 *p, Error **errp)
         if (offset > (block->used_length - qemu_target_page_size())) {
             error_setg(errp, "multifd: offset too long %" PRIu64
                        " (max " RAM_ADDR_FMT ")",
-                       offset, block->max_length);
+                       offset, block->used_length);
             return -1;
         }
         p->pages->iov[i].iov_base =3D block->host + offset;
--=20
2.24.1


