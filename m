Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3835FC8FE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 18:15:17 +0200 (CEST)
Received: from localhost ([::1]:53928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oieO4-0006ib-Pa
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 12:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oieET-0003KO-D0
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:05:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oieEM-0005gz-49
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665590713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qk30fyQ0Le155PMM91BRCjq1NfaJf0UNUST6CUuyfFE=;
 b=YXwadHNVtRuDFrRdfrTL8eB4Hb0jpTe59ktpip7mVMjv7XH4ly8Y/DYT5YsOAATU9Prxqv
 RjB0IImUhpkHw7VqpE0H4nbnl3QId0IMKc1WYI8x5XGKPTyVM/vQoUK2uHS26mTIHaXmrs
 7NTLbrzcvjQweVVvZDElslzwvsyudkg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-GomwmYcgO8i0iDOIVf2Jmw-1; Wed, 12 Oct 2022 12:05:05 -0400
X-MC-Unique: GomwmYcgO8i0iDOIVf2Jmw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3C36811E75;
 Wed, 12 Oct 2022 16:05:04 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CA4A404CD9B;
 Wed, 12 Oct 2022 16:05:02 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 4/7] tests/channel-helper: set blocking in main thread
Date: Wed, 12 Oct 2022 20:04:41 +0400
Message-Id: <20221012160444.3762795-5-marcandre.lureau@redhat.com>
In-Reply-To: <20221012160444.3762795-1-marcandre.lureau@redhat.com>
References: <20221012160444.3762795-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The /io/channel/command/echo tests run the reader side and the writer
side with the same underlying command channel. Setting the blocking mode
of the fd/handles while the other end is already reading/writing may
create issues (deadlock in win32 when earlier attempt of this series
were using SetNamedPipeHandleState). Let's just do it before spawning
the threads to avoid further concurrency issues.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221006113657.2656108-4-marcandre.lureau@redhat.com>
---
 tests/unit/io-channel-helpers.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tests/unit/io-channel-helpers.c b/tests/unit/io-channel-helpers.c
index ff156ed3c4..c0799c21c2 100644
--- a/tests/unit/io-channel-helpers.c
+++ b/tests/unit/io-channel-helpers.c
@@ -25,7 +25,6 @@
 struct QIOChannelTest {
     QIOChannel *src;
     QIOChannel *dst;
-    bool blocking;
     size_t len;
     size_t niov;
     char *input;
@@ -42,8 +41,6 @@ static gpointer test_io_thread_writer(gpointer opaque)
 {
     QIOChannelTest *data = opaque;
 
-    qio_channel_set_blocking(data->src, data->blocking, NULL);
-
     qio_channel_writev_all(data->src,
                            data->inputv,
                            data->niov,
@@ -58,8 +55,6 @@ static gpointer test_io_thread_reader(gpointer opaque)
 {
     QIOChannelTest *data = opaque;
 
-    qio_channel_set_blocking(data->dst, data->blocking, NULL);
-
     qio_channel_readv_all(data->dst,
                           data->outputv,
                           data->niov,
@@ -113,7 +108,9 @@ void qio_channel_test_run_threads(QIOChannelTest *test,
 
     test->src = src;
     test->dst = dst;
-    test->blocking = blocking;
+
+    qio_channel_set_blocking(test->dst, blocking, NULL);
+    qio_channel_set_blocking(test->src, blocking, NULL);
 
     reader = g_thread_new("reader",
                           test_io_thread_reader,
-- 
2.37.3


