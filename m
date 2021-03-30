Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D737B34E7D4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:49:12 +0200 (CEST)
Received: from localhost ([::1]:57576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDny-0006vm-EI
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRDfU-0000te-Bb
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:40:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRDfM-0003Nc-Cx
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617108012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8B9bGDXpPIpRCRhpVsNkjFGkPYIFt7EGtkbW3KWad+M=;
 b=JJp6I8deENC8dKP6oGeqoKiPTdKUj4H5jWEWtCRYot+Gf3ucA2jnrZBrrmSTsRYuMrbzn5
 zU1Vd9ckmGS76wmm7zdrlhXwhXRnwAb+HRoAs/YFoTBAEUKekboOi9au9bPHV3ckQ0bQe/
 YcsZULHbcMZ2/OkFxuAOO2CNXAets9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-DQgn2gu5MeeMJT8enLRbMg-1; Tue, 30 Mar 2021 08:40:09 -0400
X-MC-Unique: DQgn2gu5MeeMJT8enLRbMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4121F1B18BC2;
 Tue, 30 Mar 2021 12:40:08 +0000 (UTC)
Received: from localhost (ovpn-113-220.ams2.redhat.com [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D790054272;
 Tue, 30 Mar 2021 12:40:07 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 4/9] qcow2: use external virtual timers
Date: Tue, 30 Mar 2021 14:39:52 +0200
Message-Id: <20210330123957.826170-5-mreitz@redhat.com>
In-Reply-To: <20210330123957.826170-1-mreitz@redhat.com>
References: <20210330123957.826170-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

Regular virtual timers are used to emulate timings
related to vCPU and peripheral states. QCOW2 uses timers
to clean the cache. These timers should have external
flag. In the opposite case they affect the execution
and it can't be recorded and replayed.
This patch adds external flag to the timer for qcow2
cache clean.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <161700516327.1141158.8366564693714562536.stgit@pasha-ThinkPad-X280>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 0db1227ac9..2fb43c6f7e 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -840,9 +840,10 @@ static void cache_clean_timer_init(BlockDriverState *bs, AioContext *context)
 {
     BDRVQcow2State *s = bs->opaque;
     if (s->cache_clean_interval > 0) {
-        s->cache_clean_timer = aio_timer_new(context, QEMU_CLOCK_VIRTUAL,
-                                             SCALE_MS, cache_clean_timer_cb,
-                                             bs);
+        s->cache_clean_timer =
+            aio_timer_new_with_attrs(context, QEMU_CLOCK_VIRTUAL,
+                                     SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
+                                     cache_clean_timer_cb, bs);
         timer_mod(s->cache_clean_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
                   (int64_t) s->cache_clean_interval * 1000);
     }
-- 
2.29.2


