Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B7F6322F3
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:01:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6Of-0001bv-MO; Mon, 21 Nov 2022 07:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6OW-0001ay-IN
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:59:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6OV-0006RT-1o
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669035566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lv4vZEI7OQUfHArHUOc7UL/dhPGExU7enAwFsaFQkm8=;
 b=OLFD3fLRomdyFChNX3BC9bJzRAaTW+BFPOWJt0rvTfes1Esy7LDUI53xTPfyXHtMobtkOE
 IC0W31zpbe9mE873c4fp+FXrCBMh5GfDHvIIABywHRdub5g148Ax8xhzFfY0TBMTcblp9Q
 Y1Xn5lYsHWohr5ae0fiYo6Gx32DlwLQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-TksasngsNL-g8bRS6tYCNA-1; Mon, 21 Nov 2022 07:59:22 -0500
X-MC-Unique: TksasngsNL-g8bRS6tYCNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6FF78027FE;
 Mon, 21 Nov 2022 12:59:21 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08FA7C15BB9;
 Mon, 21 Nov 2022 12:59:19 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PULL 4/8] migration: Fix race on qemu_file_shutdown()
Date: Mon, 21 Nov 2022 13:59:03 +0100
Message-Id: <20221121125907.62469-5-quintela@redhat.com>
In-Reply-To: <20221121125907.62469-1-quintela@redhat.com>
References: <20221121125907.62469-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Xu <peterx@redhat.com>

In qemu_file_shutdown(), there's a possible race if with current order of
operation.  There're two major things to do:

  (1) Do real shutdown() (e.g. shutdown() syscall on socket)
  (2) Update qemufile's last_error

We must do (2) before (1) otherwise there can be a race condition like:

      page receiver                     other thread
      -------------                     ------------
      qemu_get_buffer()
                                        do shutdown()
        returns 0 (buffer all zero)
        (meanwhile we didn't check this retcode)
      try to detect IO error
        last_error==NULL, IO okay
      install ALL-ZERO page
                                        set last_error
      --> guest crash!

To fix this, we can also check retval of qemu_get_buffer(), but not all
APIs can be properly checked and ultimately we still need to go back to
qemu_file_get_error().  E.g. qemu_get_byte() doesn't return error.

Maybe some day a rework of qemufile API is really needed, but for now keep
using qemu_file_get_error() and fix it by not allowing that race condition
to happen.  Here shutdown() is indeed special because the last_error was
emulated.  For real -EIO errors it'll always be set when e.g. sendmsg()
error triggers so we won't miss those ones, only shutdown() is a bit tricky
here.

Cc: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 4f400c2e52..2d5f74ffc2 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -79,6 +79,30 @@ int qemu_file_shutdown(QEMUFile *f)
     int ret = 0;
 
     f->shutdown = true;
+
+    /*
+     * We must set qemufile error before the real shutdown(), otherwise
+     * there can be a race window where we thought IO all went though
+     * (because last_error==NULL) but actually IO has already stopped.
+     *
+     * If without correct ordering, the race can happen like this:
+     *
+     *      page receiver                     other thread
+     *      -------------                     ------------
+     *      qemu_get_buffer()
+     *                                        do shutdown()
+     *        returns 0 (buffer all zero)
+     *        (we didn't check this retcode)
+     *      try to detect IO error
+     *        last_error==NULL, IO okay
+     *      install ALL-ZERO page
+     *                                        set last_error
+     *      --> guest crash!
+     */
+    if (!f->last_error) {
+        qemu_file_set_error(f, -EIO);
+    }
+
     if (!qio_channel_has_feature(f->ioc,
                                  QIO_CHANNEL_FEATURE_SHUTDOWN)) {
         return -ENOSYS;
@@ -88,9 +112,6 @@ int qemu_file_shutdown(QEMUFile *f)
         ret = -EIO;
     }
 
-    if (!f->last_error) {
-        qemu_file_set_error(f, -EIO);
-    }
     return ret;
 }
 
-- 
2.38.1


