Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1811B7619
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 15:00:34 +0200 (CEST)
Received: from localhost ([::1]:35996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRxwX-0000ay-8g
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 09:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jRxrM-0006x1-Ve
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 08:55:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jRxrM-0003WG-6P
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 08:55:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21154
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jRxrL-0003Sm-MO
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 08:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587732911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ocEUSIlpGwj/TGvjKW7k4pUWIviCfkD55ancij1hww=;
 b=idMzoMefdLL/QmfPcyHuGJQJ9p3Z0VgU4AuNFbq7oLoCkl/0m3QqiWhUoC0M0qXknlKH5f
 KaPw1BuZmD8zCdQFj9EYwJOrku4+W2OoVhu3I4ZAvKobRENR90m9w9NSaoIg36JdO2Zdoz
 iHqvcAv7U2+1LdIunUsKbrUWWg4xQow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-KV6ljlsZN0iydn_GufhnNg-1; Fri, 24 Apr 2020 08:55:08 -0400
X-MC-Unique: KV6ljlsZN0iydn_GufhnNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7B53180F109;
 Fri, 24 Apr 2020 12:55:07 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-114.ams2.redhat.com
 [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EFC66084A;
 Fri, 24 Apr 2020 12:55:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 07/10] block: truncate: Don't make backing file data visible
Date: Fri, 24 Apr 2020 14:54:45 +0200
Message-Id: <20200424125448.63318-8-kwolf@redhat.com>
In-Reply-To: <20200424125448.63318-1-kwolf@redhat.com>
References: <20200424125448.63318-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 03:54:07
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When extending the size of an image that has a backing file larger than
its old size, make sure that the backing file data doesn't become
visible in the guest, but the added area is properly zeroed out.

Consider the following scenario where the overlay is shorter than its
backing file:

    base.qcow2:     AAAAAAAA
    overlay.qcow2:  BBBB

When resizing (extending) overlay.qcow2, the new blocks should not stay
unallocated and make the additional As from base.qcow2 visible like
before this patch, but zeros should be read.

A similar case happens with the various variants of a commit job when an
intermediate file is short (- for unallocated):

    base.qcow2:     A-A-AAAA
    mid.qcow2:      BB-B
    top.qcow2:      C--C--C-

After commit top.qcow2 to mid.qcow2, the following happens:

    mid.qcow2:      CB-C00C0 (correct result)
    mid.qcow2:      CB-C--C- (before this fix)

Without the fix, blocks that previously read as zeros on top.qcow2
suddenly turn into A.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/block/io.c b/block/io.c
index 795075954e..a4f9714230 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3394,6 +3394,31 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, =
int64_t offset, bool exact,
         goto out;
     }
=20
+    /*
+     * If the image has a backing file that is large enough that it would
+     * provide data for the new area, we cannot leave it unallocated becau=
se
+     * then the backing file content would become visible. Instead, zero-f=
ill
+     * the new area.
+     *
+     * Note that if the image has a backing file, but was opened without t=
he
+     * backing file, taking care of keeping things consistent with that ba=
cking
+     * file is the user's responsibility.
+     */
+    if (new_bytes && bs->backing) {
+        int64_t backing_len;
+
+        backing_len =3D bdrv_getlength(backing_bs(bs));
+        if (backing_len < 0) {
+            ret =3D backing_len;
+            error_setg_errno(errp, -ret, "Could not get backing file size"=
);
+            goto out;
+        }
+
+        if (backing_len > old_size) {
+            flags |=3D BDRV_REQ_ZERO_WRITE;
+        }
+    }
+
     if (drv->bdrv_co_truncate) {
         if (flags & ~bs->supported_truncate_flags) {
             error_setg(errp, "Block driver does not support requested flag=
s");
--=20
2.25.3


