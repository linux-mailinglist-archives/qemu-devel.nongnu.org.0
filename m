Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3D66EE2DE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:23:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIZA-0002bm-Bs; Tue, 25 Apr 2023 09:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVU-0006ra-6J
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:15:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVG-0006cg-OP
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OChVcuXN9xUdxHfBX7+VcKkQZ81IQ8rfLZ+Ubj4/KWw=;
 b=cl3gkTS+DgMTWpAEN0Zx1PVM3mhYvZqK9hh4GmZfpMXkgxq6DI+Tt7jMi4jDHmS5IG34iO
 CxA/cLXWpcsXDIz8T117gT7r8gLncvcrYyBGWq5rLrfHE0FarSrKTk+bhMjjE3mi3uM610
 g/ujbuTBXhum+vnOtMjBdL1SYNnVQOM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-93VU3-YuOym9tznnBhmXaA-1; Tue, 25 Apr 2023 09:14:28 -0400
X-MC-Unique: 93VU3-YuOym9tznnBhmXaA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26E28185A7A7;
 Tue, 25 Apr 2023 13:14:28 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B76C40C2064;
 Tue, 25 Apr 2023 13:14:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 25/25] block/monitor/block-hmp-cmds.c: Fix crash when execute
 hmp_commit
Date: Tue, 25 Apr 2023 15:13:59 +0200
Message-Id: <20230425131359.259007-26-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=kwolf@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Wang Liang <wangliangzz@inspur.com>

hmp_commit() calls blk_is_available() from a non-coroutine context (and in
the main loop). blk_is_available() is a co_wrapper_mixed_bdrv_rdlock
function, and in the non-coroutine context it calls AIO_WAIT_WHILE(),
which crashes if the aio_context lock is not taken before.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1615
Signed-off-by: Wang Liang <wangliangzz@inspur.com>
Message-Id: <20230424103902.45265-1-wangliangzz@126.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/monitor/block-hmp-cmds.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 2846083546..ca2599de44 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -214,15 +214,17 @@ void hmp_commit(Monitor *mon, const QDict *qdict)
             error_report("Device '%s' not found", device);
             return;
         }
-        if (!blk_is_available(blk)) {
-            error_report("Device '%s' has no medium", device);
-            return;
-        }
 
         bs = bdrv_skip_implicit_filters(blk_bs(blk));
         aio_context = bdrv_get_aio_context(bs);
         aio_context_acquire(aio_context);
 
+        if (!blk_is_available(blk)) {
+            error_report("Device '%s' has no medium", device);
+            aio_context_release(aio_context);
+            return;
+        }
+
         ret = bdrv_commit(bs);
 
         aio_context_release(aio_context);
-- 
2.40.0


