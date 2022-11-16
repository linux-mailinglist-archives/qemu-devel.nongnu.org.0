Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B07762C09D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:12:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ56-0001Ea-0h; Wed, 16 Nov 2022 09:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4v-0000pT-4I
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4q-00067t-2D
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668607660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VqdJNgSPR2iME7QV2e49ms+m6C5NJ4Lp+mVdOpZtzx8=;
 b=JZh21jJB+Ll1WQ5e15+aXAGgYvcl68C3e9FXeZxMM6tR056WiDa9GNoaB9AqRNPmtV97YX
 faVSbYlkJVjltXqi0OOPy6c/yfTiTGweuKhmZFSsaMVzmNXTfWQO9IvTKAKTrWXF5QWQPt
 7peRb7ymlZpyEjU/7GQ6j2v7QBYoL+Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-8F8lMmVYM1mLHYfgabJSSQ-1; Wed, 16 Nov 2022 09:07:35 -0500
X-MC-Unique: 8F8lMmVYM1mLHYfgabJSSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC8053810D3E;
 Wed, 16 Nov 2022 14:07:34 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C54BC2C8C7;
 Wed, 16 Nov 2022 14:07:34 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alberto Garcia <berto@igalia.com>, Ilya Dryomov <idryomov@gmail.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 integration@gluster.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 01/15] block/qed: add missing graph rdlock in
 qed_need_check_timer_entry
Date: Wed, 16 Nov 2022 09:07:16 -0500
Message-Id: <20221116140730.3056048-2-eesposit@redhat.com>
In-Reply-To: <20221116140730.3056048-1-eesposit@redhat.com>
References: <20221116140730.3056048-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This function is called in two different places:
- timer callback, which does not take the graph rdlock.
- bdrv_qed_drain_begin(), which is a .bdrv_drain_begin()
  callback that will soon take the lock.

Since it calls recursive functions that traverse the
graph, we need to protect them with the graph rdlock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/qed.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/qed.c b/block/qed.c
index c2691a85b1..778b23d0f6 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -282,11 +282,13 @@ static void coroutine_fn qed_unplug_allocating_write_reqs(BDRVQEDState *s)
     qemu_co_mutex_unlock(&s->table_lock);
 }
 
+/* Called with graph rdlock taken */
 static void coroutine_fn qed_need_check_timer(BDRVQEDState *s)
 {
     int ret;
 
     trace_qed_need_check_timer_cb(s);
+    assert_bdrv_graph_readable();
 
     if (!qed_plug_allocating_write_reqs(s)) {
         return;
@@ -312,6 +314,7 @@ static void coroutine_fn qed_need_check_timer(BDRVQEDState *s)
 static void coroutine_fn qed_need_check_timer_entry(void *opaque)
 {
     BDRVQEDState *s = opaque;
+    GRAPH_RDLOCK_GUARD();
 
     qed_need_check_timer(opaque);
     bdrv_dec_in_flight(s->bs);
-- 
2.31.1


