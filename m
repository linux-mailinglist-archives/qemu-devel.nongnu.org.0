Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EDC1FF363
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 15:42:16 +0200 (CEST)
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jluo3-0007wI-DL
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 09:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jluVu-0008CF-DX
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 09:23:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48459
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jluVs-0005tF-G7
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 09:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592486607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=qXHWXtp/gvp5jX0g2Rmsyn3tiVUUdM3O3TjCQ3fM8pM=;
 b=V1OTmm2Xrtry+N9uq6jLP0qxEaBsdp1nQV0qk5PCiKlfwnVKyAdQr89j7zz5xY77I9IPiT
 tT/j8B+8kLv9Xl12W/7LWtKjMQm/LpE93BEDjPLoFuhpB2J0mRdnDGoVWBGn5vSmvH6/nV
 nbD533Ds4VvXMGqzh+pl+9DBkXRQNS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-wd_tYdBsOnyTuWuVfAOU_A-1; Thu, 18 Jun 2020 09:23:25 -0400
X-MC-Unique: wd_tYdBsOnyTuWuVfAOU_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A206107ACCA;
 Thu, 18 Jun 2020 13:23:24 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-109.pek2.redhat.com
 [10.72.12.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B23195BAC1;
 Thu, 18 Jun 2020 13:23:22 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL V2 29/33] net/colo-compare.c: Correct ordering in complete and
 finalize
Date: Thu, 18 Jun 2020 21:21:44 +0800
Message-Id: <1592486508-6135-30-git-send-email-jasowang@redhat.com>
In-Reply-To: <1592486508-6135-1-git-send-email-jasowang@redhat.com>
References: <1592486508-6135-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:21:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

In colo_compare_complete, insert CompareState into net_compares
only after everything has been initialized.
In colo_compare_finalize, remove CompareState from net_compares
before anything is deinitialized.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo-compare.c | 45 +++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index c30dbfb..ed1f3d0 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -1283,15 +1283,6 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
                            s->vnet_hdr);
     }
 
-    qemu_mutex_lock(&colo_compare_mutex);
-    if (!colo_compare_active) {
-        qemu_mutex_init(&event_mtx);
-        qemu_cond_init(&event_complete_cond);
-        colo_compare_active = true;
-    }
-    QTAILQ_INSERT_TAIL(&net_compares, s, next);
-    qemu_mutex_unlock(&colo_compare_mutex);
-
     s->out_sendco.s = s;
     s->out_sendco.chr = &s->chr_out;
     s->out_sendco.notify_remote_frame = false;
@@ -1314,6 +1305,16 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
                                                       connection_destroy);
 
     colo_compare_iothread(s);
+
+    qemu_mutex_lock(&colo_compare_mutex);
+    if (!colo_compare_active) {
+        qemu_mutex_init(&event_mtx);
+        qemu_cond_init(&event_complete_cond);
+        colo_compare_active = true;
+    }
+    QTAILQ_INSERT_TAIL(&net_compares, s, next);
+    qemu_mutex_unlock(&colo_compare_mutex);
+
     return;
 }
 
@@ -1382,19 +1383,6 @@ static void colo_compare_finalize(Object *obj)
     CompareState *s = COLO_COMPARE(obj);
     CompareState *tmp = NULL;
 
-    qemu_chr_fe_deinit(&s->chr_pri_in, false);
-    qemu_chr_fe_deinit(&s->chr_sec_in, false);
-    qemu_chr_fe_deinit(&s->chr_out, false);
-    if (s->notify_dev) {
-        qemu_chr_fe_deinit(&s->chr_notify_dev, false);
-    }
-
-    if (s->iothread) {
-        colo_compare_timer_del(s);
-    }
-
-    qemu_bh_delete(s->event_bh);
-
     qemu_mutex_lock(&colo_compare_mutex);
     QTAILQ_FOREACH(tmp, &net_compares, next) {
         if (tmp == s) {
@@ -1409,6 +1397,19 @@ static void colo_compare_finalize(Object *obj)
     }
     qemu_mutex_unlock(&colo_compare_mutex);
 
+    qemu_chr_fe_deinit(&s->chr_pri_in, false);
+    qemu_chr_fe_deinit(&s->chr_sec_in, false);
+    qemu_chr_fe_deinit(&s->chr_out, false);
+    if (s->notify_dev) {
+        qemu_chr_fe_deinit(&s->chr_notify_dev, false);
+    }
+
+    if (s->iothread) {
+        colo_compare_timer_del(s);
+    }
+
+    qemu_bh_delete(s->event_bh);
+
     AioContext *ctx = iothread_get_aio_context(s->iothread);
     aio_context_acquire(ctx);
     AIO_WAIT_WHILE(ctx, !s->out_sendco.done);
-- 
2.5.0


