Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE671BCD7D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 22:34:00 +0200 (CEST)
Received: from localhost ([::1]:50430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTWvX-0007V2-Au
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 16:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jTWr5-0000Oq-Or
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 16:29:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jTWr5-0005sQ-6g
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 16:29:23 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23163
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jTWr4-0005r1-N6
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 16:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588105762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sy7muZnbrKhcT5u11YWymKLyj9t4Jbzg6RPGMAlmONs=;
 b=KBD/ARtOQNSAnyINk6DtSk+fCs9s4c/dz8x2ieldh1gY0pgKDbnQjnyH8bgEeqAFFClwV1
 kIcB3yQUjFHBZ8XAxlf4Y9gHPsx6H4PS/ZrjkrJd8Y+vn/J0TRtr7pgnS9HIXOOfaWI5wB
 gFxYwcyhdAbR/Yrq65w64KkcLSzBVRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-h66-C6bxNkWzom0ISka0og-1; Tue, 28 Apr 2020 16:29:20 -0400
X-MC-Unique: h66-C6bxNkWzom0ISka0og-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EBCC1895A29;
 Tue, 28 Apr 2020 20:29:19 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E375E5C1D4;
 Tue, 28 Apr 2020 20:29:15 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] rbd: Support BDRV_REQ_ZERO_WRITE for truncate
Date: Tue, 28 Apr 2020 15:29:00 -0500
Message-Id: <20200428202905.770727-5-eblake@redhat.com>
In-Reply-To: <20200428202905.770727-1-eblake@redhat.com>
References: <20200428202905.770727-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 04:11:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: kwolf@redhat.com, Jason Dillaman <dillaman@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our .bdrv_has_zero_init_truncate always returns 1 because rbd always
0-fills; we can use that same knowledge to implement
BDRV_REQ_ZERO_WRITE by ignoring it.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/rbd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/rbd.c b/block/rbd.c
index f2d52091c702..331c45adb2b2 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -817,6 +817,9 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *o=
ptions, int flags,
         }
     }

+    /* When extending regular files, we get zeros from the OS */
+    bs->supported_truncate_flags =3D BDRV_REQ_ZERO_WRITE;
+
     r =3D 0;
     goto out;

--=20
2.26.2


