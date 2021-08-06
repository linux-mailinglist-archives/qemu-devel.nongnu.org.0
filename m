Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6243E278F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 11:42:35 +0200 (CEST)
Received: from localhost ([::1]:50828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBwN8-0005D3-P9
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 05:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBwJr-0006Jf-FS
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBwJo-0003ce-TQ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628242748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2zdDw+X/ARrSOdNDB+vpDxJpMlrUxiABfyT/XZUHYc=;
 b=E9yNflEI9/SqRxGAltIyt/Y1KCIftBCEuCCjmQhVcinEByqFAraQeVLex+sL42tT73hWJ3
 NOUam+pkvW1+90yPQarfBOyhZaBxvXKQUST+FZ+wQNE+N3dvmJzI/nzbsJS+gZklnbMwUV
 DPPiltNSkt6SLnOStm+sMQvbOmbYYeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-yNjOD2nIOPiQ-9Jk95Cu2A-1; Fri, 06 Aug 2021 05:39:07 -0400
X-MC-Unique: yNjOD2nIOPiQ-9Jk95Cu2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00ABE87D541;
 Fri,  6 Aug 2021 09:39:06 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 496F819D9D;
 Fri,  6 Aug 2021 09:39:05 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.2 v3 02/12] mirror: Keep s->synced on error
Date: Fri,  6 Aug 2021 11:38:49 +0200
Message-Id: <20210806093859.706464-3-mreitz@redhat.com>
In-Reply-To: <20210806093859.706464-1-mreitz@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An error does not take us out of the READY phase, which is what
s->synced signifies.  It does of course mean that source and target are
no longer in sync, but that is what s->actively_sync is for -- s->synced
never meant that source and target are in sync, only that they were at
some point (and at that point we transitioned into the READY phase).

The tangible problem is that we transition to READY once we are in sync
and s->synced is false.  By resetting s->synced here, we will transition
from READY to READY once the error is resolved (if the job keeps
running), and that transition is not allowed.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/mirror.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/mirror.c b/block/mirror.c
index 98fc66eabf..d73b704473 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -121,7 +121,6 @@ typedef enum MirrorMethod {
 static BlockErrorAction mirror_error_action(MirrorBlockJob *s, bool read,
                                             int error)
 {
-    s->synced = false;
     s->actively_synced = false;
     if (read) {
         return block_job_error_action(&s->common, s->on_source_error,
-- 
2.31.1


