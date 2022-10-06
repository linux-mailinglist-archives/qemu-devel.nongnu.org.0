Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDF55F62F1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 10:43:04 +0200 (CEST)
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogMT8-0001a4-Kw
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 04:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogLzy-0006Qk-03
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:12:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogLzv-0002pV-Rl
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665043971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewLeS4ncP+E7VOsBF6eqtywiAtqKEQEmMxssfQaquZ4=;
 b=ZB45bODfR33Lmb419J4GmJ6QLcyPdrjEs0AIPsoxhaixrEic5HyDzSuSdwtZTo8U1Ipg8o
 GoYLcmvrqFRq3ZolUMLgCvVdSeMwsIsrjjloPbmPbH5NTfnsiFqFy0Do3BG1cz0njaVyCr
 BWLBfGniSkyerZaIh4CsmQKclFIPg6k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-b5aFTXTjP_6jgOB1OO0UYg-1; Thu, 06 Oct 2022 04:12:50 -0400
X-MC-Unique: b5aFTXTjP_6jgOB1OO0UYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E57EC29AB3E3
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 08:12:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C72239DB3;
 Thu,  6 Oct 2022 08:12:33 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 2/5] tests/channel-helper: set blocking in main thread
Date: Thu,  6 Oct 2022 12:12:19 +0400
Message-Id: <20221006081222.2606746-3-marcandre.lureau@redhat.com>
In-Reply-To: <20221006081222.2606746-1-marcandre.lureau@redhat.com>
References: <20221006081222.2606746-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
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


