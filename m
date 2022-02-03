Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798774A88A1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:35:02 +0100 (CET)
Received: from localhost ([::1]:49364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFf4X-0002yh-It
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:35:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFf0k-0008CG-T3
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:31:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFf0O-00008j-DX
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643905841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L/yALtGnRAFItyx6a9duy3eIiskc8Dxn6TJKEaTcPto=;
 b=WmVOZNOjDKDrTqxXbcTTO7WnnIFjnOHpf84DfPigD5BYTuzkgmlt/UUVokxMM9yIGdRGaK
 TaE8dKMoSn1pJph+v5iGu+frkRq/1tNaB524IPMiDHwXPH7syFSjCbXLk77zC/id6swmiX
 AF3IZ+fMaubqoeB1dPoh+jMuA1YiDkc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-wHZF_RN4MimY6l_NypGAqg-1; Thu, 03 Feb 2022 11:30:33 -0500
X-MC-Unique: wHZF_RN4MimY6l_NypGAqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FC8E1923E21;
 Thu,  3 Feb 2022 16:30:32 +0000 (UTC)
Received: from localhost (unknown [10.39.193.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA25F7E2FC;
 Thu,  3 Feb 2022 16:30:31 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/7] block/nbd: Delete open timer when done
Date: Thu,  3 Feb 2022 17:30:19 +0100
Message-Id: <20220203163024.38913-3-hreitz@redhat.com>
In-Reply-To: <20220203163024.38913-1-hreitz@redhat.com>
References: <20220203163024.38913-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We start the open timer to cancel the connection attempt after a while.
Once nbd_do_establish_connection() has returned, the attempt is over,
and we no longer need the timer.

Delete it before returning from nbd_open(), so that it does not persist
for longer.  It has no use after nbd_open(), and just like the reconnect
delay timer, it might well be dangerous if it were to fire afterwards.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/nbd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 16cd7fef77..5ff8a57314 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1885,11 +1885,19 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
+    /*
+     * The connect attempt is done, so we no longer need this timer.
+     * Delete it, because we do not want it to be around when this node
+     * is drained or closed.
+     */
+    open_timer_del(s);
+
     nbd_client_connection_enable_retry(s->conn);
 
     return 0;
 
 fail:
+    open_timer_del(s);
     nbd_clear_bdrvstate(bs);
     return ret;
 }
-- 
2.34.1


