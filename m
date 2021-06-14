Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E618E3A5E28
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:13:49 +0200 (CEST)
Received: from localhost ([::1]:36482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lshjA-0003ib-Er
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshhB-0001mQ-9H
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:11:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshh9-0000Ny-N4
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623658303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4/0Erw3WmEht4VK5x8EhojEjIPZG3WjiEKwFHI1Gco4=;
 b=LeI15gaS8XQ8mNw/inj9LGiZZ1Y0JT3Q0mjsHidi5XsecfRfYtVK7LyZWCait67DelZR3Z
 hUUo9LVZWDm/ekFdJeH2pud5GZftnEFNh+cNhrnmodq8jrwIqQ/u6xYfv3vcZfK33F6v9i
 gNyi+h8IKKOeIAlXpsYG4o2Fz750hAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-3dZBXgBXM6GD2FOVQKLurw-1; Mon, 14 Jun 2021 04:11:41 -0400
X-MC-Unique: 3dZBXgBXM6GD2FOVQKLurw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B50341922055;
 Mon, 14 Jun 2021 08:11:39 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-49.ams2.redhat.com
 [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1D315D6AB;
 Mon, 14 Jun 2021 08:11:37 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 1/5] ratelimit: treat zero speed as unlimited
Date: Mon, 14 Jun 2021 10:11:26 +0200
Message-Id: <20210614081130.22134-2-eesposit@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
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

Both users of RateLimit, block-copy.c and blockjob.c, treat
a speed of zero as unlimited, while RateLimit treats it as
"as slow as possible".  The latter is nicer from the code
point of view but pretty useless, so disable rate limiting
if a speed of zero is provided.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/ratelimit.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/qemu/ratelimit.h b/include/qemu/ratelimit.h
index 003ea6d5a3..48bf59e857 100644
--- a/include/qemu/ratelimit.h
+++ b/include/qemu/ratelimit.h
@@ -43,7 +43,11 @@ static inline int64_t ratelimit_calculate_delay(RateLimit *limit, uint64_t n)
     double delay_slices;
 
     QEMU_LOCK_GUARD(&limit->lock);
-    assert(limit->slice_quota && limit->slice_ns);
+    if (!limit->slice_quota) {
+        /* Throttling disabled.  */
+        return 0;
+    }
+    assert(limit->slice_ns);
 
     if (limit->slice_end_time < now) {
         /* Previous, possibly extended, time slice finished; reset the
@@ -83,7 +87,11 @@ static inline void ratelimit_set_speed(RateLimit *limit, uint64_t speed,
 {
     QEMU_LOCK_GUARD(&limit->lock);
     limit->slice_ns = slice_ns;
-    limit->slice_quota = MAX(((double)speed * slice_ns) / 1000000000ULL, 1);
+    if (speed == 0) {
+        limit->slice_quota = 0;
+    } else {
+        limit->slice_quota = MAX(((double)speed * slice_ns) / 1000000000ULL, 1);
+    }
 }
 
 #endif
-- 
2.31.1


