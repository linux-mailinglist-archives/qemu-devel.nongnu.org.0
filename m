Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E29377EEC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 11:05:47 +0200 (CEST)
Received: from localhost ([::1]:59498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg1rG-00035E-HJ
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 05:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lg1li-0003Rf-Jp
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:00:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lg1lg-0005hn-3u
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:00:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620637199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WacJFVkbfLKPGda97mgasN/KKrj662I+VeKllJ5ILvQ=;
 b=ghd07kBEa1bGzyWx1djVUcc+EoQpZqTpnxllWrns3Yw5ZvqSAr8YbsvYYfA/b9k3haMAJx
 TeTufUoQX169mMFHvlE4TpobecAJi4a4drlIHJjuox124GRm0Au09ko2mfp8A4dc7t1FZ8
 /G4Lvf3Fzzj5i4V4sax0Bp3Mbh7ZbHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501--4orAuLWOFuM3jEYZjpn0Q-1; Mon, 10 May 2021 04:59:57 -0400
X-MC-Unique: -4orAuLWOFuM3jEYZjpn0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DD99107ACCA;
 Mon, 10 May 2021 08:59:56 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-184.ams2.redhat.com
 [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23FD062923;
 Mon, 10 May 2021 08:59:53 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/6] blockjob: let ratelimit handle a speed of 0
Date: Mon, 10 May 2021 10:59:38 +0200
Message-Id: <20210510085941.22769-4-eesposit@redhat.com>
In-Reply-To: <20210510085941.22769-1-eesposit@redhat.com>
References: <20210510085941.22769-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockjob.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index dc1d9e0e46..046c1bcd66 100644
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
 
@@ -473,11 +469,9 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     blk_set_allow_aio_context_change(blk, true);
 
     /* Only set speed when necessary to avoid NotSupported error */
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
2.30.2


