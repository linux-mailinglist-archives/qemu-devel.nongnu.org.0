Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08862FF183
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:14:08 +0100 (CET)
Received: from localhost ([::1]:39386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dX5-0007dC-O0
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1l2dQi-0001a6-MW
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:07:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1l2dQY-0001qV-8c
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611248838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qo5p2TRXzIfGX4YJ9RV/fb1d7R174yzwYtBXzKdVd9w=;
 b=G3xSoa1tEPS/ad2xT5hx3zLvfctG491QOAeNC6v+l3bv/hKcsG5Bnp0jwKsXLLTqqZCFkv
 DNfBGpMS2qihCYEIU0ZlKfD1G5L/AoQEmCuB9+F/iltplygvkCGZ5ThuW+IYx3y1uEw+8i
 HEAGtkSq18Bf+HF3GF0Q+SyBJfKBOXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-9zeONQahMcOjE5nHllhrlw-1; Thu, 21 Jan 2021 12:07:14 -0500
X-MC-Unique: 9zeONQahMcOjE5nHllhrlw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3294884E242;
 Thu, 21 Jan 2021 17:07:13 +0000 (UTC)
Received: from toolbox.redhat.com (ovpn-113-165.rdu2.redhat.com
 [10.10.113.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B320D6E515;
 Thu, 21 Jan 2021 17:07:11 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] block: move blk_exp_close_all() to qemu_cleanup()
Date: Thu, 21 Jan 2021 18:07:00 +0100
Message-Id: <20210121170700.59734-3-slp@redhat.com>
In-Reply-To: <20210121170700.59734-1-slp@redhat.com>
References: <20210121170700.59734-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move blk_exp_close_all() from bdrv_close() to qemu_cleanup(), before
bdrv_drain_all_begin().

Export drivers may have coroutines yielding at some point in the block
layer, so we need to shut them down before draining the block layer,
as otherwise they may get stuck blk_wait_while_drained().

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1900505
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 block.c            | 1 -
 softmmu/runstate.c | 9 +++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 3da99312db..9682c82fa8 100644
--- a/block.c
+++ b/block.c
@@ -4435,7 +4435,6 @@ static void bdrv_close(BlockDriverState *bs)
 void bdrv_close_all(void)
 {
     assert(job_next(NULL) == NULL);
-    blk_exp_close_all();
 
     /* Drop references from requests still in flight, such as canceled block
      * jobs whose AIO context has not been polled yet */
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 6177693a30..ac4b2e2540 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "audio/audio.h"
 #include "block/block.h"
+#include "block/export.h"
 #include "chardev/char.h"
 #include "crypto/cipher.h"
 #include "crypto/init.h"
@@ -783,6 +784,14 @@ void qemu_cleanup(void)
      */
     migration_shutdown();
 
+    /*
+     * Close the exports before draining the block layer. The export
+     * drivers may have coroutines yielding on it, so we need to clean
+     * them up before the drain, as otherwise they may be get stuck in
+     * blk_wait_while_drained().
+     */
+    blk_exp_close_all();
+
     /*
      * We must cancel all block jobs while the block layer is drained,
      * or cancelling will be affected by throttling and thus may block
-- 
2.26.2


