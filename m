Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E7C55168D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 13:05:52 +0200 (CEST)
Received: from localhost ([::1]:46420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3FE6-0006Fm-3l
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 07:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FAh-0002mh-5F
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FAe-0007UF-Ue
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655722936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3I+HARwk4i/8zBtntK3+Fni6j5yJI2/m9pihcprTrvU=;
 b=TqNLyf3zz0LKLTjAcR4pWfeeJ81jchx5LHzT93Lgvn0MPY+g7m4Mm8Yao5A6MenPA9ESQQ
 sm48EXGbLR7mxsDQ1Febz3Ifrflc+7j3GohnH6Q1DhfIjHzJZgpYb7WO1Z9PORBHE7BCFY
 fQDPV8Pjpg+17qrbTpmWNCufOEzx86Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-s7SJtIMUNxmGScu1gV4cWA-1; Mon, 20 Jun 2022 07:02:13 -0400
X-MC-Unique: s7SJtIMUNxmGScu1gV4cWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC5CD811E80;
 Mon, 20 Jun 2022 11:02:12 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D278C2810D;
 Mon, 20 Jun 2022 11:02:11 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 02/21] migration: switch to use QIOChannelNull for dummy
 channel
Date: Mon, 20 Jun 2022 12:01:46 +0100
Message-Id: <20220620110205.1357829-3-berrange@redhat.com>
In-Reply-To: <20220620110205.1357829-1-berrange@redhat.com>
References: <20220620110205.1357829-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This removes one further custom impl of QEMUFile, in favour of a
QIOChannel based impl.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/ram.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5f5e37f64d..89082716d6 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -32,11 +32,13 @@
 #include "qemu/bitmap.h"
 #include "qemu/madvise.h"
 #include "qemu/main-loop.h"
+#include "io/channel-null.h"
 #include "xbzrle.h"
 #include "ram.h"
 #include "migration.h"
 #include "migration/register.h"
 #include "migration/misc.h"
+#include "migration/qemu-file-channel.h"
 #include "qemu-file.h"
 #include "postcopy-ram.h"
 #include "page_cache.h"
@@ -457,8 +459,6 @@ static QemuThread *compress_threads;
  */
 static QemuMutex comp_done_lock;
 static QemuCond comp_done_cond;
-/* The empty QEMUFileOps will be used by file in CompressParam */
-static const QEMUFileOps empty_ops = { };
 
 static QEMUFile *decomp_file;
 static DecompressParam *decomp_param;
@@ -569,7 +569,8 @@ static int compress_threads_save_setup(void)
         /* comp_param[i].file is just used as a dummy buffer to save data,
          * set its ops to empty.
          */
-        comp_param[i].file = qemu_fopen_ops(NULL, &empty_ops, false);
+        comp_param[i].file = qemu_fopen_channel_output(
+            QIO_CHANNEL(qio_channel_null_new()));
         comp_param[i].done = true;
         comp_param[i].quit = false;
         qemu_mutex_init(&comp_param[i].mutex);
-- 
2.36.1


