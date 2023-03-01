Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655716A75B4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 21:59:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTXL-0003rM-VI; Wed, 01 Mar 2023 15:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXTXK-0003qx-Ic
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:58:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXTXJ-000449-2F
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677704332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7FHaIBM/eBasSIGq1f13k97Nq9uyQeyH+6pJ/nmRAA=;
 b=IUikfMTIoO1MOVAXcgMBo1JzFqOn3gvndINVq/bjhc84e1pLsXjpgD50SF9NfjmLQfBWy+
 bslLWOsJk3PPHV11lBmstl/6GPMyRwqMTDsoGO6Sw2vv5LMSZgfxPHaWUDTv1extvK8JJo
 iMf8YAx5I4AcE5VWDxWyqoE9F0Z9Dpw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-4X4nKHZjOxa_icySQsdFzA-1; Wed, 01 Mar 2023 15:58:51 -0500
X-MC-Unique: 4X4nKHZjOxa_icySQsdFzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD9DC3811F2C;
 Wed,  1 Mar 2023 20:58:48 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DB5C2166B26;
 Wed,  1 Mar 2023 20:58:47 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 6/6] monitor: convert monitor_cleanup() to
 AIO_WAIT_WHILE_UNLOCKED()
Date: Wed,  1 Mar 2023 15:58:01 -0500
Message-Id: <20230301205801.2453491-7-stefanha@redhat.com>
In-Reply-To: <20230301205801.2453491-1-stefanha@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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


