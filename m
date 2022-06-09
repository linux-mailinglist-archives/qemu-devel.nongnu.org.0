Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC352545433
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:34:15 +0200 (CEST)
Received: from localhost ([::1]:49610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMyz-0006ds-Dd
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzLJb-0000gS-Pc
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:47:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzLJZ-0006VO-RI
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654793240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VlBXSLKPMbLopKgZce2Q2MK/CyVPgH2pSsygq+8Hmms=;
 b=X4oYN+ZjG0DXVjyBEOAZC2tePOcpkY+J5QrKbyV4kF+W727ODWZMMN6khd3AB0TwpivQHV
 apdguRAxbn/AmesEYbGOpLaWnb1sjpBtArkabxtQlXT3Od+KqO9G/QO0/xr7bcHX7hsaZ6
 GYSblCCy3jhqFYVWqGpY7WItw4sCzdc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-82zejNysOkK5mXQc46yDgw-1; Thu, 09 Jun 2022 12:47:14 -0400
X-MC-Unique: 82zejNysOkK5mXQc46yDgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9437F85A580;
 Thu,  9 Jun 2022 16:47:14 +0000 (UTC)
Received: from localhost (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4708F1121314;
 Thu,  9 Jun 2022 16:47:14 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-stable@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Nikolay Tenev <nt@storpool.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH 1/2] linux-aio: fix unbalanced plugged counter in
 laio_io_unplug()
Date: Thu,  9 Jun 2022 17:47:11 +0100
Message-Id: <20220609164712.1539045-2-stefanha@redhat.com>
In-Reply-To: <20220609164712.1539045-1-stefanha@redhat.com>
References: <20220609164712.1539045-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Every laio_io_plug() call has a matching laio_io_unplug() call. There is
a plugged counter that tracks the number of levels of plugging and
allows for nesting.

The plugged counter must reflect the balance between laio_io_plug() and
laio_io_unplug() calls accurately. Otherwise I/O stalls occur since
io_submit(2) calls are skipped while plugged.

Reported-by: Nikolay Tenev <nt@storpool.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/linux-aio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/linux-aio.c b/block/linux-aio.c
index 4c423fcccf..6078da7e42 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -363,8 +363,10 @@ void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
                     uint64_t dev_max_batch)
 {
     assert(s->io_q.plugged);
+    s->io_q.plugged--;
+
     if (s->io_q.in_queue >= laio_max_batch(s, dev_max_batch) ||
-        (--s->io_q.plugged == 0 &&
+        (!s->io_q.plugged &&
          !s->io_q.blocked && !QSIMPLEQ_EMPTY(&s->io_q.pending))) {
         ioq_submit(s);
     }
-- 
2.36.1


