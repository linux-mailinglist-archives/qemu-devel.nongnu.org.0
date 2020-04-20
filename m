Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F29C1B0497
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 10:39:19 +0200 (CEST)
Received: from localhost ([::1]:59700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQRxW-0005cR-MK
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 04:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56484 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jQRrC-0002tj-EO
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 04:32:46 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jQRrA-0006wX-Kl
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 04:32:46 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54063
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jQRrA-0006ue-7R
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 04:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587371563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8IwJuUhdu7xVAnYSveDtWGbyVZ74+1IB1yT93ItMesU=;
 b=cW7hUOFznlHN6rY7Znw/lNlR+Z2iSCpsYBrE4o90YNa+6JaWIJngfqzABycHfduJI7ea6c
 gW3pqXDlf4Ie2fBGT31T8iZQybC/3H9Li0PcYmukIoRnM0+eGRhVzlEI/COz8q4sMbcagg
 8FyRAqxCbuIJavVHET9l4blNaXhmv2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-DwqgQ15fM1WjDn9fWgMn0Q-1; Mon, 20 Apr 2020 04:32:41 -0400
X-MC-Unique: DwqgQ15fM1WjDn9fWgMn0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02FA0DB21
 for <qemu-devel@nongnu.org>; Mon, 20 Apr 2020 08:32:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 424995D9CD;
 Mon, 20 Apr 2020 08:32:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A29ED11358BE; Mon, 20 Apr 2020 10:32:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] block/file-posix: Fix check_cache_dropped() error
 handling
Date: Mon, 20 Apr 2020 10:32:27 +0200
Message-Id: <20200420083236.19309-3-armbru@redhat.com>
In-Reply-To: <20200420083236.19309-1-armbru@redhat.com>
References: <20200420083236.19309-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 01:47:04
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


