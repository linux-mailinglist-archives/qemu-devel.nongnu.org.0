Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336251B45FD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 15:12:36 +0200 (CEST)
Received: from localhost ([::1]:50316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRFB5-0002op-6o
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 09:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46934)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRF6C-0003u6-V3
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:07:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRF6C-00040k-Av
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:07:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32628
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jRF6B-0003zL-PX
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587560851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Glh3aSFU95f07Nq6p1r26pjgro1OM1831U2o6jSJdDE=;
 b=A2g7NpwKnlI4bTBrakgkdq5t3ciXG+o+myHPSnqBT9QLWyXNhHbUUFLyCYvkXNAAYjH/zu
 g+ybT4pmbmmQ6rGIGP+dSyPk3s01WTvCArBxES+At5g9WI6clY4hw7Frv6R2FxrpoPm59k
 nZi56ihYcamtStSqww1B9qA6wGqyI5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-T6Z_mBxiPpylZ6JboZTCzw-1; Wed, 22 Apr 2020 09:07:29 -0400
X-MC-Unique: T6Z_mBxiPpylZ6JboZTCzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C628218CA247
 for <qemu-devel@nongnu.org>; Wed, 22 Apr 2020 13:07:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 908B85D714;
 Wed, 22 Apr 2020 13:07:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0468C11358BE; Wed, 22 Apr 2020 15:07:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/14] block/file-posix: Fix check_cache_dropped() error
 handling
Date: Wed, 22 Apr 2020 15:07:07 +0200
Message-Id: <20200422130719.28225-3-armbru@redhat.com>
In-Reply-To: <20200422130719.28225-1-armbru@redhat.com>
References: <20200422130719.28225-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 09:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

check_cache_dropped() calls error_setg() in a loop.  It fails to break
the loop in one instance.  If a subsequent iteration error_setg()s
again, it trips error_setv()'s assertion.

Fix it to break the loop.

Fixes: 31be8a2a97ecba7d31a82932286489cac318e9e9
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/file-posix.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 7e19bbff5f..094e3b0212 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2691,10 +2691,13 @@ static void check_cache_dropped(BlockDriverState *b=
s, Error **errp)
         vec_end =3D DIV_ROUND_UP(length, page_size);
         for (i =3D 0; i < vec_end; i++) {
             if (vec[i] & 0x1) {
-                error_setg(errp, "page cache still in use!");
                 break;
             }
         }
+        if (i < vec_end) {
+            error_setg(errp, "page cache still in use!");
+            break;
+        }
     }
=20
     if (window) {
--=20
2.21.1


