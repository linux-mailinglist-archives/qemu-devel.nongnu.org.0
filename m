Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7EA3A5E2A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:14:02 +0200 (CEST)
Received: from localhost ([::1]:37042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lshjN-000452-BY
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshhH-0001uG-91
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:11:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshhD-0000SS-On
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623658307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxqvgwC/0RkwBtocgVjIypFWWDWJcOfx/nwhDSsgzIo=;
 b=XgE5P0KALp/nxQzMzIKXCoOiqNlOifzGCW9yGnMvT9jONK6Mg95QwnEW16ECzahzTYwI5m
 rvC7YBrQTsUky/yR3Dfph1g01Ya7GV8U5TlWtmseuMRIu3nOLSA7k7G9Q2FeKW47HHDK0l
 YoMZNxH0LF1fYzkjW3KdF3smHbwWbGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-VjYZ88h-OKW6whbJM_bZ8g-1; Mon, 14 Jun 2021 04:11:45 -0400
X-MC-Unique: VjYZ88h-OKW6whbJM_bZ8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 901208B78A5;
 Mon, 14 Jun 2021 08:11:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-49.ams2.redhat.com
 [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A09B15D6A8;
 Mon, 14 Jun 2021 08:11:42 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 3/5] blockjob: let ratelimit handle a speed of 0
Date: Mon, 14 Jun 2021 10:11:28 +0200
Message-Id: <20210614081130.22134-4-eesposit@redhat.com>
In-Reply-To: <20210614081130.22134-1-eesposit@redhat.com>
References: <20210614081130.22134-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockjob.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index dc1d9e0e46..22e5bb9b1f 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -300,10 +300,6 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 
 int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
 {
-    if (!job->speed) {
-        return 0;
-    }
-
     return ratelimit_calculate_delay(&job->limit, n);
 }
 
@@ -472,12 +468,9 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     blk_set_disable_request_queuing(blk, true);
     blk_set_allow_aio_context_change(blk, true);
 
-    /* Only set speed when necessary to avoid NotSupported error */
-    if (speed != 0) {
-        if (!block_job_set_speed(job, speed, errp)) {
-            job_early_fail(&job->job);
-            return NULL;
-        }
+    if (!block_job_set_speed(job, speed, errp)) {
+        job_early_fail(&job->job);
+        return NULL;
     }
 
     return job;
-- 
2.31.1


