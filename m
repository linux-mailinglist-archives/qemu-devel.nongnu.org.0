Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845A51B607F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 18:14:20 +0200 (CEST)
Received: from localhost ([::1]:58626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jReUV-0002Jo-Hx
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 12:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59972)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jReHr-0006BC-2T
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:01:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jReHa-0002DM-F8
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:01:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22382
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jReHX-00020F-HU
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587657642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2jcaWXJL7+Y8beWBsofv6D3+PvqGhK2beksT/pD30Q=;
 b=Ba8cdSevhYm+n9Iy9wUXWxaKPLB0c3irinF8DVe6CUpreV7wX6pI2ydPb6eJEN1pj4JmSo
 kxXlVMu32f+fIcnb050obtYbZSd5u9V5j4xNI8rlL06emA+lKd0fEgyJlvAEZMKAvKKgc0
 BAofMwfGXfOaSDepX9JRNyWkTVg3tIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-J0vzZe5vNeyjP-hJzz-kxQ-1; Thu, 23 Apr 2020 12:00:41 -0400
X-MC-Unique: J0vzZe5vNeyjP-hJzz-kxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEB45835B45;
 Thu, 23 Apr 2020 16:00:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7849560609;
 Thu, 23 Apr 2020 16:00:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A31A11358C3; Thu, 23 Apr 2020 18:00:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/13] qapi: Fix Visitor contract for start_alternate()
Date: Thu, 23 Apr 2020 18:00:30 +0200
Message-Id: <20200423160036.7048-8-armbru@redhat.com>
In-Reply-To: <20200423160036.7048-1-armbru@redhat.com>
References: <20200423160036.7048-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 05:42:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The contract demands v->start_alternate() for input and dealloc
visitors, but visit_start_alternate() actually requires it for input
and clone visitors.  Fix the contract, and delete superfluous
qapi_dealloc_start_alternate().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/visitor-impl.h | 5 ++---
 qapi/qapi-dealloc-visitor.c | 7 -------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h
index 8ccb3b6c20..252206dc0d 100644
--- a/include/qapi/visitor-impl.h
+++ b/include/qapi/visitor-impl.h
@@ -67,13 +67,12 @@ struct Visitor
     /* Must be set */
     void (*end_list)(Visitor *v, void **list);
=20
-    /* Must be set by input and dealloc visitors to visit alternates;
-     * optional for output visitors. */
+    /* Must be set by input and clone visitors to visit alternates */
     void (*start_alternate)(Visitor *v, const char *name,
                             GenericAlternate **obj, size_t size,
                             Error **errp);
=20
-    /* Optional, needed for dealloc visitor */
+    /* Optional */
     void (*end_alternate)(Visitor *v, void **obj);
=20
     /* Must be set */
diff --git a/qapi/qapi-dealloc-visitor.c b/qapi/qapi-dealloc-visitor.c
index d192724b13..2239fc6417 100644
--- a/qapi/qapi-dealloc-visitor.c
+++ b/qapi/qapi-dealloc-visitor.c
@@ -34,12 +34,6 @@ static void qapi_dealloc_end_struct(Visitor *v, void **o=
bj)
     }
 }
=20
-static void qapi_dealloc_start_alternate(Visitor *v, const char *name,
-                                         GenericAlternate **obj, size_t si=
ze,
-                                         Error **errp)
-{
-}
-
 static void qapi_dealloc_end_alternate(Visitor *v, void **obj)
 {
     if (obj) {
@@ -123,7 +117,6 @@ Visitor *qapi_dealloc_visitor_new(void)
     v->visitor.type =3D VISITOR_DEALLOC;
     v->visitor.start_struct =3D qapi_dealloc_start_struct;
     v->visitor.end_struct =3D qapi_dealloc_end_struct;
-    v->visitor.start_alternate =3D qapi_dealloc_start_alternate;
     v->visitor.end_alternate =3D qapi_dealloc_end_alternate;
     v->visitor.start_list =3D qapi_dealloc_start_list;
     v->visitor.next_list =3D qapi_dealloc_next_list;
--=20
2.21.1


