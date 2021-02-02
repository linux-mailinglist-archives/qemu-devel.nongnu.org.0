Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8160630C60D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:40:10 +0100 (CET)
Received: from localhost ([::1]:60104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yin-0006ey-0A
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:40:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6yY4-00055H-QC
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:29:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6yY2-00009n-Nl
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612283342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gij5QeqtyE8f4Gz34t7KEJ33X71FNsnrFRF6nodtYrk=;
 b=GkwnHOWnDoNyC75hky3Rg+79okdh2YrIrUeHJolOZEdGUfEMkOKFUAzdBWBkwx1HDgP/qa
 4NajGa+qaC7uo4Sr/11/JouIpLRlknMFlKhiD7in3TYMVKPT0FPjdI8seg95vcdIC/BtNr
 X3yvNG3HZaE5qkTnObybyOZOjUxsk3E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-k_anpE2DP3yDQUEJTX7ShA-1; Tue, 02 Feb 2021 11:29:00 -0500
X-MC-Unique: k_anpE2DP3yDQUEJTX7ShA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED46E107ACFB;
 Tue,  2 Feb 2021 16:28:58 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5255A5D749;
 Tue,  2 Feb 2021 16:28:56 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 03/10] block: move blk_exp_close_all() to qemu_cleanup()
Date: Tue,  2 Feb 2021 17:28:27 +0100
Message-Id: <20210202162834.269789-4-kwolf@redhat.com>
In-Reply-To: <20210202162834.269789-1-kwolf@redhat.com>
References: <20210202162834.269789-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


