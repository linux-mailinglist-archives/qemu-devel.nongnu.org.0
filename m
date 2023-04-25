Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F372E6EE2B7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:19:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIVG-0006Oi-AD; Tue, 25 Apr 2023 09:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUq-0006H5-CZ
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUo-0006YL-LY
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WZzjOQjr4EGJGYSIGh5NZ6SmuS59Q02T1jtutgDaXvU=;
 b=Z1dqRRcaKVWFVqE1mxTiW0+/ssBisqiE/2837ptkWa2y1mvG5NE+M4E+OVVnyCV0nw+5ce
 n0sRUu8yimhdFkeLox40aJjillh/6G+7Ds3uyMPLcat5FWTqCQ/jotaMpz6co2ZC3j07YD
 MYRtfv+h2er4SF0QNgGQQcgstGHpdVw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-I3w3NSFjO-Ou95LxWV529Q-1; Tue, 25 Apr 2023 09:14:12 -0400
X-MC-Unique: I3w3NSFjO-Ou95LxWV529Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17875858F09;
 Tue, 25 Apr 2023 13:14:12 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EA9840C2064;
 Tue, 25 Apr 2023 13:14:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 08/25] hmp: convert handle_hmp_command() to
 AIO_WAIT_WHILE_UNLOCKED()
Date: Tue, 25 Apr 2023 15:13:42 +0200
Message-Id: <20230425131359.259007-9-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The HMP monitor runs in the main loop thread. Calling
AIO_WAIT_WHILE(qemu_get_aio_context(), ...) from the main loop thread is
equivalent to AIO_WAIT_WHILE_UNLOCKED(NULL, ...) because neither unlocks
the AioContext and the latter's assertion that we're in the main loop
succeeds.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230309190855.414275-6-stefanha@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 monitor/hmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index fee410362f..5cab56d355 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1167,7 +1167,7 @@ void handle_hmp_command(MonitorHMP *mon, const char *cmdline)
         Coroutine *co = qemu_coroutine_create(handle_hmp_command_co, &data);
         monitor_set_cur(co, &mon->common);
         aio_co_enter(qemu_get_aio_context(), co);
-        AIO_WAIT_WHILE(qemu_get_aio_context(), !data.done);
+        AIO_WAIT_WHILE_UNLOCKED(NULL, !data.done);
     }
 
     qobject_unref(qdict);
-- 
2.40.0


