Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C418250F703
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:09:15 +0200 (CEST)
Received: from localhost ([::1]:50522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njHC6-0006ch-T0
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGvF-0007DP-LO
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGvE-0000gI-5i
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650963107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4QLXWHSEH+WUuRo1EdjW0OdX0UvC4rVVzDAZajucAM=;
 b=Unkg/6LAj0jaFNvjFnJejmsavOj/q7BH2yFiZAlHlY06SgmlduoHfNML57xib55xn0cVGU
 Yl7LRO4nRyRiDByJNF6Nm9R8XqJxwGiyjIFL8AQMq2XFlETD1X6SWwWU4kuXI+yqomv+ly
 PgFrc+6AMSpobGC7JOUO92zkRHo1fMk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-wRp9yW_HMzWMkAT_eL3c1w-1; Tue, 26 Apr 2022 04:51:43 -0400
X-MC-Unique: wRp9yW_HMzWMkAT_eL3c1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 362CF29ABA05;
 Tue, 26 Apr 2022 08:51:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11C5640E8100;
 Tue, 26 Apr 2022 08:51:25 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 8/8] mirror: protect drains in coroutine with rdlock
Date: Tue, 26 Apr 2022 04:51:14 -0400
Message-Id: <20220426085114.199647-9-eesposit@redhat.com>
In-Reply-To: <20220426085114.199647-1-eesposit@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drain performed in coroutine schedules a bh in the main loop.
However, drain itself still is a read, and we need to signal
the writer that we are going through the graph.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/mirror.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/mirror.c b/block/mirror.c
index ce6bc58d1f..de86729f9b 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1065,10 +1065,14 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
             trace_mirror_before_drain(s, cnt);
 
             s->in_drain = true;
+            bdrv_graph_co_rdlock();
             bdrv_drained_begin(bs);
+            bdrv_graph_co_rdunlock();
             cnt = bdrv_get_dirty_count(s->dirty_bitmap);
             if (cnt > 0 || mirror_flush(s) < 0) {
+                bdrv_graph_co_rdlock();
                 bdrv_drained_end(bs);
+                bdrv_graph_co_rdunlock();
                 s->in_drain = false;
                 continue;
             }
@@ -1110,7 +1114,9 @@ immediate_exit:
 
     if (need_drain) {
         s->in_drain = true;
+        bdrv_graph_co_rdlock();
         bdrv_drained_begin(bs);
+        bdrv_graph_co_rdunlock();
     }
 
     return ret;
-- 
2.31.1


