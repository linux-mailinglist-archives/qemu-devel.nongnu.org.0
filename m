Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762591FF31F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 15:34:26 +0200 (CEST)
Received: from localhost ([::1]:51888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlugT-0001l9-BV
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 09:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jluVh-0007XS-UY
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 09:23:17 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35059
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jluVg-0005rH-4u
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 09:23:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592486595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=FTFRvKvrhsZ1FsmM7z4nNla9QKNddW17ekwJj03MREI=;
 b=ZPjkbaSFYlCFu9djavTaZ06qXfEOrnC1Y0Gt+gdHVrHqwZI55xo0DKMN+YyyKQ1yhcHvfp
 n5FMIIhqAWfUSap51dITm4rgsw0wdjSp9CdtsXCZXHDeHmY7qcRQdXCfyaegsBrZnIfqc6
 KOySai/cN5aoCfRDdDSTccpfGMOVb0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-gjeUIQvuNJOtZGfeArWe5g-1; Thu, 18 Jun 2020 09:23:11 -0400
X-MC-Unique: gjeUIQvuNJOtZGfeArWe5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B001DC744F;
 Thu, 18 Jun 2020 13:23:09 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-109.pek2.redhat.com
 [10.72.12.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5096C5BAC3;
 Thu, 18 Jun 2020 13:23:07 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL V2 24/33] net/colo-compare.c: Create event_bh with the right
 AioContext
Date: Thu, 18 Jun 2020 21:21:39 +0800
Message-Id: <1592486508-6135-25-git-send-email-jasowang@redhat.com>
In-Reply-To: <1592486508-6135-1-git-send-email-jasowang@redhat.com>
References: <1592486508-6135-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:32:18
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
 Lukas Straub <lukasstraub2@web.de>
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


