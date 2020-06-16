Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88D21FA978
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 09:05:22 +0200 (CEST)
Received: from localhost ([::1]:51714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl5er-0005A2-Lv
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 03:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5Mx-000248-W5
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:46:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23377
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5Mw-0005mq-Cq
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592290009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=FTFRvKvrhsZ1FsmM7z4nNla9QKNddW17ekwJj03MREI=;
 b=O0nQ1iyRs9mVnP84KmVypbQ5VG2EO3NOg6iN8bZ11QIhTLVHk5v+gZq/OBzv6z28gm/LMg
 RXQ5C/LqDqmNhJMb6qyReSb8v2mcPsMjfHYCL70k9W8bvyV8YxmSMqXDfoBRVMHcHTG+sd
 KPaRhIoS3KjSFJO2ailTH0qgrvi2uaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-zZ5W2x-SNH6VUp5jZmoyTw-1; Tue, 16 Jun 2020 02:46:47 -0400
X-MC-Unique: zZ5W2x-SNH6VUp5jZmoyTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34515835B5C;
 Tue, 16 Jun 2020 06:46:46 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-222.pek2.redhat.com
 [10.72.13.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 497E78202D;
 Tue, 16 Jun 2020 06:46:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 24/33] net/colo-compare.c: Create event_bh with the right
 AioContext
Date: Tue, 16 Jun 2020 14:45:35 +0800
Message-Id: <1592289944-13727-25-git-send-email-jasowang@redhat.com>
In-Reply-To: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
References: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

qemu_bh_new will set the bh to be executed in the main
loop. This causes crashes as colo_compare_handle_event assumes
that it has exclusive access the queues, which are also
concurrently accessed in the iothread.

Create the bh with the AioContext of the iothread to fulfill
these assumptions and fix the crashes. This is safe, because
the bh already takes the appropriate locks.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Derek Su <dereksu@qnap.com>
Tested-by: Derek Su <dereksu@qnap.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo-compare.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index c07e7c1..e557da7 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -890,6 +890,7 @@ static void colo_compare_handle_event(void *opaque)
 
 static void colo_compare_iothread(CompareState *s)
 {
+    AioContext *ctx = iothread_get_aio_context(s->iothread);
     object_ref(OBJECT(s->iothread));
     s->worker_context = iothread_get_g_main_context(s->iothread);
 
@@ -906,7 +907,7 @@ static void colo_compare_iothread(CompareState *s)
     }
 
     colo_compare_timer_init(s);
-    s->event_bh = qemu_bh_new(colo_compare_handle_event, s);
+    s->event_bh = aio_bh_new(ctx, colo_compare_handle_event, s);
 }
 
 static char *compare_get_pri_indev(Object *obj, Error **errp)
-- 
2.5.0


