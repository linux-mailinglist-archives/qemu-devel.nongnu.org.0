Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704C6263069
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 17:21:33 +0200 (CEST)
Received: from localhost ([::1]:54222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG1ue-0006qE-HQ
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 11:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kG1m0-00027D-La
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 11:12:36 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53155
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kG1lr-0003rI-Of
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 11:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599664347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T1f93CLeI7XbsWc1n6jkN80r4+iwDZXWFjXEDaFuglk=;
 b=Pzbe1oIas7QIElI6ySLLyHiIleo65J0JGsvsfmlwCkk21Hi1BRNY4dxBSzqSgqpBLuDAY6
 42y9TGfEHadFM7hmpOwbKGWGeHEJ0S/0nKVvF7TU7GFcsawc/LzPoqIF3JfC+aabbDdCzf
 9Au04FPgHskyXJhlvz17ddIHwC7qWEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-VOJ9l9jDNtyZtNsmsRzp4A-1; Wed, 09 Sep 2020 11:12:24 -0400
X-MC-Unique: VOJ9l9jDNtyZtNsmsRzp4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F8651882FA0;
 Wed,  9 Sep 2020 15:12:23 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-221.ams2.redhat.com
 [10.36.113.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0749660C87;
 Wed,  9 Sep 2020 15:12:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 12/13] block: Add bdrv_co_move_to_aio_context()
Date: Wed,  9 Sep 2020 17:11:48 +0200
Message-Id: <20200909151149.490589-13-kwolf@redhat.com>
In-Reply-To: <20200909151149.490589-1-kwolf@redhat.com>
References: <20200909151149.490589-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:20:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a function to move the current coroutine to the AioContext of a
given BlockDriverState.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |  6 ++++++
 block.c               | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 981ab5b314..80ab322f11 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -626,6 +626,12 @@ bool bdrv_debug_is_suspended(BlockDriverState *bs, const char *tag);
  */
 AioContext *bdrv_get_aio_context(BlockDriverState *bs);
 
+/**
+ * Move the current coroutine to the AioContext of @bs and return the old
+ * AioContext of the coroutine.
+ */
+AioContext *coroutine_fn bdrv_co_move_to_aio_context(BlockDriverState *bs);
+
 /**
  * Transfer control to @co in the aio context of @bs
  */
diff --git a/block.c b/block.c
index 9538af4884..81403e00d1 100644
--- a/block.c
+++ b/block.c
@@ -6372,6 +6372,16 @@ AioContext *bdrv_get_aio_context(BlockDriverState *bs)
     return bs ? bs->aio_context : qemu_get_aio_context();
 }
 
+AioContext *coroutine_fn bdrv_co_move_to_aio_context(BlockDriverState *bs)
+{
+    Coroutine *self = qemu_coroutine_self();
+    AioContext *old_ctx = qemu_coroutine_get_aio_context(self);
+    AioContext *new_ctx = bdrv_get_aio_context(bs);
+
+    aio_co_reschedule_self(new_ctx);
+    return old_ctx;
+}
+
 void bdrv_coroutine_enter(BlockDriverState *bs, Coroutine *co)
 {
     aio_co_enter(bdrv_get_aio_context(bs), co);
-- 
2.25.4


