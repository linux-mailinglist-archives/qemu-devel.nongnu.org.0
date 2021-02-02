Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43330CF6F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:55:52 +0100 (CET)
Received: from localhost ([::1]:44374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74aN-0003Ve-QN
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qk-0007Tt-Dr
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qa-0005rB-FC
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ze12h6Q257OAoWvvO+28PCLATrE+mdLZ9H4j6SE86n4=;
 b=FR6wwqellS1/E/67BgTJLP1f4rIi+naXQ34wZRneuwertmAO9AHKzGidcrv7vJeHgd4G2P
 5LJ19EYoZiQznpfy/G/QV3SKd19j30y88M3d+WKzsRh/Nl0C96ysCScyEXFG0PEGA8J0ns
 OQ2ZusHNiP0yoxnmU2OcwmdUg5QWmR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-bVqe_y_IOuSwv2-D-_EFUA-1; Tue, 02 Feb 2021 17:45:41 -0500
X-MC-Unique: bVqe_y_IOuSwv2-D-_EFUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7432E107ACE3;
 Tue,  2 Feb 2021 22:45:40 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4EAC10016F5;
 Tue,  2 Feb 2021 22:45:39 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/20] block/throttle-groups:
 throttle_group_co_io_limits_intercept(): 64bit bytes
Date: Tue,  2 Feb 2021 16:45:16 -0600
Message-Id: <20210202224529.642055-8-eblake@redhat.com>
In-Reply-To: <20210202224529.642055-1-eblake@redhat.com>
References: <20210202224529.642055-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Alberto Garcia <berto@igalia.com>,
 "open list:Throttling infras..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

The function is called from 64bit io handlers, and bytes is just passed
to throttle_account() which is 64bit too (unsigned though). So, let's
convert intermediate argument to 64bit too.

This patch is a first in the 64-bit-blocklayer series, so we are
generally moving to int64_t for both offset and bytes parameters on all
io paths. Main motivation is realization of 64-bit write_zeroes
operation for fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

Patch-correctness audit by Eric Blake:

  Caller has 32-bit, this patch now causes widening which is safe:
  block/block-backend.c: blk_do_preadv() passes 'unsigned int'
  block/block-backend.c: blk_do_pwritev_part() passes 'unsigned int'
  block/throttle.c: throttle_co_pwrite_zeroes() passes 'int'
  block/throttle.c: throttle_co_pdiscard() passes 'int'

  Caller has 64-bit, this patch fixes potential bug where pre-patch
  could narrow, except it's easy enough to trace that callers are still
  capped at 2G actions:
  block/throttle.c: throttle_co_preadv() passes 'uint64_t'
  block/throttle.c: throttle_co_pwritev() passes 'uint64_t'

  Implementation in question: block/throttle-groups.c
  throttle_group_co_io_limits_intercept() takes 'unsigned int bytes'
  and uses it: argument to util/throttle.c throttle_account(uint64_t)

  All safe: it patches a latent bug, and does not introduce any 64-bit
  gotchas once throttle_co_p{read,write}v are relaxed, and assuming
  throttle_account() is not buggy.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-Id: <20201211183934.169161-7-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/throttle-groups.h | 2 +-
 block/throttle-groups.c         | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/block/throttle-groups.h b/include/block/throttle-groups.h
index 8bf7d233fae5..9541b3243280 100644
--- a/include/block/throttle-groups.h
+++ b/include/block/throttle-groups.h
@@ -77,7 +77,7 @@ void throttle_group_unregister_tgm(ThrottleGroupMember *tgm);
 void throttle_group_restart_tgm(ThrottleGroupMember *tgm);

 void coroutine_fn throttle_group_co_io_limits_intercept(ThrottleGroupMember *tgm,
-                                                        unsigned int bytes,
+                                                        int64_t bytes,
                                                         bool is_write);
 void throttle_group_attach_aio_context(ThrottleGroupMember *tgm,
                                        AioContext *new_context);
diff --git a/block/throttle-groups.c b/block/throttle-groups.c
index abd16ed9dbfd..fb203c3ced4a 100644
--- a/block/throttle-groups.c
+++ b/block/throttle-groups.c
@@ -358,12 +358,15 @@ static void schedule_next_request(ThrottleGroupMember *tgm, bool is_write)
  * @is_write:  the type of operation (read/write)
  */
 void coroutine_fn throttle_group_co_io_limits_intercept(ThrottleGroupMember *tgm,
-                                                        unsigned int bytes,
+                                                        int64_t bytes,
                                                         bool is_write)
 {
     bool must_wait;
     ThrottleGroupMember *token;
     ThrottleGroup *tg = container_of(tgm->throttle_state, ThrottleGroup, ts);
+
+    assert(bytes >= 0);
+
     qemu_mutex_lock(&tg->lock);

     /* First we check if this I/O has to be throttled. */
-- 
2.30.0


