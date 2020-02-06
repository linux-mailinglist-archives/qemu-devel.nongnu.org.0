Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE681154A8A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 18:51:33 +0100 (CET)
Received: from localhost ([::1]:43814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izlJM-0006IN-Ra
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 12:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1izl6z-0001Rc-Vm
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 12:38:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1izl6y-0000ue-Or
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 12:38:45 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41436
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1izl6y-0000rt-K1
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 12:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581010724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KJx7gNx32V3qHzDazapjQlwfbUrsYLgzxhHy+vzrx90=;
 b=CzpuUD2v7/1v7bIhSske4Y4tnmRdNSZo6uHN98yMKxwjMgmFb9NVOUmmOoaGaqaHwVxpzm
 DdQ3/Ag2Op0+ysJu+dyVapCSjQ0roFDllLtMb+vvgqBy5FnuY4qIlekEQUrjw63qHgbUEO
 e4dnPYsxnelwPsKL5Rtsy5KMSt8Wl0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-o3jzaSvKPWCImQYyUlT6YQ-1; Thu, 06 Feb 2020 12:38:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59D75100551A;
 Thu,  6 Feb 2020 17:38:39 +0000 (UTC)
Received: from blue.redhat.com (ovpn-117-249.phx2.redhat.com [10.3.117.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD3995DA7D;
 Thu,  6 Feb 2020 17:38:38 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] nbd: Fix regression with multiple meta contexts
Date: Thu,  6 Feb 2020 11:38:32 -0600
Message-Id: <20200206173832.130004-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: o3jzaSvKPWCImQYyUlT6YQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: qemu-trivial@nongnu.org, pannengyuan@huawei.com, laurent@vivier.eu,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Detected by a hang in the libnbd testsuite.  If a client requests
multiple meta contexts (both base:allocation and qemu:dirty-bitmap:x)
at the same time, our attempt to silence a false-positive warning
about a potential uninitialized variable introduced botched logic: we
were short-circuiting the second context, and never sending the
NBD_REPLY_FLAG_DONE.  Combining two 'if' into one 'if/else' in
bdf200a55 was wrong (I'm a bit embarrassed that such a change was my
initial suggestion after the v1 patch, then I did not review the v2
patch that actually got committed). Revert that, and instead silence
the false positive warning by replacing 'return ret' with 'return 0'
(the value it always has at that point in the code, even though it
eluded the deduction abilities of the robot that reported the false
positive).

Fixes: bdf200a5535
Signed-off-by: Eric Blake <eblake@redhat.com>
---

It's never fun when a regression is caused by a patch taken through
qemu-trivial, proving that the patch was not trivial after all.

 nbd/server.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 87fcd2e7bfac..11a31094ff83 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2384,15 +2384,23 @@ static coroutine_fn int nbd_handle_request(NBDClien=
t *client,
                                                !client->export_meta.bitmap=
,
                                                NBD_META_ID_BASE_ALLOCATION=
,
                                                errp);
-            } else {              /* client->export_meta.bitmap */
+                if (ret < 0) {
+                    return ret;
+                }
+            }
+
+            if (client->export_meta.bitmap) {
                 ret =3D nbd_co_send_bitmap(client, request->handle,
                                          client->exp->export_bitmap,
                                          request->from, request->len,
                                          dont_fragment,
                                          true, NBD_META_ID_DIRTY_BITMAP, e=
rrp);
+                if (ret < 0) {
+                    return ret;
+                }
             }

-            return ret;
+            return 0;
         } else {
             return nbd_send_generic_reply(client, request->handle, -EINVAL=
,
                                           "CMD_BLOCK_STATUS not negotiated=
",
--=20
2.24.1


