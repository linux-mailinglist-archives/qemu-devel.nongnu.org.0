Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4E8359E68
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 14:12:40 +0200 (CEST)
Received: from localhost ([::1]:43634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUq07-0004oD-0H
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 08:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUpsO-000810-F9
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 08:04:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUpsH-0008DO-1O
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 08:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617969872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAc7L9+YJ0ealn7uzjhYK9sm6EPpUm39QMeBeWZZmLI=;
 b=UzoXO0rigOM9/X852USiEEfyBD2jIzOxviLnQ+eJoaWpQZ0Vo1iAw57uGie8U8pS7MZ3ew
 OGbpY4yrR55imoaRKSVcuayep1oeependyW0wOGFldej9ymCRdZdn49rwqpVCBx63w2SHR
 FsyQoCyjdt+FzoV3zZ+95VpZ4d/w+EE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-bZ4uwY5kMTK5NbaSkUPcvg-1; Fri, 09 Apr 2021 08:04:30 -0400
X-MC-Unique: bZ4uwY5kMTK5NbaSkUPcvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4B368030B5;
 Fri,  9 Apr 2021 12:04:28 +0000 (UTC)
Received: from localhost (ovpn-114-67.ams2.redhat.com [10.36.114.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 874992DAD0;
 Fri,  9 Apr 2021 12:04:28 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/4] mirror: Do not enter a paused job on completion
Date: Fri,  9 Apr 2021 14:04:19 +0200
Message-Id: <20210409120422.144040-3-mreitz@redhat.com>
In-Reply-To: <20210409120422.144040-1-mreitz@redhat.com>
References: <20210409120422.144040-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, it is impossible to complete jobs on standby (i.e. paused
ready jobs), but actually the only thing in mirror_complete() that does
not work quite well with a paused job is the job_enter() at the end.

If we make it conditional, this function works just fine even if the
mirror job is paused.

So technically this is a no-op, but obviously the intention is to accept
block-job-complete even for jobs on standby, which we need this patch
for first.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/mirror.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/mirror.c b/block/mirror.c
index f1f936bf1a..5a71bd8bbc 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1148,7 +1148,11 @@ static void mirror_complete(Job *job, Error **errp)
     }
 
     s->should_complete = true;
-    job_enter(job);
+
+    /* If the job is paused, it will be re-entered when it is resumed */
+    if (!job->paused) {
+        job_enter(job);
+    }
 }
 
 static void coroutine_fn mirror_pause(Job *job)
-- 
2.29.2


