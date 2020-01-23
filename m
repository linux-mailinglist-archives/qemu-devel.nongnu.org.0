Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E021471E3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:41:23 +0100 (CET)
Received: from localhost ([::1]:60382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuiLy-0007j6-Ii
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:41:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42313)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufee-0005p6-Oi
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufed-0007uP-MN
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36391
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufed-0007tp-Jm
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9llGFG3+z7QcjC+AlX0yI14eva8q16/+ssJR4lGIrM4=;
 b=U+Q8xlo0DBNMdGciG4rkcqWwObuMP1hEa0YdQQDWDcmw4Mm3CKOgy+csxsbFP0dvqkbAvh
 ksK+GS7eGB6IaRwjLe+4c9pjkjEzpgjkUFaJUMea9dpEO0DOmGEGmkwILW1/rQ65XTIWXi
 MrVlAYpbeLEtMmfAJHeTNtmcMoM+Ge4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-pCzYJXdSN6akB6EiuRlORQ-1; Thu, 23 Jan 2020 11:48:25 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2F12803A47
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:48:24 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AA2D28993;
 Thu, 23 Jan 2020 16:48:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 083/108] virtiofsd: fix incorrect error handling in lo_do_lookup
Date: Thu, 23 Jan 2020 16:46:05 +0000
Message-Id: <20200123164630.91498-84-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: pCzYJXdSN6akB6EiuRlORQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Ren <renzhen@linux.alibaba.com>

Signed-off-by: Eric Ren <renzhen@linux.alibaba.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index e8dc5c7320..05b5f898db 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -814,7 +814,6 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t pare=
nt, const char *name,
         close(newfd);
         newfd =3D -1;
     } else {
-        saverr =3D ENOMEM;
         inode =3D calloc(1, sizeof(struct lo_inode));
         if (!inode) {
             goto out_err;
--=20
2.24.1


