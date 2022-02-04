Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5294A9853
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 12:20:04 +0100 (CET)
Received: from localhost ([::1]:57298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFwdH-0002k0-Ed
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 06:20:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFwU1-0003Ia-4S
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:10:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFwTy-0004VF-Sp
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643973025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X370MflJYE3deYTEwh5EXqE26Agy5yfuiKm3IPPb3xM=;
 b=eTqpUjRN86EDV+fmtodeSpkVGDAWDn6GXBEqUkDUrwpcBc8SX3bv6BndeusHZi/GvutOSE
 Yd/OckdTEOxlhYFL4bBnLeu5QEgRAOYWbrSt5HWVnWJPbFnTF0Par+kUe7nTkl66rIgOQU
 ud3n063+gjbRH9npMXKkqQWRhMEfFak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-1lwgfEcOPyq73iczmQTUig-1; Fri, 04 Feb 2022 06:10:22 -0500
X-MC-Unique: 1lwgfEcOPyq73iczmQTUig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A06D18C89DD;
 Fri,  4 Feb 2022 11:10:21 +0000 (UTC)
Received: from localhost (unknown [10.39.193.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C560A7B6F3;
 Fri,  4 Feb 2022 11:10:20 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 3/7] block/nbd: Assert there are no timers when closed
Date: Fri,  4 Feb 2022 12:10:08 +0100
Message-Id: <20220204111012.34720-4-hreitz@redhat.com>
In-Reply-To: <20220204111012.34720-1-hreitz@redhat.com>
References: <20220204111012.34720-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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

Our two timers must not remain armed beyond nbd_clear_bdrvstate(), or
they will access freed data when they fire.

This patch is separate from the patches that actually fix the issue
(HEAD^^ and HEAD^) so that you can run the associated regression iotest
(281) on a configuration that reproducibly exposes the bug.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/nbd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 5ff8a57314..dc6c3f3bbc 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -110,6 +110,10 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
 
     yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
 
+    /* Must not leave timers behind that would access freed data */
+    assert(!s->reconnect_delay_timer);
+    assert(!s->open_timer);
+
     object_unref(OBJECT(s->tlscreds));
     qapi_free_SocketAddress(s->saddr);
     s->saddr = NULL;
-- 
2.34.1


