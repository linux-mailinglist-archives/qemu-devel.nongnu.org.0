Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D3930B01A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:10:39 +0100 (CET)
Received: from localhost ([::1]:50644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6eas-0005mC-7u
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6eY0-0003ms-At
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:07:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6eXy-0000PB-JY
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612206458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gij5QeqtyE8f4Gz34t7KEJ33X71FNsnrFRF6nodtYrk=;
 b=L1bbBgOf1V0ESCjfwU3vblbp1K+7hvmCNt2Sjl6HP+Bcv3CfjEfHlzmSc6NW3Ot4dPfOhx
 stl2ffJXi3bbHhjFUiIo6Eqssl3sS80dQjjUMNvz2t+06Hhu/VYH44SF5qx3LMsZOY9FX7
 onmATvnCWVbqkiQ4EKDa2QtBdTjYz4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-raozcOgqNGWLV2K9DMfUcA-1; Mon, 01 Feb 2021 14:07:36 -0500
X-MC-Unique: raozcOgqNGWLV2K9DMfUcA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5F6C8144E0;
 Mon,  1 Feb 2021 19:07:34 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44E5560C05;
 Mon,  1 Feb 2021 19:07:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 3/6] block: move blk_exp_close_all() to qemu_cleanup()
Date: Mon,  1 Feb 2021 20:07:17 +0100
Message-Id: <20210201190720.245732-4-kwolf@redhat.com>
In-Reply-To: <20210201190720.245732-1-kwolf@redhat.com>
References: <20210201190720.245732-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergio Lopez <slp@redhat.com>

Move blk_exp_close_all() from bdrv_close() to qemu_cleanup(), before
bdrv_drain_all_begin().

Export drivers may have coroutines yielding at some point in the block
layer, so we need to shut them down before draining the block layer,
as otherwise they may get stuck blk_wait_while_drained().

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1900505
Signed-off-by: Sergio Lopez <slp@redhat.com>
Message-Id: <20210201125032.44713-3-slp@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                              | 1 -
 qemu-nbd.c                           | 1 +
 softmmu/runstate.c                   | 9 +++++++++
 storage-daemon/qemu-storage-daemon.c | 1 +
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 5c428e1595..4e52b1c588 100644
--- a/block.c
+++ b/block.c
@@ -4435,7 +4435,6 @@ static void bdrv_close(BlockDriverState *bs)
 void bdrv_close_all(void)
 {
     assert(job_next(NULL) == NULL);
-    blk_exp_close_all();
 
     /* Drop references from requests still in flight, such as canceled block
      * jobs whose AIO context has not been polled yet */
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 0d513cb38c..608c63e82a 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -503,6 +503,7 @@ static const char *socket_activation_validate_opts(const char *device,
 static void qemu_nbd_shutdown(void)
 {
     job_cancel_sync_all();
+    blk_exp_close_all();
     bdrv_close_all();
 }
 
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index beee050815..a7fcb603f7 100644
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
@@ -784,6 +785,14 @@ void qemu_cleanup(void)
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
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index e0c87edbdd..d8d172cc60 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -314,6 +314,7 @@ int main(int argc, char *argv[])
         main_loop_wait(false);
     }
 
+    blk_exp_close_all();
     bdrv_drain_all_begin();
     bdrv_close_all();
 
-- 
2.29.2


