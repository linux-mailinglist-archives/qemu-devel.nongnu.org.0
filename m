Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3BB11D493
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 18:53:20 +0100 (CET)
Received: from localhost ([::1]:34972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifSeN-0000dx-4D
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 12:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34343)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ifRWo-0007Qe-W3
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:41:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ifRWn-0004M8-Ss
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:41:26 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35207
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ifRWn-0004K4-NM
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576168884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNGmZE7aAynmSencc4aNdEJnJ7DR5wAkEtYCUhW11NE=;
 b=gg0BFDb2eQHh99IUQvS1gVHfZ5kMG405i0K6aF69AB/ziOrO/n7UCay6aY+iqaDQ6uOygO
 ly1PPt4HTmdM2rQ9Eof69TVsJp7jOcl0ThZn8k57/9NCvmqU1ZMy6J3VRthX3b34spCatX
 Iu4ooKo7dq/IjG7YotTPGD0D6oSLRQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-uwvEZrmDP9SUBt1_6otTyA-1; Thu, 12 Dec 2019 11:41:22 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B0B0802568
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 16:41:22 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-226.ams2.redhat.com
 [10.36.116.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DE6660BE1;
 Thu, 12 Dec 2019 16:41:21 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com,
	vgoyal@redhat.com
Subject: [PATCH 083/104] virtiofsd: fix incorrect error handling in
 lo_do_lookup
Date: Thu, 12 Dec 2019 16:38:43 +0000
Message-Id: <20191212163904.159893-84-dgilbert@redhat.com>
In-Reply-To: <20191212163904.159893-1-dgilbert@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: uwvEZrmDP9SUBt1_6otTyA-1
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Ren <renzhen@linux.alibaba.com>

Signed-off-by: Eric Ren <renzhen@linux.alibaba.com>
---
 tools/virtiofsd/passthrough_ll.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 097033aa00..fbcc222860 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -815,7 +815,6 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t pare=
nt, const char *name,
         close(newfd);
         newfd =3D -1;
     } else {
-        saverr =3D ENOMEM;
         inode =3D calloc(1, sizeof(struct lo_inode));
         if (!inode) {
             goto out_err;
--=20
2.23.0


