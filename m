Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5246B2D65
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 20:10:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paLdi-0006Tx-Ht; Thu, 09 Mar 2023 14:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1paLdX-0006Om-Bj
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 14:09:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1paLdV-0008B6-ME
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 14:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678388948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aWG+IEviwS8T1zoXJw48V6vODCcaqCTgHGF8TS9PKNQ=;
 b=FZNBP9VtjjqB23GRNPZ4pxKlc0/Ju1hu8vkjyguesWIBLbNeOuqrExQxHjVTt84yrgLTm/
 Mf88Z0urwrM1V0SHn7aMpccRduAWyQ68Cb47e7onhCcG1PnO5gOinWn6ka+YD3gx9/r81Y
 2bkxv5iQ7T2tM8cE4m+sWKLdkxfDF5o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361--KM0tmpfNy6bNStpOlhy8Q-1; Thu, 09 Mar 2023 14:09:07 -0500
X-MC-Unique: -KM0tmpfNy6bNStpOlhy8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 867C63823A0C;
 Thu,  9 Mar 2023 19:09:06 +0000 (UTC)
Received: from localhost (unknown [10.39.192.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E16B7440DD;
 Thu,  9 Mar 2023 19:09:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, armbru@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 3/6] block: convert bdrv_graph_wrlock() to
 AIO_WAIT_WHILE_UNLOCKED()
Date: Thu,  9 Mar 2023 14:08:52 -0500
Message-Id: <20230309190855.414275-4-stefanha@redhat.com>
In-Reply-To: <20230309190855.414275-1-stefanha@redhat.com>
References: <20230309190855.414275-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following conversion is safe and does not change behavior:

     GLOBAL_STATE_CODE();
     ...
  -  AIO_WAIT_WHILE(qemu_get_aio_context(), ...);
  +  AIO_WAIT_WHILE_UNLOCKED(NULL, ...);

Since we're in GLOBAL_STATE_CODE(), qemu_get_aio_context() is our home
thread's AioContext. Thus AIO_WAIT_WHILE() does not unlock the
AioContext:

  if (ctx_ && in_aio_context_home_thread(ctx_)) {                \
      while ((cond)) {                                           \
          aio_poll(ctx_, true);                                  \
          waited_ = true;                                        \
      }                                                          \

And that means AIO_WAIT_WHILE_UNLOCKED(NULL, ...) can be substituted.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/graph-lock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/graph-lock.c b/block/graph-lock.c
index 454c31e691..639526608f 100644
--- a/block/graph-lock.c
+++ b/block/graph-lock.c
@@ -127,7 +127,7 @@ void bdrv_graph_wrlock(void)
          * reader lock.
          */
         qatomic_set(&has_writer, 0);
-        AIO_WAIT_WHILE(qemu_get_aio_context(), reader_count() >= 1);
+        AIO_WAIT_WHILE_UNLOCKED(NULL, reader_count() >= 1);
         qatomic_set(&has_writer, 1);
 
         /*
-- 
2.39.2


