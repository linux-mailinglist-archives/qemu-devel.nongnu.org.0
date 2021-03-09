Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5BC332BF7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:28:27 +0100 (CET)
Received: from localhost ([::1]:42306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfDe-0004nj-5o
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJefL-0004J5-HE
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJef1-00012U-SY
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615305159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/aC3KvlsNRw6J6FsQ+Xu0A6KIiqvgUT2v8PeO5Qy6fE=;
 b=Ts12yn4TXVDWVVmHsbpiNDqBjZ9dMwjQu5iorJd7jFeFmUUsJck0b6EIZAOwsztA+VRssn
 pC099S9t6XPI/uA3Tv7wPqd52Y5uVLqaUKcBNVliRqOxogchepjMtefOU67kmclvGN/zFc
 ZA1r97bUlJQJiJbdAUmrEU+sXJL1cs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-2yX-GDo-P5-x7-BJO9YABg-1; Tue, 09 Mar 2021 10:52:34 -0500
X-MC-Unique: 2yX-GDo-P5-x7-BJO9YABg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6DB41018F72;
 Tue,  9 Mar 2021 15:52:32 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 189AD19C46;
 Tue,  9 Mar 2021 15:52:32 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/17] block/qcow2: simplify qcow2_co_invalidate_cache()
Date: Tue,  9 Mar 2021 09:52:00 -0600
Message-Id: <20210309155202.1312571-16-eblake@redhat.com>
In-Reply-To: <20210309155202.1312571-1-eblake@redhat.com>
References: <20210309155202.1312571-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, "open list:qcow2" <qemu-block@nongnu.org>,
 Greg Kurz <groug@kaod.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

qcow2_do_open correctly sets errp on each failure path. So, we can
simplify code in qcow2_co_invalidate_cache() and drop explicit error
propagation.

Add ERRP_GUARD() as mandated by the documentation in
include/qapi/error.h so that error_prepend() is actually called even if
errp is &error_fatal.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210202124956.63146-13-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 4aa0890166e3..a1dee95dea6c 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2716,11 +2716,11 @@ static void qcow2_close(BlockDriverState *bs)
 static void coroutine_fn qcow2_co_invalidate_cache(BlockDriverState *bs,
                                                    Error **errp)
 {
+    ERRP_GUARD();
     BDRVQcow2State *s = bs->opaque;
     int flags = s->flags;
     QCryptoBlock *crypto = NULL;
     QDict *options;
-    Error *local_err = NULL;
     int ret;

     /*
@@ -2738,16 +2738,11 @@ static void coroutine_fn qcow2_co_invalidate_cache(BlockDriverState *bs,

     flags &= ~BDRV_O_INACTIVE;
     qemu_co_mutex_lock(&s->lock);
-    ret = qcow2_do_open(bs, options, flags, &local_err);
+    ret = qcow2_do_open(bs, options, flags, errp);
     qemu_co_mutex_unlock(&s->lock);
     qobject_unref(options);
-    if (local_err) {
-        error_propagate_prepend(errp, local_err,
-                                "Could not reopen qcow2 layer: ");
-        bs->drv = NULL;
-        return;
-    } else if (ret < 0) {
-        error_setg_errno(errp, -ret, "Could not reopen qcow2 layer");
+    if (ret < 0) {
+        error_prepend(errp, "Could not reopen qcow2 layer: ");
         bs->drv = NULL;
         return;
     }
-- 
2.30.1


