Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DE06EE2B3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:19:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIVN-0006dE-3G; Tue, 25 Apr 2023 09:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUq-0006H6-Mi
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUp-0006YW-1w
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKQLVWSHThtVZrDboUZcqCzd2/g4SHW9pEqs0RAjMd8=;
 b=hnjr6lRLRmPaM8KrbR3xHxdiz8AHxUUUFuBGZhtIbsXLk22ZBkhoZgOpl0CIAl5dVp0Dl1
 QSGz5/Wh025vUFLz3MlL/y+YO0Z8fkpPr/nQTSEHrlhU+6tsN7oHXaNJjIVQRi/ubhQkdp
 zS+7+tEaj5N+qveJbI+PD/6/dw7TnVo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-II83OfLyOXiYxAuJBcxnwQ-1; Tue, 25 Apr 2023 09:14:10 -0400
X-MC-Unique: II83OfLyOXiYxAuJBcxnwQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 372CB38221CF;
 Tue, 25 Apr 2023 13:14:10 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DA7F40C2064;
 Tue, 25 Apr 2023 13:14:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 06/25] block: convert bdrv_graph_wrlock() to
 AIO_WAIT_WHILE_UNLOCKED()
Date: Tue, 25 Apr 2023 15:13:40 +0200
Message-Id: <20230425131359.259007-7-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Hajnoczi <stefanha@redhat.com>

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
Message-Id: <20230309190855.414275-4-stefanha@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.40.0


