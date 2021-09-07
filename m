Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F40402962
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:08:52 +0200 (CEST)
Received: from localhost ([::1]:50438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaqJ-0002qb-Je
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRJ-0005kc-I5
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:43:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRE-0006Fo-JC
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631018575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43AC8gfWOFivU3D+o0AqL2/4Zqz4A9/ayKVa0QPW7x8=;
 b=ewxlGazcoH/8bREOFaaekXI/brkgW0Q7M8CTH1l61mBvIA5OH2cnlNgN3PWr0e/i6mpBRO
 82r59iDuFqnnqBHnSFsVM3ZS0uzgEDKdYrwnfXhIjbTErqmHozo3EsCgVnAPT+BUDyCLh0
 ZJtSGH+mOZupgpHA1Jrk3Rmcn+bSFWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-T-OGwSrgOKapJjzCmD9nsA-1; Tue, 07 Sep 2021 08:42:52 -0400
X-MC-Unique: T-OGwSrgOKapJjzCmD9nsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9B11512E;
 Tue,  7 Sep 2021 12:42:51 +0000 (UTC)
Received: from localhost (unknown [10.39.193.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 822DF6B54F;
 Tue,  7 Sep 2021 12:42:51 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 02/12] mirror: Keep s->synced on error
Date: Tue,  7 Sep 2021 14:42:35 +0200
Message-Id: <20210907124245.143492-3-hreitz@redhat.com>
In-Reply-To: <20210907124245.143492-1-hreitz@redhat.com>
References: <20210907124245.143492-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
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

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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


