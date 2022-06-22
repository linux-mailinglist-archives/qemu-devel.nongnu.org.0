Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA03D553F97
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 02:36:57 +0200 (CEST)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3oMa-0000qF-Uc
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 20:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCG-0002vd-3P
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oC6-00066L-Dg
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655857565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NWmVpRmMqZxslS2wDEvplRHj16T+Uv3aYbCe3PRbN4I=;
 b=DCrGnP/1raMc1sS0EhPGQFlBH0XLqxhBz0mKCKyGXXjRjyF0bdM+sBdua8NMGVohUMjmQd
 Ppy1ICPqFT018WBkVWDjf7xgk5Ys8WPkdHJ8xMTq4FIi47EXuog+wUNG8WTs9f2tyAgDTl
 5fwHPynPrLmqRvD4m00kLJgPnWiwy3Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-xVWC-l3BN9OTTxYA2tjiNw-1; Tue, 21 Jun 2022 20:26:04 -0400
X-MC-Unique: xVWC-l3BN9OTTxYA2tjiNw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A78713C0CD46;
 Wed, 22 Jun 2022 00:26:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0BF8141510D;
 Wed, 22 Jun 2022 00:26:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 06/25] migration: switch to use QIOChannelNull for dummy channel
Date: Wed, 22 Jun 2022 02:25:28 +0200
Message-Id: <20220622002547.64784-7-quintela@redhat.com>
In-Reply-To: <20220622002547.64784-1-quintela@redhat.com>
References: <20220622002547.64784-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

This removes one further custom impl of QEMUFile, in favour of a
QIOChannel based impl.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
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
2.35.3


