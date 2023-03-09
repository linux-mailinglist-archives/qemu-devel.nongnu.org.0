Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E726B2D63
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 20:10:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paLdk-0006Vk-G0; Thu, 09 Mar 2023 14:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1paLdh-0006U2-M8
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 14:09:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1paLdg-0008E1-96
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 14:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678388958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jMtoshAqlniuyeVys7v9v29yYD+MW5M0XRYHSKyek8g=;
 b=GDcsdPI6R8e2rut/9dvzKlgUu0P9y0pZcoRZkIQ7Z/TRduaKI7VgYvvTNnIh+e+hEhk8tq
 L6Zt3nwtZtZ1DSOvUxRDxbCXuyS44ty+Uk9LnsSSAwEgDmCa4NdP4fAAo+tHFXGi2hbmyO
 9+5lUQ76xJdqOPspq2YfldQGomLxfkg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-obUvb5hGNzG7sQmz90mGyg-1; Thu, 09 Mar 2023 14:09:14 -0500
X-MC-Unique: obUvb5hGNzG7sQmz90mGyg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50FDF85A5B1;
 Thu,  9 Mar 2023 19:09:14 +0000 (UTC)
Received: from localhost (unknown [10.39.192.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0C5F492B00;
 Thu,  9 Mar 2023 19:09:13 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, armbru@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 6/6] monitor: convert monitor_cleanup() to
 AIO_WAIT_WHILE_UNLOCKED()
Date: Thu,  9 Mar 2023 14:08:55 -0500
Message-Id: <20230309190855.414275-7-stefanha@redhat.com>
In-Reply-To: <20230309190855.414275-1-stefanha@redhat.com>
References: <20230309190855.414275-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

monitor_cleanup() is called from the main loop thread. Calling
AIO_WAIT_WHILE(qemu_get_aio_context(), ...) from the main loop thread is
equivalent to AIO_WAIT_WHILE_UNLOCKED(NULL, ...) because neither unlocks
the AioContext and the latter's assertion that we're in the main loop
succeeds.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 monitor/monitor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/monitor/monitor.c b/monitor/monitor.c
index 8dc96f6af9..602535696c 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -666,7 +666,7 @@ void monitor_cleanup(void)
      * We need to poll both qemu_aio_context and iohandler_ctx to make
      * sure that the dispatcher coroutine keeps making progress and
      * eventually terminates.  qemu_aio_context is automatically
-     * polled by calling AIO_WAIT_WHILE on it, but we must poll
+     * polled by calling AIO_WAIT_WHILE_UNLOCKED on it, but we must poll
      * iohandler_ctx manually.
      *
      * Letting the iothread continue while shutting down the dispatcher
@@ -679,7 +679,7 @@ void monitor_cleanup(void)
         aio_co_wake(qmp_dispatcher_co);
     }
 
-    AIO_WAIT_WHILE(qemu_get_aio_context(),
+    AIO_WAIT_WHILE_UNLOCKED(NULL,
                    (aio_poll(iohandler_get_aio_context(), false),
                     qatomic_mb_read(&qmp_dispatcher_co_busy)));
 
-- 
2.39.2


