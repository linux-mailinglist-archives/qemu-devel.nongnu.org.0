Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE3A151943
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 12:08:27 +0100 (CET)
Received: from localhost ([::1]:56364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyw4A-00012F-Om
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 06:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34117)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iyw15-0005Pe-HC
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 06:05:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iyw14-0008Hn-Ke
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 06:05:15 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36442
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iyw14-0008Gy-GI
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 06:05:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580814314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b99PsUtLC8Qy49cqjmWGtvS2/yIOiWGXjqbKMb5lPmM=;
 b=StaXH8GErStHmdCKdSBi9xqdiAJM1sjtPpkJ1MAhtS+OZwJR/nPzd8jbTSQMMgR5u9wQZt
 dkrDqv27nPtwa4R+UC4jyJb8bRddvSejsTlY9hkk379xm+sdelUO76wmIKVOQ4IbLBCZ/Y
 tB1ebkYaK2vOq69pa4JBNwYQGd07+rY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-8pZDAYSjO6mxQ6w0SwE_Dw-1; Tue, 04 Feb 2020 06:05:12 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 665BBDBA9
 for <qemu-devel@nongnu.org>; Tue,  4 Feb 2020 11:05:11 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE6CC196AE;
 Tue,  4 Feb 2020 11:05:10 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PATCH 4/4] virtiofsd: do_read missing NULL check
Date: Tue,  4 Feb 2020 11:05:01 +0000
Message-Id: <20200204110501.10731-5-dgilbert@redhat.com>
In-Reply-To: <20200204110501.10731-1-dgilbert@redhat.com>
References: <20200204110501.10731-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 8pZDAYSjO6mxQ6w0SwE_Dw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Missing a NULL check if the argument fetch fails.

Fixes: Coverity CID 1413119
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 01c418aade..704c0369b2 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1116,6 +1116,10 @@ static void do_read(fuse_req_t req, fuse_ino_t nodei=
d,
         struct fuse_file_info fi;
=20
         arg =3D fuse_mbuf_iter_advance(iter, sizeof(*arg));
+        if (!arg) {
+            fuse_reply_err(req, EINVAL);
+            return;
+        }
=20
         memset(&fi, 0, sizeof(fi));
         fi.fh =3D arg->fh;
--=20
2.24.1


